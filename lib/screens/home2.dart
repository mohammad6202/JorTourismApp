// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jordan_heaven/Sites/ajloun.dart';
import 'package:jordan_heaven/Sites/dana.dart';
import 'package:jordan_heaven/Sites/jerash.dart';
import 'package:jordan_heaven/Sites/petra.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, Widget> routes = {
      "البتراء": const PetraDetailsScreen(),
      "محمية ضانا": const DanaDetailsScreen(),
      "قلعة عجلون": const AjlounDetailsScreen(),
      "آثار جرش": const JerashDetailsScreen(),
    };
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(right: 30, left: 30),
          alignment: AlignmentGeometry.topRight,
          width: double.infinity,
          height: 200.w,
          decoration: BoxDecoration(
            color: Color(0xffffe5df),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "أردنا جنة",
                    style: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff612518),
                    ),
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/heaven.jpg"),
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              Text(
                "تطبيقك المفضل للسياحة في الأردن",
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff612518),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 50.h),
        Padding(
          padding: EdgeInsets.only(right: 30.w, left: 30.w),
          child: Text(
            "تعد الأردن من الوجهات السياحية الرائجة محليا، وحول العالم. حيث تحتوي الأردن على العديد من المواقع الأثرية والسياحية التي تجعلها في مقدمة الدول من حيث السياحة. هذا ما أعطاها تنوعا أضاف للأردن جمالا ساحرا. شاهد مقطع الفيديو القصير هذا عن أهم المواقع السياحية",
            style: TextStyle(
              color: Color(0xffffe5df),
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          height: 600.h,
          margin: EdgeInsets.all(0),
          child: VideoPlayerWidget(),
        ),

        Padding(
          padding: EdgeInsets.all(30),
          child: Text(
            "أهم المعالم الأثرية",
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Color(0xffffe5df),
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: ClampingScrollPhysics(),
          child: Row(
            children: [
              siteItem(
                context,
                "البتراء",
                "البتراء أو البترا أو البطراء مدينة أثرية وتاريخية تقع في محافظة معان في جنوب المملكة الأردنية الهاشمية. تشتهر بعمارتها المنحوتة بالصخور ونظام قنوات جر المياه القديمة. أُطلق عليها قديمًا اسم «سلع»، كما سُميت بـ «المدينة الوردية» نسبةً لألوان صخورها الملتوية.",
                routes,
              ),
              siteItem(
                context,
                "محمية ضانا",
                "محمية ضانا تعتبر واحدة من أهم وأكبر المحميات الطبيعية في الأردن، حيث تمتد على مساحة تقارب 308 كيلومتر مربع. تم تأسيس المحمية عام 1993 بهدف حماية التنوع البيولوجي الفريد الذي تحتويه المنطقة، فضلاً عن الحفاظ على التراث الثقافي والطبيعي. تقع المحمية في المنطقة الجنوبية من المملكة، وتتميز بتضاريسها المتنوعة التي تشمل الجبال الشاهقة والأودية العميقة والسهول الواسعة.",
                routes,
              ),
              siteItem(
                context,
                "قلعة عجلون",
                "قلعة عجلون وتسمى أيضًا قلعة الرَّبض وقلعة صلاح الدين هي قلعة تقع في عجلون، الأردن، على قمة جبل عوف (أو جبل بني عوف) المشرف على أودية كفرنجة وراجب واليابس. بناها القائد عز الدين أسامة أحد قادة صلاح الدين الأيوبي سنة 1184م (580 هجري) لتكون نقطة ارتكاز لحماية المنطقة والحفاظ على خطوط المواصلات وطرق الحج بين بلاد الشام والحجاز لإشرافها على وادي الأردن وتحكمها بالمنطقة الممتدة بين بحيرة طبريا والبحر الميت. ",
                routes,
              ),
              siteItem(
                context,
                "آثار جرش",
                "تعتبر مدينة جرش الأثرية من أفضل مناطق الجذب السياحي في الأردن، حيث تبعد عن العاصمة عمان 52 كيلو مترًا، وكانت تُعرف سابقًا باسم جراسا، كما أنها تضم ​​العديد من المعالم الأثرية من عصور مختلفة، وفيما يلي نعرض لكم أشهر اثار جرش في الأردن. ",
                routes,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//SitesCard
Widget siteItem(
  BuildContext context,
  String title,
  String description,
  Map<String, Widget> routes,
) {
  return Container(
    margin: EdgeInsets.all(15.h),
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.r),
      gradient: LinearGradient(colors: [Color(0xffa4442e), Color(0xffffe5df)]),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),

        SizedBox(height: 5.h),

        SizedBox(
          height: 110.h,
          width: 300.w,
          child: Text(
            description,
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 14.sp),
          ),
        ),

        

        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              if (routes.containsKey(title)) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => routes[title]!),
                );
              }
            },
            child: Text("اقرأ المزيد...", style: TextStyle(fontSize: 14.sp)),
          ),
        ),
      ],
    ),
  );
}

//Video Player Widget

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({super.key});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController controller;
  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset("assets/videos/jordan.mp4")
      ..initialize().then((value) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: controller.value.isInitialized
              ? AspectRatio(
                  child: VideoPlayer(controller),
                  aspectRatio: controller.value.aspectRatio,
                )
              : Text("تعذر التشغيل"),
        ),
        Center(
  child: IconButton(
    onPressed: () async {

      if (controller.value.isPlaying) {
        await controller.pause();
      } else {
        await controller.play();
      }

      setState(() {}); // فقط لتحديث الأيقونة

    },
    icon: controller.value.isPlaying
        ? const Icon(Icons.pause_circle, size: 40)
        : const Icon(Icons.play_circle, size: 40),
  ),
),
      ],
    );
  }
}
