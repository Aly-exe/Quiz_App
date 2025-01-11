import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizapp/features/quiz/presentation/view/home_page_screen.dart';

void main(){
  runApp(QuizApp());
}
class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 756),
      minTextAdapt: true,
      builder: (context, child){
        return MaterialApp(
        title: "Quiz App",
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      );
      },);
  }
}