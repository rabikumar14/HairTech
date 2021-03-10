import 'package:hair_salon/global_items/hairstylist_card.dart';
import 'package:hair_salon/global_items/package_export.dart';
import 'package:hair_salon/global_items/widget_export.dart';
import 'package:hair_salon/pages/home/widget/offer_carousel.dart';
import 'package:hair_salon/pages/home/widget/outlet_card.dart';
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
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            // OfferCarousel(),
            Container(
              height: screen_size_height * .2,
              width: screen_size_width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  OutletCard(),
                  SizedBox(width: 10),
                  OutletCard(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: textFont("Top Rated Stylists",
                            Theme.of(context).primaryColor,
                            maxLines: 1,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                    TextButton(
                        onPressed: () {},
                        child: Text("View All Stylists",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor)))
                  ]),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HairstylistCard(),
                  SizedBox(width: 10),
                  HairstylistCard(),
                  SizedBox(width: 10),
                  HairstylistCard(),
                  SizedBox(width: 10),
                  HairstylistCard(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: textFont(
                            "Popular Products", Theme.of(context).primaryColor,
                            maxLines: 1,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                    TextButton(
                        onPressed: () {},
                        child: Text("View All Products",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor)))
                  ]),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  TopProduct(),
                  SizedBox(width: 10),
                  TopProduct(),
                  SizedBox(width: 10),
                  TopProduct(),
                  SizedBox(width: 10),
                  TopProduct(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
