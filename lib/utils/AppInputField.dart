import 'package:flutter/material.dart';
import 'package:task_app/utils/AppColors.dart';

class AppInputField extends StatelessWidget {

  var controller;
  var errorText;
  var hintText;
  var onChanged;
   AppInputField({this.controller,this.errorText,this.hintText,this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        errorText: errorText,
        hintText: hintText,
        label: Text(hintText, style: TextStyle(color: Colors.black),),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color:  Colors.black, width: 1),
          borderRadius: BorderRadius.circular( 10),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
              color:  Colors.black, width: 1),
          borderRadius: BorderRadius.circular( 10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color:  Colors.black, width: 1),
          borderRadius: BorderRadius.circular( 10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color:  Colors.red, width: 1),
          borderRadius: BorderRadius.circular( 10),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
