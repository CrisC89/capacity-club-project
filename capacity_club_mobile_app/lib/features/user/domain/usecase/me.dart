import 'package:capacity_club_mobile_app/core/contract/usecase.dart';
import 'package:capacity_club_mobile_app/core/model/failure.dart';
import 'package:capacity_club_mobile_app/features/user/domain/entity/member.entity.dart';
import 'package:capacity_club_mobile_app/features/user/domain/repository/member.repository.dart';
import 'package:either_dart/either.dart';

class GetUser implements UseCase<Member, NoParams> {
  final MemberRepository repository;

  const GetUser({required this.repository});

  @override
  Future<Either<Failure, Member>> call(NoParams params) async {
    try {
      final member = repository.me();
      return member.fold(
        (left) => Left(left),
        (right) => Right(right),
      );
    } on Exception catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}
