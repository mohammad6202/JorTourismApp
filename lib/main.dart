import 'package:flutter/material.dart';
import 'package:jordan_heaven/screens/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final width =MediaQuery.of(context).size.width;
    final height =MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      designSize: Size(width, height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_,context){
        return MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: const Locale('ar'),
      
        supportedLocales: const [
          Locale('ar'),
        ],
      
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      
        // ✅ فرض RTL
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: child!,
          );
        },
      
        home: const HomeScreen(),
      ); 
      },
    );
  }
}
