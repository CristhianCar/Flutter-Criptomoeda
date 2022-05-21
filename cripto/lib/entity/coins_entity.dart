import 'dart:convert';

class CoinsEntity {
  String currency_name;
  String cotation;
  String symbol;
  String image_url;
  CoinDetails details;
  
  CoinsEntity({
    required this.currency_name,
    required this.cotation,
    required this.symbol,
    required this.image_url,
    required this.details,
  });
  

  Map<String, dynamic> toMap() {
    return {
      'currency_name': currency_name,
      'cotation': cotation,
      'symbol': symbol,
      'image_url': image_url,
      'details': details.toMap(),
    };
  }

  factory CoinsEntity.fromMap(Map<String, dynamic> map) {
    return CoinsEntity(
      currency_name: map['currency_name'] ?? '',
      cotation: map['cotation'] ?? '',
      symbol: map['symbol'] ?? '',
      image_url: map['image_url'] ?? '',
      details: CoinDetails.fromMap(map['details']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CoinsEntity.fromJson(String source) => CoinsEntity.fromMap(json.decode(source));
}

class CoinDetails {
  String about;
  double fee;
  
  CoinDetails({
    required this.about,
    required this.fee,
  });

  Map<String, dynamic> toMap() {
    return {
      'about': about,
      'fee': fee,
    };
  }

  factory CoinDetails.fromMap(Map<String, dynamic> map) {
    return CoinDetails(
      about: map['about'] ?? '',
      fee: map['fee']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoinDetails.fromJson(String source) => CoinDetails.fromMap(json.decode(source));
}
