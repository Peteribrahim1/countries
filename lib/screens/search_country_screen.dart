import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:countries/api/api_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../models/countries_model.dart';
import 'package:countries/widgets/themeModel.dart';
import 'package:provider/provider.dart';
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

  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  var _icon = Icons.wb_sunny;

  @override
  void initState() {
    getConnectivity();
    fetchCountries();
    super.initState();
  }

  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            showDialogBox();
            setState(() => isAlertSet = true);
          }
        },
      );

  @override
  void dispose() {
    super.dispose();
    searchEditingController.dispose();
    subscription.cancel();
  }

  List<CountryModel> countryList = [];

  dynamic countries;
  dynamic sortedCountries;

  bool loading = true;

  Future<void> fetchCountries() async {
    countries = await ApiHandler.getCountries();
    sortedCountries = countries;
    sortedCountries.sort((a, b) => a['name']['common']
        .toString()
        .compareTo(b['name']['common'].toString()));
    setState(() {
      loading = false;
    });
  }

  Future<void> sortedCountriesList(List<String> regions) async {
    print("Continents selected ${regions.length}");
    for (int i = 0; i < regions.length; i++) {
      sortedCountries = countries
          .where((country) => country['region'] == regions[i])
          .toList();
      print('sortedcountries $sortedCountries');
    }

    print('Sorted countries $sortedCountries');
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ThemeModel themeNotifier, child) {
        return Scaffold(
          //   backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/explore.png'),
                      IconButton(
                        icon: Icon(
                          _icon,
                          color: Colors.grey,
                          size: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            if (_icon == Icons.wb_sunny) {
                              _icon = Icons.brightness_2;
                              themeNotifier.isDark = true;
                            } else {
                              _icon = Icons.wb_sunny;
                              themeNotifier.isDark = false;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  TextField(
                    controller: searchEditingController,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    onChanged: (value) {
                      if (value.isEmpty) {
                        setState(() {
                          sortedCountries = countries;
                        });
                      } else {
                        final nan = "smatt";

                        sortedCountries = countries
                            .where((country) => country['name']['common']
                                .toString()
                                .toLowerCase()
                                .contains(value.toString().toLowerCase()))
                            .toList();
                        print('sortedcountries $sortedCountries');
                      }
                      setState(() {});
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
                  //test
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(7),
                        width: 83,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Color.fromRGBO(169, 184, 212, 1),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.language),
                            SizedBox(width: 3),
                            Text('EN'),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          List<String> regions = await showModalBottomSheet(
                            context: context,
                            builder: (context) => Filter(),
                          );

                          if (regions.isEmpty) {
                          } else {
                            sortedCountriesList(regions);
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(7),
                          width: 83,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Color.fromRGBO(169, 184, 212, 1),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.filter_alt_outlined),
                              SizedBox(width: 3),
                              Text('Filter'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 37),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: loading
                        ? const CupertinoActivityIndicator()
                        : ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: sortedCountries.length,
                            itemBuilder: (context, index) {
                              final country = sortedCountries[index];
                              return CountryWidget(
                                country: country,
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  showDialogBox() => showCupertinoDialog<String>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: Text('No connection'),
          content: Text('Please check your internet connectivity'),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.pop(context, 'Cancel');
                setState(() => isAlertSet = false);
                isDeviceConnected =
                    await InternetConnectionChecker().hasConnection;
                if (!isDeviceConnected) {
                  showDialogBox();
                  setState(() => isAlertSet = true);
                }
              },
              child: Text('Ok'),
            )
          ],
        ),
      );
}
