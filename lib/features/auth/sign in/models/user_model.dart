class UserModel {
  final String email;
  final String name;
  final String phone;
  String? image;
  final String id;

  UserModel(
      {required this.email,
      required this.name,
      this.image,
      required this.phone,
      required this.id});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      image: json['image'],
      id: json['id'],
    );
  }
  toJson() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
      'id': id,
      'image': image
    };
  }
}
