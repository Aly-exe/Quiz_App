import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizapp/core/constants/colors.dart';
import 'package:quizapp/features/quiz/presentation/view/widgets/about_us_button.dart';
import 'package:quizapp/features/quiz/presentation/view/widgets/lets_start_button_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallet.kBackgroundColor,
      appBar: AppBar(
          title:  Text(
            'Quiz App',
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500, color: ColorPallet.kGreenColor),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Image.asset(
              "assets/images/question_image.png",
              width: double.infinity,
              height: 200.h,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: 100,
            ),
            LetsStart()
            ,SizedBox(
              height: 20.h,
            ),
            AboutUsButton()

          ]),
    );
  }
}
