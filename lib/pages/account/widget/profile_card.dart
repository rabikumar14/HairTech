import 'package:Beautech/global/widget_export.dart';
import 'package:Beautech/models/user.dart';
import 'package:Beautech/pages/account/edit_account_page.dart';
import 'package:Beautech/services/crud_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileCard extends StatefulWidget {
  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController addressEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appUser = Provider.of<AppUser>(context);

    showAddressUpdateDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              appUser.appUserAddress == ""
                  ? "Add your address"
                  : "Edit your address",
              style: GoogleFonts.varelaRound(
                  fontSize: 16,
                  color: Colors.pink[500],
                  fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
            ),
            content: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    controller: addressEditingController
                      ..text = appUser.appUserAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'You cannot leave this field empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      focusColor: Colors.pink[500],
          
                      hintText: "Flat No, Street, Post Code",
                      labelText: "Your Address",
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            await CRUD()
                                .updateAddress(appUser.appUserID,
                                    addressEditingController.text)
                                .then((value) => Navigator.of(context).pop());
                          }
                        },
                        child: Text(
                          "Save",
                          style: GoogleFonts.varelaRound(
                              fontSize: 16,
                              color: Colors.pink[500],
                              fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () async {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Cancel",
                          style: GoogleFonts.varelaRound(
                              fontSize: 16,
                              color: Colors.pink[500],
                              fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      );
    }

    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 15,
          ),
          child: Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(90, 0, 0, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        textFont(
                          appUser.appUserName,
                          Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        textFont(
                            appUser.appUserEmail, Theme.of(context).accentColor,
                            maxLines: 1, overflow: TextOverflow.ellipsis)
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            textFont('Current Address:',
                                Theme.of(context).accentColor,
                                fontWeight: FontWeight.bold, fontSize: 14),
                            Divider(
                                indent: 18,
                                endIndent: 18,
                                color: Theme.of(context).primaryColor),
                            Text(
                              appUser.appUserAddress == ""
                                  ? "Please add a default address"
                                  : appUser.appUserAddress,
                              style: GoogleFonts.varelaRound(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: OutlinedButton(
                          child: textFont(
                            appUser.appUserAddress == "" ? "Add" : "Edit",
                            Theme.of(context).primaryColor,
                          ),
                          onPressed: () {
                            showAddressUpdateDialog();
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
          height: 75,
          width: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(appUser.appUserProfilePic),
            ),
          ),
          margin: EdgeInsets.only(
            left: 18,
          ),
        )
      ],
    );
  }
}
