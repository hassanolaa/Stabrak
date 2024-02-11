
import 'package:course/Blogic/Firebase/FireStore.dart';
import 'package:course/Screens/HomeScreen.dart';
import 'package:course/Screens/Navi.dart';
import 'package:course/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileSignUp extends StatefulWidget {
  const ProfileSignUp({super.key});

  @override
  State<ProfileSignUp> createState() => _ProfileSignUpState();
}

class _ProfileSignUpState extends State<ProfileSignUp> {

 TextEditingController name = TextEditingController();
 TextEditingController age = TextEditingController();
 TextEditingController phone = TextEditingController();

 @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    name.dispose();
    age.dispose();
    phone.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(height: 30.h,),
      
           Center(
            child: CircleAvatar(
              radius: 60.r,
              backgroundImage: NetworkImage("https://i.imgur.com/zZR7pS9.png")),),
          
        SizedBox(height: 30.h,),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: TextField(
            controller: name,
            decoration: InputDecoration(
              label: Text('Full name',style: TextStyle(color: AppColors.secondaryColor),),            
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.secondaryColor,width: 2.w),
                borderRadius: BorderRadius.circular(20.r),
              ),
              prefixIcon: Icon(Icons.person,color: AppColors.secondaryColor,),
            ),
          ),
        ),
        SizedBox(height: 40.h,),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: TextField(
            controller: phone,
            decoration: InputDecoration(
              label: Text('Phone Number',style: TextStyle(color: AppColors.secondaryColor),),            
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.secondaryColor,width: 2.w),
                borderRadius: BorderRadius.circular(20.r),
              ),
              prefixIcon: Icon(Icons.phone_callback_outlined,color: AppColors.secondaryColor,),
            ),
          ),
        ),
        SizedBox(height: 40.h,),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: TextField(
            controller: age,
            decoration: InputDecoration(
              label: Text('Age',style: TextStyle(color: AppColors.secondaryColor),),            
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.secondaryColor,width: 2.w),
                borderRadius: BorderRadius.circular(20.r),
              ),
              prefixIcon: Icon(CupertinoIcons.arrowshape_turn_up_right,color: AppColors.secondaryColor,),
            ),
          ),
        ),
        SizedBox(height: 40.h,),
        ElevatedButton(onPressed: (){
           try {
           FireStore.AddUserInfo(name.text,age.text, phone.text);       

          Navigator.push(context, MaterialPageRoute(builder: (context) => Navi()));
                 
                } catch (e) {
                  print(e);
                }




        }, child: Text('Submit',style: TextStyle(fontSize: 15.sp),),style: ElevatedButton.styleFrom(
          primary: AppColors.secondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),),
      ]),
    );
  }
}