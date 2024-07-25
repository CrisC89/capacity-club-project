import 'package:capacity_club_mobile_app/core/utils/page_config.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/user-profile/bloc/user_profile_page_bloc.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/user-profile/provider/user_profile_page_provider.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/user-profile/view-state/user_profile_page_error_view.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/user-profile/view-state/user_profile_page_loaded_view.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/user-profile/view-state/user_profile_page_loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  static const pageConfig = PageConfig(
      icon: FontAwesomeIcons.user,
      name: 'user',
      child: UserProfilePageProvider());

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: BlocBuilder<UserProfilePageBloc, UserProfilePageState>(
      builder: (context, state) {
        if (state is UserProfilePageLoadingState) {
          return UserProfilePageLoadingView();
        } else if (state is UserProfilePageLoadedState) {
          return UserProfilePageLoadedView();
        } else if (state is UserProfilePageErrorState) {
          return UserProfilePageErrorView();
        }
        return UserProfilePageLoadingView();
      },
    ));
  }
}
