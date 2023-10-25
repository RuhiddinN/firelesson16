import 'dart:developer';

import 'package:flutter/material.dart';

import 'firebase_realtime_database_services.dart';
import 'user_models.dart';

class RtdbPages extends StatefulWidget {
  static const String id = 'rtdb_pages';

  const RtdbPages({super.key});

  @override
  State<RtdbPages> createState() => _RtdbPagesState();
}

class _RtdbPagesState extends State<RtdbPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () async {
                FootBall footbBall = FootBall(
                    name: "Eldor Shomurodcov",
                    position: "Striker",
                    number: 14,
                    height: 1.9,
                    rating: 72,
                    country: "Uzbekistan",
                    thropies: [
                      "Asian chempions",
                      'The best player Uzbekistan',
                      'Uzb PFL Cup'
                    ],
                    isMusilman: true);
                RealtimeDbServices services = RealtimeDbServices();
                services.add(footbBall);
              },
              child: const Text('RealTDB Add'),
            ),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () async {
                  RealtimeDbServices ser = RealtimeDbServices();
                  ser.get('1007').then((value) {
                    log("${value}");
                  });
                },
                child: const Text("RealTDB Get")),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                FootBall footBall = FootBall(
                  name: "Kylian Mbappe",
                  position: "Striker",
                  height: 1.85,
                  rating: 91,
                  country: "France",
                  thropies: ["World Cup", "Europe Cup", "Golden Boot"],
                  isMusilman: false,
                  number: 7,
                );
                RealtimeDbServices services = RealtimeDbServices();
                services.update(footBall);
              },
              child: const Text("RealTDb Update"),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                RealtimeDbServices services = RealtimeDbServices();
                services.delete();
              },
              child: const Text("RealTDb Delete"),
            ),
          ),
        ],
      ),
    );
  }
}
