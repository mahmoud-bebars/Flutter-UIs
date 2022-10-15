import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

getApiData() async {
  var url = Uri.https("api.coingecko.com", "/api/v3/coins/markets", {
    'vs_currency': 'usd',
    'order': 'order=market_cap_desc',
    'per_page': '20',
    'page': '1',
    'price_change_percentage': '1d'
  });
  var response = await http.get(url, headers: {
    "Accept": "application/json",
  });
  var jsonResponse = convert.jsonDecode(response.body); // expected bug
  return jsonResponse;
}

// API URL
/* https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=20&page=1&sparkline=true&price_change_percentage=7d */