import 'package:course/main.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Screen3 extends StatefulWidget {
 String? name;//fff
 int? age;
 String? image;

 Screen3({
   this.name,
   this.age,
   this.image
  }) ;

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {

  @override
  Widget build(BuildContext context) {
 

    return Scaffold(
      backgroundColor: Colors.blue,
       
  );
  }
}



































