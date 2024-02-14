import 'package:course/Models/CartItem.dart';
import 'package:course/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'CartAddress.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {

    int total = 0;

  totalprice(){
    for(int i = 0; i<cartitems.length;i++){
     setState(() {
      total += cartitems[i].totalprice!;
      
     });
    }
    return total;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    totalprice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(width: 2.w, color: AppColors.secondaryColor),
          color: AppColors.primaryColor,
        ),
        width: double.infinity,
        height: 90.h,
        child: Column(
          children: [
            SizedBox(height: 20.h,),
            Row(children: [
              SizedBox(width: 50.w,),
               Text("Total :",style: TextStyle(color: AppColors.secondaryColor,fontSize: 20.sp,fontWeight: FontWeight.bold),),
            SizedBox(width: 20.w,),
            Text(total.toString(),style: TextStyle(color: AppColors.secondaryColor,fontSize: 22.sp,fontWeight: FontWeight.bold),),
            SizedBox(width: 40.w,),
            ElevatedButton(onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context) => CartAddress(nettotal: total,)));



            }, child: Text("Confirm",style: TextStyle(fontSize: 13.sp),),style: ElevatedButton.styleFrom(
              primary: AppColors.secondaryColor,
              fixedSize: Size(80.w,50.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),),
            ],),
           
          ],
        ),
      )
      
      ,
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: 30.h),
          Container(
               height: MediaQuery.of(context).size.height ,
                        child: ListView.builder(
                          
                          itemCount:cartitems.length ,
                           itemBuilder: (context, index) {
              return ListTile(
                leading: Image(image: NetworkImage(cartitems[index].image!)),
                title: Text(cartitems[index].name!),
                subtitle: Text('x${cartitems[index].count}  ${cartitems[index].singleprice}\$            ${cartitems[index].totalprice}\$'),
                trailing: IconButton(icon:Icon(Icons.delete), onPressed: () {
                  setState(() {
                    cartitems.removeAt(index);
                  });
                }),
              );
            }),
          ),





        ],
      )),
    );
  }
}
