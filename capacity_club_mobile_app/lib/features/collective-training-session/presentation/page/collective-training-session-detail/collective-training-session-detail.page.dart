import 'package:capacity_club_mobile_app/features/collective-training-session/domain/repository/collective-training-session.repository.dart';
import 'package:capacity_club_mobile_app/features/collective-training-session/domain/usecase/collective-training-session-by-id.usecase.dart';
import 'package:capacity_club_mobile_app/features/collective-training-session/presentation/page/collective-training-session-detail/bloc/collective_training_session_detail_bloc.dart';
import 'package:capacity_club_mobile_app/features/collective-training-session/presentation/page/collective-training-session-detail/view-states/collective-training-session-detail-error.view.dart';
import 'package:capacity_club_mobile_app/features/collective-training-session/presentation/page/collective-training-session-detail/view-states/collective-training-session-detail-loaded.view.dart';
import 'package:capacity_club_mobile_app/features/collective-training-session/presentation/page/collective-training-session-detail/view-states/collective-training-session-detail-loading.view.dart';
import 'package:capacity_club_mobile_app/features/core/contract/page_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CollectiveTrainingSessionDetailProvider extends StatelessWidget {
  const CollectiveTrainingSessionDetailProvider(
      {super.key, required this.collective_id});

  final String collective_id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CollectiveTrainingSessionDetailBloc(
          collectiveById: CollectiveTrainingSessionById(
              repository:
                  RepositoryProvider.of<CollectiveTrainingSessionRepository>(
                      context)),
          collective_id: collective_id),
      child: CollectiveTrainingSessionDetail(id: collective_id),
    );
  }
}

class CollectiveTrainingSessionDetail extends StatelessWidget {
  const CollectiveTrainingSessionDetail({super.key, required this.id});

  final String id;

  static const pageConfig = PageConfig(
      icon: FontAwesomeIcons.lightHouse,
      name: 'collective-training-session-detail',
      child: Placeholder());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<CollectiveTrainingSessionDetailBloc>(context).add(
          CollectiveTrainingSessionDetailRequestedEvent(collective_id: id));
    });
    return SingleChildScrollView(child: BlocBuilder<
        CollectiveTrainingSessionDetailBloc,
        CollectiveTrainingSessionDetailState>(
      builder: (context, state) {
        if (state is CollectiveTrainingSessionDetailStateLoading) {
          return const CollectiveTrainingSessionDetailLoadingView();
        } else if (state is CollectiveTrainingSessionDetailStateLoaded) {
          return CollectiveTrainingSessionDetailLoadedView(
              session: state.session);
        } else {
          return const CollectiveTrainingSessionDetailErrorView();
        }
      },
    ));
  }
}
