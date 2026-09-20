import 'package:flutter/material.dart';
import 'package:smart_parking_mobile/data/parking_overview.dart';
import 'package:smart_parking_mobile/data/temp_data.dart';
import 'package:smart_parking_mobile/widgets/general_widgets/display_label_box.dart';
import 'package:smart_parking_mobile/widgets/general_widgets/search_box.dart';
import 'package:smart_parking_mobile/widgets/overview_widgets/zone_list.dart';

class OverviewMain extends StatefulWidget {
  const OverviewMain({super.key});

  @override
  State<StatefulWidget> createState() {
    return _OverviewMainState();
  }
}

class _OverviewMainState extends State<OverviewMain> {
  final ParkingOverview _overviewData = overviewData;

  String formatPercentage(double value) {
    String formatted = value.toStringAsFixed(1);
    return formatted.endsWith('.0')
        ? formatted.substring(0, formatted.length - 2)
        : formatted;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: const Color.fromARGB(255, 130, 161, 161),
      color: const Color.fromARGB(255, 237, 241, 241),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10,
          children: [
            SearchBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              spacing: 20,
              children: [
                Expanded(child: DisplayLabelBox("ZONES", "2")),
                Expanded(
                  child: DisplayLabelBox(
                    "AVAILABLE",
                    overviewData.availableSpots.toString(),
                  ),
                ),
                Expanded(
                  child: DisplayLabelBox(
                    "OCCUPIED",
                    overviewData.occupiedSpots.toString(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Container(
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
                      Text(
                        "OVERALL CAPACITY",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        "${formatPercentage((_overviewData.availableSpots * 100) / _overviewData.totalSpots)}% free",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: LinearProgressIndicator(
                      value: _overviewData.totalSpots > 0
                          ? _overviewData.occupiedSpots /
                                _overviewData.totalSpots
                          : 0.0,
                      minHeight: 7,
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .secondaryFixed,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    spacing: 5,
                    children: [
                      Text(
                        "${_overviewData.occupiedSpots}/${_overviewData.totalSpots}",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "occupied",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              alignment: AlignmentGeometry.topStart,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
              child: Text(
                "PARKING ZONES",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            Expanded(child: ZoneList(_overviewData.zones!)),
          ],
        ),
      ),
    );
  }
}
