class UserModel {
  final String id;
  final int accNo;
  final String fullname;
  final String? phoneNumber;
  final String? profileImgUrl;
  final String pin;
  UserModel({
    required this.id,
    required this.fullname,
    required this.accNo,
    this.phoneNumber,
    this.profileImgUrl,
    required this.pin,
  });

  UserModel copyWith(
          {String? id,
          String? fullname,
          int? accNo,
          String? phoneNumber,
          String? profileImgUrl,
          String? pin}) =>
      UserModel(
          id: id ?? this.id,
          fullname: fullname ?? this.fullname,
          accNo: accNo ?? this.accNo,
          phoneNumber: phoneNumber ?? this.phoneNumber,
          profileImgUrl: profileImgUrl ?? this.profileImgUrl,
          pin: pin ?? this.pin);
  Map<String, dynamic> toJson() => {
        "uid": id,
        'fullname': fullname,
        'accNo': accNo,
        "phoneNumber": phoneNumber,
        "profileImgUrl": profileImgUrl,
        'pin': pin,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        fullname: json['fullname'],
        accNo: json['accNo'],
        phoneNumber: json['phoneNumber'],
        profileImgUrl: json['profileImgUrl'],
        pin: json['pin'],
      );
}
