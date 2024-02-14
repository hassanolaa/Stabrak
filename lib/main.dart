import 'package:course/Screens/HomeScreen.dart';
import 'package:course/Screen3.dart';
import 'package:course/Screens/SginUp.dart';
import 'package:course/Screens/SignIn.dart';
import 'package:course/Screens/SplashScreen.dart';
import 'package:course/test.dart';
import 'package:course/theme/theme.dart';
import 'package:course/vid/testscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
          scrollBehavior: MyCustomScrollBehavior(),
          // routes: {
          //   "/":(context)=>HomeScreen(),
          //   "/screen3":(context)=>Screen3()
          // },
          debugShowCheckedModeBanner: false,
          home: SplashScreen()),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 20.h,
        ),
        Center(
          child: Image(image: NetworkImage("https://i.imgur.com/zZR7pS9.png")),
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 60.w,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
              child: Container(
                width: 100.w,
                height: 60.h,
                child: Center(
                    child: Text(
                  "SignUp",
                  style: TextStyle(color: Colors.white, fontSize: 20.sp),
                )),
                decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                        width: 3.w, color: AppColors.secondaryColor)),
              ),
            ).animate().fade(duration: 2.seconds),
            SizedBox(
              width: 20.w,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignIn()));
              },
              child: Container(
                width: 100.w,
                height: 60.h,
                child: Center(
                    child: Text(
                  "SignIn",
                  style: TextStyle(
                      color: AppColors.secondaryColor, fontSize: 20.sp),
                )),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                        width: 3.w, color: AppColors.secondaryColor)),
              ),
            ).animate().fade(duration: 2.seconds),
          ],
        )
      ]),
    );
  }
}



/*

List<product> cart;

cart.add()



*/
