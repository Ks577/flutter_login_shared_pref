import 'package:flutter/material.dart';
import '../const/colors.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final onPressed;
   const AuthButton({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
   return  Container(
        height: 38 ,
        width: MediaQuery
        .of(context)
        .size
        .width,
       decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(50.0),
           gradient:  const LinearGradient(
               begin: Alignment.topCenter,
               end: Alignment.bottomCenter,
               colors: buttonsGradients),
           boxShadow: const [
             BoxShadow(
                 color: Colors.orange,
                 offset: Offset(3, 3),
                 blurRadius: 6,
                 spreadRadius: 2)]),
       child:
       MaterialButton(
           elevation: 2,
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(50.0)),
           minWidth: double.infinity,
           textColor: Colors.black,
           onPressed: onPressed,
           child: Text(
               text, style: const TextStyle(
               fontSize: 20,
               color: Colors.white))));
  }}