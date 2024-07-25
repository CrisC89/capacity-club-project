import 'package:capacity_club_mobile_app/core/config/theme/theme.dart';
import 'package:capacity_club_mobile_app/core/widgets/button/custom_icon_button_widget.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home/components/widget/custom_coach_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CoachInfoCard2 extends StatelessWidget {
  final String name;
  final String description;
  final String imageUrl;
  final String email;
  final String phoneNumber;

  const CoachInfoCard2({
    Key? key,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.email,
    required this.phoneNumber,
  }) : super(key: key);

  void _sendEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=Contact&body=Hello $name',
    );
    try {
      await launchUrl(emailLaunchUri);
    } catch (e) {
      print('Could not launch $emailLaunchUri');
    }
  }

  void _callPhone() async {
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    try {
      await launchUrl(phoneLaunchUri);
    } catch (e) {
      print('Could not launch $phoneLaunchUri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: Color(0xff949494)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                CustomCoachLogo(
                  backgroundColor: Color.fromARGB(255, 4, 136, 183),
                  text: 'JL',
                  radius: 30,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name,
                        style: AppTheme.dustyGrayMedium16,
                      ),
                      SizedBox(height: 4),
                      Text(description, style: AppTheme.dustyGrayMedium12),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomIconButton(
                              icon: FontAwesomeIcons.envelope,
                              onTap: _sendEmail),
                          CustomIconButton(
                              icon: FontAwesomeIcons.whatsapp,
                              onTap: _callPhone)
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
