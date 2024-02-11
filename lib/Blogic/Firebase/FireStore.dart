import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:course/Models/User.dart';
import 'package:flutter/cupertino.dart';

class FireStore {
  static final auth = FirebaseAuth.instance;
  static String name = "";
  static String age = "";
  static String phonenuber = "";
  static UserModel? user;

  static Future<void> Add(String name, String age, String phonenumber) async {
    await FirebaseFirestore.instance.collection('Users').add({
      'username': name,
      'age': age,
      'phonenumber': phonenumber,
    });
  }

  static Future<void> AddUserInfo(
      String name, String age, String phonenumber) async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(auth.currentUser!.uid)
        .set({
      'username': name,
      'age': age,
      'phonenumber': phonenumber,
    });
  }

  static Future<void> AddToWishList(String name, String des, int price,
      int oldprice, String img1, String img2, String img3) async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(auth.currentUser!.uid)
        .collection('wishlist')
        .add({
      'name': name,
      'des': des,
      'price': price,
      'oldprice': oldprice,
      'img1': img1,
      'img2': img2,
      'img3': img3,
    });
  }

  static Future<void> AddOrder(String fullname, String location, String address,String phonenumber, int totalprice,String order ) async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(auth.currentUser!.uid)
        .collection('Orders')
        .add({
      'fullname': fullname,
      'location': location,
      'address': address,
      'phonenumber': phonenumber,
      'totalprice': totalprice,
      'order': order,

    });
  }







}
