import 'package:flutter/material.dart';

class OverviewMain extends StatefulWidget {
  const OverviewMain({super.key});

  @override
  State<StatefulWidget> createState() {
    return _OverviewMainState();
  }
}

class _OverviewMainState extends State<OverviewMain> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 237, 241, 241),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Text("hi"), Text("hi"), Text("hi")],
            ),
          ],
        ),
      ),
    );
  }
}
