class ResponseNotificationDto {
  ResponseNotificationDto({
    required this.datetime,
    required this.fullName,
    required this.answer,
    required this.car,
    required this.accidentId,
    required this.id,
  });

  late final String datetime;
  late final String fullName;
  late final String answer;
  late final String car;
  late final int accidentId;
  late final int id;

  ResponseNotificationDto.fromJson(Map<String, dynamic> json) {
    datetime = json['datetime'];
    fullName = json['full_name'];
    answer = json['answer'];
    car = json['car'];
    accidentId = int.parse(json['accident_id']);
    id = int.parse(json['id']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['datetime'] = datetime;
    data['full_name'] = fullName;
    data['answer'] = answer;
    data['car'] = car;
    data['accident_id'] = accidentId;
    data['id'] = id;
    return data;
  }
}
