import 'dart:convert';
import 'dart:io';

//import 'package:countries/models/country_model.dart';
import 'package:http/http.dart' as http;

import '../consts/api_consts.dart';
import '../models/countries_model.dart';
import '../widgets/failure.dart';

class ApiHandler {
  static Future<dynamic> getCountries() async {
    List<CountryModel> countries = [];
    var uri = Uri.https(BASE_URL, 'v3.1/all');

    dynamic decodedResponse;

    try {
      var response = await http.get(uri);
      // print('response ${jsonDecode(response.body)}');
      decodedResponse = json.decode(response.body);
      // print('Decoded response $decodedResponse');
      print('Decoded response ${decodedResponse[0]}');
      print('Decoded response ${decodedResponse.length}');
      print('Decoded response ${decodedResponse[0]['name']['common']}');
      // countries = countryModelFromJson(response.body);

    } catch (error) {
      print(error.toString());
    }
    print('countries $countries');

    return decodedResponse;
  }
}
