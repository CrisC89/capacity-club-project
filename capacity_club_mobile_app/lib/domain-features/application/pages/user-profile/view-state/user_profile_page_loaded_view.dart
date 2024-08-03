import 'package:capacity_club_mobile_app/auth/domain/entity/credential_entity.dart';
import 'package:capacity_club_mobile_app/core/config/theme/constant_size.dart';
import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/test-page/widget/update_profile.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/user-profile/component/user/member_card_widget.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/user-profile/component/user/user_image_with_icon_widget.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/user-profile/component/user/user_profile_card_widget.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/user-profile/component/user/user_profile_list_title_widget.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member/model/enum/gender_enum.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/address/entity/address_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/member-card/entity/member_card_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/member/entity/member_entity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserProfilePageLoadedView extends StatelessWidget {
  UserProfilePageLoadedView({super.key});

  MemberEntity currentMember = MemberEntity(
      member_id: UniqueId('456'),
      firstname: 'John',
      lastname: 'Doe',
      birthdate: DateTime(1990, 5, 20),
      gender: Gender.male,
      phone: '123-456-7890',
      mail: 'john.doe@example.com',
      code_activation: 'abc123',
      active: true,
      member_plan_subscriptions: [],
      indoor_training_subscription: [],
      member_home_trainings: [],
      address: AddressEntity(
          address_id: UniqueId('123'),
          street: 'Main Street',
          number: '42',
          zipcode: '12345',
          town: 'Sample Town',
          country: 'Sample Country',
          complement: 'Apt 101',
          is_empty: false),
      credential: CredentialEntity.empty(),
      member_card: MemberCardEntity(
        member_card_id: UniqueId('789'),
        collective_session_count: 10,
        individual_session_count: 5,
      ),
      is_empty: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(appDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  UserImageWithIcon(),
                  SizedBox(height: 10),
                  UserProfileCard(
                      member: currentMember,
                      onEdit: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UpdateProfileScreen()),
                          )),
                  MemberCardView(
                      memberCard: currentMember.member_card, onEdit: () {}),
                  UserProfileListTitle(
                    title: "TRAINING HISTORY",
                    icon: FontAwesomeIcons.dumbbell,
                    onPress: () {},
                  ),
                  UserProfileListTitle(
                    title: "SETTINGS",
                    icon: FontAwesomeIcons.gear,
                    onPress: () {},
                  ),
                  UserProfileListTitle(
                    title: "Logout",
                    icon: FontAwesomeIcons.rightFromBracket,
                    endIcon: false,
                    onPress: () => _showLogoutModal(context),
                  ),
                ],
              ))),
    );
  }

  _showLogoutModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("LOGOUT", style: TextStyle(fontSize: 20)),
          content: const Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: Text("Are you sure, you want to Logout?"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Replace with your logout logic
              },
              child: const Text("Yes"),
            ),
            OutlinedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("No"),
            ),
          ],
        );
      },
    );
  }
}
