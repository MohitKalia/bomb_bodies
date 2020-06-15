

class SizeAnalizer {
  static double convertSize(double screenHeight, double percent) {
    double newHeight;
    if (screenHeight > 850.00 && screenHeight < 900.00) {
      percent = percent + 0.21;
    } else if (screenHeight > 800.0 && screenHeight < 850.0) {
      percent = percent + 0.19;
    } else if (screenHeight > 730.0 && screenHeight < 800.0) {
      percent = percent + 0.16;
    } else if (screenHeight > 660.0 && screenHeight < 730.0) {
      percent = percent + 0.12;
    } else if (screenHeight > 600.0 && screenHeight < 660.0) {
      percent = percent + 0.08;
    } else if (screenHeight > 500.0 && screenHeight < 600.0) {
      percent = percent + 0.05;
    }
    newHeight = screenHeight * percent;
    return newHeight;
  }
  static double convertSizeCalendarBg(double screenHeight, double percent) {
    double newHeight;
    if (screenHeight > 850.00 && screenHeight < 900.00) {
      percent = percent + 0.00;
    } else if (screenHeight > 800.0 && screenHeight < 850.0) {
      percent = percent + 0.02;
    } else if (screenHeight > 730.0 && screenHeight < 800.0) {
      percent = percent + 0.04;
    } else if (screenHeight > 660.0 && screenHeight < 730.0) {
      percent = percent + 0.06;
    } else if (screenHeight > 600.0 && screenHeight < 660.0) {
      percent = percent + 0.08;
    } else if (screenHeight > 500.0 && screenHeight < 600.0) {
      percent = percent + 0.10;
    }
    newHeight = screenHeight * percent;
    return newHeight;
  }
}