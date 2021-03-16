import 'package:hair_salon/global_items/package_export.dart';
import 'package:hair_salon/global_items/widget_export.dart';
import 'package:hair_salon/pages/cart/cart_item.dart';

//todo fix colour & depreciated buttons
class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: GlobalAppBar("Your Cart"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CartItem(),
              CartItem(),
              Divider(
                thickness: 0.2,
                color: Colors.black,
              ),
              SizedBox(height: 40),
              Center(
                child: Text(
                  'Delivery Address: Blk 261 Toa Payoh East',
                  style: GoogleFonts.varelaRound(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                ),
              ),
              FlatButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () {},
                  child: Text(
                    'Change Delivery Address',
                    style: TextStyle(color: Colors.white),
                  )),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  '**** **** **** 4564',
                  style: GoogleFonts.varelaRound(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              FlatButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () {},
                  child: Text(
                    'Change Payment Method',
                    style: TextStyle(color: Colors.white),
                  )),
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
                Builder(builder: (BuildContext context) {
                  return Row(
                    children: [
                      Column(
                        children: [
                          FlatButton(
                              color: Theme.of(context).primaryColor,
                              onPressed: () {},
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        (MediaQuery.of(context).size.width /
                                                5) *
                                            0.8,
                                    vertical: 10),
                                child: Text(
                                  'Checkout',
                                  style: TextStyle(color: Colors.white),
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
                        'Total: ' + '\$' + '51.98',
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
