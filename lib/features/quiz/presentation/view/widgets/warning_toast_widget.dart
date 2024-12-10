import 'package:flutter/material.dart';

class WarningToast extends StatelessWidget {
  const WarningToast({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        children: [
          Icon(Icons.error_outline, color: Colors.white ,size: 20,),
          SizedBox(width: 4,),
          Text(
            "برجاء الإجابه علي السؤال للإنتقال الي السؤال التالي",
            style: TextStyle(fontSize: 15),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}