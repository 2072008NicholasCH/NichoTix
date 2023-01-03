class User {
  String? name;
  String? email;
  String? phone;
  int? balance;

  // Map<String, dynamic>? history_topup;

  User({
    this.name,
    this.email,
    this.phone,
    this.balance,
    // this.history_topup,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        balance: json['balance'],
        // history_topup: json['history_topup'],
      );
}
