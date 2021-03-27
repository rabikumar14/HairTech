


import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionCancelled extends StatelessWidget {
    int count ;

   TransactionCancelled({Key key, this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
          child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Your transaction did not got through',
            style: GoogleFonts.varelaRound(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 15),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.pink[300]),
            child: Text(
              'Back to homepage',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
                 
                    Navigator.of(context).popUntil((_) => count-- <= 0);


            },
          ),
        ],
      ))),
    );
  }
}