import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:hair_salon/firebase_services/google_sign_in.dart';
import 'package:hair_salon/global_items/package_export.dart';
import 'package:hair_salon/global_items/widget_export.dart';
import 'package:hair_salon/models/product.dart';
import 'package:hair_salon/models/salon.dart';
import 'package:hair_salon/pages/home/widget/outlet_card.dart';
import 'package:hair_salon/pages/home/widget/services_offered.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String serviceCategory = 'All';
  String isSelected = 'All';

  List<String> stringItem = [
    "All",
    "Hair Salon",
    "Massage Salon",
    "Spa",
    "Nail Salon",
    "Beauty Salon"
  ];

  List<String> stringPath = [
    'images/female-hair-cut-with-scissors.svg',
    'images/comb-and-long-hair-1.svg',
    'images/professional-hair-treatment-with-creams-and-heating-standing-hairdryer.svg',
    'images/chair-and-sink-tools-for-wash-hair-at-the-salon.svg',
    'images/brush-tool.svg',
    'images/hair-salon-situation-of-two-persons.svg'
  ];
  @override
  Widget build(BuildContext context) {
    final salons = Provider.of<List<Salon>>(context);
    final products = Provider.of<List<Product>>(context);
    final user = FirebaseAuth.instance.currentUser;
    String appbarTitle = user == null
        ? "Welcome to BeautTech"
        : "Welcome back, " +
            user.displayName.substring(0, user.displayName.indexOf(" "));

    double screenSizeWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: GlobalAppBar(
        appbarTitle,
        color: Colors.pink[50],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              color: Colors.pink[50],
              width: screenSizeWidth,
              height: 110,
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: stringItem.length,
                    itemBuilder: (BuildContext context, int index) {
                      String listViewSalonTypes = stringItem[index];
                      return InkWell(
                        onTap: () {
                          setState(() {
                            serviceCategory = listViewSalonTypes;
                            isSelected = listViewSalonTypes;
                          });
                        },
                        child: Container(
                          width: 100,
                          child: ServiceIcons(
                            serviceName: listViewSalonTypes,
                            svgPath: stringPath[index],
                            isSelected: isSelected,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),

            if (FirebaseAuth.instance.currentUser == null)
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                child: GoogleSignupButtonWidget(),
              ))
            else
              Container(),
            // Padding(
            //   padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
            //   child: TextButton.icon(
            //     label: Text(
            //       'Add New Salon',
            //       style: TextStyle(fontSize: 20, color: Colors.white),
            //     ),
            //     icon: Icon(
            //       Icons.add,
            //       color: Colors.white,
            //     ),
            //     style: TextButton.styleFrom(backgroundColor: Colors.blue),
            //     onPressed: () {
            //       addProductToFirebase();
            //      // addSalonToFirebase();
            //     },
            //   ),
            // ),
            Container(
              child: Flexible(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: salons.length,
                  itemBuilder: (BuildContext context, int index) {
                    Salon listViewSalon = salons[index];

                    if (isSelected != "All" &&
                        listViewSalon.salonCategory == isSelected) {
                      return OutletCard(
                        salon: listViewSalon,
                      );
                    } else if (isSelected == "All") {
                      return OutletCard(
                        salon: listViewSalon,
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GoogleSignupButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.all(4),
        child: TextButton.icon(
          label: Text(
            'Login with Google',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          icon: Icon(
            TablerIcons.brand_google,
            color: Colors.white,
          ),
          style: TextButton.styleFrom(backgroundColor: Colors.blue),
          onPressed: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.login();
          },
        ),
      );
}
