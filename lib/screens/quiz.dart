import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // استدعاء مكتبة الصوت

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // مشغل الصوت
  final AudioPlayer _audioPlayer = AudioPlayer();

  // خريطة لحفظ الإجابات المختارة (رقم السؤال: رقم الخيار المختار)
  Map<int, int> selectedAnswers = {};

  // قائمة الأسئلة والخيارات والإجابة الصحيحة (رقم الخيار الصحيح يبدأ من 0)
  final List<Map<String, dynamic>> quizData = [
    {
      "question": "1. بماذا تشتهر البتراء؟",
      "options": ["صخورها السوداء", "صخورها الوردية", "أعمدتها اليونانية"],
      "correctAnswerIndex": 1 // صخورها الوردية
    },
    {
      "question": "2. أين تقع قلعة عجلون",
      "options": ["في شمال الأردن", "في البادية الغربية", "في جنوب الأردن"],
      "correctAnswerIndex": 0 // في شمال الأردن
    },
    {
      "question": "3. متى تم اكتشاف أعمدة جرش",
      "options": ["عام 1806م", "عام 1920م", "عام 1896م"],
      "correctAnswerIndex": 0 // عام 1806م
    },
    {
      "question": "4. متى تم تأسيس محمية ضانا؟",
      "options": ["عام 1999م", "عام 1980م", "عام 1989م"],
      "correctAnswerIndex": 2 // عام 1989م
    },
  ];

  // دالة حساب النتيجة وعرضها
  void _submitQuiz() async {
    int score = 0;

    // حساب الإجابات الصحيحة
    for (int i = 0; i < quizData.length; i++) {
      if (selectedAnswers[i] == quizData[i]["correctAnswerIndex"]) {
        score++;
      }
    }

    // إذا كانت النتيجة عالية (مثلاً 3 أو 4 من 4)، قم بتشغيل الصوت التشجيعي
    if (score >= 3) {
      // تأكد من وجود ملف الصوت في المسار assets/sounds/cheer.mp3
      await _audioPlayer.play(AssetSource('sounds/cheer.mp3'));
    }

    // عرض النتيجة في نافذة منبثقة (Dialog)
    if (mounted) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: const Color(0xFFFFE5DF),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: const Text(
              "النتيجة النهائية",
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF552219), fontWeight: FontWeight.bold),
            ),
            content: Text(
              "لقد حصلت على $score من ${quizData.length} ${score >= 3 ? '🎉 ممتاااز!' : '👍 حظاً أوفر المرة القادمة!'}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, color: Color(0xFF552219)),
            ),
            actions: [
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF552219),
                    foregroundColor: const Color(0xFFFFE5DF),
                  ),
                  onPressed: () {
                    Navigator.pop(context); // إغلاق النافذة
                  },
                  child: const Text("حسناً"),
                ),
              )
            ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose(); // التخلص من مشغل الصوت عند إغلاق الشاشة
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.all(30.h),
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "لديك مجموعة من الأسئلة الترفيهية، أجب عليها\nواعرف درجتك النهائية!!!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFE5DF),
                ),
              ),
              const SizedBox(height: 30),
              
              // بناء الأسئلة ديناميكياً من القائمة
              ...List.generate(quizData.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: _buildQuizCard(
                    questionIndex: index,
                    question: quizData[index]["question"],
                    options: List<String>.from(quizData[index]["options"]),
                  ),
                );
              }),
              
              const SizedBox(height: 10),
              // زر التسليم
              Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  onPressed: _submitQuiz, // استدعاء دالة التسليم
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFE5DF),
                    foregroundColor: const Color(0xFF552219),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
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
            ],
          ),
    );
      
      // شريط التنقل السفلي
  }

  // دالة مساعدة لبناء شكل البطاقة بالخيارات التفاعلية
  Widget _buildQuizCard({
    required int questionIndex,
    required String question,
    required List<String> options,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
          colors: [Color(0xFFFFE5DF), Color(0xFFA64D3A)],
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
              color: Color(0xFF552219),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // إنشاء الخيارات وجعلها قابلة للضغط
              children: List.generate(options.length, (optionIndex) {
                // التحقق مما إذا كان هذا الخيار هو المحدد حالياً
                bool isSelected = selectedAnswers[questionIndex] == optionIndex;

                return GestureDetector(
                  onTap: () {
                    // تحديث واجهة المستخدم عند اختيار إجابة
                    setState(() {
                      selectedAnswers[questionIndex] = optionIndex;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          // تغيير شكل الأيقونة إذا كانت محددة أو لا
                          isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                          color: const Color(0xFF185A80),
                          size: 22,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          options[optionIndex],
                          style: TextStyle(
                            color: const Color(0xFF552219),
                            fontSize: 14,
                            // زيادة سماكة الخط للإجابة المحددة لتمييزها
                            fontWeight: isSelected ? FontWeight.w900 : FontWeight.bold, 
                          ),
                        ),
                      ],
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