import 'package:capacity_club_mobile_app/features/core/model/page_config.dart';
import 'package:capacity_club_mobile_app/features/user/domain/usecase/me.dart';
import 'package:capacity_club_mobile_app/features/user/presentation/page/user/bloc/user_bloc.dart';
import 'package:capacity_club_mobile_app/features/user/presentation/page/user/view_state/user-error.view.dart';
import 'package:capacity_club_mobile_app/features/user/presentation/page/user/view_state/user-loaded.view.dart';
import 'package:capacity_club_mobile_app/features/user/presentation/page/user/view_state/user-loading.view.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPageProvider extends StatelessWidget {
  const UserPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserBloc(repository: Me(repository: RepositoryProvider.of(context))),
      child: const UserPage(),
    );
  }
}

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  static const pageConfig = PageConfig(
      icon: FontAwesomeIcons.user, name: 'user', child: UserPageProvider());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<UserBloc>(context).add(UserRequestedEvent());
    });
    return Container(
      child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        if (state is UserStateLoading) {
          return const UserLoadingView();
        } else if (state is UserStateLoaded) {
          return UserLoadedView(member: state.user);
        } else {
          return const UserErrorView();
        }
      }),
    );
  }
}
