import 'package:bomb_bodies/BaseClasses/BasePresenter.dart';
import 'package:bomb_bodies/BaseUtils/GlobalUtils.dart';
import 'package:bomb_bodies/Features/ExerciseList/ExerciseView.dart';
import 'package:bomb_bodies/WebHelpers/ApiHelper.dart';

class ExercisePresenter extends BasePresenter<ExerciseView> {
  void getExpertList(String workoutId){
    Map map = {'workoutid':workoutId};
    viewable.showLoader = true;
    ApiHelper.fetchExerciseList(map, ApiHelper.EXERCISE_LIST).then((value) {
      print('Exercise__$value\n\n');
      viewable.showLoader = false;
      viewable.onResponse(value['daily_exercise']);

    }).catchError((onError) {
      viewable.showLoader = false;
      viewable.onResponse([]);
      GlobalUtils.errorMessage('No data available');
    });
  }
}
