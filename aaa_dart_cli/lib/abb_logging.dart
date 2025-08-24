import "package:logging/logging.dart";

void configLogger() {
  // set the root logging level
  Logger.root.level = Level.ALL;

  // configure a listener for :event:record
  Logger.root.onRecord.listen((record) {
    if (record.stackTrace == null) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    } else {
      print(
        '${record.level.name}: ${record.time}: ${record.message} ${record.stackTrace}',
      );
    }
  });

  // optional -- listen for :event:levelChnaged
  Logger.root.onLevelChanged.listen((level) {
    print('The new log level is $level');
  });
}

void exerciseLoggerInfo() {
  final log = Logger('in :fn:exerciseLoggerInfo()');
  log.info("i am just and info message");

  log.info(() => "message in a closure -- delayed evaluation");
}

void exerciseLoggerSevere() {
  final log = Logger('in :fn:exerciseLoggerSevere()');
  try {
    throw Exception("Whoopsie!");
  } catch (e, stackTrace) {
    log.severe("e.message =${e.toString()}", e, stackTrace);
  }
}

void main(List<String> args) {
  configLogger();
  exerciseLoggerInfo();
  exerciseLoggerSevere();
}
