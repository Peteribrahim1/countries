import 'package:countries/screens/country_details_screen.dart';
import 'package:countries/screens/search_country_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     // home: SearchCountry(),
        initialRoute: '/',
        routes: {
          '/': (ctx) => SearchCountry(),
         // CountryDetails.routeName: (ctx) => CountryDetails(),
        }
    );
  }
}

