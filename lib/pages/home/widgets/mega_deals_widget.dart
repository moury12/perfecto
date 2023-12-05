import 'package:flutter/material.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

import '../controller/home_controller.dart';

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
        isStacked?isBestSeller?
        Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(color: Color(0xffD4F3FF),borderRadius: BorderRadius.only(topLeft: Radius.circular(4),bottomRight: Radius.circular(4)),
          ),
          child: const Text('Bestseller', style: TextStyle(color: Color(0xff0094CF),fontSize: 10),),):
        Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(color: Color(0xffECDDFF),borderRadius: BorderRadius.only(topLeft: Radius.circular(4),bottomRight: Radius.circular(4)),
        ),
        child: const Text('Offer', style: TextStyle(color: Color(0xff8513DF),fontSize: 10),),):const SizedBox.shrink()
      ],
    );
  }
}
class TileTextWidget extends StatelessWidget {
  final String tileText;
  const TileTextWidget({
    super.key, required this.tileText,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Text(tileText,style: AppTheme.textStyleSemiBoldBlack16,),
    );
  }
}

class GridItemWidget extends StatelessWidget {
  final String img;
  const GridItemWidget({
    super.key,
    required this.size, required this.img,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(image: DecorationImage(image: AssetImage(img,),fit: BoxFit.fitWidth,alignment: Alignment.topCenter)),
      child: Column(
        children: [
          CustomSizedBox.space8H,
          SizedBox(height:MediaQuery.of(context).size.width>800?size.height/1.5:size.height/7.5,),
          GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16),
            shrinkWrap: true,
            primary: false,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
                mainAxisExtent: 250

            ),itemBuilder: (context, index)
          {
            Map<String, dynamic> data=HomeController.to.megadealsITem[index];
            return Padding(
              padding:  EdgeInsets.all(MediaQuery.of(context).size.width>800?8:4.0),
              child: MegaDealsWidget(
                name: data['name'],
                isBestSeller:data['isBestSeller'] ,
                isBuy1Get1:data['isbuy1Get1'] ,
                isStacked: data['isStacked'],
                rate: data['rating'],
                price: data['price'],
                previousPrice: data['previousPrice'], img: data['img'],),
            );
          },
            itemCount: 6,
          )
        ],
      ),
    );
  }
}