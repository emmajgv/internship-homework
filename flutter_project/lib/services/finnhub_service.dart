import 'package:http/http.dart' as http;
import 'dart:convert';

const String apiKey = 'INSERT_FINNHUB_KEY';

// A Finnhub quote usually looks like this
// {
// "c": 261.74,  // Current price
// "h": 263.31,  // High price of the day
// "l": 260.64,  // Low price of the day
// "o": 261.07,  // Open price of the day
// "pc": 259.45, // Previous close price
// "t": 1582641000 // Timestamp
// }

Future<Map<String, dynamic>?> fetchQuote(String symbol) async {
try {
    final url = Uri.parse(
      'https://finnhub.io/api/v1/quote?symbol=$symbol&token=$apiKey'
    );

    final response = await http.get(url).timeout(Duration(seconds: 10));
    final data = jsonDecode(response.body);

    // Finnhub returns c: 0 when the symbol doesn't exist
    if (data['c'] == 0) return null;

    return data;
  } catch (e) {
    return null;
  }
}
