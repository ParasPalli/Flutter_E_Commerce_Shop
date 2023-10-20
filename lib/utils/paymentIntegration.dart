import 'package:flutter/cupertino.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:provider/provider.dart';

import '../Models/cartModel.dart';
import 'cartList.dart';

PaypalCheckout paymentIntegration(BuildContext context) {
  List<Map<String, dynamic>> _getItems() {
    List<Map<String, dynamic>> items_list = [];

    for (cartModel item
        in Provider.of<cartList>(context, listen: false).items) {
      Map<String, dynamic> itm = {
        "name": item.productName,
        "quantity": item.quantity,
        "price": item.price,
        "currency": "USD",
      };
      items_list.add(itm);
    }

    return items_list;
  }

  return PaypalCheckout(
    sandboxMode: true,
    clientId:
        "ATovMUr32jIsSpiZz5HhAhnXn5rQkA7ThdzTvRtVLa3TZ65w75-pGC4TQmTCb_VJeuiHQp84Ai8jhBTo",
    secretKey:
        "EG-C9ThCDGkaYfd23R3i0SNk9Y6Miq_QnL1xYbnM0tM6J6QaRvKouzaBIj1Yh_iZ1E-8t8PTYRCGCpPl",
    returnURL: "success.test.com",
    cancelURL: "cancel.test.com",
    transactions: [
      {
        "amount": {
          "total": Provider.of<cartList>(context, listen: false).getTotal(),
          "currency": "USD",
          "details": {
            "subtotal":
                Provider.of<cartList>(context, listen: false).getTotal(),
            "shipping": '0',
            "shipping_discount": 0
          }
        },
        "description": "The payment transaction description.",
        "item_list": {
          "items": _getItems(),
        }
      }
    ],
    note: "Contact us for any questions on your order.",
    onSuccess: (Map params) async {
      print("onSuccess: $params");
      Provider.of<cartList>(context, listen: false).clearitems();
      Navigator.pop(context);
    },
    onError: (error) {
      print("onError: $error");
      Navigator.pop(context);
    },
    onCancel: () {
      print('cancelled:');
      Navigator.pop(context);
    },
  );
}
