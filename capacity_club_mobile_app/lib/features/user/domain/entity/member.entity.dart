import 'dart:ffi';

class Member {
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
  final bool active;

  const Member(
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
}
