import 'package:hair_salon/global_items/package_export.dart';
import 'package:hair_salon/global_items/widget_export.dart';
import 'package:hair_salon/pages/account/edit_account_page.dart';

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 30,
          ),
          child: FancyCard(
            Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(115, 0, 0, 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      textFont(
                        "Shwe Best Leader",
                        Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      textFont('shwebestleader@gmail.com.sg',
                          Theme.of(context).accentColor,
                          maxLines: 1, overflow: TextOverflow.ellipsis)
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          textFont('Gender', Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold),
                          Divider(
                              indent: 18,
                              endIndent: 18,
                              color: Theme.of(context).primaryColor),
                          textFont('Female', Theme.of(context).accentColor)
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          textFont('Age', Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold),
                          Divider(
                              indent: 28,
                              endIndent: 28,
                              color: Theme.of(context).primaryColor),
                          textFont('12', Theme.of(context).accentColor)
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          textFont('Contact', Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold),
                          Divider(
                            indent: 17,
                            endIndent: 17,
                            color: Theme.of(context).primaryColor,
                          ),
                          textFont('12345678', Theme.of(context).accentColor)
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: OutlinedButton(
                        child: textFont(
                          'Edit',
                          Theme.of(context).primaryColor,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EditAccount(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://scontent.fsin9-2.fna.fbcdn.net/v/t1.0-9/74661747_1442722825865598_5378789738956193792_o.jpg?_nc_cat=100&ccb=3&_nc_sid=0debeb&_nc_ohc=fbtwuwDIOTQAX-2n03t&_nc_ht=scontent.fsin9-2.fna&oh=0672c6ae6418fa287ae3f1a2eafaeb47&oe=60631900'),
            ),
          ),
          margin: EdgeInsets.only(left: 20),
        )
      ],
    );
  }
}
