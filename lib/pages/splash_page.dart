import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/constants/constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void loadLogin() {
    Timer(const Duration(seconds: 2), () {
      Get.toNamed('/login');
    });
  }

  @override
  void initState() {
    super.initState();
    loadLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SizedBox(height: 10),
            Text(
              'Avocoda Media Hub',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
