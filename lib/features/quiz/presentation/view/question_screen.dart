import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizapp/core/constants/colors.dart';
import 'package:quizapp/features/quiz/data/models/questions_list.dart';
import 'package:quizapp/features/quiz/presentation/view/home_page_screen.dart';
import 'package:quizapp/features/quiz/presentation/view/widgets/warning_toast_widget.dart';
import 'package:quizapp/features/quiz/utilize/generate_random_number.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late List questionNumbers;
  bool isAlreadyselect = false;
  int index = 0;
  int score = 0;
  Color correctAnswer = Colors.transparent;
  Color wrongAnswer = Colors.transparent;
  bool scoreshow = false;
  bool exitShow = false;
  bool reloadDialog = false;
  var player = AudioPlayer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    questionNumbers = uniqueRandomNumberGenerator();
  }

  @override
  Widget build(BuildContext context) {
    print(questionNumbers.toString());
    print(questionsList.length);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorPallet.kBackgroundColor,
            body: Stack(
              children: [
                Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * .036),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                // exit widget
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      exitShow = true;
                                    });
                                  },
                                  child: Container(
                                    height: 40.h,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                      color: ColorPallet.kButtonBackgroundColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(Icons.exit_to_app , color: ColorPallet.kGreenColor,size: 16.w,),
                                  ),
                                ),
                                Spacer(),
                                Text('السؤال ${index + 1} ',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: ColorPallet.kGreenColor)),
                                Spacer(),
                                Text('النتيجه ${score}/10 ',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: ColorPallet.kGreenColor)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * .025,
                          ),
                          // Question
                          TextContainerWidget(
                              text: questionsList[questionNumbers[index]]
                                  .question),
                          SizedBox(
                            height: height * .025,
                          ),
                          // Answer
                          Container(
                            height: height * .5,
                            child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 4,
                                itemBuilder: (context, indexx) {
                                  return AnswerOptionWidget(
                                      istrue:
                                          questionsList[questionNumbers[index]]
                                              .options
                                              .values
                                              .toList()[indexx],
                                      correctAnswer: isAlreadyselect
                                          ? correctAnswer
                                          : Colors.transparent,
                                      wrongAnswer: isAlreadyselect
                                          ? wrongAnswer
                                          : Colors.transparent,
                                      onTap: () {
                                        if (isAlreadyselect == false) {
                                          isAlreadyselect = true;
                                          if (questionsList[
                                                  questionNumbers[index]]
                                              .options
                                              .values
                                              .toList()[indexx]) {
                                              player.play(AssetSource("sounds/correct_answer.mp3"));
                                            setState(() {
                                              score++;
                                              correctAnswer =
                                                  ColorPallet.kCorrectAnswer;
                                              wrongAnswer = Colors.transparent;
                                            });
                                          } else {
                                              player.play(AssetSource("sounds/wrong_answer.mp3"));
                                            setState(() {
                                              correctAnswer =
                                                  ColorPallet.kCorrectAnswer;
                                              wrongAnswer =
                                                  ColorPallet.kwrongAnswer;
                                            });
                                          }
                                        }
                                        if (index == 9) {
                                          scoreshow = true;
                                        }
                                      },
                                      answer:
                                          questionsList[questionNumbers[index]]
                                              .options
                                              .keys
                                              .toList()[indexx],
                                      index: indexx);
                                }),
                          ),
                          Spacer(),
                          //Next Question Button
                          Padding(
                            padding: const EdgeInsets.only(right: 5,bottom: 25,left:5),
                            child: Row(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      if (isAlreadyselect) {
                                        setState(() {
                                          if (index != 9) {
                                            index++;
                                            isAlreadyselect = false;
                                          }
                                        });
                                      } else {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                                backgroundColor:
                                                    ColorPallet.kWarningColor,
                                                content: const WarningToast()));
                                      }
                                    },
                                    child: Container(
                                      height: height * .05,
                                      width: 250.w,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: ColorPallet
                                              .kSecondButtonBackgroundColor,
                                          borderRadius: BorderRadius.circular(20)),
                                      child: Text(
                                        "السؤال التالى",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                
                                Spacer(),
                                InkWell(
                                    onTap: () {
                                      setState(() {
                                        reloadDialog=true;
                                      });
                                    },
                                    child: Container(
                                    height: 40.h,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                      color: ColorPallet.kButtonBackgroundColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(Icons.replay_outlined , color: ColorPallet.kGreenColor,size: 16.w,),
                                  ),
                                  ),
                              ],
                            ),
                          )
                          
                        ],
                      ),
                    )),

                //show when exit or when finsih test Center
                scoreshow ? ScoreWidget(score: score) : SizedBox(),
                exitShow? Directionality(
                        textDirection: TextDirection.rtl,
                        child: Center(
                          child: Container(
                            width: 200.w,
                            height: 250.h,
                            decoration: BoxDecoration(
                                color: ColorPallet.kButtonBackgroundColor,
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "أنت علي وشك المغادره ! \n إنهاء الاختبار ؟",
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomePage()));
                                    },
                                    child: Container(
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                        color: ColorPallet.kCorrectAnswer,
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(6.w),
                                        child: Text(
                                          "نعم",
                                          style: TextStyle(color: Colors.white,fontSize: 14.sp),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        exitShow = false;
                                      });
                                    },
                                    child: Container(
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                        color: ColorPallet.kwrongAnswer,
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(6.w),
                                        child: Text(
                                          "لا",
                                          style: TextStyle(color: Colors.white,fontSize: 14.sp),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),
                    reloadDialog? Directionality(
                        textDirection: TextDirection.rtl,
                        child: Center(
                          child: Container(
                            width: 200.w,
                            height: 250.h,
                            decoration: BoxDecoration(
                                color: ColorPallet.kButtonBackgroundColor,
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "هل تريد إعادة الاختبار ؟",
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  QuestionScreen()));
                                    },
                                    child: Container(
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                        color: ColorPallet.kCorrectAnswer,
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(6.h),
                                        child: Text(
                                          "نعم",
                                          style: TextStyle(color: Colors.white ,fontSize: 14.sp),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        reloadDialog = false;
                                      });
                                    },
                                    child: Container(
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                        color: ColorPallet.kwrongAnswer,
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(6.h),
                                        child: Text(
                                          "لا",
                                          style: TextStyle(color: Colors.white, fontSize: 14.sp),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : SizedBox()
              ],
            )));
  }
}

