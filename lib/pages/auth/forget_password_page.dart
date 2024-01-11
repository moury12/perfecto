import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:mh_core/widgets/textfield/custom_textfield.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/auth/login_page.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String routeName = '/forget_pass';
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset(AssetsConstant.backRoute,height: 20,),
        ),
      ),elevation: 0,backgroundColor: AppColors.kBackgroundColor,),
      backgroundColor: AppColors.kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).viewPadding.top),


            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Forgot Password',
                style: AppTheme.textStyleSemiBoldBlack24,
              ),
            ),
              const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Enter the email address you used when you registered and we’ll send you instructions to reset your password.',
                style: AppTheme.textStyleNormalBlack14,
              ),
            ),


            CustomTextField(
              hintText: 'Enter Your email',
              enableBorderColor: AppColors.kPrimaryColor,
              prefixWidget: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  AssetsConstant.email,color: Colors.grey,
                  height: 20,
                ),
              ),
            ),

            CustomButton(
              label: 'Send reset instructions',
              marginVertical: 20,
              onPressed: () {},
            ),

            CustomSizedBox.space16H,
          ],
        ),
      ),
    );
  }
}
