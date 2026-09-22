import 'package:flutter/material.dart';
import 'package:smart_parking_mobile/data/parking_zone.dart';
import 'package:smart_parking_mobile/screens/zone_details_page.dart';

class ZoneBlock extends StatelessWidget {
  final ParkingZone zone;

  const ZoneBlock(this.zone, {super.key});

  void _navigateToZoneDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => ZoneDetailsPage(zone)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final occupiedSpots = zone.total - zone.free;

    final occupancyRate = zone.total > 0 ? occupiedSpots / zone.total : 0.0;

    return InkWell(
      onTap: () => _navigateToZoneDetails(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(30, 0, 0, 0),
              blurRadius: 3,
              spreadRadius: 1,
              offset: const Offset(2.5, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      zone.zoneId,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      zone.name,
                      style: const TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryFixed,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    zone.free > 0 ? "AVAILABLE" : "FULL",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            Hero(
              tag: zone.zoneId,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: LinearProgressIndicator(
                  value: occupancyRate,
                  minHeight: 7,
                  backgroundColor: Theme.of(context).colorScheme.secondaryFixed,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              spacing: 5,
              children: [
                Text(
                  "$occupiedSpots/${zone.total}",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "occupied",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
