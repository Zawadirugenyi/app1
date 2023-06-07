class User {
  String id;
  String username;
  String email;
  String password;
  DateTime time;
  bool active;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.time,
    required this.active,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['Id'] as String,
      username: json['Username'] as String,
      email: json['Email'] as String,
      password: json['Password'] as String,
      time: DateTime.parse(json['Time'] as String),
      active: json['Active'] == "1",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Username'] = username;
    data['Email'] = email;
    data['Password'] = password;
    data['Time'] = time.toIso8601String();
    data['Active'] = active ? "1" : "0";
    return data;
  }
}
