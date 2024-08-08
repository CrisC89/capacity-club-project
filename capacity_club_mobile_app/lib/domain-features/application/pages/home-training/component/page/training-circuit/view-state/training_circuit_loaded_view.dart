import 'package:capacity_club_mobile_app/core/config/theme/theme.dart';
import 'package:capacity_club_mobile_app/core/config/theme/theme_color.dart';
import 'package:capacity_club_mobile_app/core/widgets/app_logo_widget.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home-training/component/page/custom_text_button_widget.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home-training/component/page/training-circuit/bloc/training_circuit_bloc.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/training-circuit/entity/training_circuit_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrainingCircuitLoadedView extends StatelessWidget {
  TrainingCircuitLoadedView({super.key, required this.circuit});
  final TrainingCircuitEntity circuit;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: appLogo(context),
                ),
                SizedBox(height: 32),
                Center(
                  child: Text(
                    circuit.title,
                    style: AppTheme.titleTextStyle,
                  ),
                ),
                SizedBox(height: 32),
                ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: circuit.exercise_training_list.map((exercise) {
                    return ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            exercise.exercise_data.title,
                            style: AppTheme.subTitleTextStyle,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 4),
                          Text(
                            '${exercise.nb_reps} reps - ${exercise.intensity} intensity',
                            style: AppTheme.subTitleItalicTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: ThemeColor.mainColor,
                ),
                child: TextButton(
                    onPressed: () {
                      context.read<TrainingCircuitBloc>().add(NextCircuit());
                    },
                    child: Text('Start Circuit',
                        style: AppTheme.whiteTypeMedium14,
                        textAlign: TextAlign.center)))),
      ],
    );
  }
}
