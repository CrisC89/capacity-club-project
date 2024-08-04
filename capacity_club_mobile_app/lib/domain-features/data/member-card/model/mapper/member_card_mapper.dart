import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-card/model/member_card_model.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/member-card/entity/member_card_entity.dart';

class MemberCardMapper {
  static MemberCardModel fromEntity(MemberCardEntity entity) {
    return MemberCardModel(
      member_card_id: entity.member_card_id,
      collective_session_count: entity.collective_session_count,
      individual_session_count: entity.individual_session_count,
    );
  }

  static MemberCardModel fromJson(Map<String, dynamic> json) {
    return MemberCardModel(
      member_card_id: json['member_card_id'] != null
          ? UniqueId(json['member_card_id'])
          : UniqueId(''),
      collective_session_count: json['collective_session_count'],
      individual_session_count: json['individual_session_count'],
    );
  }

  static MemberCardEntity toEntity(MemberCardModel model) {
    return MemberCardEntity(
        member_card_id: model.member_card_id,
        collective_session_count: model.collective_session_count,
        individual_session_count: model.individual_session_count,
        is_empty: false);
  }

  static Map<String, dynamic> toJson(MemberCardModel model) {
    return {
      'member_card_id': model.member_card_id,
      'collective_session_count': model.collective_session_count,
      'individual_session_count': model.individual_session_count,
    };
  }
}
