import 'dart:developer';

import 'package:firelesson16/firebase_database_services.dart';
import 'package:firelesson16/rtdb_services.dart';
import 'package:firelesson16/user_models.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            //add
            child: ElevatedButton(
              onPressed: () async {
                DatabaseServices databaseServices = DatabaseServices();
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
                databaseServices.add(footBall);
              },
              child: const Text('FootBall Add'),
            ),
          ),
          Center(
            //update
            child: ElevatedButton(
              onPressed: () {
                FootBall footBall = FootBall(
                  name: 'Karim Benzema',
                  position: "Striker",
                  number: 9,
                  height: 1.81,
                  rating: 90,
                  country: " France",
                  thropies: [
                    "Golden Ball",
                    "World Cup",
                    "UCL Cup",
                    "La Liga Cup"
                  ],
                  isMusilman: true,
                );
                DatabaseServices databaseServices = DatabaseServices();
                databaseServices.get().then((value) {
                  for (final item in value) {
                    if (item.name == "Kylian Mbappe") {
                      footBall.id = item.id;
                      databaseServices.update(footBall);
                    }
                  }
                });
              },
              child: const Text("FootBall Update"),
            ),
          ),
          Center(
            //get
            child: ElevatedButton(
              onPressed: () async {
                DatabaseServices databaseServices = DatabaseServices();
                databaseServices.get().then((value) {
                  for (final item in value) {
                    log('${item.rating}');
                  }
                });
              },
              child: const Text("FootBall Get"),
            ),
          ),
          //delete
          Center(
            child: ElevatedButton(
              onPressed: () async {
                DatabaseServices databaseServices = DatabaseServices();
                databaseServices.get().then((value) {
                  for (final item in value) {
                    databaseServices.delete(item.id ?? "");
                  }
                });
              },
              child: const Text("FootBall Delete"),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, RtdbPages.id);
              },
              child: const Text("rtdb"),
            ),
          )
        ],
      ),
    );
  }
}
