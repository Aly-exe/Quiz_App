import 'package:flutter/material.dart';
import 'package:quizapp/features/quiz/presentation/view/home_page_screen.dart';

void main(){
  runApp(QuizApp());
}
class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz App",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}