import 'package:capacity_club_mobile_app/domain-features/application/pages/user-profile/bloc/user_profile_page_bloc.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/user-profile/user_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfilePageProvider extends StatelessWidget {
  const UserProfilePageProvider();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            UserProfilePageBloc()..add(UserProfilePageInitEvent()),
        child: UserProfilePage());
  }
}
