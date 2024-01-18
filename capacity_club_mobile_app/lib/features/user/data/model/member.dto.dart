import 'dart:ffi';

class MemberDto {
  final String member_id;
  final String firstname;
  final String lastname;
  final DateTime birthdate;
  final String gender; // Gender
  final String mail;
  final String phone;
  final String iban;
  final String code_activation;
  final String subscriptions; // MemberPlanSubscription[]
  final String address; // Address
  final Bool active;

  const MemberDto(
      {required this.member_id,
      required this.firstname,
      required this.lastname,
      required this.birthdate,
      required this.gender,
      required this.mail,
      required this.phone,
      required this.iban,
      required this.code_activation,
      required this.subscriptions,
      required this.address,
      required this.active});

  factory MemberDto.fromJson(Map<String, dynamic> json) {
    return MemberDto(
        member_id: json['member_id'],
        firstname: json['firstname'],
        lastname: json['lastname'],
        birthdate: json['birthdate'],
        gender: json['gender'],
        mail: json['mail'],
        phone: json['phone'],
        iban: json['iban'],
        code_activation: json['code_activation'],
        subscriptions: json['subscriptions'],
        address: json['address'],
        active: json['active']);
  }

  Map<String, dynamic> toJson() => {
        'member_id': member_id,
        'firstname': firstname,
        'lastname': lastname,
        'birthdate': birthdate,
        'gender': gender,
        'mail': mail,
        'phone': phone,
        'iban': iban,
        'code_activation': code_activation,
        'subscriptions': subscriptions,
        'address': address,
        'active': active
      };
}
