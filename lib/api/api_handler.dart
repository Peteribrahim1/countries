import 'dart:convert';
import 'dart:io';

import 'package:countries/models/country_model.dart';
import 'package:http/http.dart' as http;

import '../consts/api_consts.dart';
import '../models/countries_model.dart';
import '../widgets/failure.dart';

class ApiHandler {
  // static Future<List<CountryModel>> getCountries() async {
  //   List<CountryModel> countries = [];
  //   var uri = Uri.https(BASE_URL, 'v3.1/all');
  //
  //   try {
  //     var response = await http.get(uri);
  //     // print('response ${jsonDecode(response.body)}');
  //     final decodedResponse = json.decode(response.body);
  //     // print('Decoded response $decodedResponse');
  //     print('Decoded response ${decodedResponse[0]}');
  //     print('Decoded response ${decodedResponse.length}');
  //     print('Decoded response ${decodedResponse[0]['name']['common']}');
  //           // countries = countryModelFromJson(response.body);
  //
  //   } catch (error) {
  //     print(error.toString());
  //   }
  //   print('countries $countries');
  //
  //   // List tempList = [];
  //   // for (var v in data) {
  //   //   tempList.add(v);
  //   //  // print('V $v \n\n');
  //   // }
  //   return countries;
  // }
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

    // List tempList = [];
    // for (var v in data) {
    //   tempList.add(v);
    //  // print('V $v \n\n');
    // }
    return decodedResponse;
  }
}

// class ApiHandler {
//   static Future<void> getCountries() async {
//     var response = await http.get(Uri.parse('https://restcountries.com/v3.1/all'),);
//     print('response ${jsonDecode(response.body)}');
//   }
// }

// class ApiHandler {
//   Future<Name?> getCountries() async {
//     try {
//       final call = await http.get(Uri.parse(
//           'https://restcountries.com/v3.1/all'));
//       if (call.statusCode == 200) {
//         //print(call.body);
//         final json = jsonDecode(call.body);
//         //print(json);
//         return CountryModel.fromJson(json).name;
//       } else if (call.statusCode != 200) {
//         throw Failure(message: "check url");
//       }
//     } on SocketException {
//       throw Failure(message: "You're not connected to the internet. Why?");
//     } catch (error) {
//       throw Failure(message: "An unknown error occured");
//     }
//   }
// }
