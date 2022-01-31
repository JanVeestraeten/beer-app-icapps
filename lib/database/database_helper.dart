import 'dart:io';
import 'dart:isolate';
import 'package:beer_app_icapps/database/database.dart';
import 'package:drift/native.dart';
import 'package:drift/isolate.dart';
import 'package:drift/drift.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

Future<DriftIsolate> createMoorIsolate() async {
  final dir = await getApplicationDocumentsDirectory();
  final path = p.join(dir.path, 'db.sqlite');
  final receivePort = ReceivePort();

  await Isolate.spawn(
    _startBackground,
    _IsolateStartRequest(receivePort.sendPort, path),
  );

  return (await receivePort.first as DriftIsolate);
}

void _startBackground(_IsolateStartRequest request) {
  final executor =
      NativeDatabase(File(request.targetPath), logStatements: true);
  final moorIsolate = DriftIsolate.inCurrent(
    () => DatabaseConnection.fromExecutor(executor),
  );

  request.sendMoorIsolate.send(moorIsolate);
}

class _IsolateStartRequest {
  final SendPort sendMoorIsolate;
  final String targetPath;

  _IsolateStartRequest(this.sendMoorIsolate, this.targetPath);
}

Future<AppDatabase> initDatabase() async {
  DriftIsolate isolate = await createMoorIsolate();
  DatabaseConnection connection = await isolate.connect();

  return AppDatabase.connect(connection);
}
