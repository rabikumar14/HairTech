import 'package:Beautech/global/package_export.dart';
import 'package:Beautech/global/widget_export.dart';
import 'package:Beautech/global_data.dart';
import 'package:Beautech/models/user.dart';
import 'package:Beautech/pages/cart/cart_item.dart';
import 'package:Beautech/pages/confirm/confrim_order.dart';
import 'package:Beautech/pages/product/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

//todo fix colour & depreciated buttons
class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final appUser = Provider.of<AppUser>(context);
    return ScopedModelDescendant<AppUser>(builder: (context, child, model) {
      if (model.cart.isEmpty) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: GlobalAppBar("Your Cart"),
          body: Center(
            child: Text(
              'No items in you cart yet!',
              style: GoogleFonts.varelaRound(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
            ),
          ),
        );
      } else {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: GlobalAppBar("Your Cart"),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount:
                        ScopedModel.of<AppUser>(context, rebuildOnChange: true)
                            .total,
                    itemBuilder: (context, index) {
                      return ScopedModelDescendant<AppUser>(
                        builder: (context, child, model) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: CartItem(
                              product: model.cart[index],
                              cartModel: model,
                            ),
                          );
                        },
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 10);
                    },
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: Text(
                      'The items will be delivered within to you house within 7 working days. You can keep track of your orders in "Track Orders" section in your account. Feel free to email us at beautech-es@gmail.com if there are any issues',
                      style: GoogleFonts.varelaRound(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Container(
              height: 130,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Divider(
                      thickness: 0.2,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      appUser.appUserAddress == ""
                          ? 'Address: Please add an address before you place an order'
                          : 'Address: ' + appUser.appUserAddress,
                      style: GoogleFonts.varelaRound(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Builder(builder: (BuildContext context) {
                      return Row(
                        children: [
                          Column(
                            children: [
                              OutlinedButton(
                                  onPressed: () async {
                                    if (appUser.appUserAddress == '') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  'You need to have an address before placing an order'),
                                              duration: Duration(seconds: 2)));
                                    } else {
                                      int cost = (double.parse(model
                                                  .totalCartValue
                                                  .toStringAsFixed(2)) *
                                              100)
                                          .toInt();

                                      await createAutomaticPaymentIntentProductOrder(
                                              context, cost, model, appUser)
                                          .then(
                                        (value) {
                                          model.clearCart();
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ConfirmOrder()));
                                        },
                                      );
                                    }
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            (MediaQuery.of(context).size.width /
                                                    5) *
                                                0.8,
                                        vertical: 10),
                                    child: Text(
                                      'Checkout',
                                      style: TextStyle(color: Colors.pink[500]),
                                    ),
                                  )),
                              Text(
                                '7% GST included',
                                style: GoogleFonts.varelaRound(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Text(
                            'Total: ' +
                                '\$' +
                                model.totalCartValue.toStringAsFixed(2),
                            style: GoogleFonts.varelaRound(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      );
                    })
                  ],
                ),
              ),
            ),
          ),
        );
      }
    });
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      centerTitle: true,
      title: Text(
        'Your Cart',
        style: GoogleFonts.varelaRound(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
