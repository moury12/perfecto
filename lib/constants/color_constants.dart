import 'package:flutter/material.dart';

class AppColors {
  static const Color kPrimaryColor = Color(0xFF5DC9F4);
  static const Color kDarkPrimaryColor = Color(0xFF0094CF);
  static const Color kAccentColor = Color(0xffD4F3FF);

  static MaterialColor kPrimarySwatch = MaterialColor(0xff2A41CB, swatch);

  static Map<int, Color> swatch = {
    50: kPrimaryColor.withOpacity(.1),
    100: kPrimaryColor.withOpacity(.2),
    200: kPrimaryColor.withOpacity(.3),
    300: kPrimaryColor.withOpacity(.4),
    400: kPrimaryColor.withOpacity(.5),
    500: kPrimaryColor.withOpacity(.6),
    600: kPrimaryColor.withOpacity(.7),
    700: kPrimaryColor.withOpacity(.8),
    800: kPrimaryColor.withOpacity(.9),
    900: kPrimaryColor.withOpacity(1),
  };

  static const Color kBackgroundColor = Color(0xFFEFF2FB);
  static const Color kOfferButtonColor = Color(0xffFFAC0A);
  static const Color kFreeDeliveryButtonColor = Color(0xffFF800A);
  static const Color kBlackColor = Color(0xff000000);
  static const Color kRedColor = Color(0xffd70000);
  static const Color kGreyColor = Color(0xffc5c5c5);
  static const Color kLightTextColor = Color(0xffc0cbf3);
  static const Color kProgressRemainingColor = Color(0xffeaedff);
  static const Color kExamItemBGColor = Color(0xffDCE4FF);
  static Color kBorderColor = const Color(0xff2A41CB).withOpacity(0.8);
  static Color kPrimaryColor5P = const Color(0xff2A41CB).withOpacity(0.5);
  static Color kPrimaryColor2P = const Color(0xff2A41CB).withOpacity(0.02);
  static const kbgGradient = LinearGradient(
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
    colors: [
      Color(0xFF849EFF),
      Color(0xFFC0CBF3),
    ],
  );
}
