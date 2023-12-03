import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';

class TopBrandsOfferListWidget extends StatelessWidget {
  const TopBrandsOfferListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10),boxShadow: [BoxShadow(color: AppColors.kDarkPrimaryColor.withOpacity(.12),blurRadius: 12)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network('', errorBuilder: (context, error, stackTrace) => Image.asset(AssetsConstant.verticalBannner),),

          Padding(
            padding: const EdgeInsets.all(12.0).copyWith(bottom: 4),
            child: Text('Upto 35% Off',style: TextStyle(color: AppColors.kPrimaryColor,fontWeight: FontWeight.bold,fontSize: 14),),
          ), Padding(
            padding: const EdgeInsets.all(12.0).copyWith(top: 0),
            child: Text('Additional 10% off on ৳1299+',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 11),),
          ),
        ],
      ),
    );
  }
}
