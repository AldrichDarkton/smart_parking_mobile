import 'package:flutter/material.dart';
import 'package:smart_parking_mobile/data/parking_zone.dart';
import 'package:smart_parking_mobile/widgets/detail_widgets/zone_detail_main.dart';

class ZoneDetailsPage extends StatelessWidget {
  final ParkingZone zone;
  const ZoneDetailsPage(this.zone, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 4,
        backgroundColor: Colors.white,
        shadowColor: const Color.fromARGB(115, 0, 0, 0),
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  zone.zoneId,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
            Text(
              zone.name,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 12,
                wordSpacing: .2,
                letterSpacing: .2,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
          SizedBox(width: 10),
        ],
      ),
      body: ZoneDetailMain(zone),
    );
  }
}
