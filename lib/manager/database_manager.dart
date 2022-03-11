
import 'package:flutter_project/model/launch.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class DatabaseManager {
  static const launchStore = "launch-store";
  static DatabaseManager instance = DatabaseManager._internal();

  factory DatabaseManager() => instance;

  late Database _db;

  final StoreRef<String, Map<String, dynamic>> _launchStore =
  stringMapStoreFactory.store(launchStore);

  DatabaseManager._internal();

  Future<void> init() async {
    String dataDirectoryPath = (await getApplicationDocumentsDirectory()).path;
    _db = await databaseFactoryIo
        .openDatabase("$dataDirectoryPath/launch_spacex.db");
  }

  Future<void> toggleFavorite(bool isFavorite, Launch launch) =>
      isFavorite ? removeSpot(launch.id!) : insertSpot(launch);

  Future<void> insertSpot(Launch launch) async =>
      await _db.transaction((transaction) async =>
      await _launchStore.record(launch.id!).put(transaction, launch.toJson()));

  Future<void> removeSpot(String idLaunch) async =>
      await _launchStore.record(idLaunch).delete(_db);

  Future<bool> isFavorite(String idLaunch) async =>
      await _launchStore.record(idLaunch).exists(_db);

  Future<List<Launch>> getFavoriteLaunches() async =>
      await _launchStore.find(_db).then((records) =>
          records.map((record) => Launch.fromJson(record.value)).toList());
}
