class DummyModel {
  final exercise;
  final day;
  final imageUrl;

  const DummyModel({this.exercise, this.day, this.imageUrl = ""});
}

const DUMMYDATA = const [
  DummyModel(
      exercise: "FULL BODY", day: '1', imageUrl: 'assets/images/layer.png'),
  DummyModel(
      exercise: "LEGS & GLUTES", day: '2', imageUrl: "assets/images/layer1"
      ".png"),
  DummyModel(
      exercise: "CARDIO #1",
      day: '3',
      imageUrl: "assets/images/layer2.png"),
  DummyModel(
      exercise: "UPPER UP", day: '4', imageUrl: "assets/images/layer3.png"),
  DummyModel(
      exercise: "Bench press", day: '5', imageUrl: 'assets/images/layer1.png'),
  DummyModel(
      exercise: "Squats", day: '6', imageUrl: "assets/images/layer2.png"),
];