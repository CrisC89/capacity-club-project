import 'package:capacity_club_mobile_app/features/collective-training-session/domain/entity/collective-training-session.entity.dart';
import 'package:capacity_club_mobile_app/features/core/widget/button/simple-button.widget.dart';
import 'package:capacity_club_mobile_app/features/personnal-workout-planning/presentation/widget/training-circuit-expension-title.widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CollectiveTrainingSessionDetailLoadedView extends StatelessWidget {
  const CollectiveTrainingSessionDetailLoadedView(
      {super.key, required this.session});

  final CollectiveTrainingSession session;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(FontAwesomeIcons.clock, size: 20),
                      const SizedBox(width: 10),
                      Text(
                        '${session.start_hours}-${session.end_hours}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2),
                      ),
                    ]),
                Row(children: [
                  const Icon(FontAwesomeIcons.user, size: 20),
                  const SizedBox(width: 10),
                  Text(
                    '${session.nb_subscription}/${session.nb_place}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2),
                  ),
                ]),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              session.title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2),
            ),
            const SizedBox(height: 50),
            ...session.workout.training_circuits.map((training) =>
                TrainingCircuitExpansionTitle(training_circuit: training)),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: simpleButton('Registration', () => {}),
            ),
          ]),
        ),
      ),
    );
  }
}
