class ProModel {
  String proName;
  String proEmail;
  String bio;
  String proProfilePic;
  String proCreatedAt;
  String proPhoneNumber;
  String proUid;
  int orderRecived;
  int totalEarn;

  ProModel({
    required this.proName,
    required this.proEmail,
    required this.bio,
    required this.proProfilePic,
    required this.proCreatedAt,
    required this.proPhoneNumber,
    required this.proUid,
    required this.orderRecived,
    required this.totalEarn,
  });

  // from map
  factory ProModel.fromMap(Map<String, dynamic> map) {
    return ProModel(
      proName: map['proName'] ?? '',
      proEmail: map['proEmail'] ?? '',
      bio: map['bio'] ?? '',
      proUid: map['proUid'] ?? '',
      proPhoneNumber: map['proPhoneNumber'] ?? '',
      proCreatedAt: map['proCreatedAt'] ?? '',
      proProfilePic: map['proProfilePic'] ?? '',
      orderRecived:map['orderRecived'] ?? '',
      totalEarn:map['totalEarn'] ?? '',
    );
  }

  // to map
  Map<String, dynamic> toMap() {
    return {
      "proName": proName,
      "proEmail": proEmail,
      "proUid": proUid,
      "bio": bio,
      "proProfilePic": proProfilePic,
      "proPhoneNumber": proPhoneNumber,
      "proCreatedAt": proCreatedAt,
      "orderRecived":orderRecived,
      "totalEarn":totalEarn,
    };
  }
}
