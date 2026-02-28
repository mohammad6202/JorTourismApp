// ignore_for_file: use_build_context_synchronously

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RateScreen extends StatefulWidget {
  const RateScreen({super.key});

  @override
  State<RateScreen> createState() => _RateScreenState();
}

class _RateScreenState extends State<RateScreen> {
  Map<int, int> selectedRatings = {};
  final AudioPlayer _audioPlayer = AudioPlayer();
  // قائمة الأسئلة
  final List<String> surveyQuestions = [
    "1. كيف تقيم تجربتك؟",
    "2. كانت المعلومات مفيدة؟",
    "3. التصميم كان منسقا وواضحا",
    "4. تنصح الاخرين باستخدامه",
  ];

  // خيارات التقييم مع الرموز التعبيرية الإضافية
  final List<Map<String, String>> ratingOptions = [
    {"text": "ممتازة", "emoji": "😍"},
    {"text": "جيدة", "emoji": "😊"},
    {"text": "ضعيفة", "emoji": "😕"},
  ];

  // دالة إرسال التقييم
  void _submitRating() async {
    // التحقق مما إذا كان المستخدم قد أجاب على جميع الأسئلة الأربعة
    if (selectedRatings.length < surveyQuestions.length) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            "يرجى الإجابة على جميع الأسئلة قبل التسليم!",
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
      return;
    }
    int excellentCount = selectedRatings.values
        .where((value) => value == 0)
        .length;

    // 🔊 تشغيل صوت التصفيق إذا 3 أو أكثر ممتازة
    if (excellentCount >= 3) {
      await _audioPlayer.play(AssetSource('sounds/clapp.mp3'));
    }
    // إذا كانت جميع الإجابات مكتملة، نعرض رسالة شكر
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color(0xffffe5df),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Icon(
            Icons.check_circle,
            color: Color(0xff612518),
            size: 60,
          ),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "شكراً لتقييمك!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff612518),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "رأيك يهمنا جداً في تطوير تطبيق أردنا جنة.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xff612518), fontSize: 16),
              ),
            ],
          ),
          actions: [
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff612518),
                  foregroundColor: Color(0xffffe5df),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context); // إغلاق النافذة
                  // يمكنك هنا إضافة كود للانتقال لشاشة أخرى
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "العودة للرئيسية",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // العنوان الرئيسي
          const Text(
            "أعطنا رأيك في التطبيق!!",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w900,
              color: Color(0xffffe5df),
            ),
          ),
          const SizedBox(height: 30),

          // توليد بطاقات التقييم
          ...List.generate(surveyQuestions.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: _buildRatingCard(
                questionIndex: index,
                question: surveyQuestions[index],
              ),
            );
          }),

          const SizedBox(height: 10),

          // زر التسليم
          Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              onPressed: _submitRating,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffffe5df),
                foregroundColor: Color(0xff612518),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 12,
                ),
                elevation: 5, // إضافة ظل بسيط للزر
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Text(
                "تسليم",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildRatingCard({
    required int questionIndex,
    required String question,
  }) {
    return Container(
      padding: const EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 8,
            offset: const Offset(0, 4), // ظل خفيف للبطاقة
          ),
        ],
        gradient: const LinearGradient(
          colors: [ Color(0xffffe5df),Color(0xffa4442e)],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(
              color: Color.fromARGB(255, 43, 17, 11),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(ratingOptions.length, (optionIndex) {
                bool isSelected = selectedRatings[questionIndex] == optionIndex;

                return GestureDetector(
                  onTap: () {
                    // تشغيل اهتزاز خفيف عند الاختيار
                    HapticFeedback.lightImpact();
                    setState(() {
                      selectedRatings[questionIndex] = optionIndex;
                    });
                  },
                  // إضافة تأثير حركي (تكبير وتصغير) عند التحديد
                  child: AnimatedScale(
                    scale: isSelected
                        ? 1.05
                        : 1.0, // تكبير بنسبة 5% إذا تم اختياره
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            isSelected
                                ? Icons.radio_button_checked
                                : Icons.radio_button_unchecked,
                            color: const Color(
                              0xFF185A80,
                            ), // لون الدائرة الأزرق
                            size: 24,
                          ),
                          const SizedBox(width: 10),
                          // استخدام تأثير حركي لتغيير سماكة الخط ولونه
                          AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 200),
                            style: TextStyle(
                              color: isSelected
                                  ? const Color(0xFF30100A)
                                  : Color.fromARGB(255, 56, 26, 19),
                              fontSize: isSelected ? 18 : 16,
                              fontWeight: isSelected
                                  ? FontWeight.w900
                                  : FontWeight.bold,
                              fontFamily: 'Cairo', // قم بتغييره لخطك المستخدم
                            ),
                            child: Text(
                              "${ratingOptions[optionIndex]['text']} ${ratingOptions[optionIndex]['emoji']}",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
