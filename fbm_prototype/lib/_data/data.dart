class JsonData {
  final List<Map<String, dynamic>> _transactionsListItems = [
    {
      'category': 'WITHDRAW',
      'merchant': 'PNB',
      'amount': '24.000',
      'date': '12/12/2022'
    },
    {
      'category': 'WITHDRAW',
      'merchant': 'PNB',
      'amount': '10.000',
      'date': '12/12/2022'
    },
    {
      'category': 'TOP UP',
      'merchant': 'PNB',
      'amount': '1.000',
      'date': '12/12/2022'
    },
    {
      'category': 'WITHDRAW',
      'merchant': 'GCASH',
      'amount': '100.000',
      'date': '12/12/2022'
    },
    {
      'category': 'TOP UP',
      'merchant': 'QRPH',
      'amount': '200.000',
      'date': '12/12/2022'
    },
    {
      'category': 'TOP UP',
      'merchant': 'QRPH',
      'amount': '200.000',
      'date': '12/12/2022'
    },
    {
      'category': 'TOP UP',
      'merchant': 'QRPH',
      'amount': '200.000',
      'date': '12/12/2022'
    },
    {
      'category': 'TOP UP',
      'merchant': 'QRPH',
      'amount': '200.000',
      'date': '12/12/2022'
    },
    {
      'category': 'TOP UP',
      'merchant': 'QRPH',
      'amount': '200.000',
      'date': '12/12/2022'
    },
    {
      'category': 'TOP UP',
      'merchant': 'QRPH',
      'amount': '200.000',
      'date': '12/12/2022'
    },
  ];

  // ✅ getter to access the private field
  List<Map<String, dynamic>> get transactionsListItems =>
      _transactionsListItems;
}
