import 'package:dartz/dartz.dart';
import 'package:flutter_application_bd/core/exception/failure.dart';
import 'package:flutter_application_bd/domain/entity/role_entity.dart';
import 'package:flutter_application_bd/domain/entity/user_entity.dart';

abstract class UserRepositories {
  String get table;

  Future<List<UserEntity>> getAll();
  Future<Either<Failure, UserEntity>> insert(
    String login,
    String password,
    RoleEnum idRole,
  );
  Future<Either<Failure, bool>> delete(int id);
}