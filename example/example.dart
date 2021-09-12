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
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Space"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        CardLoading(
                          height: 30,
                          borderRadius: 15,
                          width: 100,
                          padding: EdgeInsets.only(bottom: 10),
                        ),
                        CardLoading(
                          height: 100,
                          borderRadius: 15,
                          padding: EdgeInsets.only(bottom: 10),
                        ),
                        CardLoading(
                          height: 30,
                          width: 200,
                          borderRadius: 15,
                          padding: EdgeInsets.only(bottom: 10),
                        ),
                      ],
                    ),
                  );
                },
                childCount: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
