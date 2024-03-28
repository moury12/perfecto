import 'package:flutter/material.dart';
import 'package:perfecto/constants/color_constants.dart';

class PerfectoLoading extends StatelessWidget {
  const PerfectoLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: SizedBox(
          height: 30,
          width: 30,
          child: Stack(
            children: [
              CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.kPrimaryColor),
                color: AppColors.kPrimaryColor,
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Center(
                  child: Text(
                    'Perfecto',
                    style: TextStyle(fontSize: 5, color: AppColors.kPrimaryColor),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
