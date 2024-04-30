class User {
  final String? id;
  final String? name;
  final String? email;
  final String? gender;
  final String? avatar;
  final double? weight;
  final double? height;
  final int? age;

  User({
    this.id,
    this.name,
    this.email,
    this.gender,
    this.avatar,
    this.weight,
    this.height,
    this.age,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      gender: json['gender'],
      avatar: json['avatar'],
      weight: json['weight'].toDouble(),
      height: json['height'].toDouble(),
      age: json['age'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'gender': gender,
      'avatar': avatar,
      'weight': weight,
      'height': height,
      'age': age,
    };
  }
}
