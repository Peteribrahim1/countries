import 'package:flutter/material.dart';

import '../styles/styles.dart';
import 'continent.dart';

class Filter extends StatelessWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     // color: Color(0xff757575),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.30,
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
         // color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Filter', style: Styles.titleTextStyle,),
                InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.backspace_rounded)),
              ],
            ),
            SizedBox(height: 24),
            InkWell(
              onTap: () async{
                List<String> regions = await showModalBottomSheet(
                  context: context,
                  builder: (context) => Continent(),
                );

                Navigator.pop(context, regions);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Continent', style: Styles.modalTextStyle,),
                  Icon(Icons.expand_more),
                ],
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Time Zone', style: Styles.modalTextStyle,),
                Icon(Icons.expand_more),
              ],
            ),
            SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
