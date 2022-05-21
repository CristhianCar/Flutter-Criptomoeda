import 'dart:convert';


class UserEntity {
  String message;
  String wallet_id;
  String user_balance;
  
  UserEntity({
    required this.message,
    required this.wallet_id,
    required this.user_balance,
  });

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'wallet_id': wallet_id,
      'user_balance': user_balance,
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      message: map['message'] ?? '',
      wallet_id: map['wallet_id'] ?? '',
      user_balance: map['user_balance'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEntity.fromJson(String source) => UserEntity.fromMap(json.decode(source));
}
