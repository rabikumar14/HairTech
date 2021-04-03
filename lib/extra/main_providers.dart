
import 'package:Beautech/models/export_models.dart';
import 'package:Beautech/services/crud_model.dart';
import 'package:Beautech/services/database_service.dart';

import 'package:Beautech/theme/theme_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainMultiProvider extends StatelessWidget {
  const MainMultiProvider({
    Key key,
    @required this.model,
    @required this.themeNotifier,
    @required this.materialChild,
  }) : super(key: key);

  final Widget materialChild;
  final AppUser model;
  final ThemeNotifier themeNotifier;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
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
    ], child: materialChild);
  }
}
