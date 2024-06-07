import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:task_app/utils/AppColors.dart';

class AppInputField extends StatelessWidget {

  var controller;
  var errorText;
  var hintText;
  var iconRight;
  var rightIconCallBack;
  var onChanged;
  var isPassword;
   AppInputField({this.controller,this.errorText,this.hintText,this.onChanged,this.iconRight,this.rightIconCallBack,this.isPassword});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.blue,
      obscureText: isPassword ?? false,
      decoration: InputDecoration(
        errorText: errorText.toString().isEmpty ? null : errorText,
        hintText: hintText,
        label: Text(hintText, style: const TextStyle(color: Colors.black),),
        enabledBorder: OutlineInputBorder(
          borderSide:  BorderSide(
              color:  AppColors.black, width: 1),
          borderRadius: BorderRadius.circular( 10),
        ),
        border: OutlineInputBorder(
          borderSide:  BorderSide(
              color:  AppColors.black, width: 1),
          borderRadius: BorderRadius.circular( 10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:  BorderSide(
              color:  AppColors.blue, width: 1),
          borderRadius: BorderRadius.circular( 10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide:  const BorderSide(
              color:  Colors.red, width: 1),
          borderRadius: BorderRadius.circular( 10),
        ),
        suffixIcon: IconButton(
          onPressed: rightIconCallBack,
          icon: isPassword == null ? const SizedBox(): Icon(isPassword ? Icons.visibility : Icons.visibility_off),
          color:  isPassword != null ? HexColor('05426d') : AppColors.black.withOpacity(0.8),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
