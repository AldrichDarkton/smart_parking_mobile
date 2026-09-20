import 'package:smart_parking_mobile/data/parking_slots.dart';

class ParkingZone {
  final String name;
  final int total;
  final int free;
  final List<ParkingSlot>? slots;

  ParkingZone(this.name, this.total, this.free, this.slots);
}
