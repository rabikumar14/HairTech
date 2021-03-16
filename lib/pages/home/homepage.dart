import 'package:hair_salon/global_items/hairstylist_card.dart';
import 'package:hair_salon/global_items/package_export.dart';
import 'package:hair_salon/global_items/widget_export.dart';
import 'package:hair_salon/pages/home/widget/offer_carousel.dart';
import 'package:hair_salon/pages/home/widget/outletAddress.dart';
import 'package:hair_salon/pages/home/widget/outlet_card.dart';
import 'package:hair_salon/pages/home/widget/services_offered.dart';
import 'package:hair_salon/pages/home/widget/top_product.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screen_size_width = MediaQuery.of(context).size.width;
    final screen_size_height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: GlobalAppBar("Welcome Back, Varun", color: Colors.pink[50],),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              color: Colors.pink[50],
              width: screen_size_width,
              height: 110,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ServiceIcons(
                        serviceName: 'Haircut',
                        svgPath: 'images/female-hair-cut-with-scissors.svg',
                      ),
                      SizedBox(width:15),
                        ServiceIcons(
                        serviceName: 'Haircut',
                        svgPath: 'images/female-hair-cut-with-scissors.svg',
                      ),
                                      SizedBox(width:15),

                        ServiceIcons(
                        serviceName: 'Haircut',
                        svgPath: 'images/female-hair-cut-with-scissors.svg',
                      ),
                                      SizedBox(width:15),
                        ServiceIcons(
                        serviceName: 'Haircut',
                        svgPath: 'images/female-hair-cut-with-scissors.svg',
                      ),
                                      SizedBox(width:15),
                        ServiceIcons(
                        serviceName: 'Haircut',
                        svgPath: 'images/female-hair-cut-with-scissors.svg',
                      ),
                                      SizedBox(width:15),
                        ServiceIcons(
                        serviceName: 'Haircut',
                        svgPath: 'images/female-hair-cut-with-scissors.svg',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // OfferCarousel()
            SizedBox(height:15 ),
            Center(
              child: Container(
                height: screen_size_height * .2,
                child: OutletCard(),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: textFont(
                  "Our salon outlets near you", Theme.of(context).accentColor,
                  maxLines: 1, fontWeight: FontWeight.w400, fontSize: 18),
            ),
            Container(
                height: screen_size_height * .2,
                child: PageView(
                  children: [
                    CustomListItem(),
                    CustomListItem(),
                    CustomListItem(),
                  ],
                )),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10),
            //   child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: <Widget>[
            //         Expanded(
            //             child: textFont(
            //                 "Top Rated Stylists", Theme.of(context).accentColor,
            //                 maxLines: 1,
            //                 fontWeight: FontWeight.bold,
            //                 fontSize: 18)),
            //         TextButton(
            //             onPressed: () {},
            //             child: Text("View All Stylists",
            //                 style: TextStyle(
            //                     color: Theme.of(context).primaryColor)))
            //       ]),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: textFont(
                  "Our popular hair stylists", Theme.of(context).accentColor,
                  maxLines: 1, fontWeight: FontWeight.w400, fontSize: 18),
            ),
            Center(
              child: Wrap(
                spacing: 15,
                runSpacing: 15,
                children: [
                  HairstylistCard(),
                  HairstylistCard(),
                  HairstylistCard(),
                  HairstylistCard(),
                  HairstylistCard(),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10),
            //   child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: <Widget>[
            //         Expanded(
            //             child: textFont(
            //                 "Popular Products", Theme.of(context).primaryColor,
            //                 maxLines: 1,
            //                 fontWeight: FontWeight.bold,
            //                 fontSize: 18)),
            //         TextButton(
            //             onPressed: () {},
            //             child: Text("View All Products",
            //                 style: TextStyle(
            //                     color: Theme.of(context).primaryColor)))
            //       ]),
            // ),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: [
            //       TopProduct(),
            //       SizedBox(width: 10),
            //       TopProduct(),
            //       SizedBox(width: 10),
            //       TopProduct(),
            //       SizedBox(width: 10),
            //       TopProduct(),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
