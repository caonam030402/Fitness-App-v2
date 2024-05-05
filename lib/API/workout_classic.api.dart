import 'dart:convert';

import 'package:fit_ness/models/workout.model.dart';
import 'package:fit_ness/DB/classsic_workouts.db.dart';
import 'package:fit_ness/constants/configs.dart';
import 'package:http/http.dart';

Future<List<ClassicWorkout>> fetchListClassicWorkout() async {
  try {
    Response response = await get(
      Uri.parse('${config.baseUrl}workout/classic'),
    );

    List<dynamic> data = json.decode(response.body)['data'];

    List<ClassicWorkout> classicWorkout = data.map((json) {
      return ClassicWorkout.fromJson(json);
    }).toList();

    return classicWorkout;
  } catch (e) {
    print(e);
    throw e;
  }
}

Future<Workout> fetchDetaitWorkout(String idWorkout) async {
  try {
    Response response = await get(
      Uri.parse('${config.baseUrl}workout/$idWorkout'),
    );

    dynamic data = json.decode(response.body)['data'];
    final workout = Workout.fromJson(data);

    return workout;
  } catch (e) {
    print(e);
    throw e;
  }
}
