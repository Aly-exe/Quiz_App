import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaIcon extends StatelessWidget {
  final String url;
  final String image;
  const SocialMediaIcon({
    super.key,
    required this.url,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: ()async{
          await launchUrl(Uri.parse(url));
        },
        child: Image.asset("$image", height: 40 ,width: 40,),
      ),
    );
  }
}