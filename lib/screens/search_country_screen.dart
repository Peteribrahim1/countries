import 'package:countries/api/api_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/countries_model.dart';
import '../models/country_model.dart';

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

  List<CountryModel> countryList = [];

  dynamic countries;
  dynamic sortedCountries;

  bool loading = true;

  @override
  void didChangeDependencies() {
    // fetchCountries();
    super.didChangeDependencies();
  }

  Future<void> fetchCountries () async {
    countries = await ApiHandler.getCountries();
    sortedCountries = countries;
   // sortedCountries.sort((a, b) => a.toString().compareTo(b.toString()));
    // sortedCountries.sort((a, b) {
    //   return a['name']['common'].toLowerCase().compareTo(b['name']['common'].toLowerCase());
    // });
    setState(() {
      loading = false;
    });


  }

  Future<void> sortedCountriesList (List<String> regions) async {
    print("Continents selected ${regions.length}");
    for(int i = 0; i < regions.length; i++) {

      sortedCountries = countries.where((country) => country['region'] == regions[i]).toList();
      print('sortedcountries $sortedCountries');
    }

    print('Sorted countries $sortedCountries');
    setState(() {
      loading = false;
    });


  }
  @override
  void initState() {
    fetchCountries();
    super.initState();
  }

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
                onChanged: (value){
                  if(value.isEmpty){
                    setState(() {
                      sortedCountries = countries;
                    });
                  }else{
                    final nan = "smart";

                      sortedCountries = countries.where((country) => country['name']['common'].toString().toLowerCase().contains(value.toString().toLowerCase())).toList();
                      print('sortedcountries $sortedCountries');




                  }
                  setState(() {

                  });
                },
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
                    onTap: () async{
                     List<String> regions = await showModalBottomSheet(
                        context: context,
                        builder: (context) => Filter(),
                      );

                      if (regions.isEmpty) {

                      } else {
                        sortedCountriesList(regions);
                      }
                    },
                    child: Image.asset('assets/images/filter.png'),
                  ),
                ],
              ),
              SizedBox(height: 47),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: loading ? const CupertinoActivityIndicator() : ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: sortedCountries.length,
                  itemBuilder: (context, index) {
                    final country = sortedCountries[index];
                    return CountryWidget(country: country,);
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
