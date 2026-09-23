import 'package:flutter/material.dart';
import 'package:smart_parking_mobile/widgets/detail_widgets/parking_spot_block.dart';

class ParkingSpotGrid extends StatelessWidget {
  const ParkingSpotGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 1.5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        ParkingSpotBlock(false, "#A01"),
        ParkingSpotBlock(true, "#A02"),
        ParkingSpotBlock(false, "#A03"),

        ParkingSpotBlock(true, "#A04"),
        ParkingSpotBlock(true, "#A05"),
        ParkingSpotBlock(false, "#A06"),

        ParkingSpotBlock(false, "#A07"),
        ParkingSpotBlock(false, "#A08"),
        ParkingSpotBlock(true, "#A09"),

        ParkingSpotBlock(true, "#A10"),
        ParkingSpotBlock(true, "#A11"),
        ParkingSpotBlock(false, "#A12"),
      ],
    );
  }
}
