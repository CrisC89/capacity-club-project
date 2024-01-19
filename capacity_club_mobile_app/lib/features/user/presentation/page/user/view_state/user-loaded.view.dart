import 'package:capacity_club_mobile_app/features/user/domain/entity/member.entity.dart';
import 'package:flutter/material.dart';

class UserLoadedView extends StatelessWidget {
  final Member member;

  const UserLoadedView({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('DATA LOADED'),
          Text('Nom : ${member.lastname}'),
          Text('Prénom : ${member.firstname}'),
        ],
      ),
    );
  }
}
