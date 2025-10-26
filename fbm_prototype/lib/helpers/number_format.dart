class NumberFormat {
  static String format(dynamic number) {
    // Convert to num safely
    final numValue =
        number is num ? number : num.tryParse(number.toString()) ?? 0;

    // Format with commas and two decimal places
    final parts = numValue.toStringAsFixed(2).split('.');
    final integerPart = parts[0].replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
    return '$integerPart.${parts[1]}';
  }
}
