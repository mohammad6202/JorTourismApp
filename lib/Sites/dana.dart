import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DanaDetailsScreen extends StatelessWidget {
  const DanaDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "أردنا جنة",
          style: TextStyle(fontSize: 20.sp),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "محمية ضانا",
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}