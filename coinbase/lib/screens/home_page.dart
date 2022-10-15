import 'package:coinbase_app/widgets/Coin_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  List currencies;
  HomePage(this.currencies, {Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List? currencies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "CoinBase 💰",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          //  backgroundColor: Colors.transparent,
          bottomOpacity: 20,
          elevation: 0,
          scrolledUnderElevation: 10),
      body: _cryptoList(),
    );
  }

  Widget _cryptoList() {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
      itemCount: 20, // expected bug
      itemBuilder: (BuildContext context, int index) {
        final Map currency = widget.currencies[index];

        return coinWidget(currency);
        // print(currency['quote']['USD']['price']);
        // return Text(currency['name']);
      },
    );
  }
}
