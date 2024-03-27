import 'package:flutter/material.dart';
import 'package:flutter_sslcommerz/model/SSLCAdditionalInitializer.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCTransactionInfoModel.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:mh_core/utils/global.dart' as mh;
import 'package:perfecto/shared/global.dart';

// Future<SSLCTransactionInfoModel> sslCommerzGeneralCallTest(double price, String category) async {
//   Sslcommerz sslcommerz = Sslcommerz(
//     initializer: SSLCommerzInitialization(
//       //Use the ipn if you have valid one, or it will fail the transaction.
//       // ipn_url: "www.ipnurl.com",
//       ipn_url: "https://www.shebaone.com",
//       // multi_card_name: 'multi',
//       currency: SSLCurrencyType.BDT,
//       product_category: category,
//       sdkType:
//       // _radioSelected == SdkType.TESTBOX
//       //     ?
//       // SSLCSdkType.TESTBOX,
//       // :
//       SSLCSdkType.LIVE,
//       store_id: 'shebaonelive',
//       store_passwd: '621B03D88866C40843',
//       total_amount: price,
//       tran_id: uuid.v4(),
//     ),
//   );
//   SSLCTransactionInfoModel res = SSLCTransactionInfoModel();
//   try {
//     SSLCTransactionInfoModel result = await sslcommerz.payNow();
//
//     if (result.status!.toLowerCase() == "failed") {
//       mh.showSnackBar(
//         msg: "Transaction is Failed....",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 16.0,
//       );
//     } else if (result.status!.toLowerCase() == "closed") {
//       mh.showSnackBar(
//         msg: "SDK Closed by User",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 16.0,
//       );
//     } else {
//       mh.showSnackBar(
//           msg: "Transaction is ${result.status} and Amount is ${result.amount}",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.CENTER,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.black,
//           textColor: Colors.white,
//           fontSize: 16.0);
//     }
//     res = result;
//     print(result.toJson());
//   } catch (e) {
//     debugPrint(e.toString());
//   }
//   return res;
// }

Future<SSLCTransactionInfoModel> sslCommerzGeneralCallTest(double price, String category, String tranId) async {
  Sslcommerz sslcommerz = Sslcommerz(
    initializer: SSLCommerzInitialization(
      //Use the ipn if you have valid one, or it will fail the transaction.
      // ipn_url: "www.ipnurl.com",
      ipn_url:
          // kReleaseMode ? "https://www.shebaone.com" :
          "www.mh-sarkar.com",
      // multi_card_name: formData['multicard'],
      currency: SSLCurrencyType.BDT,
      product_category: category,
      sdkType:
          // _radioSelected == SdkType.TESTBOX
          //     ?
          // kReleaseMode ? SSLCSdkType.LIVE :
          SSLCSdkType.TESTBOX,
      // : SSLCSdkType.LIVE,
      store_id:
          // kReleaseMode ? 'shebaonelive' :
          'mhsar634cebec62412',
      store_passwd:
          // kReleaseMode ? '621B03D88866C40843' :
          'mhsar634cebec62412@ssl',
      total_amount: price,
      tran_id: tranId,
    ),
  )..addAdditionalInitializer(
      sslcAdditionalInitializer: SSLCAdditionalInitializer(
        valueA: "perfecto app",
        valueB: category,
        valueC: "",
        valueD: "",
      ),
    );
  SSLCTransactionInfoModel res = SSLCTransactionInfoModel();
  try {
    SSLCTransactionInfoModel result = await sslcommerz.payNow();

    if (result.status!.toLowerCase() == "failed") {
      mh.showSnackBar(
        msg: "Transaction is Failed....",
      );
    } else if (result.status!.toLowerCase() == "closed") {
      mh.showSnackBar(
        msg: "SDK Closed by User",
      );
    } else {
      mh.showSnackBar(
        msg: "Transaction is ${result.status} and Amount is ${result.amount}",
      );
    }
    res = result;
  } catch (e) {
    debugPrint(e.toString());
  }
  return res;
}
