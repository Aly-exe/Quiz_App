import 'package:flutter/material.dart';
import 'package:quizapp/core/constants/colors.dart';
import 'package:quizapp/features/quiz/presentation/view/about_us_screen.dart';
class AboutUsButton extends StatelessWidget {
  const AboutUsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> AboutUs()));
              },
              child: Container(
                width: 100,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ColorPallet.kSecondButtonBackgroundColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text("نبذه عنا" ,style: TextStyle(color: Colors.white,fontSize: 24, fontWeight: FontWeight.w600)),
              ),
            );
  }
}