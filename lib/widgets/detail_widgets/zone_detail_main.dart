import 'package:flutter/material.dart';
import 'package:smart_parking_mobile/data/parking_zone.dart';
import 'package:smart_parking_mobile/widgets/detail_widgets/parking_zone_grid.dart';
import 'package:smart_parking_mobile/widgets/general_widgets/display_label_box.dart';
import 'package:smart_parking_mobile/widgets/general_widgets/search_box.dart';

class ZoneDetailMain extends StatefulWidget {
  final ParkingZone zone;
  const ZoneDetailMain(this.zone, {super.key});
  @override
  State<StatefulWidget> createState() {
    return _ZoneDetailMainState();
  }
}

class _ZoneDetailMainState extends State<ZoneDetailMain> {
  @override
  Widget build(BuildContext context) {
    final occupiedSpots = widget.zone.total - widget.zone.free;

    final occupancyRate = widget.zone.total > 0
        ? occupiedSpots / widget.zone.total
        : 0.0;

    return Container(
      // color: const Color.fromARGB(255, 130, 161, 161),
      color: const Color.fromARGB(255, 237, 241, 241),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // =========================
            // FIXED TOP SECTION
            // =========================

            SearchBox(),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              spacing: 20,
              children: [
                Expanded(
                  child: DisplayLabelBox("TOTAL", widget.zone.total.toString()),
                ),
                Expanded(
                  child: DisplayLabelBox(
                    "AVAILABLE",
                    widget.zone.free.toString(),
                  ),
                ),
                Expanded(
                  child: DisplayLabelBox("OCCUPIED", occupiedSpots.toString()),
                ),
              ],
            ),

            const SizedBox(height: 15),

            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: 5,
              children: [
                Hero(
                  tag: widget.zone.zoneId,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: LinearProgressIndicator(
                      value: occupancyRate,
                      minHeight: 7,
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .secondaryFixed,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  spacing: 5,
                  children: [
                    Text(
                      "$occupiedSpots/${widget.zone.total}",
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

            // =========================
            // SCROLLABLE BOTTOM SECTION
            // =========================
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 15),

                    // IMAGE / MAP
                    Container(
                      width: double.infinity,
                      height: 223,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryFixed,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Icon(
                        Icons.local_parking,
                        size: 100,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // PARKING SPOTS TITLE
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 6,
                      ),
                      child: Text(
                        "PARKING SPOTS",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),

                    // PARKING SPOT GRID
                    const ParkingSpotGrid(),
                  ],
                ),
              ),
            ),
          ],
        ),
        // child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   spacing: 10,
        //   children: [
        //     SearchBox(),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       spacing: 20,
        //       children: [
        //         Expanded(
        //           child: DisplayLabelBox("TOTAL", widget.zone.total.toString()),
        //         ),
        //         Expanded(
        //           child: DisplayLabelBox(
        //             "AVAILABLE",
        //             widget.zone.free.toString(),
        //           ),
        //         ),
        //         Expanded(
        //           child: DisplayLabelBox("OCCUPIED", occupiedSpots.toString()),
        //         ),
        //       ],
        //     ),
        //     SizedBox(height: 5),
        //     Column(
        //       mainAxisSize: MainAxisSize.min,
        //       crossAxisAlignment: CrossAxisAlignment.end,
        //       spacing: 5,
        //       children: [
        //         Hero(
        //           tag: widget.zone.zoneId,
        //           child: ClipRRect(
        //             borderRadius: BorderRadius.circular(100),
        //             child: LinearProgressIndicator(
        //               value: occupancyRate,
        //               minHeight: 7,
        //               backgroundColor: Theme.of(context)
        //                   .colorScheme
        //                   .secondaryFixed,
        //               color: Theme.of(context).colorScheme.primary,
        //             ),
        //           ),
        //         ),
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.end,
        //           spacing: 5,
        //           children: [
        //             Text(
        //               "$occupiedSpots/${widget.zone.total}",
        //               style: TextStyle(
        //                 color: Theme.of(context).colorScheme.primary,
        //                 fontWeight: FontWeight.bold,
        //               ),
        //             ),
        //             Text(
        //               "occupied",
        //               style: TextStyle(
        //                 color: Theme.of(context).colorScheme.primary,
        //               ),
        //             ),
        //           ],
        //         ),
        //       ],
        //     ),
        //     Container(
        //       width: 382,
        //       height: 223,
        //       decoration: BoxDecoration(
        //         color: Theme.of(context).colorScheme.secondaryFixed,
        //         borderRadius: BorderRadius.circular(6),
        //       ),
        //       // COME BACK HERE TO PUT THE IMAGE AND CONDITIONALLY RENDER THE MAP WHEN THERE IS ONE
        //       child: Icon(
        //         Icons.local_parking,
        //         size: 100,
        //         color: Theme.of(context).colorScheme.primary,
        //       ),
        //     ),
        //     Container(
        //       alignment: AlignmentGeometry.topStart,
        //       padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
        //       child: Text(
        //         "PARKING SPOTS",
        //         style: TextStyle(
        //           fontWeight: FontWeight.w400,
        //           fontSize: 18,
        //           color: Theme.of(context).colorScheme.primary,
        //         ),
        //       ),
        //     ),
        //     ParkingSpotGrid(),
        //   ],
        // ),
      ),
    );
  }
}
