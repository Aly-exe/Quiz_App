import 'package:flutter/material.dart';
import 'package:quizapp/core/constants/colors.dart';
import 'package:quizapp/features/quiz/presentation/view/question_screen.dart';

class LetsStart extends StatelessWidget {
  const LetsStart({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> QuestionScreen()));
              },
              child: Container(
                width: 100,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ColorPallet.kSecondButtonBackgroundColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text("هيا نبدأ" ,style: TextStyle(color: Colors.white,fontSize: 24, fontWeight: FontWeight.w600)),
              ),
            );
  }
}