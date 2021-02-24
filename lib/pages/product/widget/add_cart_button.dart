import 'package:hair_salon/global_items/package_export.dart';
import 'package:hair_salon/global_items/widget_export.dart';
import 'file:///C:/src/Flutter%20Projects/HairTech/hair_salon/lib/global_items/cart_counter.dart';

class AddToCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, top: 10, right: 40, left: 40),
      child: Row(
        children: [
          CartCounter(),
          Spacer(),
          GestureDetector(
              onTap: () async {
                ScaffoldMessengerState scaffoldMessenger =
                    ScaffoldMessenger.of(context);

                ScaffoldFeatureController controller =
                    scaffoldMessenger.showSnackBar(
                  const SnackBar(content: Text('Added to Cart')),
                );
                final result = await controller.closed;
                print(result);
                Feedback.forTap(context);
              },
              child: FancyCard(textFont(
                  'Add to Cart', Theme.of(context).primaryColor,
                  fontSize: 16, fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }
}
