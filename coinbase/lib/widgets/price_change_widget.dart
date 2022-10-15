import 'package:flutter/material.dart';

priceChangeWidget(priceUSD, percentageChange) {
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
