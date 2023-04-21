class ProviderModel {
  String order;
  String income;

  String phoneNumber;
  String uid;

  ProviderModel({
    required this.order,
    required this.income,
    required this.phoneNumber,
    required this.uid,
  });

  // from map
  factory ProviderModel.fromMap(Map<String, dynamic> map) {
    return ProviderModel(
      order: map['order'] ?? '',
      income: map['income'] ?? '',

      uid: map['uid'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',

    );
  }

  // to map
  Map<String, dynamic> toMap() {
    return {
      "order": order,
      "income": income,
      "uid": uid,

      "phoneNumber": phoneNumber,

    };
  }
}
