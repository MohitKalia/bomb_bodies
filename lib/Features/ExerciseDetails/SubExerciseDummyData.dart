class SubExerciseDummyModel {
  final exercise;
  final day;
  final imageUrl;
  final sets;

  const SubExerciseDummyModel({this.exercise, this.day, this.sets, this.imageUrl
  = ""});
}

const SUBEXERCISEDUMMYDATA = const [
  SubExerciseDummyModel(
      exercise: "Barbell sumo deadlifts", day: 'assets/images/user2.png',
      imageUrl: ''
      '10 reps', sets: "3 Sets"),
  SubExerciseDummyModel(
      exercise: "Barbell hip thrusts", day: 'assets/images/user3.png',
      imageUrl: ''
      '10 reps', sets: "3 Sets"),
  SubExerciseDummyModel(
      exercise: "Barbell Glutes Bridges", day: 'assets/images/user4.png',
      imageUrl: '10 reps', sets: "3 Sets of supersets"),
  SubExerciseDummyModel(
      exercise: "Seated hip abductions", day: 'assets/images/user5.png',
      imageUrl: ''
      '10 reps'
      'dumbblles', sets: "3 Sets of supersets"),
];