class TextContainerWidget extends StatelessWidget {
  final text;
  const TextContainerWidget({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child:  Text(
            text,
            maxLines: 2,
            style: TextStyle(fontSize: 15.sp, color: Colors.white),
          ),
      ),
    );
  }
}

class AnswerOptionWidget extends StatelessWidget {
  final answer;
  final index;
  final void Function() onTap;
  final bool istrue;
  final Color correctAnswer;
  final Color wrongAnswer;
  const AnswerOptionWidget({
    super.key,
    required this.answer,
    required this.index,
    required this.onTap,
    required this.istrue,
    required this.correctAnswer,
    required this.wrongAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: istrue ? correctAnswer : wrongAnswer,
              borderRadius: BorderRadius.circular(10.0)),
          child: Row(
            children: [
              CircleAvatar(
                  backgroundColor: ColorPallet.kSecondButtonBackgroundColor,
                  child: Text("${index + 1}",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white))),
              TextContainerWidget(
                text: answer,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScoreWidget extends StatelessWidget {
  final int score;
  const ScoreWidget({super.key, required this.score});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Center(
        child: Container(
          width: 240.w,
          height: 300.h,
          decoration: BoxDecoration(
              color: ColorPallet.kButtonBackgroundColor,
              borderRadius: BorderRadius.circular(30.0)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
                  "النتيجه",
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: ColorPallet.kGreenColor,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${score}/10",
                  style:
                      TextStyle(color: ColorPallet.kGreenColor, fontSize: 20.sp),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  score <= 5
                      ? "للأسف، نتيجتك ضعيفة. حاول مرة أخرى لتحسين أدائك."
                      : score > 5 && score <= 7
                          ? "أداء مقبول ، ولكن بإمكانك التحسين!"
                          : score == 8 || score == 9
                              ? "أداء ممتاز ! اقتربت من الكمال."
                              : "تهانينا ! لقد حصلت على الدرجة الكاملة!",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Container(
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: ColorPallet.kSecondButtonBackgroundColor,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(6.h),
                      child: Text(
                        "الرئيسيه",
                        style: TextStyle(color: Colors.white,fontSize: 16.sp),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuestionScreen()));
                  },
                  child: Container(
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: ColorPallet.kSecondButtonBackgroundColor,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(6.h),
                      child: Text(
                        "إعادة الاختبار",
                        style: TextStyle(color: Colors.white, fontSize: 16.sp),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
