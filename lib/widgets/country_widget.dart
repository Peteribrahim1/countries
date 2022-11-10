import 'package:countries/screens/country_details_screen.dart';
import 'package:flutter/material.dart';

import '../styles/styles.dart';

class CountryWidget extends StatelessWidget {
  const CountryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed(
          CountryDetails.routeName,
        );
      },
      leading: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        height: 40,
        width: 40,
        child: Image.network('https://picsum.photos/250?image=9'),
      ),
      title: Text(
        'Nigera',
        style: Styles.leadingTextStyle,
      ),
      subtitle: Text('Gombe',
      style: Styles.subtitleTextStyle,),
    );
  }
}
