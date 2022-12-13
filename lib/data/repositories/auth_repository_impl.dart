import 'package:dartz/dartz.dart';
import 'package:flutter_application_bd/common/data_base_request.dart';
import 'package:flutter_application_bd/core/crypto/crypto.dart';
import 'package:flutter_application_bd/core/db/data_base_helper.dart';
import 'package:flutter_application_bd/core/exception/failure.dart';
import 'package:flutter_application_bd/data/model/user.dart';
import 'package:flutter_application_bd/domain/entity/role_entity.dart';
import 'package:flutter_application_bd/domain/repositories/auth_repositories.dart';
import 'package:sqflite/sqflite.dart';

class AuthRepositoryImlp implements AuthRepositories {
  final _db = DataBaseHelper.instance.database;

  @override
  String get table => DataBaseRequest.tableUsers;

  @override
  Future<Either<Failure, RoleEnum>> signIn(
      String login, String password) async {
    try {
      var user = await _db.query(
        table,
        columns: ['login', 'password', 'id_role'],
        where: 'login = ?',
        whereArgs: [login],
      );
      if (user.isEmpty) {
        return Left(AuthUserEmptyFailure());
      }

      if (user.first['password'] != Crypto.crypto(password)) {
        return Left(AuthPasswordFailure());
      }

      return Right(RoleEnum.values[(user.first['id_role'] as int) - 1]);
    } on DatabaseException catch (e) {
      Left(FailureImpl(e.getResultCode()!));
    }
    return Left(DefaultFailure());
  }

  @override
  Future<Either<Failure, bool>> signUp(String login, String password) async {
    try {
      await _db.insert(
        table,
        User(
          login: login,
          password: password,
          idRole: RoleEnum.user,
        ).toMap(),
      );
      return const Right(true);
    } on DatabaseException catch (e) {
      return Left(FailureImpl(e.getResultCode()!).error);
    }
  }

}