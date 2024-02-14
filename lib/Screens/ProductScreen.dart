import 'package:course/Blogic/Firebase/FireStore.dart';
import 'package:course/Models/CartItem.dart';
import 'package:course/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Models/Product.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({super.key, required this.product});
  Product product;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int index = 0;
  int indexColor = 0;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 80.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
          color: AppColors.quaternaryColor,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 20.w,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    count--;
                  });
                },
                icon: Icon(
                  Icons.plus_one,
                  color: AppColors.primaryColor,
                  size: 25.sp,
                )),
            Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                  child: Text(
                count.toString(),
                style:
                    TextStyle(fontSize: 25.sp, color: AppColors.secondaryColor),
              )),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    count++;
                  });
                },
                icon: Icon(
                  Icons.plus_one,
                  color: AppColors.primaryColor,
                  size: 25.sp,
                )),
            SizedBox(
              width: 20.w,
            ),
            GestureDetector(
              onTap: () {
                if (count > 0) {
                  cartitems.add(CartItem(
                    name: widget.product.productname!,
                    image: widget.product.productImg1!,
                    count: count,
                    singleprice: widget.product.productPrice!,
                    totalprice: widget.product.productPrice! * count,
                  ));

                  print(cartitems!.length);
                }
                else{
                SnackBar(content: Text("Please Add Quantity"));
                }
              },
              child: Container(
                width: 150.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Text(
                    "Add to Cart",
                    style: TextStyle(
                        color: AppColors.secondaryColor, fontSize: 20.sp),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 20.h,
          ),
          if (index == 0) ...{
            Container(
                width: MediaQuery.of(context).size.width,
                height: 270.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                        image: NetworkImage(widget.product.productImg1!),
                        fit: BoxFit.cover)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20.w,
                        ),
                        CircleAvatar(
                          radius: 15.w,
                          backgroundColor: AppColors.primaryColor,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: AppColors.secondaryColor,
                              size: 20.sp,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 250.w,
                        ),
                        CircleAvatar(
                          radius: 15.w,
                          backgroundColor: AppColors.primaryColor,
                          child: IconButton(
                            onPressed: () {
                              FireStore.AddToWishList(
                                  widget.product.productname!,  
                                  widget.product.productDescription!,
                                  widget.product.productPrice!,
                                  widget.product.productOldPrice!,
                                  widget.product.productImg1!,
                                  widget.product.productImg2!,
                                  widget.product.productImg3!,
                                  );
                              print("okey");
                            },
                            icon: Icon(
                              Icons.bookmark_add_outlined,
                              color: AppColors.secondaryColor,
                              size: 20.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          },
          if (index == 1) ...{
            Container(
                width: MediaQuery.of(context).size.width,
                height: 270.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                        image: NetworkImage(widget.product.productImg2!),
                        fit: BoxFit.cover)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20.w,
                        ),
                        CircleAvatar(
                          radius: 15.w,
                          backgroundColor: AppColors.primaryColor,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: AppColors.secondaryColor,
                              size: 20.sp,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                )),
          },
          if (index == 2) ...{
            Container(
                width: MediaQuery.of(context).size.width,
                height: 270.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                        image: NetworkImage(widget.product.productImg3!),
                        fit: BoxFit.cover)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20.w,
                        ),
                        CircleAvatar(
                          radius: 15.w,
                          backgroundColor: AppColors.primaryColor,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: AppColors.secondaryColor,
                              size: 20.sp,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                )),
          },
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 50.w,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 0;
                  });
                },
                child: Container(
                  width: 70.w,
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                      image: NetworkImage(widget.product.productImg1!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 30.w,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 1;
                  });
                },
                child: Container(
                  width: 70.w,
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                      image: NetworkImage(widget.product.productImg2!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 30.w,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 2;
                  });
                },
                child: Container(
                  width: 70.w,
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                      image: NetworkImage(widget.product.productImg3!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(children: [
            SizedBox(
              width: 10.w,
            ),
            Container(
                width: 150.w,
                child: Text(
                  widget.product.productname!,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryColor,
                      fontSize: 15.sp),
                )),
          ]),
          SizedBox(
            height: 30.h,
          ),
          Row(children: [
            SizedBox(
              width: 20.w,
            ),
            Text(
              widget.product.productPrice!.toString() + " \$",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.secondaryColor,
                  fontSize: 20.sp),
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              widget.product.productOldPrice!.toString() + " \$",
              style: TextStyle(color: Colors.black38, fontSize: 14.sp),
            ),
          ]),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 20.w,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    indexColor = 0;
                  });
                },
                child: Container(
                    height: 50.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      color: widget.product.productColor1,
                      borderRadius: BorderRadius.circular(10.r),
                    )),
              ),
              SizedBox(
                width: 20.w,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    indexColor = 1;
                  });
                },
                child: Container(
                    height: 50.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      color: widget.product.productColor2,
                      borderRadius: BorderRadius.circular(10.r),
                    )),
              ),
              SizedBox(
                width: 20.w,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    indexColor = 2;
                  });
                },
                child: Container(
                    height: 50.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      color: widget.product.productColor3,
                      borderRadius: BorderRadius.circular(10.r),
                    )),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(children: [
            SizedBox(
              width: 10.w,
            ),
            Container(
                width: 300.w,
                child: Text(
                  widget.product.productDescription!,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryColor,
                      fontSize: 15.sp),
                )),
          ]),
          SizedBox(
            height: 100.h,
          )
        ]),
      ),
    );
  }
}
