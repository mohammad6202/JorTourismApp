import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JerashDetailsScreen extends StatelessWidget {
  const JerashDetailsScreen({super.key});

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
          "آثار جرش",
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}