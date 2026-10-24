// For the API call, we need networking functionality
import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

// To make searching easier, I'll set up a map of these symbols with their ids in coinGecko
const Map<String, String> cryptoMap = {
  'BTC': 'bitcoin',
  'ETH': 'ethereum',
  'LTC': 'litecoin',
};

class CoinData {
  // The first part of the challenge (after the tutorial) requires us to write the API call to coinAPI
  // coinAPI is paid only so I switched to https://www.exchangerate-api.com/
  // But that one was fiat only so I switched to https://coinmarketcap.com/api/
  // And even its response was cryptic, way too many entries for the same symbol, and too much work to integrate
  // So I found https://coingecko.com/api/

  Future makeRequest({required Map<String, String?> queryParams}) async {
    var uri = Uri.https("api.coingecko.com", '/api/v3/simple/price', queryParams);
    http.Response response = await http.get(uri);
    if (response.statusCode != 200) {
      return Future.error('Error making request');
    }
    return jsonDecode(response.body);
  }

  // I had written the following methods targeting coinAPI but now adapted
  Future<String> getSingleExchange(String cur1, String cur2) async {
    // I'll have to call this multiple times from the getMultipleExchanges method to get rates for everything
    String? curID = cryptoMap[cur1];
    var result = await makeRequest(
        queryParams: {'ids': curID, 'vs_currencies': cur2});

    return result[curID][cur2].toString();
  }

  Future getMultipleExchange(String cur) async{
    // This one will be used for the final version to get exchange rates for multiple currencies
    var searchString = cryptoMap.values.join(',');
    var result = await makeRequest(queryParams: {'ids' : searchString, 'vs_currencies' : cur});

    Map<String,String> rates = {};
    for (String item in cryptoList) rates[item] = result[cryptoMap[item]][cur].toString();
    return rates;
  }

}