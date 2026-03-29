import 'package:stock_watch/entity/stock.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final String apiKey = dotenv.env['FINNHUB_API_KEY'] ?? '';

Future<Stock?> fetchQuote(String symbol) async {
  symbol = symbol.toUpperCase();
try {
    final url = Uri.parse(
      'https://finnhub.io/api/v1/quote?symbol=$symbol&token=$apiKey'
    );

    final response = await http.get(url).timeout(Duration(seconds: 10));
    final data = jsonDecode(response.body);

    if (data['c'] == 0) return null;

    double price = data['c'];
    double highestToday = data['h'];
    double lowestToday = data["l"];
    
    return Stock(symbol: symbol, price: price, highestToday: highestToday, lowestToday: lowestToday);
  } catch (e) {
    return null;
  }
}
