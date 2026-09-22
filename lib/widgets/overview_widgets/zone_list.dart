import 'package:flutter/material.dart';
import 'package:smart_parking_mobile/data/parking_zone.dart';
import 'package:smart_parking_mobile/widgets/overview_widgets/zone_block.dart';

class ZoneList extends StatelessWidget {
  final List<ParkingZone> zones;
  const ZoneList(this.zones, {super.key});



  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: zones.length,
      itemBuilder: (ctx, index) => ZoneBlock(zones[index]),
      separatorBuilder: (ctx, index) => const SizedBox(height: 12),
    );
  }
}
