import 'dart:io' show Platform;

import 'package:Beautech/extra/auth_wrappers.dart';
import 'package:Beautech/extra/main_providers.dart';
import 'package:Beautech/extra/routes.dart';
import 'package:Beautech/global/widget_export.dart';
import 'package:Beautech/pages/confirm/confrim_appointment.dart';
import 'package:Beautech/pages/confirm/confrim_order.dart';

import 'package:Beautech/services/payment_services/locator.dart';
import 'package:Beautech/theme/theme_export.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'models/export_models.dart';
import 'services/payment_services/stripe_sdk/stripe_sdk.dart';
// com.errorstacker.hair_salon
// com.errorstacker.hairSalon

const _stripePublishableKey =
    'pk_test_51IYAezDzzwMCjHARe79JLxBTnMdFeYX19Dn5jcME0nTU4Jon5FTAbLCqR6eOD3k5nzuCeUhBPSxTgvFXflAxrIQs00aOPqv9Io';
final _returnUrl = Platform.isIOS
    ? 'stripesdk://com.errorstacker.hairSalon'
    : 'stripesdk://com.errorstacker.hair_salon';
const _returnUrlWeb = 'http://localhost:52097/#/';

String getScaReturnUrl() {
  return kIsWeb ? _returnUrlWeb : _returnUrl;
}
//flutter run -d chrome --web-hostname localhost --web-port 52097
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  RouterFluro.defineRoutes();

  initializeLocator();
  Stripe.init(_stripePublishableKey, returnUrlForSca: getScaReturnUrl());
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(lightThemePink),
      child: MyApp(model: AppUser())));
}

class MyApp extends StatefulWidget {
  final AppUser model;

  const MyApp({Key key, this.model}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);


      return MainMultiProvider(
        model: widget.model,
        themeNotifier: themeNotifier,
        materialChild: ScopedModel<AppUser>(
            model: widget.model,
            child: MaterialApp(
              onUnknownRoute: (RouteSettings settings) {
                final Uri uri = Uri.tryParse(settings.name);
                if (uri == null &&
                    !uri.queryParameters.containsKey('setup_intent') &&
                    !uri.queryParameters.containsKey('payment_intent')) {
                  return MaterialPageRoute(
                      builder: (context) => BotNavBar());
                }
                return MaterialPageRoute(
                    builder: (context) => ConfirmAppointment());
              },
               onGenerateRoute: RouterFluro.router.generator,
              routes: {
                '/3ds/complete': (context) => BotNavBar(),
                '/payments': (context) => ConfirmAppointment(),
                '/a' : (context) => AuthWrapper(),
              },
              theme: themeNotifier.getTheme(),
              home: AuthWrapper(),
            )),
      );
    }
  }
