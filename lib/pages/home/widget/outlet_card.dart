import 'package:hair_salon/global_items/fancy_card.dart';
import 'package:hair_salon/global_items/font.dart';
import 'package:hair_salon/global_items/package_export.dart';

class OutletCard extends StatefulWidget {
  final String bgImage;

  const OutletCard({Key key, this.bgImage}) : super(key: key);

  @override
  _OutletCardState createState() => _OutletCardState();
}

class _OutletCardState extends State<OutletCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.1), BlendMode.darken),
              image: NetworkImage(
                  'https://miro.medium.com/max/12000/0*NEgmVl2J_RRzI9Sr'),
              fit: BoxFit.cover)),
      child: Stack(
  
        children: <Widget>[
          Positioned(right: 25, bottom: 15,
                      child: TextButton(onPressed: (){}, child: Text("Book now",    style: GoogleFonts.varelaRound(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          )),style: TextButton.styleFrom(backgroundColor: Theme.of(context).backgroundColor),),
          )
      
        ],
      ),
    );
  }
}
