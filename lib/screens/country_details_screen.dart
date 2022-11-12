import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../styles/styles.dart';
import '../widgets/image_widget.dart';

class CountryDetails extends StatefulWidget {
  static const routeName = 'country-details';

  final dynamic country;

  const CountryDetails({Key? key, required this.country}) : super(key: key);

  @override
  State<CountryDetails> createState() => _CountryDetailsState();
}

class _CountryDetailsState extends State<CountryDetails> {
  List<String> flagCoat = [];

  @override
  void initState() {
    flagCoat = [
      widget.country['flags']['png'] ?? '',
      widget.country['coatOfArms']['png'] ?? ''
    ];
    print(flagCoat);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          '${widget.country['name']['common']}',
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
                itemCount: flagCoat.length,
                itemBuilder: (ctx, index) {
                  return ImageWidget(country: flagCoat[index]);
                },
                pagination: const SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                        color: Color.fromRGBO(153, 153, 153, 1),
                        activeColor: Colors.white)),
                control: SwiperControl(),
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
                  '${widget.country['population']}',
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
                  '${widget.country['region']}',
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
                  '${widget.country['capital'].toString().replaceAll('[', '').replaceAll(']', '')}',
                  style: Styles.postTextStyle,
                ),
              ],
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Official language:',
                  style: Styles.preTextStyle,
                ),
                SizedBox(width: 8),
                Expanded(
                    child: Text(
                  '${widget.country['languages'].toString().replaceAll('{', '').replaceAll('}', '')}',
                  overflow: TextOverflow.ellipsis,
                  style: Styles.postTextStyle,
                )),
              ],
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Ethic group:',
                    style: Styles.preTextStyle),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                      '${widget.country['languages'].toString().replaceAll('{', '').replaceAll('}', '')}',
                      overflow: TextOverflow.ellipsis,
                      style: Styles.postTextStyle),
                ),
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
                Text('${widget.country['independent']}',
                    style: Styles.postTextStyle),
              ],
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Area:', style: Styles.preTextStyle),
                SizedBox(width: 8),
                Text('${widget.country['area']} km2',
                    style: Styles.postTextStyle),
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
                Expanded(
                  child: Text(
                      '${widget.country['timezones'].toString().replaceAll('[', '').replaceAll(']', '')}',
                      overflow: TextOverflow.ellipsis,
                      style: Styles.postTextStyle),
                ),
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
                Text('${widget.country['idd']['root']}',
                    style: Styles.postTextStyle),
              ],
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Driving side:', style: Styles.preTextStyle),
                SizedBox(width: 8),
                Text('${widget.country['car']['side']}',
                    style: Styles.postTextStyle),
              ],
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
