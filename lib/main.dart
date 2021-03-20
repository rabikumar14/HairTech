
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hair_salon/firebase_services/google_sign_in.dart';
import 'package:hair_salon/global_items/package_export.dart';
import 'package:hair_salon/global_items/widget_export.dart';
import 'package:hair_salon/models/product.dart';
import 'package:hair_salon/models/salon.dart';
import 'package:hair_salon/pages/theme/theme_export.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:hair_salon/payment_services/locator.dart';
import 'package:hair_salon/payment_services/network_service.dart';
import 'package:hair_salon/payment_services/stripe_sdk/src/customer_session.dart';
import 'package:hair_salon/payment_services/stripe_sdk/src/stripe.dart';
import 'package:hair_salon/varuns/database_service.dart';


// com.errorstacker.hair_salon
// com.errorstacker.hairSalon

const _stripePublishableKey = 'pk_test_FlC2pf2JCTgKLcgG0aScSQmp00XqfTJL8s';
const _returnUrl = 'stripesdk://demo.stripesdk.ezet.io';
const _returnUrlWeb = 'http://demo.stripesdk.ezet.io';

String getScaReturnUrl() {
  return kIsWeb ? _returnUrlWeb : _returnUrl;
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeLocator();
  Stripe.init(_stripePublishableKey, returnUrlForSca: getScaReturnUrl());
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(lightThemePink), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CustomerSession.initCustomerSession(
        (version) => locator.get<NetworkService>().getEphemeralKey(version));
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiProvider(
        providers: [
          StreamProvider<List<Salon>>(
            create: (_) => salon(),
            initialData: [],
          ),
          StreamProvider<List<Product>>(
            create: (_) => products(),
            initialData: [],
          ),
        ],
        child:
            MaterialApp(theme: themeNotifier.getTheme(), home: AuthWrapper()));
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              final provider = Provider.of<GoogleSignInProvider>(context);

              if (provider.isSigningIn) {
                return buildLoading();
              } else if (snapshot.hasData) {
                return BotNavBar();
              } else {
                return BotNavBar2();
              }
            },
          ),
        ),
      );

  Widget buildLoading() => Stack(
        fit: StackFit.expand,
        children: [
          Center(child: CircularProgressIndicator()),
        ],
      );
}
