import 'package:flutter/material.dart';

import '../styles/styles.dart';

class Continent extends StatelessWidget {
  const Continent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Filter',
                  style: Styles.titleTextStyle,
                ),
                InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.backspace_rounded)),
              ],
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Continent',
                  style: Styles.smallHeadingTextStyle,
                ),
                Icon(Icons.expand_less),
              ],
            ),
            SizedBox(height: 64),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Time Zone',
                  style: Styles.smallHeadingTextStyle,
                ),
                Icon(Icons.expand_more),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 90,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Reset',
                      style: Styles.modalTextStyle,
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Show results',
                      style: Styles.butonTextStyle,
                    ),
                    style: Styles.orangebutton,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
