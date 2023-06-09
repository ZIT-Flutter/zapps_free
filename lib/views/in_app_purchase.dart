// import 'package:flutter/material.dart';
// import 'package:pay/pay.dart';
// import 'package:device_detail/device_detail.dart';

// class InAppPurchaseScreen extends StatelessWidget {
//   const InAppPurchaseScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     void onApplePayResult(paymentResult) {
//       print(paymentResult);
//       // Send the resulting Apple Pay token to your server / PSP
//     }

//     void onGooglePayResult(paymentResult) {
//       print(paymentResult);
//       // Send the resulting Google Pay token to your server / PSP
//     }

//     const _paymentItems = [
//       // PaymentItem(
//       //   label: 'Total',
//       //   amount: '99.99',
//       //   status: PaymentItemStatus.final_price,
//       // ),
//     ];
//     return Scaffold(
//       backgroundColor: Colors.green,
//       body: Column(
//         children: [
//           const SizedBox(
//             height: 100,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               if (DeviceDetail().isIOS)
//                 ApplePayButton(
//                   paymentConfigurationAsset: 'applepay.json',
//                   paymentItems: _paymentItems,
//                   width: 200,
//                   height: 50,
//                   style: ApplePayButtonStyle.black,
//                   type: ApplePayButtonType.buy,
//                   margin: const EdgeInsets.only(top: 15.0),
//                   onPaymentResult: (data) {
//                     onApplePayResult(data);
//                   },
//                   loadingIndicator: const Center(
//                     child: CircularProgressIndicator(),
//                   ),
//                 ),
//               if (DeviceDetail().isAndroid)
//                 GooglePayButton(
//                   paymentConfigurationAsset: 'gpay.json',
//                   paymentItems: _paymentItems,
//                   width: 200,
//                   height: 50,
//                   style: GooglePayButtonStyle.black,
//                   type: GooglePayButtonType.pay,
//                   margin: const EdgeInsets.only(top: 15.0),
//                   onPaymentResult: (data) {
//                     onGooglePayResult(data);
//                   },
//                   loadingIndicator: const Center(
//                     child: CircularProgressIndicator(),
//                   ),
//                 ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
