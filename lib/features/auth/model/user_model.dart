import 'dart:convert';

class UserModel {
  final String displayName;
  final String username;
  final String email;
  final String profilePicture;
  final List<String> subscription;
  final int videos;
  final String userId;
  final String description;
  final String type;

  UserModel({
    required this.displayName,
    required this.username,
    required this.email,
    required this.profilePicture,
    required this.subscription,
    required this.userId,
    required this.description,
    required this.type,
    required this.videos,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      displayName: map['displayName'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      profilePicture: map['profilePicture'] as String,
      subscription: List<String>.from(map['subscription'] ?? []),
      userId: map['userId'] as String,
      description: map['description'] as String,
      type: map['type'] as String,
      videos: map['videos'] as int,
    );
  }

  Map<String, dynamic> toMap() => {
    'displayName': displayName,
    'username': username,
    'email': email,
    'profilePicture': profilePicture,
    'subscription': subscription,
    'userId': userId,
    'description': description,
    'type': type,
    'videos': videos,
  };

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
