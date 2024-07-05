import 'package:intl/intl.dart';

class CurrencyFormatterUtils {
  static NumberFormat numberFormat = NumberFormat.currency(locale: 'en_IN', symbol: '\u{20B9}');
  static NumberFormat numberFormatInternationalCurrency = NumberFormat.decimalPattern(
    'HI',
  );

  static String formatAmount(double amount) {
    return numberFormat.format(amount);
  }
}
