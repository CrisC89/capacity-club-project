import 'package:capacity_club_mobile_app/core/model/extension/json_map_extension.dart';

class MemberCardFilter {
  final int? collective_session_count;
  final int? individual_session_count;

  const MemberCardFilter({
    this.collective_session_count,
    this.individual_session_count,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json.addIfNotNull('collective_session_count', collective_session_count);
    json.addIfNotNull('individual_session_count', individual_session_count);

    return json;
  }
}
