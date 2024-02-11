import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Models/Product.dart';
import '../Screens/ProductScreen.dart';
import '../theme/theme.dart';

class ProductWidget extends StatefulWidget {
  ProductWidget({super.key,
  required this.product
  });
  Product product;

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductScreen(product: widget.product,)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(width: 2.w, color: AppColors.secondaryColor)),
        width: 150.w,
        child: Column(children: [
          Container(
            width: 150.w,
            height: 110.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.product.productImg1!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            widget.product.productname!,
            style: TextStyle(color: AppColors.secondaryColor, fontSize: 15.sp),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            widget.product.productPrice.toString() + " \$",
            style: TextStyle(color: AppColors.secondaryColor, fontSize: 18.sp),
          ),
        ]),
      ),
    );
  }
}
