import 'dart:math';

final Random _random = Random();

String getRandomUpvotes() {
  double number = _random.nextDouble() * 9 + 1; // 1 to 10
  return '${number.toStringAsFixed(1)}K';
}

int getRandomComments() {
  return _random.nextInt(50) + 1; // 1 to 50
}

int getRandomReposts() {
  return _random.nextInt(100) + 1; // 1 to 100
}
