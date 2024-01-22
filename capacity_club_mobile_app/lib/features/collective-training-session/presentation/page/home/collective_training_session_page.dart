import 'package:capacity_club_mobile_app/features/collective-training-session/domain/repository/collective-training-session.repository.dart';
import 'package:capacity_club_mobile_app/features/collective-training-session/domain/usecase/read-all-collective-training-session.dart';
import 'package:capacity_club_mobile_app/features/collective-training-session/presentation/page/home/bloc/bloc/collective_training_session_bloc.dart';
import 'package:capacity_club_mobile_app/features/collective-training-session/presentation/page/home/view-states/collective-training-session-error.view.dart';
import 'package:capacity_club_mobile_app/features/collective-training-session/presentation/page/home/view-states/collective-training-session-loaded.view.dart';
import 'package:capacity_club_mobile_app/features/collective-training-session/presentation/page/home/view-states/collective-training-session-loading.view.dart';
import 'package:capacity_club_mobile_app/features/core/model/page_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CollectiveTrainingSessionPageProvider extends StatelessWidget {
  const CollectiveTrainingSessionPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CollectiveTrainingSessionBloc(
          readAllCollectiveTrainingSession: ReadAllCollectiveTrainingSession(
              repository:
                  RepositoryProvider.of<CollectiveTrainingSessionRepository>(
                      context))),
      child: const CollectiveTrainingSessionPage(),
    );
  }
}

class CollectiveTrainingSessionPage extends StatelessWidget {
  const CollectiveTrainingSessionPage({super.key});

  static const pageConfig = PageConfig(
      icon: FontAwesomeIcons.lightHouse,
      name: 'home',
      child: CollectiveTrainingSessionPageProvider());
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<CollectiveTrainingSessionBloc>(context)
          .add(CollectiveTrainingSessionRequestedEvent());
    });
    return Container(
      child: BlocBuilder<CollectiveTrainingSessionBloc,
          CollectiveTrainingSessionState>(builder: (context, state) {
        if (state is CollectiveTrainingSessionStateLoading) {
          return const CollectiveTrainingSessionLoadingView();
        } else if (state is CollectiveTrainingSessionStateLoaded) {
          return CollectiveTrainingSessionLoadedView(sessions: state.sessions);
        } else {
          return const CollectiveTrainingSessionErrorView();
        }
      }),
    );
  }
}