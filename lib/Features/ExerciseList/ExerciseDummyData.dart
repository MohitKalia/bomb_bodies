class ExerciseDummyModel {
  final exercise;
  final day;
  final imageUrl;

  const ExerciseDummyModel({this.exercise, this.day, this.imageUrl = ""});
}

const EXERCISEDUMMYDATA = const [
  ExerciseDummyModel(
      exercise: "Booty Building", day: '45 min.', imageUrl: 'Barbell, bentch '
      'dumbblles'),
  ExerciseDummyModel(
      exercise: "Doumbblle only booty building", day: '20 Sets', imageUrl: ""
      "Doumbblles"),
  ExerciseDummyModel(
      exercise: "Hot Fire leg workout",
      day: '10 Sets',
      imageUrl: "Cables, barbell, bentch"),
  ExerciseDummyModel(
      exercise: "It's a booty-full day to be alive", day: '4 Sets', imageUrl:
  "Bentch, barbell"),
];