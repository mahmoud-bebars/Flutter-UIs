import 'package:flutter/material.dart';
import 'package:coinbase_app/screens/home_page.dart';
import 'package:coinbase_app/services/api_service.dart';

void main() async {
  final List currencies = await getApiData();
  runApp(MyApp(currencies));
}

class MyApp extends StatelessWidget {
  final List _currencies;
  const MyApp(this._currencies, {Key? key}) : super(key: key);

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
