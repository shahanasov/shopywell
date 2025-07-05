class PersonalDetailsModel {
  final String email;
  final String password;
  final String pincode;
  final String address;
  final String city;
  final String state;
  final String country;
  final String accountNumber;
  final String name;
  final String ifsc;

  PersonalDetailsModel({
    required this.email,
    required this.password,
    required this.pincode,
    required this.address,
    required this.city,
    required this.state,
    required this.country,
    required this.accountNumber,
    required this.name,
    required this.ifsc,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'pincode': pincode,
      'address': address,
      'city': city,
      'state': state,
      'country': country,
      'accountNumber': accountNumber,
      'name': name,
      'ifsc': ifsc,
    };
  }
}
