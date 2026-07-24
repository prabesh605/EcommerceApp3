class UserModel {
  final String userID;
  final String userName;
  final String userGroup;
  final String email;
  UserModel({
    required this.userID,
    required this.userName,
    required this.userGroup,
    required this.email,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userID: json['userID'],
      userName: json['userName'],
      userGroup: json['userGroup'],
      email: json['email'],
    );
  }
  Map<String, dynamic> toJson() => {
    'userID': userID,
    'userName': userName,
    'userGroup': userGroup,
    'email': email,
  };
}
