import 'package:flutter/material.dart';
import 'package:smart_parking_mobile/widgets/overview_widgets/overview_main.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  "SMART",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(width: 3),
                Text(
                  "CAR",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(width: 3),
                Text(
                  "PARK",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            Text(
              "Smart Sensing for Seamless Parking",
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
          Image.asset(
            "assets/images/icons/logo_square.png",
            width: 50,
            height: 50,
          ),
          SizedBox(width: 10),
        ],
      ),
      body: OverviewMain(),
    );
  }
}
