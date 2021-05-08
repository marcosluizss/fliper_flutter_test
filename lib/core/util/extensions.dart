import 'package:intl/intl.dart';

enum DisplayType { PRICE, PERCENT }

extension DoubleToCurrency on double {
  String toCurrencyDisplay() {
    return NumberFormat.currency(locale: "pt_BR", symbol: 'R\$').format(this);
  }

  String toPercentDisplay({int precision = 3}) {
    return "${this.toStringAsFixed(precision)}%".replaceAll(".", ",");
  }

  String toDisplay(DisplayType type, int precision) {
    switch (type) {
      case DisplayType.PRICE:
        return this.toCurrencyDisplay();
      case DisplayType.PERCENT:
        return this.toPercentDisplay(precision: precision);
      default:
        return "$this";
    }
  }
}
