enum ActionType {
  accident('Accident part'),
  report('Create a report');

  const ActionType(this.description);

  final String description;

}