import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PetraDetailsScreen extends StatefulWidget {
  const PetraDetailsScreen({super.key});

  @override
  State<PetraDetailsScreen> createState() => _PetraDetailsScreenState();
}

class _PetraDetailsScreenState extends State<PetraDetailsScreen> {
  int? selectedIndex;
  int rating = 0;

  final List<String> galleryImages = [
    "assets/images/petra1.jpg",
    "assets/images/petra2.jpg",
    "assets/images/petra3.jpg",
    "assets/images/petra4.jpg",
  ];

  final List<Map<String, String>> landmarks = [
    {
      "title": "الخزنة",
      "desc":
          "تُعد الخزنة أشهر معالم البتراء، وهي واجهة ضخمة منحوتة في الصخر الوردي بارتفاع يقارب 40 مترًا.",
    },
    {
      "title": "الدير",
      "desc":
          "يعتبر الدير من أكبر المعالم في البتراء، ويتطلب الوصول إليه صعود أكثر من 800 درجة.",
    },
    {
      "title": "السيق",
      "desc": "السيق هو ممر صخري ضيق بطول 1.2 كم يؤدي إلى قلب المدينة الوردية.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff6f3),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔥 صورة رئيسية
            Image.asset(
              "assets/images/petra1.jpg",
              height: 230.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            SizedBox(height: 20.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                "البتراء - المدينة الوردية",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff612518),
                ),
              ),
            ),

            SizedBox(height: 15.h),

            // 📝 نص معلومات
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                "تقع مدينة البتراء في جنوب المملكة الأردنية الهاشمية، وتحديدًا في محافظة معان، "
                "وتُعد واحدة من أعظم المدن الأثرية في العالم وأكثرها إبهارًا. أسسها الأنباط في القرن الرابع قبل الميلاد، "
                "وجعلوها عاصمة لمملكتهم التي ازدهرت بفضل موقعها الاستراتيجي على طرق التجارة القديمة التي كانت تربط بين الجزيرة العربية ومصر وبلاد الشام. "
                "ساهم هذا الموقع في جعل البتراء مركزًا تجاريًا مهمًا لتبادل البضائع مثل البخور والتوابل والحرير.\n\n"
                "تتميز البتراء بهندستها المعمارية الفريدة، حيث نُحتت مبانيها بالكامل في الصخور الرملية الوردية، "
                "مما أكسبها لقب 'المدينة الوردية'. ومن أبرز معالمها الخزنة، الدير، المدرج النبطي، والسيق، "
                "وهو ممر صخري ضيق وطويل يؤدي إلى قلب المدينة. كما أبدع الأنباط في تصميم نظام مائي متطور "
                "اعتمد على القنوات والسدود والخزانات لتجميع مياه الأمطار وتخزينها، مما مكّنهم من العيش في بيئة صحراوية قاسية.\n\n"
                "في عام 1985، أدرجت منظمة اليونسكو البتراء على قائمة التراث العالمي نظرًا لقيمتها التاريخية والثقافية العظيمة. "
                "وفي عام 2007، تم اختيارها كواحدة من عجائب الدنيا السبع الجديدة، ما عزز مكانتها كوجهة سياحية عالمية "
                "تستقطب ملايين الزوار سنويًا من مختلف أنحاء العالم.\n\n"
                "اليوم، لا تمثل البتراء مجرد موقع أثري، بل تُعد رمزًا للهوية الوطنية الأردنية وشاهدًا حيًا على حضارة عظيمة "
                "امتزجت فيها العبقرية الهندسية بالفن المعماري والطبيعة الساحرة، لتبقى واحدة من أجمل الكنوز التاريخية في العالم.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 15.sp,
                  height: 1.9,
                  color: Colors.black87,
                ),
              ),
            ),

            SizedBox(height: 25.h),

            // 🖼 معرض الصور الأفقي
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                "معرض الصور",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff612518),
                ),
              ),
            ),

            SizedBox(height: 15.h),

            SizedBox(
              height: 160.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: galleryImages.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => Dialog(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              galleryImages[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 15.w),
                      width: 200.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(galleryImages[index]),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 30.h),

            // ⭐ تقييم نجوم
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                "قيّم البتراء",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff612518),
                ),
              ),
            ),

            SizedBox(height: 10.h),

            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return IconButton(
                    onPressed: () {
                      setState(() {
                        rating = index + 1;
                      });
                    },
                    icon: Icon(
                      index < rating ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                      size: 32,
                    ),
                  );
                }),
              ),
            ),

            if (rating > 0)
              Center(
                child: Text(
                  "تقييمك: $rating / 5 ⭐",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff612518),
                  ),
                ),
              ),

            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
