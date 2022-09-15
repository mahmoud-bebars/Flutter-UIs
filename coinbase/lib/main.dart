import 'package:coinbase_app/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() async {
  final List currencies = await getCurrencies();
  print(currencies.length);
  runApp(MyApp(currencies));
}

class MyApp extends StatelessWidget {
  final List _currencies;
  const MyApp(this._currencies);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.white,
          secondary: Colors.grey,
        ),
      ),
      home: HomePage(_currencies),
    );
  }
}

getCurrencies() async {
  var url = Uri.https(
      "pro-api.coinmarketcap.com",
      "/v1/cryptocurrency/listings/latest",
      {'start': '1', 'limit': '5000', 'convert': 'USD'});
  var response = await http.get(url, headers: {
    'X-CMC_PRO_API_KEY': '28aa3727-f27e-431d-8446-725e2b0e44c1',
    "Accept": "application/json",
  });
  var jsonResponse =
      convert.jsonDecode(response.body) as Map<String, dynamic>; // expected bug
  return jsonResponse["data"];
}
