import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExampleCardLoading(),
    );
  }
}

class ExampleCardLoading extends StatelessWidget {
  const ExampleCardLoading({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Card Loading"),
        backgroundColor: Colors.black,
        brightness: Brightness.dark,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardLoading(
                height: 30,
                width: size.width * .2,
                padding: const EdgeInsets.only(bottom: 10),
                borderRadius: 15,
              ),
              CardLoading(
                height: size.height * .15,
                padding: const EdgeInsets.only(bottom: 10),
                borderRadius: 15,
              ),
              CardLoading(
                height: size.height * .1,
                padding: const EdgeInsets.only(bottom: 20),
                borderRadius: 15,
              ),
            ],
          );
        },
      ),
    );
  }
}
