import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Padding(
          padding: EdgeInsets.only(left: 30.w,top: 30.h,right: 30.w,bottom: 100.h),
          child: VideoPlayerWidget(),
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
    // TODO: implement initState
    super.initState();
    controller = VideoPlayerController.asset("assets/videos/jordan.mp4")
      ..initialize().then((value) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: controller.value.isInitialized
              ? AspectRatio(
                  child: VideoPlayer(controller),
                  aspectRatio: controller.value.aspectRatio,
                )
              : Text("تعذر التشغيل"),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(shape:CircleBorder()),
          onPressed: (){
          controller.value.isPlaying? controller.pause():controller.play();
        }, child: Icon(controller.value.isPlaying?Icons.play_arrow:Icons.pause))
      ],
    );
  }
}
