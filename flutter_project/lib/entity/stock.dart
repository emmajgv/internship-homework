class Stock {
  final String symbol;
  final double price;
  final double highestToday;
  final double lowestToday;

  const Stock({
    required this.symbol,
    required this.price,
    required this.highestToday,
    required this.lowestToday,
  });
}

