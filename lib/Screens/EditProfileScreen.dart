import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course/Blogic/Firebase/FireStore.dart';
import 'package:course/Screens/HomeScreen.dart';
import 'package:course/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  static final auth = FirebaseAuth.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Future<void> GetUserInfo() async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(auth.currentUser!.uid)
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        setState(() {
          nameController.text = snapshot.data()!['username'];
          ageController.text = snapshot.data()!['age'];
          phoneController.text = snapshot.data()!['phonenumber'];
        });
      } else {
        print('No data');
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextStyle(color: AppColors.secondaryColor, fontSize: 20.sp),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                try {
                  FireStore.AddUserInfo(nameController.text, ageController.text,
                      phoneController.text);
                   Fluttertoast.showToast(
                      msg: "Profile Updated",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: AppColors.secondaryColor,
                      textColor: Colors.white,
                      fontSize: 16.0);

                  
                
                } catch (e) {
                  print(e);
                }
              },
              icon: Icon(
                Icons.save,
                color: AppColors.secondaryColor,
                size: 15.sp,
              ))
        ],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.secondaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Column(children: [
        SizedBox(
          height: 30.h,
        ),
        Center(
          child: CircleAvatar(
              radius: 60.r,
              backgroundImage: NetworkImage("https://i.imgur.com/zZR7pS9.png")),
        ),
        SizedBox(
          height: 30.h,
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: TextField(
            controller: nameController,
            decoration: InputDecoration(
              label: Text(
                'Full name',
                style: TextStyle(color: AppColors.secondaryColor),
              ),
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.secondaryColor, width: 2.w),
                borderRadius: BorderRadius.circular(20.r),
              ),
              prefixIcon: Icon(
                Icons.person,
                color: AppColors.secondaryColor,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 40.h,
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: TextField(
            controller: phoneController,
            decoration: InputDecoration(
              label: Text(
                'Phone Number',
                style: TextStyle(color: AppColors.secondaryColor),
              ),
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.secondaryColor, width: 2.w),
                borderRadius: BorderRadius.circular(20.r),
              ),
              prefixIcon: Icon(
                Icons.phone_callback_outlined,
                color: AppColors.secondaryColor,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 40.h,
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: TextField(
            controller: ageController,
            decoration: InputDecoration(
              label: Text(
                'Age',
                style: TextStyle(color: AppColors.secondaryColor),
              ),
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.secondaryColor, width: 2.w),
                borderRadius: BorderRadius.circular(20.r),
              ),
              prefixIcon: Icon(
                CupertinoIcons.arrowshape_turn_up_right,
                color: AppColors.secondaryColor,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 40.h,
        ),
      ]),
    );
  }
}
