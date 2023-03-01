// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _deviceNameMeta =
      const VerificationMeta('deviceName');
  @override
  late final GeneratedColumn<String> deviceName = GeneratedColumn<String>(
      'device_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _rateMeta = const VerificationMeta('rate');
  @override
  late final GeneratedColumn<double> rate = GeneratedColumn<double>(
      'rate', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<String> price = GeneratedColumn<String>(
      'price', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _imgUrlMeta = const VerificationMeta('imgUrl');
  @override
  late final GeneratedColumn<String> imgUrl = GeneratedColumn<String>(
      'img_url', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, deviceName, rate, price, imgUrl];
  @override
  String get aliasedName => _alias ?? 'products';
  @override
  String get actualTableName => 'products';
  @override
  VerificationContext validateIntegrity(Insertable<Product> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('device_name')) {
      context.handle(
          _deviceNameMeta,
          deviceName.isAcceptableOrUnknown(
              data['device_name']!, _deviceNameMeta));
    } else if (isInserting) {
      context.missing(_deviceNameMeta);
    }
    if (data.containsKey('rate')) {
      context.handle(
          _rateMeta, rate.isAcceptableOrUnknown(data['rate']!, _rateMeta));
    } else if (isInserting) {
      context.missing(_rateMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('img_url')) {
      context.handle(_imgUrlMeta,
          imgUrl.isAcceptableOrUnknown(data['img_url']!, _imgUrlMeta));
    } else if (isInserting) {
      context.missing(_imgUrlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Product(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      deviceName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}device_name'])!,
      rate: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}rate'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}price'])!,
      imgUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}img_url'])!,
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
  final int id;
  final String deviceName;
  final double rate;
  final String price;
  final String imgUrl;
  const Product(
      {required this.id,
      required this.deviceName,
      required this.rate,
      required this.price,
      required this.imgUrl});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['device_name'] = Variable<String>(deviceName);
    map['rate'] = Variable<double>(rate);
    map['price'] = Variable<String>(price);
    map['img_url'] = Variable<String>(imgUrl);
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      deviceName: Value(deviceName),
      rate: Value(rate),
      price: Value(price),
      imgUrl: Value(imgUrl),
    );
  }

  factory Product.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      id: serializer.fromJson<int>(json['id']),
      deviceName: serializer.fromJson<String>(json['deviceName']),
      rate: serializer.fromJson<double>(json['rate']),
      price: serializer.fromJson<String>(json['price']),
      imgUrl: serializer.fromJson<String>(json['imgUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'deviceName': serializer.toJson<String>(deviceName),
      'rate': serializer.toJson<double>(rate),
      'price': serializer.toJson<String>(price),
      'imgUrl': serializer.toJson<String>(imgUrl),
    };
  }

  Product copyWith(
          {int? id,
          String? deviceName,
          double? rate,
          String? price,
          String? imgUrl}) =>
      Product(
        id: id ?? this.id,
        deviceName: deviceName ?? this.deviceName,
        rate: rate ?? this.rate,
        price: price ?? this.price,
        imgUrl: imgUrl ?? this.imgUrl,
      );
  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('id: $id, ')
          ..write('deviceName: $deviceName, ')
          ..write('rate: $rate, ')
          ..write('price: $price, ')
          ..write('imgUrl: $imgUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, deviceName, rate, price, imgUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.id == this.id &&
          other.deviceName == this.deviceName &&
          other.rate == this.rate &&
          other.price == this.price &&
          other.imgUrl == this.imgUrl);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<int> id;
  final Value<String> deviceName;
  final Value<double> rate;
  final Value<String> price;
  final Value<String> imgUrl;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.deviceName = const Value.absent(),
    this.rate = const Value.absent(),
    this.price = const Value.absent(),
    this.imgUrl = const Value.absent(),
  });
  ProductsCompanion.insert({
    this.id = const Value.absent(),
    required String deviceName,
    required double rate,
    required String price,
    required String imgUrl,
  })  : deviceName = Value(deviceName),
        rate = Value(rate),
        price = Value(price),
        imgUrl = Value(imgUrl);
  static Insertable<Product> custom({
    Expression<int>? id,
    Expression<String>? deviceName,
    Expression<double>? rate,
    Expression<String>? price,
    Expression<String>? imgUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (deviceName != null) 'device_name': deviceName,
      if (rate != null) 'rate': rate,
      if (price != null) 'price': price,
      if (imgUrl != null) 'img_url': imgUrl,
    });
  }

  ProductsCompanion copyWith(
      {Value<int>? id,
      Value<String>? deviceName,
      Value<double>? rate,
      Value<String>? price,
      Value<String>? imgUrl}) {
    return ProductsCompanion(
      id: id ?? this.id,
      deviceName: deviceName ?? this.deviceName,
      rate: rate ?? this.rate,
      price: price ?? this.price,
      imgUrl: imgUrl ?? this.imgUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (deviceName.present) {
      map['device_name'] = Variable<String>(deviceName.value);
    }
    if (rate.present) {
      map['rate'] = Variable<double>(rate.value);
    }
    if (price.present) {
      map['price'] = Variable<String>(price.value);
    }
    if (imgUrl.present) {
      map['img_url'] = Variable<String>(imgUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('deviceName: $deviceName, ')
          ..write('rate: $rate, ')
          ..write('price: $price, ')
          ..write('imgUrl: $imgUrl')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [email, password];
  @override
  String get aliasedName => _alias ?? 'users';
  @override
  String get actualTableName => 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {email};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final String email;
  final String password;
  const User({required this.email, required this.password});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['email'] = Variable<String>(email);
    map['password'] = Variable<String>(password);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      email: Value(email),
      password: Value(password),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      email: serializer.fromJson<String>(json['email']),
      password: serializer.fromJson<String>(json['password']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'email': serializer.toJson<String>(email),
      'password': serializer.toJson<String>(password),
    };
  }

  User copyWith({String? email, String? password}) => User(
        email: email ?? this.email,
        password: password ?? this.password,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('email: $email, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(email, password);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.email == this.email &&
          other.password == this.password);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> email;
  final Value<String> password;
  const UsersCompanion({
    this.email = const Value.absent(),
    this.password = const Value.absent(),
  });
  UsersCompanion.insert({
    required String email,
    required String password,
  })  : email = Value(email),
        password = Value(password);
  static Insertable<User> custom({
    Expression<String>? email,
    Expression<String>? password,
  }) {
    return RawValuesInsertable({
      if (email != null) 'email': email,
      if (password != null) 'password': password,
    });
  }

  UsersCompanion copyWith({Value<String>? email, Value<String>? password}) {
    return UsersCompanion(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('email: $email, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }
}

class $SessionsTable extends Sessions with TableInfo<$SessionsTable, Session> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _isLoggedInMeta =
      const VerificationMeta('isLoggedIn');
  @override
  late final GeneratedColumn<String> isLoggedIn = GeneratedColumn<String>(
      'is_logged_in', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _flagMeta = const VerificationMeta('flag');
  @override
  late final GeneratedColumn<bool> flag =
      GeneratedColumn<bool>('flag', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("flag" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns => [isLoggedIn, flag];
  @override
  String get aliasedName => _alias ?? 'sessions';
  @override
  String get actualTableName => 'sessions';
  @override
  VerificationContext validateIntegrity(Insertable<Session> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('is_logged_in')) {
      context.handle(
          _isLoggedInMeta,
          isLoggedIn.isAcceptableOrUnknown(
              data['is_logged_in']!, _isLoggedInMeta));
    } else if (isInserting) {
      context.missing(_isLoggedInMeta);
    }
    if (data.containsKey('flag')) {
      context.handle(
          _flagMeta, flag.isAcceptableOrUnknown(data['flag']!, _flagMeta));
    } else if (isInserting) {
      context.missing(_flagMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {isLoggedIn};
  @override
  Session map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Session(
      isLoggedIn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}is_logged_in'])!,
      flag: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}flag'])!,
    );
  }

  @override
  $SessionsTable createAlias(String alias) {
    return $SessionsTable(attachedDatabase, alias);
  }
}

class Session extends DataClass implements Insertable<Session> {
  final String isLoggedIn;
  final bool flag;
  const Session({required this.isLoggedIn, required this.flag});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['is_logged_in'] = Variable<String>(isLoggedIn);
    map['flag'] = Variable<bool>(flag);
    return map;
  }

  SessionsCompanion toCompanion(bool nullToAbsent) {
    return SessionsCompanion(
      isLoggedIn: Value(isLoggedIn),
      flag: Value(flag),
    );
  }

  factory Session.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Session(
      isLoggedIn: serializer.fromJson<String>(json['isLoggedIn']),
      flag: serializer.fromJson<bool>(json['flag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'isLoggedIn': serializer.toJson<String>(isLoggedIn),
      'flag': serializer.toJson<bool>(flag),
    };
  }

  Session copyWith({String? isLoggedIn, bool? flag}) => Session(
        isLoggedIn: isLoggedIn ?? this.isLoggedIn,
        flag: flag ?? this.flag,
      );
  @override
  String toString() {
    return (StringBuffer('Session(')
          ..write('isLoggedIn: $isLoggedIn, ')
          ..write('flag: $flag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(isLoggedIn, flag);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Session &&
          other.isLoggedIn == this.isLoggedIn &&
          other.flag == this.flag);
}

class SessionsCompanion extends UpdateCompanion<Session> {
  final Value<String> isLoggedIn;
  final Value<bool> flag;
  const SessionsCompanion({
    this.isLoggedIn = const Value.absent(),
    this.flag = const Value.absent(),
  });
  SessionsCompanion.insert({
    required String isLoggedIn,
    required bool flag,
  })  : isLoggedIn = Value(isLoggedIn),
        flag = Value(flag);
  static Insertable<Session> custom({
    Expression<String>? isLoggedIn,
    Expression<bool>? flag,
  }) {
    return RawValuesInsertable({
      if (isLoggedIn != null) 'is_logged_in': isLoggedIn,
      if (flag != null) 'flag': flag,
    });
  }

  SessionsCompanion copyWith({Value<String>? isLoggedIn, Value<bool>? flag}) {
    return SessionsCompanion(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      flag: flag ?? this.flag,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (isLoggedIn.present) {
      map['is_logged_in'] = Variable<String>(isLoggedIn.value);
    }
    if (flag.present) {
      map['flag'] = Variable<bool>(flag.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionsCompanion(')
          ..write('isLoggedIn: $isLoggedIn, ')
          ..write('flag: $flag')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $ProductsTable products = $ProductsTable(this);
  late final $UsersTable users = $UsersTable(this);
  late final $SessionsTable sessions = $SessionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [products, users, sessions];
}
