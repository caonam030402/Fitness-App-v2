double calculateBmi(num height, num weight) {
  double heightInMeters = height / 100.0;
  return weight / (heightInMeters * heightInMeters);
}
