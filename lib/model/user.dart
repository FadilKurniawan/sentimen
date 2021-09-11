class User {
  User({
    this.localId,
    this.displayName,
    this.photoUrl,
    this.email,
    this.emailVerified,
    this.token,
  });

  String? localId;
  String? displayName;
  String? photoUrl;
  String? email;
  bool? emailVerified;
  String? token;

  factory User.fromJson(Map<String, dynamic> json) => User(
        localId: json["localId"],
        displayName: json["displayName"],
        photoUrl: json["photoUrl"],
        email: json["email"],
        emailVerified: json["emailVerified"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "localId": localId,
        "displayName": displayName,
        "photoUrl": photoUrl,
        "email": email,
        "emailVerified": emailVerified,
        "token": token,
      };
}
