import 'dart:convert';
import 'package:http/http.dart' as http;

class Classes {
  int? count;
  List<Results>? results;

  Classes({required this.count, required this.results});

  Classes.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['results'] = results?.map((v) => v.toJson()).toList();
    return data;
  }
}

class Results {
  String? index;
  String? name;
  String? url;

  Results({required this.index, required this.name, required this.url});

  Results.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['index'] = index;
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

Future<Classes> fetchClass() async {
  final response = await http.get(Uri.parse("https://www.dnd5eapi.co/api/classes/"));
  if (response.statusCode == 200) {
    return Classes.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load classes');
  }
}