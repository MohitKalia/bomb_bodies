class DummyModel {
  final exercise;
  final day;
  final imageUrl;

  const DummyModel({this.exercise, this.day, this.imageUrl = ""});
}

const DUMMYDATA = const [
  DummyModel(
      exercise: "LEGS & GLUTES", day: '2', imageUrl: "assets/images/layer"
      ".png"),
];