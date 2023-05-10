import 'package:flutter/material.dart';
import 'package:week15_login/const/colors.dart';

class SocialButton extends StatelessWidget {
  final Icon icon;
  final onTap;
  const SocialButton({Key? key, required this.onTap, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
      onTap: onTap,
      child: Container(
        padding:  const EdgeInsets.all(17.0),
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor,
            //Color((0xFFF57C00)),
            boxShadow: [
              BoxShadow(
                offset: Offset(1, 1),
                blurRadius: 7,
                color: Colors.orange,
              ),
            ]),
        child: icon,
        ),
      );
  } }