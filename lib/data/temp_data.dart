import 'package:smart_parking_mobile/data/parking_overview.dart';
import 'package:smart_parking_mobile/data/parking_zone.dart';

ParkingOverview overviewData = ParkingOverview(
  totalSpots: 50,
  occupiedSpots: 38,
  availableSpots: 12,
  isFull: false,
  zones: [
    ParkingZone("Zone A", 25, 15, null),
    ParkingZone("Zone B", 25, 23, null),
  ],
);
