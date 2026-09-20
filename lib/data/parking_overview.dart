import 'package:smart_parking_mobile/data/parking_zone.dart';

class ParkingOverview {
  final int totalSpots;
  final int occupiedSpots;
  final int availableSpots;
  final bool isFull;
  final List<ParkingZone>? zones;

  ParkingOverview({
    required this.totalSpots,
    required this.occupiedSpots,
    required this.availableSpots,
    required this.isFull,
    required this.zones,
  });
}
