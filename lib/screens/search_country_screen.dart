import 'package:flutter/material.dart';

import '../widgets/country_widget.dart';
import '../widgets/filter.dart';

class SearchCountry extends StatefulWidget {
  static const routeName = 'search-country';

  const SearchCountry({Key? key}) : super(key: key);

  @override
  State<SearchCountry> createState() => _SearchCountryState();
}

class _SearchCountryState extends State<SearchCountry> {
  final TextEditingController searchEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/explore.png'),
                  //  Text('Explore'),
                  Image.asset('assets/images/mode.png'),
                  //  Icon(Icons.brightness_high),
                ],
              ),
              SizedBox(height: 24),
              TextField(
                controller: searchEditingController,
                textAlign: TextAlign.center,
                maxLines: 1,
                decoration: InputDecoration(
                  filled: true,
                  counterText: "",
                  fillColor: Color.fromRGBO(242, 244, 247, 1),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color.fromRGBO(102, 112, 133, 1),
                  ),
                  contentPadding: EdgeInsets.all(18),
                  hintText: 'Search Country',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(242, 244, 247, 1), width: 1),
                  ),
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(102, 112, 133, 1),
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/english.png'),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Filter(),
                      );
                    },
                    child: Image.asset('assets/images/filter.png'),
                  ),
                ],
              ),
              SizedBox(height: 47),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return CountryWidget();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
