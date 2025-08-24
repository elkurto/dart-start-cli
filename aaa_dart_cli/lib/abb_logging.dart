import "package:logging/logging.dart";

/*
 *   Simple usage of :package: logging 
 *   @see https://pub.dev/packages/logging
 */
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

/*
(@see https://pub.dev/packages/logging)
Run example: 
  dart lib/abb_logging.dart

  OUTPUT:
    INFO: 2025-08-24 15:46:40.927822: i am just and info message
    INFO: 2025-08-24 15:46:40.933330: message in a closure -- delayed evaluation
    SEVERE: 2025-08-24 15:46:40.933821: e.message =Exception: Whoopsie! #0      exerciseLoggerSevere (package:aaa_dart_cli/abb_logging.dart:34:5)
    #1      main (package:aaa_dart_cli/abb_logging.dart:43:3)
    #2      _delayEntrypointInvocation.<anonymous closure> (dart:isolate-patch/isolate_patch.dart:312:33)
    #3      _RawReceivePort._handleMessage (dart:isolate-patch/isolate_patch.dart:193:12)


 */
