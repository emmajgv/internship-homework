import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/finnhub_service.dart';

//  Homescreen class that extends StatefulWidget
// so that the screen can change when data comes back.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// _ means private and that it's only usable inside this file
// this class is only meant to support Homescreen internally.
// state class contains: data(state), logic(functions that change data) and UI (build method)
class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic>? stockData;
  bool isLoading = false;
  String? errorMessage;

  Future<void> search(String symbol) async {
    // something changed - rebuild the ui
    setState(() {
      isLoading = true;
      errorMessage = null;
      stockData = null;
    });
    final data = await fetchQuote(symbol);

    // save result and stop loading
    setState(() {
      isLoading = false;
      if (data == null) {
        errorMessage = 'Could not find stock "$symbol". Please try again';
      } else {
        stockData = data;
      }
    });
  }

// returns the screen layout
  @override
  Widget build(BuildContext context) {
    // basic app layout
    return Scaffold(
  appBar: AppBar(title: const Text('Stock Watch')),
  body: Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        TextField(
          decoration: const InputDecoration(
            hintText: 'Enter stock symbol',
          ),
          onSubmitted: (value) => search(value),
        ),
        const SizedBox(height: 20),
        if (isLoading)
          const CircularProgressIndicator(),

        if (errorMessage != null)
          Text(errorMessage!,
          style: TextStyle(color: Colors.red),
          ),

        if (stockData != null)
          Text(
            'Current price: ${stockData!['c']}',
            style: const TextStyle(fontSize: 24),
          ),
      ],
    ),
  ),
);
  }
}
