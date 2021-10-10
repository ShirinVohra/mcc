import 'dart:io';

import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:moor/ffi.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:path/path.dart' as p;

part 'db.g.dart';

class Users extends Table {
  TextColumn get name => text().named('name')();
  TextColumn get emailId =>
      text().named('email_id').customConstraint('UNIQUE')();
  TextColumn get password => text().named('password')();
  TextColumn get dob => text().named('dob')();
}

// LazyDatabase _openConnection() {
//   return LazyDatabase(() async {
//     final dbFolder = await getApplicationDocumentsDirectory();
//     final file = File(p.join(
//       dbFolder.path,
//       'db.sqlite',
//     ));
//     return VmDatabase(file, logStatements: true);
//   });
// }

@UseMoor(tables: [Users], daos: [UserDao])
class MyDatabase extends _$MyDatabase {
  MyDatabase()
      : super(((FlutterQueryExecutor.inDatabaseFolder(
          path: 'db.sqlite',
          // Good for debugging - prints SQL in the console
          logStatements: true,
        ))));

  @override
  int get schemaVersion => 1;

  Future addUser(User entry) {
    return into(users).insert(entry);
  }
}

@UseDao(tables: [Users])
class UserDao extends DatabaseAccessor<MyDatabase> with _$UserDaoMixin {
  final MyDatabase db;

  UserDao(this.db) : super(db);

  Future<String> checkUser(String email, String password) async {
    var uMail = await (select(users)
          ..where(
              (ci) => ci.emailId.equals(email) & ci.password.equals(password)))
        .getSingle()
        .then((value) => value.emailId);

    return uMail;
  }
}
