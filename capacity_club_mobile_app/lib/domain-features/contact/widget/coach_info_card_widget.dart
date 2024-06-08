import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CoachInfoCard extends StatelessWidget {
  final String name;
  final String description;
  final String imageUrl;
  final String email;
  final String phoneNumber;

  const CoachInfoCard({
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                  radius: 40,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: _sendEmail,
                  icon: Icon(Icons.email),
                  label: Text('Email'),
                ),
                ElevatedButton.icon(
                  onPressed: _callPhone,
                  icon: Icon(Icons.phone),
                  label: Text('Appel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
