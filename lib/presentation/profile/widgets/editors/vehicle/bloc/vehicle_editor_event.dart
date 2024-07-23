sealed class VehicleEditorEvent {}

class Initial extends VehicleEditorEvent{
  final int? next;

  Initial({this.next = 1});
}

class GetModels extends VehicleEditorEvent{
  final int brandId;

  GetModels(this.brandId);
}


class GetColors extends VehicleEditorEvent{
  final int brandId;

  GetColors(this.brandId);
}

class OnSubmitVehicle extends VehicleEditorEvent {}
