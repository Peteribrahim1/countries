import 'package:flutter/material.dart';

import '../styles/styles.dart';

class Continent extends StatefulWidget {
  const Continent({Key? key}) : super(key: key);

  @override
  State<Continent> createState() => _ContinentState();
}

class _ContinentState extends State<Continent> {
  bool checkBoxValue = false;

  List<String> continents = [
    'Africa',
    'Antarctica',
    'Asia',
    'Australia',
    'Europe',
    'North America',
    'South America',
  ];

  List<String> selectedContinents = [];

  void handlecheckbox(bool? value) {
    if (value != null) {
      setState(() {
        checkBoxValue = value;
      });
    }
  }

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
                  'Continents',
                  style: Styles.smallHeadingTextStyle,
                ),
                Icon(Icons.expand_less),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: continents.length,
                itemBuilder: (context, index) {
                  final continent = continents[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        continent,
                        style: Styles.fadedmodalTextStyle,
                      ),
                      InkWell(
                        onTap: () {
                          if(selectedContinents.contains(continent)){
                            selectedContinents.remove(continent);
                          }else{
                            selectedContinents.add(continent);
                          }
                          print("Selected continents length ${selectedContinents.length}");
                          setState(() {

                          });
                        },
                        child: Icon(selectedContinents.contains(continent)?  Icons.check_box : Icons.check_box_outline_blank_outlined)

                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 24),
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
                    onPressed: () {
                      Navigator.pop(context, selectedContinents);
                    },
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
