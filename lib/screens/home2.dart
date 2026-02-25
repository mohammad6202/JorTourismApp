import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
          height: 700.h,
          padding: EdgeInsets.only(
            left: 30.w,
            top: 30.h,
            right: 30.w,
            bottom: 100.h,
          ),
          child: VideoPlayerWidget(),
        ),
        
        Padding(
          padding: EdgeInsets.only(right:30.w, bottom: 30.h),
          child: Text("أهم المعالم الأثرية",style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.bold , color: Color(0xffffe5df)),),
        ),
        Container(
          margin: EdgeInsets.only(left: 30.w,right: 30.w),
          height: 100.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient: LinearGradient(
              colors: [Color(0xffa4442e), Color(0xffffe5df)],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [Text("data"), Text("data1"),Text("data2")]),
              Image(image: AssetImage("")),
            ],
          ),
        ),
      ],
    );
  }
}

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
            style: ElevatedButton.styleFrom(shape: CircleBorder()),
            onPressed: () async {
              controller.value.isPlaying
                  ? controller.pause()
                  : controller.play();
            },
            icon: controller.value.isPlaying
                ? Icon(Icons.pause)
                : Icon(Icons.play_arrow),
          ),
        ),
      ],
    );
  }
}
