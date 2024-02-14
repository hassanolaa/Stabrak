import 'package:course/Blogic/Firebase/FireStore.dart';
import 'package:course/Models/CartItem.dart';
import 'package:course/Screens/Navi.dart';
import 'package:course/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/theme.dart';

class CartAddress extends StatefulWidget {
  CartAddress({super.key, required this.nettotal});
  int nettotal;

  @override
  State<CartAddress> createState() => _CartAddressState();
}

class _CartAddressState extends State<CartAddress> {
  String firstname = "";
  String lastname = "";
  String country = "";
  String city = "";
  String address = "";
  String code = "";
  String phonenumber = "";
  String order = " ";
  int tax = 50;
  int delivery = 150;
  int totalorderr = 0;
  totalorder() {
    totalorderr = widget.nettotal + tax + delivery;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    totalorder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 50.h,
          ),
          Center(
            child: Text(
              " Your Address Information",
              style: TextStyle(
                  color: AppColors.secondaryColor,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 25.w,
              ),
              Container(
                width: 150.w,
                child: FastTextField(
                  onChanged: (Value) {
                    setState(() {
                      firstname = Value!;
                    });
                  },
                  name: 'field_destination',
                  decoration: InputDecoration(
                    labelText: 'first name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Container(
                width: 150.w,
                child: FastTextField(
                  onChanged: (Value) {
                    setState(() {
                      lastname = Value!;
                    });
                  },
                  name: 'field_destination',
                  decoration: InputDecoration(
                    labelText: 'last name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 25.w,
              ),
              Container(
                width: 150.w,
                child: FastDropdown<String>(
                  onChanged: (Value) {
                    setState(() {
                      country = Value!;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: '',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  name: 'dropdown',
                  items: ['Egypt', 'Irac', 'Usa', 'England', 'Iceland'],
                  initialValue: 'Egypt',
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Container(
                width: 150.w,
                child: FastDropdown<String>(
                  onChanged: (Value) {
                    setState(() {
                      city = Value!;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'City',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  name: 'dropdown',
                  items: ['Cairo', 'Baghdad', 'NewYork', 'London', 'Iceland'],
                  initialValue: 'Cairo',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            width: 310.w,
            child: FastTextField(
              onChanged: (Value) {
                setState(() {
                  address = Value!;
                });
              },
              name: 'field_destination',
              decoration: InputDecoration(
                labelText: 'Address details',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 25.w,
              ),
              Container(
                width: 70.w,
                child: FastTextField(
                  onChanged: (Value) {
                    setState(() {
                      code = Value!;
                    });
                  },
                  name: 'field_destination',
                  decoration: InputDecoration(
                    labelText: 'Code',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Container(
                width: 230.w,
                child: FastTextField(
                  onChanged: (Value) {
                    setState(() {
                      phonenumber = Value!;
                    });
                  },
                  name: 'field_destination',
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 20.w,
              ),
              Container(
                  width: 310.w,
                  height: 250.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColors.secondaryColor),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "order price :          ${widget.nettotal} ",
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Tax :                             50 ",
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Delivery :                      150 ",
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Total :                        $totalorderr ",
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor),
                        onPressed: () {
                          for (var index in cartitems) {
                            order = order + "x${index.count} ${index.name}\n ";
                          }
                          // for(int i = 0; i < 5; i++)

                          FireStore.AddOrder(
                              firstname + " " + lastname,
                              country + " " + city,
                              address,
                              code+phonenumber,
                              totalorderr,
                              order);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Navi()));
                        },
                        child: Text(
                          "Confirm",
                          style: TextStyle(
                              color: AppColors.secondaryColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ]),
      ),
    );
  }
}
