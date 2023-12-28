class RequestNotificationDto {
  RequestNotificationDto({
    required this.image,
    required this.fullName,
    required this.car,
    required this.accidentId,
    required this.id,
  });
  late final String image;
  late final String fullName;
  late final String car;
  late final int accidentId;
  late final int id;

  RequestNotificationDto.fromJson(Map<String, dynamic> json){
    image = json['image'];
    fullName = json['full_name'];
    car = json['car'];
    accidentId = int.parse(json['accident_id']);
    id = int.parse(json['id']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['image'] = image;
    _data['full_name'] = fullName;
    _data['car'] = car;
    _data['accident_id'] = accidentId;
    _data['id'] = id;
    return _data;
  }
}