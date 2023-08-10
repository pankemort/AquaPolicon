import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aquaponic"),
        actions: [
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  "Sign Up",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Sign In"),
              ),
            ],
          )
        ],
      ),
      body: Container(
        color: Colors.lightBlue.shade50,
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Image.asset('assets/images/Aquaponics1.png'),
            const SizedBox(
              height: 24,
            ),
            RichText(
              text: const TextSpan(
                  text: 'Aquaponics ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          'is a cooperation between plants and fish and the term originates from the two words aquaculture (the growing of fish in a closed environment) and hydroponics (the growing of plants usually in a soil-less environment). Aquaponic systems come in various sizes from small indoor units to large commercial units',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          fontWeight: FontWeight.normal),
                    ),
                  ]),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("See Live Updates"),
            ),
          ],
        ),
      ),
    );
  }
}
