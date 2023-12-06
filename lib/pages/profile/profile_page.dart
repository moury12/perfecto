import 'package:flutter/material.dart';
import 'package:perfecto/constants/assets_constants.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName='/profile';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AssetsConstant.banner2);
  }
}
