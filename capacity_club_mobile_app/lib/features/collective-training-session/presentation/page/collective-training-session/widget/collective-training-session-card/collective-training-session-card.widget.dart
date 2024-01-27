import 'package:capacity_club_mobile_app/features/collective-training-session/presentation/page/collective-training-session-detail/collective-training-session-detail.page.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:capacity_club_mobile_app/features/collective-training-session/domain/entity/collective-training-session.entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CollectiveTrainingSessionCard extends StatelessWidget {
  final CollectiveTrainingSession session;

  const CollectiveTrainingSessionCard({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        elevation: 2,
        margin: const EdgeInsets.fromLTRB(5, 2, 5, 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: ListTile(
              leading: Image.asset(
                'assets/img/icon_logo_black-remove-bg.png',
                width: 85,
              ),
              title: Text(session.title),
              subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      const Icon(FontAwesomeIcons.clock, size: 15),
                      const SizedBox(width: 5),
                      Text('${session.start_hours}-${session.end_hours}',
                          style: const TextStyle(fontSize: 12))
                    ]),
                    Row(children: [
                      const Icon(FontAwesomeIcons.user, size: 15),
                      const SizedBox(width: 5),
                      Text('${session.nb_subscription}/${session.nb_place}',
                          style: const TextStyle(fontSize: 12))
                    ])
                  ]),
              onTap: () {
                if (Breakpoints.small.isActive(context)) {
                  context.pushNamed(
                    CollectiveTrainingSessionDetail.pageConfig.name,
                    pathParameters: {
                      'collectionId': session.collective_training_session_id
                    },
                  );
                }
              }),
        ));
  }
}
