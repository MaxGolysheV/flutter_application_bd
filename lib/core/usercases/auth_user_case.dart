import 'package:dartz/dartz.dart';
import 'package:flutter_application_bd/domain/entity/role_entity.dart';

abstract class AuthUserCase<Type, Params> {
  Future<Either<Type, RoleEnum>> signIn(Params params);
  Future<Either<Type, bool>> signUp(Params params);
}