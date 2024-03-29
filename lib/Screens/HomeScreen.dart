import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course/Blogic/Firebase/Auth.dart';
import 'package:course/Screens/CartView.dart';
import 'package:course/Screens/Cat.dart';
import 'package:course/Models/Product.dart';
import 'package:course/Screens/ProductScreen.dart';
import 'package:course/Screens/Profile.dart';
import 'package:course/Screens/StoreScreen.dart';
import 'package:course/Widgets/Categories.dart';
import 'package:course/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Models/Category.dart';
import '../Widgets/Product.dart';
import 'SplashScreen.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  List<Categoryclass> list = [
    Categoryclass(
        name: "mobiles",
        image:
            "https://m.media-amazon.com/images/I/71xU8w3fHJL._AC_UL480_FMwebp_QL65_.jpg"),
    Categoryclass(
        name: "laptops",
        image:
            "https://m.media-amazon.com/images/I/81VBQJoT5JL._AC_UL480_FMwebp_QL65_.jpg"),
    Categoryclass(
        name: "tablets",
        image:
            "https://m.media-amazon.com/images/I/61NGnpjoRDL._AC_UL480_FMwebp_QL65_.jpg"),
    Categoryclass(
        name: "Cameras",
        image:
            "https://m.media-amazon.com/images/I/410-m0UcKfL._AC_UL480_FMwebp_QL65_.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'SATBRAK',
          style: TextStyle(color: AppColors.secondaryColor, fontSize: 20.sp),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.secondaryColor,
              size: 20.sp,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartView()));
            },
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: AppColors.secondaryColor,
              size: 20.sp,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: AppColors.secondaryColor,
              size: 20.sp,
            ),
            onPressed: () {
              Authentication.signOut();
             if(FirebaseAuth.instance.currentUser==null){
                   Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SplashScreen()));
         
             }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: 250.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://www.digitalsilk.com/wp-content/uploads/2020/05/ecommerce-coronavirus-hero-image.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(children: [
              SizedBox(
                height: 80.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    "welcome to Stabark",
                    style: TextStyle(
                        color: AppColors.quaternaryColor,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StoreScreen()));
                },
                child: Container(
                    width: 180.w,
                    height: 40.h,
                    color: AppColors.primaryColor,
                    child: Row(children: [
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        "Shop Now",
                        style: TextStyle(
                            color: AppColors.secondaryColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: AppColors.secondaryColor,
                        size: 20.sp,
                      ),
                    ])),
              )
            ]),
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 30.w,
              ),
              Text(
                "Categories",
                style: TextStyle(
                    color: AppColors.quaternaryColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
              height: 260,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                ),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CategoryWidget(
                      category: list[index],
                    ),
                  );
                },
              )),
          SizedBox(
            height: 15.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 30.w,
              ),
              Text(
                "Most Ordered",
                style: TextStyle(
                    color: AppColors.quaternaryColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
              height: 200.h,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("mostOrderd")
                    .snapshots(),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProductWidget(
                            product: Product(
                              productImg1: snapshot.data!.docs[index]["img1"],
                              productImg2: snapshot.data!.docs[index]["img2"],
                              productImg3: snapshot.data!.docs[index]["img3"],
                              productname: snapshot.data!.docs[index]["name"],
                              productPrice: snapshot.data!.docs[index]["price"],
                              productOldPrice: snapshot.data!.docs[index]
                                  ["oldprice"],
                              productDescription: snapshot.data!.docs[index]
                                  ["des"],
                              productColor1: Colors.black,
                              productColor2: Colors.blue,
                              productColor3: Colors.cyanAccent,
                            ),
                          ));
                    },
                  );
                }),
              )),
          SizedBox(
            height: 15.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 30.w,
              ),
              Text(
                "Most Sale",
                style: TextStyle(
                    color: AppColors.quaternaryColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
              height: 200.h,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("mostsale")
                    .snapshots(),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProductWidget(
                            product: Product(
                              productImg1: snapshot.data!.docs[index]["img1"],
                              productImg2: snapshot.data!.docs[index]["img2"],
                              productImg3: snapshot.data!.docs[index]["img3"],
                              productname: snapshot.data!.docs[index]["name"],
                              productPrice: snapshot.data!.docs[index]["price"],
                              productOldPrice: snapshot.data!.docs[index]
                                  ["oldprice"],
                              productDescription: snapshot.data!.docs[index]
                                  ["des"],
                              productColor1: Colors.black,
                              productColor2: Colors.blue,
                              productColor3: Colors.cyanAccent,
                            ),
                          ));
                    },
                  );
                }),
              )),
        ]),
      ),
    );
  }
}



//  ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: 10,
//               itemBuilder: (context, index) {
//                 return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: ProductWidget(
//                       product: Product(
//                           productColor1: Colors.black,
//                           productColor2: Colors.blue,
//                           productColor3: Colors.cyanAccent,
//                           productImg1: "https://i.imgur.com/6Jz9PzX.png",
//                           productname: "Product Name",
//                           productPrice: 200.0,
//                           productOldPrice: 300.0,
//                           productImg2: "https://i.imgur.com/O9PcXrv.png",
//                           productImg3:
//                               "https://www.digitalsilk.com/wp-content/uploads/2020/05/ecommerce-coronavirus-hero-image.png",
//                           productDescription: "jndfjkvknvjfvjkdfvkdjvkldjvclljndfjkvknvjfvjkdfvkdjvkldjvclljndfjkvknvjfvjkdfvkdjvkldjvclljndfjkvknvjfvjkdfvkdjvkldjvcll"),
//                     ));
//               },
//             ),