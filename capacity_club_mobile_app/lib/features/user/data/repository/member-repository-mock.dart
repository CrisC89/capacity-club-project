import 'package:capacity_club_mobile_app/core/model/failure.dart';
import 'package:capacity_club_mobile_app/features/user/domain/entity/member.entity.dart';
import 'package:capacity_club_mobile_app/features/user/domain/repository/member.repository.dart';
import 'package:either_dart/src/either.dart';

class MemberRepositoryMock implements MemberRepository {
  @override
  Future<Either<Failure, Member>> me() {
    final member = Member(
        member_id: '1',
        firstname: 'Cristina',
        lastname: 'CAVALERI',
        birthdate: DateTime.now(),
        gender: 'F',
        mail: 'cristina.cavaleri@domain.com',
        phone: '0725654872',
        iban: "BE000000000",
        code_activation: 'Empty',
        subscriptions: 'Empty',
        address: 'Empty',
        active: true);

    return Future.delayed(
      const Duration(milliseconds: 200),
      () => Right(member),
    );
  }
}
