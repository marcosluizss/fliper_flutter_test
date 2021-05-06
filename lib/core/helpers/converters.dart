double getDouble(dynamic value) {
  if (value is int) {
    return value.toDouble();
  }
  return value;
}
