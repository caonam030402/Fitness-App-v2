class Exercise {
  final String id;
  final String title;
  final int fitTime;
  final List<String> images;
  final String video;
  final String description;

  Exercise({
    required this.id,
    required this.title,
    required this.fitTime,
    required this.images,
    required this.video,
    required this.description,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    List<String> exerciseImages = [];
    for (var image in json['images']) {
      exerciseImages.add(image);
    }
    return Exercise(
      id: json['_id'],
      title: json['title'],
      fitTime: json['fitTime'],
      images: exerciseImages,
      video: json['video'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'fitTime': fitTime,
      'images': images,
      'video': video,
      'description': description,
    };
  }
}

class Workout {
  final String id;
  final String title;
  final String level;
  final String image;
  final String time;
  final List<Exercise> exercises;

  Workout(
      {required this.id,
      required this.title,
      required this.image,
      required this.time,
      required this.exercises,
      required this.level});

  factory Workout.fromJson(Map<String, dynamic> json) {
    List<Exercise> exercises = [];
    for (var exercise in json['exercises']) {
      exercises.add(Exercise.fromJson(exercise));
    }
    return Workout(
      id: json['_id'],
      title: json['title'],
      level: json['level'],
      image: json['image'],
      time: json['time'],
      exercises: exercises,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'level': level,
      'image': image,
      'time': time,
      'exercises': exercises.map((exercise) => exercise.toJson()).toList(),
    };
  }
}

class ClassicWorkout {
  final String id;
  final String title;
  final String image;
  final List<Workout> list;

  ClassicWorkout({
    required this.id,
    required this.title,
    required this.image,
    required this.list,
  });

  factory ClassicWorkout.fromJson(Map<String, dynamic> json) {
    List<Workout> workouts = [];
    for (var workoutData in json['list'] as List<dynamic>) {
      workouts.add(Workout.fromJson(workoutData));
    }
    return ClassicWorkout(
      id: json['_id'],
      title: json['title'],
      image: json['image'],
      list: workouts,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'image': image,
      'list': list.map((workout) => workout.toJson()).toList(),
    };
  }
}
