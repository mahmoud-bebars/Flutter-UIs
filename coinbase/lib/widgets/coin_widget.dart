import 'package:coinbase_app/widgets/price_change_widget.dart';
import 'package:flutter/material.dart';

coinWidget(Map currency) {
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
                    padding: const EdgeInsets.all(2),
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
                        priceChangeWidget(currency['current_price'],
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
