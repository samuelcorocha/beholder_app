import 'package:beholder_companion/api/api_ability_scores.dart';
import 'package:flutter/material.dart';
import 'api_classes.dart';

class Teste extends StatefulWidget {
  const Teste({Key? key}) : super(key: key);

  @override
  TesteState createState() => TesteState();
}

class TesteState extends State<Teste> {

  late Future<AbilityScore> futureScore;
  late Future<AbilityScore> futureCharisma;
  late Future<AbilityScore> futureConsitution;

  List<Future<AbilityScore>> abilityScores = [
    fetchScore('cha'), fetchScore('con'), fetchScore('dex'), fetchScore('int'), fetchScore('str'), fetchScore('wis')
  ];

  int counter = 0;

  @override
  void initState() {
    super.initState();
    futureScore = fetchScore('cha');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List>(
        future: getScores(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Failed to load scoressss'),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data!.name.toString()),
                );
              }
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}