import 'package:capacity_club_mobile_app/core/config/theme/constant_size.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/test-page/widget/text_string.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/test-page/widget/user_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileFormScreen extends StatelessWidget {
  const ProfileFormScreen({
    Key? key,
    required this.user,
    required this.email,
    required this.phoneNo,
    required this.fullName,
    required this.password,
  }) : super(key: key);

  final UserModel user;
  final TextEditingController email;
  final TextEditingController phoneNo;
  final TextEditingController fullName;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    //final controller = Get.put(ProfileController());

    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: fullName,
            decoration: const InputDecoration(
                label: Text(tFullName),
                prefixIcon: Icon(FontAwesomeIcons.user)),
          ),
          const SizedBox(height: tFormHeight - 20),
          TextFormField(
            controller: email,
            decoration: const InputDecoration(
                label: Text(tEmail),
                prefixIcon: Icon(FontAwesomeIcons.envelope)),
          ),
          const SizedBox(height: tFormHeight - 20),
          TextFormField(
            controller: phoneNo,
            decoration: const InputDecoration(
                label: Text(tPhoneNo),
                prefixIcon: Icon(FontAwesomeIcons.phone)),
          ),
          const SizedBox(height: tFormHeight),

          /// -- Form Submit Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                final userData = UserModel(
                  id: user.id,
                  email: email.text.trim(),
                  fullName: fullName.text.trim(),
                  phoneNo: phoneNo.text.trim(),
                );

                //await controller.updateRecord(userData);
              },
              child: const Text(tEditProfile),
            ),
          ),
          const SizedBox(height: tFormHeight),

          /// -- Created Date and Delete Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text.rich(
                TextSpan(
                  text: tJoined,
                  style: TextStyle(fontSize: 12),
                  children: [
                    TextSpan(
                        text: tJoinedAt,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12))
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent.withOpacity(0.1),
                    elevation: 0,
                    foregroundColor: Colors.red,
                    side: BorderSide.none),
                child: const Text(tDelete),
              ),
            ],
          )
        ],
      ),
    );
  }
}
