import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizapp/features/quiz/presentation/view/widgets/lets_start_button_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Quiz App',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent),
      body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Image.asset(
              "assets/images/question_image.png",
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 100,
            ),
            LetsStart()
          ]),
    );
  }
}
