import 'dart:math';

import 'package:capacity_club_mobile_app/core/utils/page_config.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home-training/bloc/home_training_page_bloc.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home-training/provider/home_training_page_provider.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home-training/view-state/home_training_page_error_view.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home-training/view-state/home_training_page_loaded_view.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home-training/view-state/home_training_page_loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TrainingSession {
  bool isCompleted;

  TrainingSession({required this.isCompleted});
}

class Week {
  final int weekNumber;
  final List<TrainingSession> sessions;

  Week({required this.weekNumber, required this.sessions});
}

class HomeTrainingPage extends StatefulWidget {
  const HomeTrainingPage({super.key});
  static const pageConfig = PageConfig(
      icon: FontAwesomeIcons.dumbbell,
      name: 'training',
      child: HomeTrainingPageProvider());
  @override
  _HomeTrainingPageState createState() => _HomeTrainingPageState();
}

class _HomeTrainingPageState extends State<HomeTrainingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: BlocBuilder<HomeTrainingPageBloc, HomeTrainingPageState>(
      builder: (context, state) {
        if (state is HomeTrainingPageLoadingState) {
          return HomeTrainingPageLoadingView();
        } else if (state is HomeTrainingPageLoadedState) {
          return HomeTrainingPageLoadedView();
        } else if (state is HomeTrainingPageErrorState) {
          return HomeTrainingPageErrorView();
        }
        return HomeTrainingPageLoadingView();
      },
    ));
  }
}
