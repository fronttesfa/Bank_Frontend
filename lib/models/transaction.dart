class Transaction {
  final String name;
  final String date;
  final String amount;
  final String imageUrl;
  final bool isWithdraw;

  Transaction(
      {required this.name,
      required this.date,
      required this.amount,
      required this.imageUrl,
      required this.isWithdraw});
}
