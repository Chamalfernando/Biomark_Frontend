import 'package:logger/logger.dart';

final customLogger = Logger(
  printer: PrettyPrinter(
    methodCount: 2, // Number of stack trace lines to print
    errorMethodCount: 5, // Number of method calls if error is thrown
    lineLength: 200, // Width of the log lines
    colors: true, // Colorful log messages
    printEmojis: true, // Print emojis for log messages
    printTime: false, // Print timestamp
  ),
);

/**
 * 
#########################################################################

void someFunction() {
  logger.d("Debug message");
  logger.i("Info message");
  logger.w("Warning message");
  logger.e("Error message");
}

#########################################################################
 *
 */
