import 'package:hair_salon/global_items/cart_counter.dart';
import 'package:hair_salon/global_items/package_export.dart';
import 'package:hair_salon/global_items/widget_export.dart';

class AddToCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.only(bottom: 30, top: 10, right: 40, left: 40),
        child: Row(
          children: [
            CartCounter(),
            Spacer(),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                elevation: 5,
                backgroundColor: Theme.of(context).canvasColor,
                padding: EdgeInsets.symmetric(horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
              onPressed: () async {
                Feedback.forTap(context);
                ScaffoldMessengerState scaffoldMessenger =
                    ScaffoldMessenger.of(context);

                ScaffoldFeatureController controller =
                    scaffoldMessenger.showSnackBar(
                  const SnackBar(content: Text('Added to Cart')),
                );
                final result = await controller.closed;
                print(result);
              },
              child: textFont('Add to Cart', Theme.of(context).primaryColor,
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }
}
