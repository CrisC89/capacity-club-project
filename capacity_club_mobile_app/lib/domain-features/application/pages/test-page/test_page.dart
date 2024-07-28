import 'package:capacity_club_mobile_app/core/config/theme/app_color.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/test-page/bloc/test_bloc.dart';
import 'package:capacity_club_mobile_app/core/config/theme/constant_size.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/test-page/widget/text_string.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/test-page/widget/update_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TestPageProvider extends StatelessWidget {
  const TestPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TestBloc(),
      child: TestPage(),
    );
  }
}

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSpace),
          child: Column(
            children: [
              /// -- IMAGE with ICON
              ImageWithIcon(),
              const SizedBox(height: 10),
              Text(tProfileHeading,
                  style: Theme.of(context).textTheme.headlineMedium),
              Text(tProfileSubHeading,
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 20),
              UserInformationCard(
                fullName: 'John Doe',
                email: 'john.doe@example.com',
                dateOfBirth: '01/01/1990',
                address: '123 Main St, Anytown, USA',
              ),
              const SizedBox(height: 20),
              TPrimaryButton(
                isFullWidth: false,
                width: 200,
                text: tEditProfile,
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UpdateProfileScreen()),
                ),
              ),

              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              /// -- MENU
              ProfileMenuWidget(
                title: "Settings",
                icon: FontAwesomeIcons.gear,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "Billing Details",
                icon: FontAwesomeIcons.wallet,
                onPress: () {},
              ),
              /*
              ProfileMenuWidget(
                title: "User Management",
                icon: FontAwesomeIcons.userCheck,
                onPress: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllUsers()),
                ),
                endIcon: FontAwesomeIcons.angleRight, // Added endIcon for right angle icon
              ),
              */
              ProfileMenuWidget(
                title: "User Management",
                icon: FontAwesomeIcons.userCheck,
                onPress: () {
                  // Replace with navigation code for your app
                },
              ),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                title: "Information",
                icon: FontAwesomeIcons.info,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "Logout",
                icon: FontAwesomeIcons.signOutAlt,
                textColor: Colors.red,
                endIcon: false,
                onPress: () => _showLogoutModal(context),
              ),
            ],
          ),
        ),
      ),
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

class TPrimaryButton extends StatelessWidget {
  const TPrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isFullWidth = true,
    this.width = 100.0,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isFullWidth;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullWidth ? double.infinity : width,
      child: ElevatedButton(
        onPressed: onPressed,
        child:
            isLoading ? const ButtonLoadingWidget() : Text(text.toUpperCase()),
      ),
    );
  }
}

class ButtonLoadingWidget extends StatelessWidget {
  const ButtonLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(color: Colors.white),
        ),
        SizedBox(width: 10),
        Text("Loading...")
      ],
    );
  }
}

class ImageWithIcon extends StatelessWidget {
  ImageWithIcon({
    Key? key,
  }) : super(key: key);

  String tProfileImage = "assets/img/user.png";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 120,
          height: 120,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image(image: AssetImage(tProfileImage)),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100), color: tPrimaryColor),
            child: const Icon(FontAwesomeIcons.pencil,
                color: Colors.black, size: 20),
          ),
        ),
      ],
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor = isDark ? tPrimaryColor : tAccentColor;

    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(tBorderRadius),
          color: iconColor.withOpacity(0.1),
        ),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(title,
          style:
              Theme.of(context).textTheme.bodyLarge?.apply(color: textColor)),
      trailing: endIcon
          ? const SizedBox(
              width: 30,
              height: 30,
              child: Icon(FontAwesomeIcons.angleRight,
                  size: 18.0, color: Colors.grey))
          : null,
    );
  }
}

class UserInformationCard extends StatelessWidget {
  final String fullName;
  final String email;
  final String dateOfBirth;
  final String address;

  const UserInformationCard({
    Key? key,
    required this.fullName,
    required this.email,
    required this.dateOfBirth,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Full Name: $fullName',
                style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 10),
            Text('Email: $email', style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 10),
            Text('Date of Birth: $dateOfBirth',
                style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 10),
            Text('Address: $address',
                style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
