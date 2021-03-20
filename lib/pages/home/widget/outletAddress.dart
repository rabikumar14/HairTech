import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hair_salon/varuns/models.dart';

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    Key key,
    this.thumbnail,
    this.title,
    this.user,
    this.viewCount,
  }) : super(key: key);

  final Widget thumbnail;
  final String title;
  final String user;
  final int viewCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.1), BlendMode.darken),
                      image: NetworkImage(
                          'https://i.pinimg.com/originals/c4/40/2f/c4402f9661049e993b335d8d41c28001.jpg'),
                      fit: BoxFit.cover)),
            ),
          ),
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Lorong 8 Toa Payoh, Blk 15, 331210",
                        style: GoogleFonts.varelaRound(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Open Hours: 9:00 AM-8:00 PM",
                        style: GoogleFonts.varelaRound(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        "Open Days: Monday to Friday",
                        style: GoogleFonts.varelaRound(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        "Phone: +65 3133 1414",
                        style: GoogleFonts.varelaRound(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                      Spacer(),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OutlinedButton(
                              onPressed: () {},
                              child: Text(
                                "View on Google Map",
                                style: GoogleFonts.varelaRound(
                                  color: Theme.of(context).accentColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                              style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 1),
                                  backgroundColor: Colors.white),
                            )
                          ]),
                    ]),
              )),
        ],
      ),
    );
  }
}

class AddressDescription extends StatelessWidget {
  const AddressDescription({
    Key key,
    this.title,
    this.user,
    this.viewCount,
  }) : super(key: key);

  final String title;
  final String user;
  final int viewCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            user,
            style: const TextStyle(fontSize: 10.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            '$viewCount views',
            style: const TextStyle(fontSize: 10.0),
          ),
        ],
      ),
    );
  }
}
