import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  List currencies;
  HomePage(this.currencies, {Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List? currencies;

  final List<MaterialColor> _colors = [Colors.blue, Colors.indigo, Colors.red];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CoinBase",
          style: TextStyle(color: Colors.black),
        ),
        //  backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: _cryptoWidget(),
    );
  }

  Widget _cryptoWidget() {
    return ListView.builder(
      itemCount: currencies?.length, // expected bug
      itemBuilder: (BuildContext context, int index) {
        final Map currency = widget.currencies[index];
        final MaterialColor color = _colors[index % _colors.length];

        return _getListItemUi(currency, color);
        // print(currency['quote']['USD']['price']);
        // return Text(currency['name']);
      },
    );
  }

  Widget _getListItemUi(Map currency, MaterialColor color) {
    final price = currency['quote']['USD']['price'].toString();
    final changeInHour =
        currency['quote']['USD']['percent_change_1h'].toString();
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(currency['name'][0]),
      ),
      title: Text(
        currency['name'],
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: _getSubTitleText(price, changeInHour),
      isThreeLine: true,
    );
  }

  Widget _getSubTitleText(String priceUSD, String percentageChange) {
    TextSpan priceTextWidget = TextSpan(
        text: "\$$priceUSD/n", style: const TextStyle(color: Colors.black));
    String percentageChangeText = "1 hour: $percentageChange%";
    TextSpan percentageChangeTextWidget;

    if (double.parse(percentageChange) > 0) {
      percentageChangeTextWidget = TextSpan(
        text: percentageChangeText,
        style: const TextStyle(color: Colors.green),
      );
    } else {
      percentageChangeTextWidget = TextSpan(
        text: percentageChangeText,
        style: const TextStyle(color: Colors.red),
      );
    }

    return RichText(
        text:
            TextSpan(children: [priceTextWidget, percentageChangeTextWidget]));
  }
}
