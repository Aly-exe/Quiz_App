import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizapp/core/constants/colors.dart';
import 'package:quizapp/features/quiz/presentation/view/widgets/social_media_icon_widget.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: ColorPallet.kBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30 ,  vertical: 40.h ),
    child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 300.h,
              height: 350.h,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/Ali.jpeg"), fit: BoxFit.cover),
                border: Border.all(
                  color: Color(0xffFFFFFF),
                  width: 10,
                ),
                borderRadius: BorderRadius.circular(57.0),
              ),
            )
            ,const SizedBox(height: 30,),
            Text("Ali Sayed",style: TextStyle(fontSize: 40.sp,fontWeight: FontWeight.w700, color: Colors.white),),
            const SizedBox(height: 10,),
            Text("Software Engineer (Flutter Developer)",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500,color: Colors.white))
            ,const SizedBox(height: 15,),
            Text("You wil find me there",style: TextStyle(fontSize: 22.sp,color: ColorPallet.kCorrectAnswer ,fontWeight: FontWeight.w500))
            ,const SizedBox(height: 10,)
            , Container(height: 2, width: 260.w, color: Colors.grey,child: SizedBox(),)
            , SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                SocialMediaIcon(
                  image: "assets/images/github.png",
                  url: "https://github.com/Aly-exe",
                ),
                SocialMediaIcon(
                  image: "assets/images/linkedin.png",
                  url: "https://www.linkedin.com/in/ali-sayed-8a8b81220/",
                ),
                SocialMediaIcon(
                  image: "assets/images/facebook.png",
                  url: "https://www.facebook.com/profile.php?id=100026765389745",
                ),
                SocialMediaIcon(
                  image: "assets/images/instagram.png",
                  url: "https://www.instagram.com/3liisayed/",
                ),
                SocialMediaIcon(
                  image: "assets/images/whatsapp.png",
                  url: "https://wa.me/+201018961447",
                ),
              ]
            )

          ],
        ),
      ),
    ));
  }
}