import 'package:course/Screens/Cat.dart';
import 'package:course/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Store",
          style: TextStyle(color: AppColors.secondaryColor, fontSize: 20.sp),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          Container(
            height: 200.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoriesScreen()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                              width: 2.w, color: AppColors.secondaryColor)),
                      width: 100.w,
                      child: Column(children: [
                        Container(
                          width: 150.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://www.digitalsilk.com/wp-content/uploads/2020/05/ecommerce-coronavirus-hero-image.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "Product Name",
                          style: TextStyle(
                              color: AppColors.secondaryColor, fontSize: 15.sp),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "200 \$",
                          style: TextStyle(
                              color: AppColors.secondaryColor, fontSize: 18.sp),
                        ),
                      ]),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
            height: 100.h,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CircleAvatar(
                      radius: 60.r,
                      backgroundImage: NetworkImage(
                          "https://www.digitalsilk.com/wp-content/uploads/2020/05/ecommerce-coronavirus-hero-image.png"),
                      child: Text(
                        "Product Name",
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 40.h,
          ),
          Container(
            height: 200.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoriesScreen()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                              width: 2.w, color: AppColors.secondaryColor)),
                      width: 100.w,
                      child: Column(children: [
                        Container(
                          width: 150.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://www.digitalsilk.com/wp-content/uploads/2020/05/ecommerce-coronavirus-hero-image.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "Product Name",
                          style: TextStyle(
                              color: AppColors.secondaryColor, fontSize: 15.sp),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "200 \$",
                          style: TextStyle(
                              color: AppColors.secondaryColor, fontSize: 18.sp),
                        ),
                      ]),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                  leading: Image(image: NetworkImage("https://www.digitalsilk.com/wp-content/uploads/2020/05/ecommerce-coronavirus-hero-image.png")),
                  title: Text('Item Name $index'),
                  subtitle: Text('Subtitle $index'),
                  trailing: IconButton(icon:Icon(Icons.remove), onPressed: () {}),
                );
                }),
          ),
        ],
      )),
    );
  }
}
