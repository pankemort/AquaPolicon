import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: null,
      body: Stack(
        children: [
          Container(
            color: Colors.lightBlue,
            child: Column(
              children: [
                const Text("AquaPonic"),
                const Text(
                    "Aquaponics is a cooperation between plants and fish and the term originates from the two words aquaculture (the growing of fish in a closed environment) and hydroponics (the growing of plants usually in a soil-less environment). Aquaponic systems come in various sizes from small indoor units to large commercial units"),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("See Live Updates"),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
