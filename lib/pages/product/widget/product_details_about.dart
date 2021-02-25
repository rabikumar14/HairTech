import 'package:hair_salon/global_items/package_export.dart';
import 'package:hair_salon/global_items/widget_export.dart';

class ProductDetailsAbout extends StatelessWidget {
  final description =
      'Styling, heat tools, and humidity can all dry out your curls. Lock-in moisture with TRESemmé Pro Care Curls Conditioner, designed to help protect your curls from frizz and humidity.';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: EdgeInsets.only(left: 20, right: 20, top: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              textFont('5 star', Theme.of(context).primaryColor),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              textFont('134 Sold', Theme.of(context).primaryColor),
              Spacer(),
              GestureDetector(
                onTap: () async {
                  ScaffoldMessengerState scaffoldMessenger =
                      ScaffoldMessenger.of(context);

                  ScaffoldFeatureController controller =
                      scaffoldMessenger.showSnackBar(
                    const SnackBar(content: Text('Favourited')),
                  );
                  final result = await controller.closed;
                  print(result);
                  Feedback.forTap(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Theme.of(context).canvasColor,
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: Theme.of(context).primaryColor,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5, top: 5),
            child: textFont('Description', Theme.of(context).accentColor,
                deco: TextDecoration.underline, fontWeight: FontWeight.bold),
          ),
          textFont(
            description,
            Theme.of(context).primaryColor,
            overflow: TextOverflow.ellipsis,
            maxLines: 10,
          ),
        ],
      ),
    );
  }
}
