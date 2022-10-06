class UserError {
  UserError({
    required this.code,
    this.message,
  });

  int code;
  String? message;

  factory UserError.fromJson(Map<String, dynamic> json) => UserError(
        code: json["code"] == null ? null : json["code"],
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "message": message == null ? null : message,
      };
}
