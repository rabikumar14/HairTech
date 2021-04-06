import 'dart:io';

import 'package:Beautech/global/package_export.dart';
import 'package:Beautech/global/widget_export.dart';
import 'package:Beautech/models/product.dart';
import 'package:Beautech/models/user.dart';
import 'package:Beautech/services/crud_model.dart';
import 'package:Beautech/services/export_services.dart';
import 'package:Beautech/services/firebase_storage.dart';
import 'package:Beautech/services/payment_services/network_service.dart';
import 'package:Beautech/services/uploadImage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddNewUser extends StatefulWidget {
  final Product product;

  const AddNewUser({Key key, this.product}) : super(key: key);
  @override
  _AddNewUserState createState() => _AddNewUserState();
}

class _AddNewUserState extends State<AddNewUser> {
  final formKey = GlobalKey<FormState>();
  TextEditingController userNameController = new TextEditingController();
  TextEditingController userEmailController = new TextEditingController();
  TextEditingController userPhoneController = new TextEditingController();
  String userRoleController;

  String hintText;
  String labelText;
  IconData icon;

  static Future<UserCredential> register(String email, String password) async {
    FirebaseApp app = await Firebase.initializeApp(
        name: 'new', options: Firebase.app().options);
    try {
      UserCredential userCredential = await FirebaseAuth.instanceFor(app: app)
          .createUserWithEmailAndPassword(email: email, password: password);

      await app.delete();
      return Future.sync(() => userCredential);
    } on FirebaseAuthException catch (e) {
      // Do something with exception. This try/catch is here to make sure
      // that even if the user creation fails, app.delete() runs, if is not,
      // next time Firebase.initializeApp() will fail as the previous one was
      // not deleted.
    }
  }

  File _image;
  final picker = ImagePicker();

  Future getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
          appBar: GlobalAppBar(
            "Add New User",
            color: Colors.white,
            elevation: 5,
            action: [
              IconButton(
                  icon: Icon(Icons.save),
                  onPressed: () async {
                    if (formKey.currentState.validate() && userRoleController != null) {
                      UserCredential userCredential =
                          await register(userEmailController.text, userEmailController.text+userNameController.text);
                      AppUser appUser = AppUser(
                        appUserID: userCredential.user.uid,
                          appUserEmail: userEmailController.text,
                          appUserName: userNameController.text,
                          userCreatedAt: DateTime.now(),
                          lastLogin: DateTime.now(),
                          appUserPhoneNumber: userPhoneController.text,
                          isDev: userRoleController == "Dev" ? true : false,
                          isSeller:
                              userRoleController == "Salon" ? true : false);
                      await CRUD()
                          .addNewUser(userCredential.user.uid, appUser)
                          .then((value) async {
                        final NetworkService networkService = locator.get();
                        networkService.updateUserNewUser(userCredential.user, userNameController.text);
                      });

                      Navigator.of(context).pop();

                      
                    }
                    else{
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Please fill in all the fields'),
                      duration: Duration(seconds: 2),
                    ));
                    }
                  })
            ],
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ConstrainedBox(
                    constraints: new BoxConstraints(
                      minWidth: 300,
                      maxWidth: 600,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            TextFormField(
                              controller: userNameController,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'You cannot leave this field empty';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                focusColor: Colors.pink[500],
                                suffixIcon: Icon(Icons.tab_outlined),
                                hintText: "Varun Bhalerao",
                                labelText: "User Name",
                              ),
                            ),
                            TextFormField(
                              controller: userEmailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'You cannot leave this field empty';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                focusColor: Colors.pink[500],
                                suffixIcon: Icon(Icons.tab_outlined),
                                hintText: "user email",
                                labelText: "Email",
                              ),
                            ),
                            TextFormField(
                              controller: userPhoneController,
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'You cannot leave this field empty';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                focusColor: Colors.pink[500],
                                suffixIcon: Icon(Icons.tab_outlined),
                                hintText: "user phone",
                                labelText: "Phone Number",
                              ),
                            ),
                            Center(
                              child: Container(
                                child: DropdownButton<String>(
                                  hint: Text('User Role'),
                                  value: userRoleController,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: TextStyle(color: Colors.black),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.black,
                                  ),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      userRoleController = newValue;
                                    });
                                  },
                                  items: <String>[
                                    "Dev",
                                    "Salon",
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
