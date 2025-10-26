import 'package:flutter/material.dart';

class TransactionDetailsPage extends StatelessWidget {
  final String transactionId; // 👈 add this

  const TransactionDetailsPage({
    Key? key,
    this.transactionId = '000000000',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Details'),
      ),
      body: Center(
        child: Text('Transaction ID: $transactionId'),
      ),
    );
  }
}
