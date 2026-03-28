import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/finnhub_service.dart';
import 'package:flutter_application_1/entity/stock.dart';

Set<Stock> watchlist = {};

// Homescreen class that extends StatefulWidget
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
  Stock? stock;
  bool isLoading = false;
  String? errorMessage;

  Future<void> search(String symbol) async {
    // something changed - rebuild the ui
    setState(() {
      isLoading = true;
      errorMessage = null;
      stock = null;
    });
    final data = await fetchQuote(symbol);

    // save result and stop loading
    setState(() {
      isLoading = false;
      if (data == null) {
        errorMessage = 'Could not find stock "$symbol". Please try again';
      } else {
        stock = data;
      }
    });
  }

  // returns the screen layout
  @override
  Widget build(BuildContext context) {
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

        if (stock case Stock(price: final price?, symbol: final symbol?))


      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$symbol \$$price',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          if (stock != null)
            IconButton(
              icon: Icon(
                watchlist.contains(stock) ? Icons.star : Icons.star_border,
              ),
              onPressed: () {
                setState(() {
                  if (watchlist.contains(stock)) {
                    watchlist.remove(stock);
                  } else {
                    watchlist.add(stock!);
                  }
                });
              },
            ),
        ],
      ),
      
        const SizedBox(height: 40),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Your watchlist',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,
            ),
          ),
        ),


        const SizedBox(height: 20),
        Expanded(
          child: watchlist.isEmpty ? Center(child: Text('No stocks in watchlist yet'),
          )
          : ListView.builder(
            itemCount: watchlist.length,
            itemBuilder: (context, index) {
              final stock = watchlist.elementAt(index);

              return ListTile(
                title: Text('${stock.symbol} \$${stock.price}', 
                style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Row(
                  children: [
                    Icon(Icons.arrow_downward, color: Colors.red, size: 14),
                    Text('\$${stock.lowestToday}'),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_upward, color: Colors.green, size: 14),
                    Text('\$${stock.highestToday}'),
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.star, color: Colors.amber),
                  onPressed: () {
                    setState(() => watchlist.remove(stock));
                  },
                ),
              );
            },
          ),

        ),
      ],
    ),
  ),
);
  }
}
