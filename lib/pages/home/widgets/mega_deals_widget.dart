import 'package:flutter/material.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/theme/theme_data.dart';

class MegaDealsWidget extends StatelessWidget {
  final String name;

  final String img;

  final int rate;
  final String price;
  final String previousPrice;
  final bool isStacked;
  final bool isBestSeller;
  final bool isBuy1Get1;
  const MegaDealsWidget({
    super.key, required this.name,  required this.rate, required this.price, required this.previousPrice, this.isStacked=false, this.isBestSeller=false, this.isBuy1Get1=true, required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(


          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(color:AppColors.kDarkPrimaryColor.withOpacity(.10),blurRadius: 8)]),
          child:
          Column(
            children: [
              ClipRRect(borderRadius: BorderRadius.circular(10),
                child:  Image.network('',errorBuilder: (context, error, stackTrace) {
                  return Image.asset(img,fit: BoxFit.fitWidth,height: 109,);
                },),
              ),
              Padding(
                padding:  EdgeInsets.all(8.0),
                child: Text(name,style: AppTheme.textStyleBoldBlack12,maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,),
              ), Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 6),
                    decoration: BoxDecoration(color:isBuy1Get1? AppColors.kOfferButtonColor:AppColors.kFreeDeliveryButtonColor, borderRadius: BorderRadius.circular(2)),
                    child: Text(isBuy1Get1?'Buy 1 Get 1':'Free Delivery',style: AppTheme.textStyleBoldWhite10)),
              ),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 4),
                child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [...List.generate(5,(index) {
                    return
                      index == 4
                          ? const Icon(
                        Icons.star_border_rounded,
                        color: AppColors
                            .kOfferButtonColor,
                        size: 15,
                      )
                          : const Icon(
                        Icons.star_rate_rounded,
                        color: AppColors
                            .kOfferButtonColor,
                        size: 15,
                      );
                  },),
                    Text('($rate)',style: const TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 10))],),
              ),
              RichText(text: TextSpan(text: '',style: AppTheme.textStyleBoldBlack14, children: [
                TextSpan(text: '$price  ',style: AppTheme.textStyleBoldBlack14,),
                TextSpan(text: previousPrice,style: const TextStyle(decoration: TextDecoration.lineThrough,color: Colors.black54,fontSize: 10, fontWeight: FontWeight.normal),)
              ]))
            ],
          ),
        ),
        isStacked?isBestSeller?Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(color: Color(0xffD4F3FF),borderRadius: BorderRadius.only(topLeft: Radius.circular(4),bottomRight: Radius.circular(4)),
          ),
          child: const Text('Bestseller', style: TextStyle(color: Color(0xff0094CF),fontSize: 10),),):Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(color: Color(0xffECDDFF),borderRadius: BorderRadius.only(topLeft: Radius.circular(4),bottomRight: Radius.circular(4)),
        ),
        child: const Text('Offer', style: TextStyle(color: Color(0xff8513DF),fontSize: 10),),):const SizedBox.shrink()
      ],
    );
  }
}
