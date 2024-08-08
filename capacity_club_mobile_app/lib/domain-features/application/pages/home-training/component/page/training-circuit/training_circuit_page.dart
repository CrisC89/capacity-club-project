import 'package:capacity_club_mobile_app/core/config/theme/theme.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home-training/component/page/training-circuit/bloc/training_circuit_bloc.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home-training/component/page/training-circuit/view-state/training_circuit_ending_view.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home-training/component/page/training-circuit/view-state/training_circuit_error_view.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home-training/component/page/training-circuit/view-state/training_circuit_loaded_view.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home-training/component/page/training-circuit/view-state/training_circuit_loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrainingCircuitPageProvider extends StatelessWidget {
  const TrainingCircuitPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrainingCircuitBloc()..add(LoadTrainingCircuits()),
      child: TrainingCircuitPage(),
    );
  }
}

class TrainingCircuitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocBuilder<TrainingCircuitBloc, TrainingCircuitState>(
        builder: (context, state) {
          if (state is TrainingCircuitLoading) {
            return TrainingCircuitLoadingView();
          } else if (state is TrainingCircuitLoaded) {
            return TrainingCircuitLoadedView(circuit: state.currentCircuit);
          } else if (state is TrainingCircuitError) {
            return TrainingCircuitErrorView();
          } else if (state is TrainingCircuitEnding) {
            return TrainingCircuitEndingView();
          }
          return Center(child: Text('Please wait...'));
        },
      ),
    );
  }
}
