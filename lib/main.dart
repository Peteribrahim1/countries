import 'package:countries/screens/country_details_screen.dart';
import 'package:countries/screens/search_country_screen.dart';
import 'package:countries/widgets/themeModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Consumer(
        builder: (context, ThemeModel themeModel, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeModel.isDark ? ThemeData.dark() : ThemeData.light(),
            initialRoute: '/',
            routes: {
              '/': (ctx) => SearchCountry(),
            //   CountryDetails.routeName: (ctx) => CountryDetails(),
            },
          );
        },
      ),
    );
  }
}
