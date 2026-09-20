import 'package:flutter/material.dart';
import 'package:smart_parking_mobile/data/parking_zone.dart';

class ZoneList extends StatelessWidget {
  final List<ParkingZone> zones;
  const ZoneList(this.zones, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: zones.length,
      itemBuilder: (ctx, index) => Text(zones[index].name),
    );
  }
}
