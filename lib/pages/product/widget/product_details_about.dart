import 'package:hair_salon/global_items/package_export.dart';
import 'package:hair_salon/global_items/widget_export.dart';

class ProductDetailsAbout extends StatelessWidget {
  final description =
      'Styling, heat tools, and humidity can all dry out your curls. Lock-in moisture with TRESemmé Pro Care Curls Conditioner, designed to help protect your curls from frizz and humidity.';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          child: FancyCard(
            Icon(
              Icons.favorite,
              color: Theme.of(context).primaryColor,
              size: 18,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 3, top: 10),
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
    );
  }
}
