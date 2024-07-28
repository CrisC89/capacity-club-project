import 'package:capacity_club_mobile_app/domain-features/application/pages/test-page/test_page.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/test-page/widget/profile_form.dart';
import 'package:capacity_club_mobile_app/core/config/theme/constant_size.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/test-page/widget/text_string.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/test-page/widget/user_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UpdateProfileScreen extends StatelessWidget {
  UpdateProfileScreen({Key? key}) : super(key: key);

  final ProfileController controller = ProfileController();

  Future<UserModel> getUserData() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate a network call
    return UserModel(
      email: 'example@example.com',
      password: 'password123',
      fullName: 'John Doe',
      phoneNo: '1234567890',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(FontAwesomeIcons.angleLeft),
        ),
        title: Text(tEditProfile,
            style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSpace),

          /// -- Future Builder to load cloud data
          child: FutureBuilder<UserModel>(
            future: getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel user = snapshot.data!;

                  // Controllers
                  final email = TextEditingController(text: user.email);
                  final password = TextEditingController(text: user.password);
                  final fullName = TextEditingController(text: user.fullName);
                  final phoneNo = TextEditingController(text: user.phoneNo);

                  // Image & Form
                  return Column(
                    children: [
                      /// -- IMAGE with ICON
                      ImageWithIcon(),
                      const SizedBox(height: 50),

                      /// -- Form (Get data and pass it to FormScreen)
                      ProfileFormScreen(
                        fullName: fullName,
                        email: email,
                        phoneNo: phoneNo,
                        password: password,
                        user: user,
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return const Center(child: Text('Something went wrong'));
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}

// Dummy Controller class
class ProfileController {
  Future<UserModel> getUserData() {
    return Future.value(UserModel(
      email: 'example@example.com',
      password: 'password123',
      fullName: 'John Doe',
      phoneNo: '1234567890',
    ));
  }
}
