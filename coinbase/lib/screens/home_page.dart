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
      body: _cryptoWidget(),
    );
  }

  Widget _cryptoWidget() {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
      itemCount: 20, // expected bug
      itemBuilder: (BuildContext context, int index) {
        final Map currency = widget.currencies[index];

        return coinComponent(currency);
        // print(currency['quote']['USD']['price']);
        // return Text(currency['name']);
      },
    );
  }
}

coinComponent(Map currency) {
  return Container(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.only(bottom: 15),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ]),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(children: [
                Container(
                    width: 60,
                    height: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        currency['image'],
                        height: 100,
                        width: 120,
                        fit: BoxFit.fill,
                      ),
                    )),
                const SizedBox(width: 10),
                Flexible(
                  child: Column(
                    children: [
                      Row(children: [
                        Text(currency['name'],
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500)),
                        const SizedBox(
                          height: 5,
                        ),
                        const SizedBox(width: 5),
                        Text("(${currency['symbol'].toUpperCase()})",
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                      ]),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey.shade200),
                          child: Text(
                            "\$ " + currency['current_price'].toString(),
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                        const SizedBox(width: 5),
                        _getSubTitleText(currency['current_price'],
                            currency['price_change_24h']),
                      ]),
                    ],
                  ),
                )
              ]),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _getSubTitleText(priceUSD, percentageChange) {
  final change = percentageChange.toDouble().abs().toStringAsFixed(5);
  String percentageChangeText = "24h: $change%";
  Container percentageChangeTextWidget;

  if (percentageChange > 0) {
    percentageChangeTextWidget = Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.green.shade400),
        child: Text(
          percentageChangeText + " ⇧",
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
        ));
  } else {
    percentageChangeTextWidget = Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.red.shade400),
        child: Text(
          percentageChangeText + " ⇩",
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
        ));
  }

  return percentageChangeTextWidget;
}
