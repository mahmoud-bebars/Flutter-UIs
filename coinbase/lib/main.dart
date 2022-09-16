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
          secondary: Colors.white,
        ),
      ),
      home: HomePage(_currencies),
    );
  }
}

getCurrencies() async {
  var url = Uri.https("api.coingecko.com", "/api/v3/coins/markets", {
    'vs_currency': 'usd',
    'order': 'order=market_cap_desc',
    'per_page': '20',
    'page': '1',
    'price_change_percentage': '1d'
  });
  var response = await http.get(url, headers: {
    // 'X-CMC_PRO_API_KEY': '28aa3727-f27e-431d-8446-725e2b0e44c1',
    "Accept": "application/json",
  });
  var jsonResponse = convert.jsonDecode(response.body); // expected bug
  return jsonResponse;
}


/* https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=20&page=1&sparkline=true&price_change_percentage=7d */