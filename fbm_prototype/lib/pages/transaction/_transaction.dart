import 'package:FBM/components/_custom_colors.dart';
import 'package:FBM/components/_custom_text.dart';
import 'package:flutter/material.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key}); // 👈 add const

  @override
  State<TransactionsPage> createState() => TrascactionPageState();
}

class TrascactionPageState extends State<TransactionsPage> {
  final _tabs = ['All', 'Withdraw', 'Top Up'];

  final _transactionsListItems = [
    {
      'category': 'WITHDRAW',
      'merchant': 'PNB',
      'amount': '24.000',
      'date': '12/12/2022',
    },
    {
      'category': 'WITHDRAW',
      'merchant': 'PNB',
      'amount': '10.000',
      'date': '12/12/2022',
    },
    {
      'category': 'TOP UP',
      'merchant': 'PNB',
      'amount': '1.000',
      'date': '12/12/2022',
    },
    {
      'category': 'WITHDRAW',
      'merchant': 'GCASH',
      'amount': '100.000',
      'date': '12/12/2022',
    },
    {
      'category': 'TOP UP',
      'merchant': 'QRPH',
      'amount': '200.000',
      'date': '12/12/2022',
    }
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: 'Transaction',
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.pushNamed(context, '/'),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(child: LayoutBuilder(builder: (context, constraints) {
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: AppColors.greyLight,
                        borderRadius: BorderRadius.all(
                            Radius.circular(AppColors.mainRadius)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        spacing: 10,
                        children: _tabs.asMap().entries.map((entry) {
                          final index = entry.key;
                          final tab = entry.value;
                          final isActive = _selectedIndex == index;

                          return Expanded(
                            child: GestureDetector(
                              onTap: () => _onItemTapped(index),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 250),
                                padding: EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                    color: isActive
                                        ? AppColors.primary.withOpacity(0.2)
                                        : AppColors.white,
                                    border: Border.all(
                                        color:
                                            Color.fromARGB(255, 243, 243, 243)),
                                    borderRadius: BorderRadius.circular(
                                        AppColors.subRadius)),
                                child: Center(
                                  child: CustomText(
                                    text: tab,
                                    color: isActive
                                        ? AppColors.primary
                                        : AppColors.textPrimary,
                                    fontWeight: isActive
                                        ? FontWeight.w600
                                        : FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      )),
                  SizedBox(height: 20),
                  // Your content goes here
                  Container(
                    width: double.infinity,
                    color: AppColors.greyLight,
                  ),
                ],
              ));
        })),
      ),
    );
  }
}
