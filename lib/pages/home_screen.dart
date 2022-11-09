import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  // BoxDecoration myBoxDecoration() {
  //   return BoxDecoration(
  //     border: Border.all(
  //       width: 1,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: const Text("Was gibts heute?"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                // decoration: myBoxDecoration(),
                color: Colors.white,
                width: double.infinity,
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Montag"),
                    Text("Gericht"),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
