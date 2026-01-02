import 'package:intl/intl.dart';

class JsonData {
  final List<Map<String, dynamic>> _transactionsListItems = [
    {
      'id': '1',
      'category': 'WITHDRAW',
      'merchant': 'PNB',
      'amount': '24000',
      'date': '12-12-2025 09:10:30'
    },
    {
      'id': '2',
      'category': 'WITHDRAW',
      'merchant': 'PNB',
      'amount': '10000',
      'date': '12-11-2025 12:40:20'
    },
    {
      'id': '3',
      'category': 'TOP UP',
      'merchant': 'PNB',
      'amount': '1000',
      'date': '12-11-2025 08:20:00'
    },
    {
      'id': '4',
      'category': 'WITHDRAW',
      'merchant': 'GCASH',
      'amount': '100000',
      'date': '12-12-2025 08:20:00'
    },
    {
      'id': '5',
      'category': 'TOP UP',
      'merchant': 'QRPH',
      'amount': '200000',
      'date': '12-12-2025 08:20:00'
    },
    {
      'id': '6',
      'category': 'TOP UP',
      'merchant': 'QRPH',
      'amount': '200000',
      'date': '12-05-2025 08:20:00'
    },
    {
      'id': '7',
      'category': 'TOP UP',
      'merchant': 'QRPH',
      'amount': '200000',
      'date': '01-01-2025 10:20:00'
    },
    {
      'id': '8',
      'category': 'WITHDRAW',
      'merchant': 'QRPH',
      'amount': '200000',
      'date': '01-09-2025 11:20:00'
    },
    {
      'id': '8',
      'category': 'WITHDRAW',
      'merchant': 'QRPH',
      'amount': '200000',
      'date': '11-09-2025 11:20:00'
    },
  ];

  final List<Map<String, dynamic>> _transactionsListItems2 = [
    {
      'id': '1',
      'branch': 'Quezon City Branch',
      'game_type': 'Slot Machine 1',
      'result': 'win',
      'amount': '10000',
      'date': '12-12-2022 01:10:30',
    },
    {
      'id': '2',
      'branch': 'Makati Branch',
      'game_type': 'Roulette Table',
      'result': 'lose',
      'amount': '5000',
      'date': '12-13-2022 03:45:10',
    },
    {
      'id': '3',
      'branch': 'Cebu City Branch',
      'game_type': 'Slot Machine 2',
      'result': 'win',
      'amount': '7500',
      'date': '12-14-2022 11:22:40',
    },
    {
      'id': '4',
      'branch': 'Davao Branch',
      'game_type': 'Poker Table',
      'result': 'lose',
      'amount': '3000',
      'date': '12-15-2022 16:05:15',
    },
    {
      'id': '5',
      'branch': 'Pasay Branch',
      'game_type': 'Slot Machine 3',
      'result': 'win',
      'amount': '20000',
      'date': '12-16-2022 09:18:55',
    },
    {
      'id': '6',
      'branch': 'Taguig Branch',
      'game_type': 'Blackjack Table',
      'result': 'lose',
      'amount': '12000',
      'date': '12-17-2022 20:45:00',
    },
    {
      'id': '7',
      'branch': 'Cavite Branch',
      'game_type': 'Slot Machine 4',
      'result': 'win',
      'amount': '8500',
      'date': '12-18-2022 14:33:25',
    },
    {
      'id': '8',
      'branch': 'Bulacan Branch',
      'game_type': 'Roulette Table',
      'result': 'lose',
      'amount': '6000',
      'date': '12-19-2022 23:50:45',
    },
    {
      'id': '9',
      'branch': 'Bulacan Branch',
      'game_type': 'Roulette Table',
      'result': 'lose',
      'amount': '6000',
      'date': '12-19-2022 23:50:45',
    },
    {
      'id': '10',
      'branch': 'Bulacan Branch',
      'game_type': 'Roulette Table',
      'result': 'lose',
      'amount': '6000',
      'date': '12-19-2022 23:50:45',
    },
    {
      'id': '11',
      'branch': 'Bulacan Branch',
      'game_type': 'Roulette Table',
      'result': 'lose',
      'amount': '6000',
      'date': '12-19-2022 23:50:45',
    },
    {
      'id': '12',
      'branch': 'Bulacan Branch',
      'game_type': 'Roulette Table',
      'result': 'lose',
      'amount': '6000',
      'date': '12-19-2022 23:50:45',
    },
    {
      'id': '13',
      'branch': 'Bulacan Branch',
      'game_type': 'Roulette Table',
      'result': 'lose',
      'amount': '6000',
      'date': '12-19-2022 23:50:45',
    },
  ];

  List<Map<String, dynamic>> get transactionsListItems =>
      _transactionsListItems;

  List<Map<String, dynamic>> get transactionsListItems2 =>
      _transactionsListItems2;

  List<Map<String, dynamic>> get groupedByMonth {
    final Map<String, List<Map<String, dynamic>>> grouped = {};
    final formatter = DateFormat('MM-dd-yyyy HH:mm:ss'); // ✅ Fix format

    for (final item in _transactionsListItems) {
      final date = formatter.parse(item['date']);
      final key = DateFormat('yyyy-MM').format(date);
      grouped.putIfAbsent(key, () => []).add(item);
    }

    for (final list in grouped.values) {
      list.sort((a, b) {
        final da = formatter.parse(a['date']);
        final db = formatter.parse(b['date']);
        return da.compareTo(db);
      });
    }

    final sortedKeys = grouped.keys.toList()..sort();

    return sortedKeys.map((key) {
      final date = DateFormat('yyyy-MM').parse(key);
      final monthName = DateFormat('MMMM').format(date);
      return {
        'category_month': monthName,
        'items': grouped[key]!,
      };
    }).toList();
  }

  List<Map<String, dynamic>> get groupedByMonth2 {
    final Map<String, List<Map<String, dynamic>>> grouped = {};
    final formatter = DateFormat('MM-dd-yyyy HH:mm:ss'); // ✅ Fix format

    for (final item in _transactionsListItems2) {
      final date = formatter.parse(item['date']);
      final key = DateFormat('yyyy-MM').format(date);
      grouped.putIfAbsent(key, () => []).add(item);
    }

    for (final list in grouped.values) {
      list.sort((a, b) {
        final da = formatter.parse(a['date']);
        final db = formatter.parse(b['date']);
        return da.compareTo(db);
      });
    }

    final sortedKeys = grouped.keys.toList()..sort();

    return sortedKeys.map((key) {
      final date = DateFormat('yyyy-MM').parse(key);
      final monthName = DateFormat('MMMM').format(date);
      return {
        'category_month': monthName,
        'items': grouped[key]!,
      };
    }).toList();
  }
}
