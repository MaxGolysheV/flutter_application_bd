import 'package:dartz/dartz.dart';
import 'package:flutter_application_bd/core/exception/failure.dart';
import 'package:flutter_application_bd/data/model/role.dart';
import 'package:flutter_application_bd/domain/entity/role_entity.dart';

abstract class AuthRepositories {
  String get table;

  /// Метод для регистрации пользователя
  Future<Either<Failure, RoleEnum>> signIn(String login, String password);

  /// Метод для авторизации пользователя
  Future<Either<Failure, bool>> signUp(String login, String password);
}
