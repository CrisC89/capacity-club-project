import 'package:capacity_club_mobile_app/core/model/failure.dart';
import 'package:capacity_club_mobile_app/features/user/domain/entity/member.entity.dart';
import 'package:either_dart/either.dart';

abstract class MemberRepository {
  Future<Either<Failure, Member>> me();
}
