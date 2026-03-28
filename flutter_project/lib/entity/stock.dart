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


  @override
  bool operator ==(Object other) {
    return other is Stock && other.symbol == symbol;
  }

  @override
  int get hashCode => symbol.hashCode;
}
