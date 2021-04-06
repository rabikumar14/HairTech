import 'package:Beautech/global/nav_bar/bot_nav_bar.dart';
import 'package:Beautech/global/nav_rail/nav_rail.dart';
import 'package:Beautech/global/nav_rail/nav_rail_dev.dart';
import 'package:Beautech/global/nav_rail/nav_rail_salon.dart';
import 'package:Beautech/models/export_models.dart';
import 'package:Beautech/pages/confirm/confrim_order.dart';
import 'package:Beautech/services/crud_model.dart';
import 'package:Beautech/services/firebase_services/email_sign_in.dart';

import 'package:Beautech/services/firebase_services/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
          body: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => GoogleSignInProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => EmailSignInProvider(),
          ),
        ],
        child: StreamBuilder<User>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            final googleSignInProvider =
                Provider.of<GoogleSignInProvider>(context);
            final emailSignInProvider =
                Provider.of<EmailSignInProvider>(context);
            final userSignedIn = Provider.of<User>(context);
            final salons = Provider.of<List<Salon>>(context);
            bool isAdmin = false;

            if (userSignedIn != null) {
              return StreamBuilder<AppUser>(
                  stream: CRUD().streamAppUser(snapshot.data.uid),
                  builder: (context, userSnapshot) {
                    AppUser user;
                    bool isDev;
                    bool isSeller;
                    if (userSnapshot.hasData) {
                       user = userSnapshot.data;
                       isDev = user.isDev;
                       isSeller = user.isSeller;
                    }

                    if (userSnapshot.hasData &&
                            isDev == null &&
                            isSeller == null ||
                        isDev == false && isSeller == false) {
                      if (googleSignInProvider.isSigningIn == true) {
                        print("checking google");
                        return buildLoading();
                      } else   {
                        print("already in");
                        return BotNavBar();
                      }
                    } else if (userSnapshot.hasData && isDev == true) {
                      return NavRailDev();
                    } else if (userSnapshot.hasData && isSeller == true) {
                      return NavRailSalon();
                    } else {
                      buildLoading();
                    }

                    return buildLoading();
                  });
            } else {

              if(googleSignInProvider.isSigningIn == true ||  snapshot.hasData ==true || emailSignInProvider.isSigningIn == true)
              {
                return buildLoading();
              }
              return BotNavBar2();
            }
          },
        ),
      ));

  Widget buildLoading() => Stack(
        fit: StackFit.expand,
        children: [
          Center(child: CircularProgressIndicator()),
        ],
      );
}
