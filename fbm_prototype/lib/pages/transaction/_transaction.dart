import 'package:FBM/components/_custom_text.dart';
import 'package:flutter/material.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key}); // 👈 add const
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Transaction',
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(),
    );
  }
}
