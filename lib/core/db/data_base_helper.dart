import 'dart:io';
//import 'package:flutter/rendering.dart';
import 'package:flutter_application_bd/common/data_base_request.dart';
import 'package:flutter_application_bd/data/model/role.dart';
import 'package:flutter_application_bd/domain/entity/role_entity.dart';
//import 'package:flutter_application_bd/domain/entity/user_entity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart';
//import 'package:sqflite/utils/utils.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../data/model/user.dart';

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._instance();
  DataBaseHelper._instance();

  final int _version = 2; //приватная переменная
  late final String _pathDB; //инициализируется в методе инит
  late final Directory _appDocumentDirectory;
  late final Database database;

  Future<void> init() async {
    _appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory(); //доступ к бд
    _pathDB = join(_appDocumentDirectory.path,
        'FLUTTER_SQL/test.db'); //путь хранения файла бд

    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      sqfliteFfiInit();
      database = await databaseFactory.openDatabase(_pathDB,
          options: OpenDatabaseOptions(
            version: _version,
            onUpgrade: (db, oldVersion, newVersion) => onUpdateTable(db),
            onCreate: (db, version) => onCreateTable(db),
          ));
    } else {
      // для телефонов
      // openDatabase(_pathDB, version: _version, onCreate: (db, _version) {});

      database = await openDatabase // ТУТ БЫЛА ОШИБКА
          (
        _pathDB,
        version: _version,
        onUpgrade: (db, oldVersion, newVersion) => onUpdateTable(db),
        onCreate: (db, version) => onCreateTable(db),
      );
    }
  }

  Future<void> onUpdateTable(Database db) async {
    var tables = await db.rawQuery('SELECT name FROM sqlite_master');
    //получение списка таблиц
    for (var table in DataBaseRequest.tableList.reversed) {
      if (tables.where((element) => element['name'] == table).isNotEmpty) {
        await db.execute(DataBaseRequest.deleteTable(table));
      }
    }
    await onCreateTable(db);
  }

  Future<void> onCreateTable(Database db) async {
    for (var tableCreate in DataBaseRequest.tableCreateList) {
      await db.execute(tableCreate);
    }

    onInitTable(db);
  }

  Future<void> onDropDatabase() async {
    await database.close();
    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      databaseFactoryFfi.deleteDatabase(_pathDB);
    } else {
      //для телефонов
      deleteDatabase(_pathDB);
    }
  }

  Future<void> onInitTable(Database db) async //инициализация таблиц
  {
    try {
      for (var element in RoleEnum.values) {
        db.insert(DataBaseRequest.tableRole, Role(role: element.name).toMap());
      }

      db.insert(
        DataBaseRequest.tableUsers,
        User(
          login: 'admin',
          idRole: RoleEnum.admin,
          password: 'admin123',
        ).toMap(),
      );
    } on DatabaseException catch (error) {
      print(error);
    }
  }
}
