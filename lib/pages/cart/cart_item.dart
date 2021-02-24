import 'package:hair_salon/global_items/font.dart';
import 'package:hair_salon/global_items/package_export.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 0.0, right: 10.0),
              child: Container(
                height: 120,
                width: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    "https://www.tresemme.com/content/dam/unilever/tresemme/south_africa/pack_shot/front/hair_care/wash_and_care/tresemm%C3%A9_expert_selection_conditioner_keratin_smooth_750ml/tresemme_keratin_smooth_conditioner_750ml_fop-953090-png.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                textFont('Nivia Men Shampoo', Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold, fontSize: 14, maxLines: 3),
                Row(
                  children: <Widget>[
                    Text('Conditioner',
                        style: GoogleFonts.varelaRound(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        )),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    IconButton(icon: Icon(Icons.add), onPressed: () {}),
                    Center(
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            child: Center(
                              child: Text(
                                1.toString(),
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.black),
                              ),
                            ),
                          ),
                          IconButton(
                              icon: Icon(Icons.remove), onPressed: () {}),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Column(
          children: [
            Center(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      "\$" + 25.99.toString(),
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
