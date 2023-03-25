// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_mark_db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorBookMarkDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$BookMarkDatabaseBuilder databaseBuilder(String name) =>
      _$BookMarkDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$BookMarkDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$BookMarkDatabaseBuilder(null);
}

class _$BookMarkDatabaseBuilder {
  _$BookMarkDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$BookMarkDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$BookMarkDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<BookMarkDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$BookMarkDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$BookMarkDatabase extends BookMarkDatabase {
  _$BookMarkDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  BookMarkDbDao? _daoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `CityEntity` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `cityName` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  BookMarkDbDao get dao {
    return _daoInstance ??= _$BookMarkDbDao(database, changeListener);
  }
}

class _$BookMarkDbDao extends BookMarkDbDao {
  _$BookMarkDbDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _cityEntityInsertionAdapter = InsertionAdapter(
            database,
            'CityEntity',
            (CityEntity item) =>
                <String, Object?>{'id': item.id, 'cityName': item.cityName});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CityEntity> _cityEntityInsertionAdapter;

  @override
  Future<List<CityEntity>> getAll() async {
    return _queryAdapter.queryList('SELECT * FROM CityEntity',
        mapper: (Map<String, Object?> row) =>
            CityEntity(row['cityName'] as String));
  }

  @override
  Future<CityEntity?> selectByName(String name) async {
    return _queryAdapter.query('SELECT * FROM CityEntity WHERE cityName = ?1',
        mapper: (Map<String, Object?> row) =>
            CityEntity(row['cityName'] as String),
        arguments: [name]);
  }

  @override
  Future<void> deleteCityByName(String name) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM CityEntity WHERE cityName = ?1',
        arguments: [name]);
  }

  @override
  Future<void> insertNewCity(CityEntity cityEntity) async {
    await _cityEntityInsertionAdapter.insert(
        cityEntity, OnConflictStrategy.abort);
  }
}
