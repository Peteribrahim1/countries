import 'package:countries/models/countries_model.dart';
import 'package:countries/screens/country_details_screen.dart';
import 'package:flutter/material.dart';

import '../styles/styles.dart';

class CountryWidget extends StatelessWidget {
  final dynamic country;

  const CountryWidget({Key? key, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CountryDetails(
              country: country,
            ),
          ),
        );
      },
      leading: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        height: 40,
        width: 40,
        child: Image.network('${country['flags']['png']}'),
      ),
      title: Text(
        '${country['name']['common']}',
        //style: Styles.leadingTextStyle,
      ),
      subtitle: Text(
        '${country['capital'].toString().replaceAll('[', '').replaceAll(']', '')}',
        style: Styles.subtitleTextStyle,
      ),
    );
  }
}
