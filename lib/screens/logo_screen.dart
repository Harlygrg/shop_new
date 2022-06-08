import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_new/constants.dart';
import 'package:shop_new/screens/product_details.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2000))
        .then((value) => Get.to(const ProductDetails()));
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          child: Image.asset(Images.logoImage),),
      ),
    );
  }
}
