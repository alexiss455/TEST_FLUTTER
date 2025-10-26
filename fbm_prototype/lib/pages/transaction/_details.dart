import 'package:FBM/components/_custom_app_bar.dart';
import 'package:flutter/material.dart';

class TransactionDetailsPage extends StatelessWidget {
  final id; // 👈 add this

  const TransactionDetailsPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Transaction Details'),
      body: Center(
        child: Text('Transaction ID: $id'),
      ),
    );
  }
}
