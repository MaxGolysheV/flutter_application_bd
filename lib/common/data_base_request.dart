abstract class DataBaseRequest {
  static String select(String table) => 'Select * from $table';
  static const String tableRole = 'role'; //таблицы
  static const String tableUsers = 'user';

  static const String tableAge = 'age';
  static const String tableBrand = 'brand';
  static const String tableSex = 'sex';
  static const String tableType = 'type';
  static const String tableComponents = 'components';
  static const String tableAccessories = 'accessories';
  static const String tableBike = 'bike';

  static const List<String> tableList = [
    //важен порядок объявления талиц в списке!
    tableRole,
    tableUsers,
    tableAge,
    tableBrand,
    tableSex,
    tableType,
    tableComponents,
    tableAccessories,
    tableBike
  ];

  static const List<String> tableCreateList = [
    //важен порядок объявления талиц в списке!
    _createTableRole,
    _createTableUsers,
    _createTableAge,
    _createTableBrand,
    _createTableSex,
    _createTableType,
    _createTableComponents,
    _createTableAccessories,
    _createTableBike
  ];

  /// Запрос для создания таблицы Role
  static const String _createTableRole =
      'CREATE TABLE $tableRole ("id" INTEGER,"role" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Users
  static const String _createTableUsers =
      'CREATE TABLE "$tableUsers" ("id"	INTEGER,"login"	TEXT NOT NULL UNIQUE,"password"	TEXT NOT NULL,"id_role"	INTEGER,FOREIGN KEY("id_role") REFERENCES "Role"("id") ON DELETE CASCADE,PRIMARY KEY("id" AUTOINCREMENT) )';

  static const String _createTableAge =
      'CREATE TABLE "$tableAge" ("id" INTEGER,"age" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';
  static const String _createTableBrand =
      'CREATE TABLE "$tableBrand" ("id" INTEGER,"brand" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT)) ';
  static const String _createTableSex =
      'CREATE TABLE "$tableSex" ("id" INTEGER,"sex" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';
  static const String _createTableType =
      'CREATE TABLE "$tableType" ("id" INTEGER,"type" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';
  static const String _createTableComponents =
      'CREATE TABLE "$tableComponents" ("id"	INTEGER,"name"	TEXT NOT NULL UNIQUE,"price" FLOAT NOT NULL,"id_brand"	INTEGER,FOREIGN KEY("id_brand") REFERENCES "Brand"("id") ON DELETE CASCADE,PRIMARY KEY("id" AUTOINCREMENT) )';
  static const String _createTableAccessories =
      'CREATE TABLE "$tableAccessories" ("id"	INTEGER,"name"	TEXT NOT NULL UNIQUE,"price" FLOAT NOT NULL,"id_brand"	INTEGER,FOREIGN KEY("id_brand") REFERENCES "Brand"("id") ON DELETE CASCADE,PRIMARY KEY("id" AUTOINCREMENT) )';
  static const String _createTableBike =
      'CREATE TABLE "$tableBike" ("id"	INTEGER,"name"	TEXT NOT NULL UNIQUE,"price" FLOAT NOT NULL,"id_brand"	INTEGER,"id_type" INTEGER,"id_age" INTEGER, FOREIGN KEY("id_type") REFERENCES "Type"("id") ON DELETE CASCADE,FOREIGN KEY("id_age") REFERENCES "Age"("id") ON DELETE CASCADE,FOREIGN KEY("id_brand") REFERENCES "Brand"("id") ON DELETE CASCADE,  PRIMARY KEY("id" AUTOINCREMENT) )';

  static String deleteTable(String table) =>
      'DROP TABLE $table'; //удаление таблицы

}
