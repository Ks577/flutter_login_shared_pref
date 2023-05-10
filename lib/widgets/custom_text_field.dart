import 'package:flutter/material.dart';
import 'package:week15_login/const/colors.dart';

Widget customTextField(
    String hintText, TextEditingController controller, Icon icon,
    {required bool obscureText}) {
  return Container(
    height: 55,
    decoration: const ShapeDecoration(
      gradient: LinearGradient(
        colors: fieldsGradients,
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.0, 0.4],
//  tileMode: TileMode.clamp,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(45.0)),
      ),
    ),
    child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        textAlignVertical: TextAlignVertical.bottom,
        //  controller:  controllerPassword,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          prefixIcon: icon,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(55),
            borderSide: const BorderSide(width: 1, color: Colors.orange),
          ),
        )),
  );
}
