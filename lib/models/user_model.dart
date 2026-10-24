class UserModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String bio;
  final String gender;
  final String birthDate;
  final String avatarPath;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.phone = '081234567890',
    this.bio = 'Pecinta Donat Manis & Dessert',
    this.gender = 'Laki-laki',
    this.birthDate = '25 Mei 2004',
    this.avatarPath = 'asset/yusuf.jpeg',
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? bio,
    String? gender,
    String? birthDate,
    String? avatarPath,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      bio: bio ?? this.bio,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      avatarPath: avatarPath ?? this.avatarPath,
    );
  }
}
