double calculateBmi(double height, double weight) {
  double heightInMeters = height / 100.0;
  return weight / (heightInMeters * heightInMeters);
}
