import 'package:capacity_club_mobile_app/features/collective-training-session/domain/entity/collective-training-session.entity.dart';
import 'package:capacity_club_mobile_app/features/collective-training-session/presentation/page/home/widget/collective-training-session-card/collective-training-session-card.widget.dart';
import 'package:flutter/material.dart';

class CollectiveTrainingSessionLoadedView extends StatelessWidget {
  const CollectiveTrainingSessionLoadedView(
      {super.key, required this.sessions});

  final List<CollectiveTrainingSession> sessions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sessions.length,
      itemBuilder: (context, index) {
        return CollectiveTrainingSessionCard(session: sessions[index]);
      },
    );
  }
}
