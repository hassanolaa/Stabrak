import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Models/Category.dart';
import '../Screens/Cat.dart';

class CategoryWidget extends StatefulWidget {
   CategoryWidget({super.key,
   required this.category
   });
  Categoryclass category;

  @override
  State<CategoryWidget> createState() => _CategoryState();
}

class _CategoryState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoriesScreen(
                    name:widget.category.name
                    )));
      },
      child: Container(
        width: 100.w,
        height: 80,
        child: Column(
          children: [
            Container(
              width: 100.w,
              height: 60.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  image: DecorationImage(
                      image: NetworkImage(
                          widget.category.image),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              widget.category.name,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
