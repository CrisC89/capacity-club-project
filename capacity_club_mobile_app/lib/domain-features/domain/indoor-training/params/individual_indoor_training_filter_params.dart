import 'package:capacity_club_mobile_app/core/model/abstract/params.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/model/filter/indoor_training_filter.dart';

class IndividualIndoorTrainingFilterParams extends Params {
  IndividualIndoorTrainingFilterParams({
    required DateTime training_date,
  }) : filter = IndoorTrainingFilter(
            training_date: training_date, is_collective: false);

  final IndoorTrainingFilter filter;

  @override
  List<Object> get props => [filter];
}
