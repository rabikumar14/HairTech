import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon/pages/edit_account.dart';
import 'package:hair_salon/pages/setting.dart';
import 'package:hair_salon/themes/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: LightTheme.bgColour,
        iconTheme: IconThemeData(color: LightTheme.mainColour),
        centerTitle: true,
        title: Text(
          'Account',
          style: GoogleFonts.varelaRound(
            color: LightTheme.mainColour,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Card(
              elevation: 5,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Settings()));
                },
                icon: Icon(
                  Icons.settings,
                  size: 22,
                  color: LightTheme.mainColour,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 30,
                  ),
                  child: Card(
                    shadowColor: Colors.grey[300],
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.grey[200],
                            Colors.white,
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
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Divider(
                                        indent: 20,
                                        endIndent: 20,
                                        color: LightTheme.mainColour),
                                    Text('Female')
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text('Age',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Divider(
                                        indent: 20,
                                        endIndent: 20,
                                        color: LightTheme.mainColour),
                                    Text('12')
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text('Contact',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Divider(
                                      indent: 20,
                                      endIndent: 20,
                                      color: LightTheme.mainColour,
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
                                    style:
                                        TextStyle(color: LightTheme.mainColour),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EditAccount()));
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
            ),
          ],
        ),
      ),
    );
  }
}
