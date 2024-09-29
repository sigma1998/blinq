enum ReportType{
  accident('Accident part'),
  breakdown('Create a report');

  const ReportType(this.description);

  final String description;
}

enum User{
  A,
  B
}