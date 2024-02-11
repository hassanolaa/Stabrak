

import 'package:flutter/material.dart';

class wishlist extends StatefulWidget {
  const wishlist({super.key});

  @override
  State<wishlist> createState() => _wishlistState();
}

class _wishlistState extends State<wishlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(itemCount: 30, itemBuilder: (context, index) {
        return ListTile(
          leading: Image(image: NetworkImage("https://www.digitalsilk.com/wp-content/uploads/2020/05/ecommerce-coronavirus-hero-image.png")),
          title: Text('Item Name $index'),
          subtitle: Text('Subtitle $index'),
          trailing: IconButton(icon:Icon(Icons.remove), onPressed: () {}),
        );
      }),
    );
  }
}