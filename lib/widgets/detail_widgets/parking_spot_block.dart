import 'package:flutter/material.dart';

class ParkingSpotBlock extends StatelessWidget {
  final bool occupied;
  final String spotNumber;

  const ParkingSpotBlock(this.occupied, this.spotNumber, {super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: occupied ? colorScheme.secondaryContainer : Colors.white,
        border: Border.all(color: colorScheme.primary, width: 1),
        borderRadius: BorderRadius.circular(6),
        boxShadow: const [BoxShadow(blurRadius: 1, offset: Offset(0, 2))],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            spotNumber,
            style: TextStyle(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 8),

          Center(
            child: Icon(
              occupied ? Icons.directions_car : Icons.local_parking,
              color: colorScheme.primary,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
