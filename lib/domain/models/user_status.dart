class UserStatus {
  String picUrl, name, email, message;

  UserStatus({
    required this.picUrl,
    required this.name,
    required this.email,
    required this.message,
  });

  factory UserStatus.fromJson(Map<String, dynamic> data) {
    return UserStatus(
        picUrl: data['picUrl'],
        name: data['name'],
        email: data['email'],
        message: data['message']);
  }

  Map<String, dynamic> toJson() {
    return {
      "picUrl": picUrl,
      "name": name,
      "email": email,
      "message": message,
    };
  }
}
