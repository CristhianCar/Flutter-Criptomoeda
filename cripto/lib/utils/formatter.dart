class Formatter {
  
  static String money(dynamic value) {
    String valueStr;

    if (value is String) {
      String temp = value.replaceAll('.', '').replaceAll(',', '.');
      double tempDbl = double.parse(temp);
      valueStr = tempDbl.toStringAsFixed(2).replaceAll('.', ',');
    } else if (value is double) {
      String temp = value.toString().replaceAll('.', '').replaceAll(',', '.');
      double tempDbl = double.parse(temp);
      valueStr = tempDbl.toStringAsFixed(2).replaceAll('.', ',');
    } else {
      valueStr = '0,00';
    }

    int size = valueStr.length - 3;
    while (size > 3) {
      size -= 3;
      valueStr =
          '${valueStr.substring(0, size)}.${valueStr.substring(size)}';
    }
    
    return 'R\$ $valueStr';
  }
}