import 'dart:convert';
import 'package:http/http.dart' as http;

class AbilityScore {
  String? index;
  String? name;
  String? fullName;
  List<String>? desc;
  List<Skills>? skills;
  String? url;

  AbilityScore(
      {required this.index, required this.name, required this.fullName, required this.desc, this.skills, required this.url});

  AbilityScore.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    name = json['name'];
    fullName = json['full_name'];
    desc = json['desc'].cast<String>();
    if (json['skills'] != null) {
      skills = <Skills>[];
      json['skills'].forEach((v) {
        skills?.add(Skills.fromJson(v));
      });
    }
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['index'] = index;
    data['name'] = name;
    data['full_name'] = fullName;
    data['desc'] = desc;
    data['skills'] = skills?.map((v) => v.toJson()).toList();
    data['url'] = url;
    return data;
  }
}

class Skills {
  String? name;
  String? index;
  String? url;

  Skills({required this.name, required this.index, required this.url});

  Skills.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    index = json['index'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['index'] = index;
    data['url'] = url;
    return data;
  }
}

Future<AbilityScore> fetchScore(String ability) async {
  final response = await http.get(Uri.parse("https://www.dnd5eapi.co/api/ability-scores/$ability"));
  if (response.statusCode == 200) {
    return AbilityScore.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load charisma score');
  }
}

Future<List> getScores() async {
  final response = await http.get(Uri.parse("https://www.dnd5eapi.co/api/ability-scores"));
  if (response.statusCode == 200) {
    return jsonDecode(utf8.decode(response.bodyBytes));
  } else {
    throw Exception('Failed to load scores');
  }
}