import 'package:Beautech/global/package_export.dart';
import 'package:Beautech/global/widget_export.dart';
import 'package:Beautech/global_data.dart';
import 'package:Beautech/models/product.dart';
import 'package:Beautech/models/salon.dart';
import 'package:Beautech/models/user.dart';
import 'package:Beautech/pages/home/widget/services_offered.dart';
import 'package:Beautech/services/crud_model.dart';
import 'package:Beautech/services/firebase_services/google_sign_in.dart';
import 'package:Beautech/services/payment_services/stripe_sdk/stripe_sdk.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

import 'widget/outlet_card.dart';

class StreamUserData extends StatelessWidget {
  final Widget widget;

  const StreamUserData({Key key, this.widget}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final streamAppUser = Provider.of<Stream<AppUser>>(context);
    return StreamProvider<AppUser>(
        create: (_) =>
            CRUD().streamAppUser(FirebaseAuth.instance.currentUser.uid),
        initialData: null,
        child: widget);
  }
}

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

  Widget googleSignInButton() {
    return Container(
      padding: EdgeInsets.all(4),
      child: TextButton.icon(
        label: Text(
          'Login with Google',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        icon: Icon(
          TablerIcons.brand_google,
          color: Colors.white,
        ),
        style: TextButton.styleFrom(backgroundColor: Colors.blue),
        onPressed: () {
          Navigator.of(context).pop();
          final provider =
              Provider.of<GoogleSignInProvider>(context, listen: false);
          provider.login();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final salons = Provider.of<List<Salon>>(context);

    final user = FirebaseAuth.instance.currentUser;
    String appbarTitle = user == null
        ? "Welcome to BeautTech"
        : "Welcome back, " +
            user.displayName.substring(0, user.displayName.indexOf(" "));

    double screenSizeWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: GlobalAppBar(
        
        appbarTitle,
        leading:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
                    radius: 26.0,
                    backgroundImage:
                        NetworkImage("https://firebasestorage.googleapis.com/v0/b/hairtech-sg.appspot.com/o/beautechapp.png?alt=media&token=1756f7e7-f45f-4f6a-94c1-7cfe30e9c344"),
                    backgroundColor: Colors.transparent,
                  ),
        ),
        color: Colors.pink[50],
        isCenter: false,
        action: user == null
            ? [
                Container(
                  child: TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Login Options',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  IconButton(
                                      icon: Icon(Icons.close),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      }),
                                ],
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                      width: double.infinity,
                                      child: googleSignInButton()),
                                  SizedBox(height: 5),
                                  SizedBox(
                                      width: double.infinity,
                                      child: EmailSignInButton()),
                                ],
                              ),
                            );
                          });
                    },
                    child: Text(
                      'Login/Signup',
                      style: TextStyle(fontSize: 14, color: Colors.pink[300]),
                    ),
                  ),
                ),
              ]
            : [],
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
            // if (FirebaseAuth.instance.currentUser == null)
            //   Center(
            //       child: Padding(
            //     padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
            //     child: GoogleSignupButtonWidget(),
            //   ))
            // else
            //   Container(),
            // Padding(
            //   padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
            //   child: TextButton.icon(
            //     label: Text(
            //       'Payment test',
            //       style: TextStyle(fontSize: 20, color: Colors.white),
            //     ),
            //     icon: Icon(
            //       Icons.add,
            //       color: Colors.white,
            //     ),
            //     style: TextButton.styleFrom(backgroundColor: Colors.blue),
            //     onPressed: () async {

            //       // //         print("ahafafafafafa");
            //       // final HttpsCallable callable =
            //       //     CloudFunctions.instance.getHttpsCallable(
            //       //   functionName: 'createAutomaticPaymentIntentHandler',
            //       // );
            //       // //         var document = await FirebaseFirestore.instance
            //       // //             .collection('user')
            //       // //             .doc(user.uid)
            //       // //             .get();
            //       // final response = await callable.call({'amount': 10000});
            //       // final result = await Stripe.instance.confirmPayment(
            //       //     response.data["clientSecret"],
            //       //     paymentMethodId: 'pm_card_threeDSecure2Required');
            //       // if (result['status'] == 'succeeded') {
            //       //   // TODO: success
            //       //   debugPrint('Success after authentication.');
            //       //   return;
            //       // } else {
            //       //   debugPrint('Error');
            //       // }
            //       addSalonToFirebase();
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

class EmailSignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.all(4),
        child: TextButton.icon(
          label: Text(
            'Admin Login',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          icon: Icon(
            TablerIcons.login,
            color: Colors.white,
          ),
          style: TextButton.styleFrom(backgroundColor: Colors.pink[500]),
          onPressed: () {
           Navigator.pushNamed(context, "login");
          },
        ),
      );
}
