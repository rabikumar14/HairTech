import 'package:Beautech/admin/dev_adminside/product_data_table.dart';
import 'package:Beautech/admin/dev_adminside/salon_data_table.dart';
import 'package:Beautech/global/nav_bar/bot_nav_bar.dart';
import 'package:Beautech/global/nav_rail/nav_rail.dart';
import 'package:Beautech/global/package_export.dart';
import 'package:Beautech/models/appointment.dart';
import 'package:Beautech/models/order.dart';
import 'package:Beautech/models/product.dart';
import 'package:Beautech/models/salon.dart';
import 'package:Beautech/models/user.dart';
import 'package:Beautech/services/crud_model.dart';
import 'package:Beautech/services/database_service.dart';
import 'package:Beautech/services/firebase_services/google_sign_in.dart';
import 'package:Beautech/services/payment_services/locator.dart';
import 'package:Beautech/services/payment_services/network_service.dart';
import 'package:Beautech/services/payment_services/stripe_sdk/stripe_sdk.dart';
import 'package:Beautech/theme/data/theme_data.dart';
import 'package:Beautech/theme/widget/theme_notifier.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:scoped_model/scoped_model.dart';

import 'dart:io' show Platform;
// com.errorstacker.hair_salon
// com.errorstacker.hairSalon

const _stripePublishableKey =
    'pk_test_51IYAezDzzwMCjHARe79JLxBTnMdFeYX19Dn5jcME0nTU4Jon5FTAbLCqR6eOD3k5nzuCeUhBPSxTgvFXflAxrIQs00aOPqv9Io';
final _returnUrl = Platform.isIOS
    ? 'stripesdk://com.errorstacker.hairSalon'
    : 'stripesdk://com.errorstacker.hair_salon';
const _returnUrlWeb = 'http://com.errorstacker.hairSalon';

String getScaReturnUrl() {
  return kIsWeb ? _returnUrlWeb : _returnUrl;
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;

  initializeLocator();
  Stripe.init(_stripePublishableKey, returnUrlForSca: getScaReturnUrl());
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(lightThemePink),
      child: MyApp(model: AppUser())));
}

class MyApp extends StatelessWidget {
  final AppUser model;

  const MyApp({Key key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // CustomerSession.initCustomerSession(
    //     (version) => locator.get<NetworkService>().getEphemeralKey(version));
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
             StreamProvider<List<ProductOrder>>(
            create: (_) => order(),
            initialData: [],
          ),
             StreamProvider<List<Appointment>>(
            create: (_) => appointment(),
            initialData: [],
          ),
          StreamProvider<User>(
            create: (context) => FirebaseAuth.instance.authStateChanges(),
            initialData: null,
          ),
          ProxyProvider<User, Stream<AppUser>>(update: (_, user, __) {
            return CRUD().userData(user?.uid);
          }),
        ],
        child: ScopedModel<AppUser>(
            model: model,
            child: MaterialApp(
                // onUnknownRoute: (settings) {
                //   final uri = Uri.parse(settings.name);
                //   if (uri.queryParameters.containsKey('setup_intent') ||
                //       uri.queryParameters.containsKey('payment_intent')) {
                //     return MaterialPageRoute(
                //         builder: (context) => AuthWrapper());
                //   }
                //   return MaterialPageRoute(builder: (context) => AuthWrapper());
                // },
                // routes: {
                //   '/': (context) => AuthWrapper(),
                //   '/3ds/complete': (context) => AuthWrapper(),
                //   '/payments': (context) => AuthWrapper()
                // },
                // initialRoute: '/',
                theme: themeNotifier.getTheme(),home:  SideNavRail(),
             )));
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
                if(kIsWeb)
                {
                  return SideNavRail();
                }
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
