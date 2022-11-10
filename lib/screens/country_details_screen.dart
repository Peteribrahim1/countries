import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../styles/styles.dart';
import '../widgets/image_widget.dart';

class CountryDetails extends StatelessWidget {
  static const routeName = 'country-details';

  const CountryDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Andora',
          style: Styles.titleTextStyle,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Swiper(
                itemCount: 3,
                itemBuilder: (ctx, index) {
                  return const ImageWidget();
                },
                pagination: const SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                        color: Color.fromRGBO(153, 153, 153, 1),
                        activeColor: Colors.white)),
                //control: SwiperControl(),
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Population:',
                  style: Styles.preTextStyle,
                ),
                SizedBox(width: 8),
                Text(
                  '77,354',
                  style: Styles.postTextStyle,
                ),
              ],
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Region:',
                  style: Styles.preTextStyle,
                ),
                SizedBox(width: 8),
                Text(
                  'Europe',
                  style: Styles.postTextStyle,
                ),
              ],
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Capital:',
                  style: Styles.preTextStyle,
                ),
                SizedBox(width: 8),
                Text(
                  'Andora la Vella',
                  style: Styles.postTextStyle,
                ),
              ],
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Motto:', style: Styles.preTextStyle,),
                SizedBox(width: 8),
                Text('Virtus unita fortior', style: Styles.postTextStyle,),
              ],
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Official language:', style: Styles.preTextStyle,),
                SizedBox(width: 8),
                Text('Catalan', style: Styles.postTextStyle,),
              ],
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Ethic group:', style: Styles.preTextStyle),
                SizedBox(width: 8),
                Text('Andorran, Spanish, Portuguese', style: Styles.postTextStyle),
              ],
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Religion:', style: Styles.preTextStyle),
                SizedBox(width: 8),
                Text('Christianity', style: Styles.postTextStyle),
              ],
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Government:', style: Styles.preTextStyle),
                SizedBox(width: 8),
                Text('Parliamentary democracy', style: Styles.postTextStyle),
              ],
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Independence:', style: Styles.preTextStyle),
                SizedBox(width: 8),
                Text('8th September, 1278', style: Styles.postTextStyle),
              ],
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Area:', style: Styles.preTextStyle),
                SizedBox(width: 8),
                Text('467.63 km2', style: Styles.postTextStyle),
              ],
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Currency:', style: Styles.preTextStyle),
                SizedBox(width: 8),
                Text('Euro', style: Styles.postTextStyle),
              ],
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('GDP:', style: Styles.preTextStyle),
                SizedBox(width: 8),
                Text('US3.400 billion', style: Styles.postTextStyle),
              ],
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Time zone:', style: Styles.preTextStyle),
                SizedBox(width: 8),
                Text('	UTC+01', style: Styles.postTextStyle),
              ],
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Date format:', style: Styles.preTextStyle),
                SizedBox(width: 8),
                Text('dd/mm/yyyy', style: Styles.postTextStyle),
              ],
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Dialling code:', style: Styles.preTextStyle),
                SizedBox(width: 8),
                Text('+376', style: Styles.postTextStyle),
              ],
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Driving side:', style: Styles.preTextStyle),
                SizedBox(width: 8),
                Text('Right', style: Styles.postTextStyle),
              ],
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
