import 'package:capacity_club_mobile_app/domain-features/application/pages/home-training/bloc/home_training_page_bloc.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home-training/home_training_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTrainingPageProvider extends StatelessWidget {
  const HomeTrainingPageProvider();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeTrainingPageBloc()..add(HomeTrainingPageInitEvent()),
      child: HomeTrainingPage(),
    );
  }
}
