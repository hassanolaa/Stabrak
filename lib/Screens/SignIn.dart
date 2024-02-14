import 'package:course/Screens/HomeScreen.dart';
import 'package:course/Screens/Navi.dart';
import 'package:course/Screens/SginUp.dart';
import 'package:course/main.dart';
import 'package:course/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Blogic/Firebase/Auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final auth=FirebaseAuth.instance;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        SizedBox(
          height: 50.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 40.w,
            ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.secondaryColor,
                )),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 40.w,
            ),
            Text(
              "Sign In",
              style: GoogleFonts.bebasNeue(
                  color: AppColors.secondaryColor,
                  fontSize: 40.sp,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            onChanged: (value) {
              email = value;
            },
            controller: _emailController,
            decoration: InputDecoration(
              hintText: "Enter Your Email",
              labelText: 'Email',
              labelStyle: TextStyle(color: AppColors.secondaryColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.secondaryColor),
              ),
              prefixIcon: Icon(
                Icons.email,
                color: AppColors.secondaryColor,
              ),
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.clear,
                    color: AppColors.secondaryColor,
                  )),
            ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            onChanged: (value) {
              password = value;
            
            },
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Enter Your Password",
              labelText: 'Password',
              labelStyle: TextStyle(color: AppColors.secondaryColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.secondaryColor),
              ),
              prefixIcon: Icon(
                Icons.password,
                color: AppColors.secondaryColor,
              ),
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.clear,
                    color: AppColors.secondaryColor,
                  )),
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 75.w,
            ),
            GestureDetector(
              onTap: () {
                try {
                 
                  if(email==null||password==null){
                    setState(() {
                    SnackBar(content: Text("Please Enter Your Email And Password"));
                      
                    });
                  }
                  else{
                     Authentication.Login(_emailController.text.trim(),
                      _passwordController.text.trim());
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Navi()));
                  }
                } catch (e) {
                  print(e);
                }
              },
              child: Container(
                width: 200.w,
                height: 60.h,
                child: Center(
                    child: Text(
                  "SignIn",
                  style: TextStyle(color: Colors.white, fontSize: 20.sp),
                )),
                decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                        width: 3.w, color: AppColors.secondaryColor)),
              ),
            )
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 75.w,
            ),
            GestureDetector(
              onTap: () {
                try {
                  Authentication.signInWithGoogle();
                  if(auth.currentUser!=null){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Navi()));

                  }
                } catch (e) {
                  print(e);
                }
              },
              child: Container(
                width: 200.w,
                height: 60.h,
                child: Center(
                    child: Text(
                  "SignIn With Google",
                  style: TextStyle(
                      color: AppColors.secondaryColor, fontSize: 20.sp),
                )),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                        width: 3.w, color: AppColors.secondaryColor)),
              ),
            )
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 35.w,
            ),
            Text(
              "Not Have An Account Yet?",
              style:
                  TextStyle(color: AppColors.secondaryColor, fontSize: 15.sp),
            ),
            SizedBox(
              width: 5.w,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
                child: Text(
                  "create one",
                  style: TextStyle(
                      color: AppColors.quaternaryColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ]),
    );
  }
}
