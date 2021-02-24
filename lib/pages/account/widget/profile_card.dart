import 'package:hair_salon/global_items/package_export.dart';
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
          child: Card(
            shadowColor: Theme.of(context).primaryColor,
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).canvasColor,
                    Theme.of(context).backgroundColor,
                  ],
                  stops: [0.1, 1],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(150, 0, 0, 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          "Shwe Best Leader",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text('shwebestleader@gmail.com'),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Gender',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Divider(
                                indent: 20,
                                endIndent: 20,
                                color: Theme.of(context).accentColor),
                            Text('Female')
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text('Age',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Divider(
                                indent: 20,
                                endIndent: 20,
                                color: Theme.of(context).accentColor),
                            Text('12')
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text('Contact',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Divider(
                              indent: 20,
                              endIndent: 20,
                              color: Theme.of(context).accentColor,
                            ),
                            Text('12345678')
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: OutlinedButton(
                          child: Text(
                            'Edit',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => EditAccount()));
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://freepngimg.com/thumb/hair/5-women-hair-png-image.png'),
            ),
          ),
          margin: EdgeInsets.only(left: 40),
        )
      ],
    );
  }
}
