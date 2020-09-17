import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:withyou/model/Info.dart';

class WYDatabase {
  static Database database;
  static String databasePath;

  static void init() async {
    databasePath = await getDatabasesPath();
  }

  static Future<void> open() async {
    database = await openDatabase(
      join(await getDatabasesPath(), "Info.db"),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            "CREATE TABLE IF NOT EXISTS Info (MyPicture TEXT, PartnerPicture Text, StartingDate DateTime)");
        await db.execute(
            "CREATE TABLE IF NOT EXISTS Event(Year TEXT NOT NULL, Month TEXT NOT NULL, MonthDisplay Text NOT NULL, Description TEXT NOT NULL,DateOfMonth TEXT NOT NULL, Date DateTime default CURRENT_TIMESTAMP, PRIMARY KEY (Year, Month, Date, Description))");
      },
    );
  }

  static Future<void> close() async {
    await database.close();
  }

  static bool isOpen() {
    return database == null ? false : database.isOpen;
  }

  static Future<int> update() async {
    return 0;
  }

  static Future<Info> getInfo() async {
    List<Map<String, dynamic>> result = await database?.query("Info",
        columns: ["MyPicture", "PartnerPicture", "StartingDate"]);
    return result.isNotEmpty
        ? Info(
            myPicture: result.first['MyPicture'],
            partnerPicture: result.first['PartnerPicture'],
            startingDate: result.first['StartingDate'])
        : null;
  }

  static Future<int> insertProfile(Info info) async {
    await database?.update("Info", info.toMap());
    return 0;
  }

  static Future<int> deleteProfile() async {
    return 0;
  }

  static Future<int> updateProfile(Info info) async {
    return 0;
  }

  static Future<int> deleteEvent() async {
    return 0;
  }

  static Future<int> insertEvent() async {
    return 0;
  }

  static Future<int> updateEvent() async {
    return 0;
  }
}
