import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DanaDetailsScreen extends StatefulWidget {
  const DanaDetailsScreen({super.key});

  @override
  State<DanaDetailsScreen> createState() => _DanaDetailsScreenState();
}

class _DanaDetailsScreenState extends State<DanaDetailsScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _fadeAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _infoCard(IconData icon, String title, String value) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 28.sp, color: Colors.green),
          SizedBox(height: 8.h),
          Text(
            title,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5.h),
          Text(
            value,
            style: TextStyle(fontSize: 12.sp),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _galleryImage(String path) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: Image.asset(
          path,
          width: 160.w,
          height: 120.h,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffffe5df),
        title: Row(
          children: const [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/heaven.jpg"),
            ),
            SizedBox(width: 5),
            Text(
              "أردنا جنة",
              style: TextStyle(
                color: Color(0xff612518),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// صورة رئيسية
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: Image.asset(
                      "assets/images/dana_main.jpg",
                      height: 220.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  SizedBox(height: 20.h),

                  /// العنوان
                  Text(
                    "محمية ضانا",
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10.h),

                  /// ⭐ تقييم
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 22.sp,
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  /// وصف غني
                  Text(
                    "تُعد محمية ضانا للمحيط الحيوي من أكبر وأجمل المحميات الطبيعية في الأردن، "
                    "وتقع في محافظة الطفيلة. تتميز بتنوعها البيئي الفريد حيث تضم الجبال "
                    "والوديان والصحارى، مما يجعلها موطناً لأكثر من 800 نوع نباتي "
                    "والعديد من الحيوانات النادرة مثل الوعل النوبي والذئب العربي. "
                    "توفر المحمية مسارات مشي طويلة، وتجارب تخييم، ومشاهدة طيور، "
                    "وتعتبر وجهة مثالية لمحبي السياحة البيئية والمغامرات.",
                    style: TextStyle(
                      fontSize: 16.sp,
                      height: 1.6,
                    ),
                  ),

                  SizedBox(height: 25.h),

                  /// بطاقات معلومات
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _infoCard(Icons.landscape, "المساحة", "300 كم²"),
                      _infoCard(Icons.park, "النباتات", "800+"),
                      _infoCard(Icons.pets, "الحيوانات", "25+"),
                    ],
                  ),

                  SizedBox(height: 30.h),

                  /// معرض الصور
                  Text(
                    "معرض الصور",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 15.h),

                  SizedBox(
                    height: 120.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _galleryImage("assets/images/dana1.jpg"),
                        _galleryImage("assets/images/dana2.jpg"),
                        _galleryImage("assets/images/dana3.jpg"),
                      ],
                    ),
                  ),

                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}