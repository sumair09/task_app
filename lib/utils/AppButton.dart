import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'AppColors.dart';

class AppButton extends StatelessWidget {
  var width;
  var text;
  var height;
  var btnColor;
  var borderRadius;
  var borderColor;
  var borderWidth;
  var fontSize;
  var isLoad;
  var loaderColor;
  VoidCallback onPress;
  var textColor;
  AppButton(
      {this.width,
        required this.onPress,
        this.btnColor,
        this.textColor,
        this.text,
        this.height,
        this.borderRadius,
        this.borderColor,
        this.borderWidth,
        this.fontSize,
        this.isLoad,
        this.loaderColor});
  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
        child: InkWell(
          onTap: isLoad != null && isLoad ? () {} : onPress,
          child: Container(
            width: width ?? Get.width * 0.5,
            height: height ?? Get.height * 0.05,
            decoration: BoxDecoration(
                color: btnColor,
                border: Border.all(
                    width: borderWidth ?? 0,
                    color: borderColor ?? Colors.transparent),
                borderRadius: BorderRadius.circular(borderRadius ?? 10)),
            child: Center(
              child: isLoad != null && isLoad
                  ? SizedBox(
                height: Get.height * 0.03,
                width: Get.height * 0.03,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: loaderColor ?? AppColors.white,
                ),
              )
                  : Text(
                text,
                style: TextStyle(
                    color: textColor,
                    fontSize: fontSize ?? Get.height * 0.02,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ));
  }
}
