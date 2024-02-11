import 'package:course/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories Name',style: TextStyle(color: AppColors.secondaryColor),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color:AppColors.secondaryColor,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(children: [
                SizedBox(width: 10.w,),
                Container(width: 150.w,child: Image(image:NetworkImage("https://www.digitalsilk.com/wp-content/uploads/2020/05/ecommerce-coronavirus-hero-image.png") ),),
                SizedBox(width: 20.w,),
                Text("Product Name",style: TextStyle(color: AppColors.quaternaryColor,fontSize: 10.sp),),
                SizedBox(width: 20.w,),
                Text("200 \$",style: TextStyle(color: AppColors.quaternaryColor,fontSize: 10.sp),),
                
          
              ],),
            ),
          );
        },
      ),
    );
  }
}
