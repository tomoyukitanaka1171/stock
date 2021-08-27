import 'package:bottom_nav_app/screen/accont/sign_in_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

import 'model/mytheme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initializeDateFormatting('ja');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyTheme>(
        create: (_) => MyTheme()..getPrefs(),
        builder: (context, snapshot) {
          return Consumer<MyTheme>(builder: (context, model, child) {
            if (model.isLoading) {
              return CircularProgressIndicator();
            }

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              home: SignInPage(),
              theme: ThemeData(
                primaryColor: model.customSwatch[model.currentNum],
                accentColor: model.customSwatch[model.currentNum],
              ),
            );
          });
        });
  }
}
