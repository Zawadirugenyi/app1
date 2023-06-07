class Account {
  final int id;
  final int clientId;
  final String phoneNumber;
  final String occupation;
  final int income;
  final String address;
  final String personOfReference;
  final DateTime time;

  Account({
    required this.id,
    required this.clientId,
    required this.phoneNumber,
    required this.occupation,
    required this.income,
    required this.address,
    required this.personOfReference,
    required this.time,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: int.parse(json['Id']),
      clientId: int.parse(json['client_id']),
      phoneNumber: json['Phone_number'],
      occupation: json['Occupation'],
      income: int.parse(json['Income']),
      address: json['Address'],
      personOfReference: json['Person_of_reference'],
      time: DateTime.parse(json['Time']),
    );
  }

  Map<String, dynamic> toJson() => {
    'Id': id.toString(),
    'client_id': clientId.toString(),
    'Phone_number': phoneNumber,
    'Occupation': occupation,
    'Income': income.toString(),
    'Address': address,
    'Person_of_reference': personOfReference,
    'Time': time.toIso8601String(),
  };
}
