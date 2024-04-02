import 'package:fit_ness/models/workout.model.dart';
import 'package:fit_ness/DB/classsic_workouts.db.dart';

Future<List<ClassicWorkout>> fetchListClassicWorkout() async {
  try {
    List<ClassicWorkout> classicWorkout = classicWorkoutsDB.map((json) {
      return ClassicWorkout.fromJson(json);
    }).toList();

    return classicWorkout;
  } catch (e) {
    print(e);
    throw e;
  }
}

Future<Workout> fetchDetaitWorkout(
    String idClassicWorkout, String idWorkout) async {
  try {
    List<ClassicWorkout> classicWorkouts = classicWorkoutsDB.map((json) {
      return ClassicWorkout.fromJson(json);
    }).toList();

    final classicWorkout = classicWorkouts.firstWhere((classsicWorkout) {
      return classsicWorkout.id == idClassicWorkout;
    });

    final workout =
        classicWorkout.list.firstWhere((workout) => workout.id == idWorkout);

    return workout;
  } catch (e) {
    print(e);
    throw e;
  }
}
