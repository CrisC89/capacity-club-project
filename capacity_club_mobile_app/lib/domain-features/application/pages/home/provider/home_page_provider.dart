import 'package:capacity_club_mobile_app/core/utils/dependency_injection.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home/bloc/home_page_bloc.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageProvider extends StatelessWidget {
  const HomePageProvider();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            serviceLocator<HomePageBloc>()..add(HomePageInitEvent()),
        child: HomePage());
  }
}
