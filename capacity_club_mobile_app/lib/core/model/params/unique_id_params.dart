import 'package:capacity_club_mobile_app/core/model/abstract/params.dart';
import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';

class UniqueIdParams extends Params {
  UniqueIdParams({
    required this.unique_id,
  }) : super();

  final UniqueId unique_id;

  @override
  List<Object> get props => [unique_id];
}
