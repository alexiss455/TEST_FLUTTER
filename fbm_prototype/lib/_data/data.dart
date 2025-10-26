class JsonData {
  final List<Map<String, dynamic>> _transactionsListItems = [
    {
      'category': 'WITHDRAW',
      'merchant': 'PNB',
      'amount': '24000',
      'date': '12-12-2022'
    },
    {
      'category': 'WITHDRAW',
      'merchant': 'PNB',
      'amount': '10000',
      'date': '12-12-2022'
    },
    {
      'category': 'TOP UP',
      'merchant': 'PNB',
      'amount': '1000',
      'date': '12-12-2022'
    },
    {
      'category': 'WITHDRAW',
      'merchant': 'GCASH',
      'amount': '100000',
      'date': '12-12-2022'
    },
    {
      'category': 'TOP UP',
      'merchant': 'QRPH',
      'amount': '200000',
      'date': '12-12-2022'
    },
    {
      'category': 'TOP UP',
      'merchant': 'QRPH',
      'amount': '200000',
      'date': '12-05-2022'
    },
    {
      'category': 'TOP UP',
      'merchant': 'QRPH',
      'amount': '200000',
      'date': '01-01-2022'
    },
    {
      'category': 'WITHDRAW',
      'merchant': 'QRPH',
      'amount': '200000',
      'date': '01-09-2022'
    },
  ];

  List<Map<String, dynamic>> get transactionsListItems =>
      _transactionsListItems;

  /// ✅ Group by month
  List<Map<String, dynamic>> get groupedByMonth {
    final Map<String, List<Map<String, dynamic>>> grouped = {};

    for (final item in _transactionsListItems) {
      final dateParts = item['date'];

      grouped.putIfAbsent(dateParts, () => []).add(item);
    }

    return grouped.entries.map((entry) {
      return {
        'category_month': entry.key,
        'items': entry.value,
      };
    }).toList();
  }
}
