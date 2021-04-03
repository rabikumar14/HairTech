import 'package:Beautech/global/widget_export.dart';
import 'package:Beautech/services/firebase_services/email_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    final userSignedIn = Provider.of<User>(context);
    final _formKey = GlobalKey<FormState>();


    return ChangeNotifierProvider(
        create: (context) => EmailSignInProvider(),
        child: Builder(
          builder: (context) {
            return Scaffold(
            appBar: GlobalAppBar(
              "",
              elevation: 5,
              color: Colors.white,
            ),
            backgroundColor: Colors.pink[50],
            body: Center(
              child: SizedBox(
                width: 360,
                child: Material(
                  elevation: 2,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome back',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          SizedBox(height: 25),
                          TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please add in your email';
                              } else if (!isValidEmail(value)) {
                                return 'Please add in a valid email';
                              } else {
                                return null;
                              }
                            },
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: 'Email',
                            ),
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            obscureText: true,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'You forgot your password';
                              } else if (value.length < 6) {
                                return 'Password must be at least six characters';
                              } else {
                                return null;
                              }
                            },
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: 'Password',
                            ),
                          ),
                          SizedBox(height: 65),
                          SizedBox(
                            height: 40,
                            width: double.infinity,
                            child: FlatButton(
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  String email = _emailController.text;
                                  String password = _passwordController.text;
                                   final provider =
                                      Provider.of<EmailSignInProvider>(context,
                                          listen: false);
                                  await provider
                                      .loginWithEmail(email, password)
                                      .then((_) => Navigator.of(context)
                                          .pushNamed('salon'))
                                      .catchError((error) {
                                    showErrorDialog(context, error);
                                  });
                                }
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.pink[200],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        ));
  }

  Future showErrorDialog(BuildContext context, error) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Oh Snap!'),
          content: Text(error.message),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Dismiss'),
            )
          ],
        );
      },
    );
  }
}

bool isValidEmail(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}
