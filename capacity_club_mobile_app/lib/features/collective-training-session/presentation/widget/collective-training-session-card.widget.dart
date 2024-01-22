import 'package:capacity_club_mobile_app/features/core/widget/title/card-title.widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:capacity_club_mobile_app/features/collective-training-session/domain/entity/collective-training-session.entity.dart';
import 'package:flutter/material.dart';

class CollectiveTrainingSessionCard extends StatelessWidget {
  final CollectiveTrainingSession session;

  const CollectiveTrainingSessionCard({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        margin: const EdgeInsets.all(2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(children: [
                  Center(
                    child: Image.asset(
                      'assets/img/icon_logo_black-remove-bg.png',
                      width: 85,
                    ),
                  )
                ]),
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      cardTitle(session.title, context),
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          const Icon(FontAwesomeIcons.clock, size: 15),
                          const SizedBox(width: 5),
                          Text('${session.start_hours}-${session.end_hours}',
                              style: const TextStyle(fontSize: 12))
                        ],
                      )
                    ]),
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 45),
                      Row(children: [
                        const Icon(FontAwesomeIcons.user, size: 15),
                        const SizedBox(width: 5),
                        Text('${session.nb_subscription}/${session.nb_place}',
                            style: const TextStyle(fontSize: 12))
                      ])
                    ]),
              ],
            )));
  }
}
