import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Models/Product.dart';
import '../Widgets/Product.dart';
import 'ProductScreen.dart';

class CategoriesScreen extends StatefulWidget {
   CategoriesScreen({super.key, required this.name});

  String name;


  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name,
          style: TextStyle(color: AppColors.secondaryColor),
        ),
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
      body: StreamBuilder<QuerySnapshot>(
        stream:FirebaseFirestore.instance.collection(widget.name).snapshots() ,
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
          else{
            return ListView.builder(
        itemCount: snapshot.data!.docs.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>
                
                ProductScreen(
                          product: Product(
                            productImg1: snapshot.data!.docs[index]["img1"],
                            productImg2: snapshot.data!.docs[index]["img2"],
                            productImg3: snapshot.data!.docs[index]["img3"],
                            productname: snapshot.data!.docs[index]["name"],
                            productPrice: snapshot.data!.docs[index]["price"] ,
                            productOldPrice: snapshot.data!.docs[index]["oldprice"] ,
                            productDescription: snapshot.data!.docs[index]["des"],
                            productColor1: Colors.black,
                            productColor2: Colors.blue,
                            productColor3: Colors.cyanAccent,

                          ),
                        )));
                
              },
              child: ListTile(
                leading: Container(
                  child: Image(
                    image: NetworkImage(snapshot.data!.docs[index]["img1"]),
                  ),
                ),
                title: Text(snapshot.data!.docs[index]["name"]),
                subtitle: Text("${snapshot.data!.docs[index]["price"].toString()}\$"),
            
              ),
            ),
            // child: Container(
            //   child: Row(
            //     children: [
            //       SizedBox(
            //         width: 10.w,
            //       ),
            //       Container(
            //         width: 150.w,
            //         child: Image(
            //             image: NetworkImage(snapshot.data!.docs[index]["img1"])),
            //       ),
            //       SizedBox(
            //         width: 20.w,
            //       ),
            //       Text(
            //        snapshot.data!.docs[index]["name"],
            //         style: TextStyle(
            //             color: AppColors.quaternaryColor, fontSize: 10.sp),
            //       ),
            //       SizedBox(
            //         width: 20.w,
            //       ),
            //       Text(
            //         "${snapshot.data!.docs[index]["price"].toString()}\$",
            //         style: TextStyle(
            //             color: AppColors.quaternaryColor, fontSize: 10.sp),
            //       ),
            //     ],
            //   ),
            // ),
          );
        },
      );
          }
        },
      )
    );
  }
}
