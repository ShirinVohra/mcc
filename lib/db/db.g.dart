// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class User extends DataClass implements Insertable<User> {
  final String name;
  final String emailId;
  final String password;
  final String dob;
  User(
      {required this.name,
      required this.emailId,
      required this.password,
      required this.dob});
  factory User.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return User(
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      emailId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email_id'])!,
      password: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}password'])!,
      dob: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dob'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    map['email_id'] = Variable<String>(emailId);
    map['password'] = Variable<String>(password);
    map['dob'] = Variable<String>(dob);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      name: Value(name),
      emailId: Value(emailId),
      password: Value(password),
      dob: Value(dob),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return User(
      name: serializer.fromJson<String>(json['name']),
      emailId: serializer.fromJson<String>(json['emailId']),
      password: serializer.fromJson<String>(json['password']),
      dob: serializer.fromJson<String>(json['dob']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'emailId': serializer.toJson<String>(emailId),
      'password': serializer.toJson<String>(password),
      'dob': serializer.toJson<String>(dob),
    };
  }

  User copyWith(
          {String? name, String? emailId, String? password, String? dob}) =>
      User(
        name: name ?? this.name,
        emailId: emailId ?? this.emailId,
        password: password ?? this.password,
        dob: dob ?? this.dob,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('name: $name, ')
          ..write('emailId: $emailId, ')
          ..write('password: $password, ')
          ..write('dob: $dob')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(name.hashCode,
      $mrjc(emailId.hashCode, $mrjc(password.hashCode, dob.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.name == this.name &&
          other.emailId == this.emailId &&
          other.password == this.password &&
          other.dob == this.dob);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> name;
  final Value<String> emailId;
  final Value<String> password;
  final Value<String> dob;
  const UsersCompanion({
    this.name = const Value.absent(),
    this.emailId = const Value.absent(),
    this.password = const Value.absent(),
    this.dob = const Value.absent(),
  });
  UsersCompanion.insert({
    required String name,
    required String emailId,
    required String password,
    required String dob,
  })  : name = Value(name),
        emailId = Value(emailId),
        password = Value(password),
        dob = Value(dob);
  static Insertable<User> custom({
    Expression<String>? name,
    Expression<String>? emailId,
    Expression<String>? password,
    Expression<String>? dob,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (emailId != null) 'email_id': emailId,
      if (password != null) 'password': password,
      if (dob != null) 'dob': dob,
    });
  }

  UsersCompanion copyWith(
      {Value<String>? name,
      Value<String>? emailId,
      Value<String>? password,
      Value<String>? dob}) {
    return UsersCompanion(
      name: name ?? this.name,
      emailId: emailId ?? this.emailId,
      password: password ?? this.password,
      dob: dob ?? this.dob,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (emailId.present) {
      map['email_id'] = Variable<String>(emailId.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (dob.present) {
      map['dob'] = Variable<String>(dob.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('name: $name, ')
          ..write('emailId: $emailId, ')
          ..write('password: $password, ')
          ..write('dob: $dob')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  final GeneratedDatabase _db;
  final String? _alias;
  $UsersTable(this._db, [this._alias]);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _emailIdMeta = const VerificationMeta('emailId');
  late final GeneratedColumn<String?> emailId = GeneratedColumn<String?>(
      'email_id', aliasedName, false,
      typeName: 'TEXT',
      requiredDuringInsert: true,
      $customConstraints: 'UNIQUE');
  final VerificationMeta _passwordMeta = const VerificationMeta('password');
  late final GeneratedColumn<String?> password = GeneratedColumn<String?>(
      'password', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _dobMeta = const VerificationMeta('dob');
  late final GeneratedColumn<String?> dob = GeneratedColumn<String?>(
      'dob', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [name, emailId, password, dob];
  @override
  String get aliasedName => _alias ?? 'users';
  @override
  String get actualTableName => 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email_id')) {
      context.handle(_emailIdMeta,
          emailId.isAcceptableOrUnknown(data['email_id']!, _emailIdMeta));
    } else if (isInserting) {
      context.missing(_emailIdMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('dob')) {
      context.handle(
          _dobMeta, dob.isAcceptableOrUnknown(data['dob']!, _dobMeta));
    } else if (isInserting) {
      context.missing(_dobMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    return User.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $UsersTable users = $UsersTable(this);
  late final UserDao userDao = UserDao(this as MyDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [users];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$UserDaoMixin on DatabaseAccessor<MyDatabase> {
  $UsersTable get users => attachedDatabase.users;
}
