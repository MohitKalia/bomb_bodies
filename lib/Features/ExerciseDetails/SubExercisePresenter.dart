import 'package:bomb_bodies/BaseClasses/BasePresenter.dart';
import 'package:bomb_bodies/BaseUtils/GlobalUtils.dart';
import 'package:bomb_bodies/Features/ExerciseDetails/SubExerciseView.dart';
import 'package:bomb_bodies/WebHelpers/ApiHelper.dart';

class SubExercisePresenter extends BasePresenter<SubExerciseView>{
  void loadExercises(String exerciseId) async {
    print('LD=> id,=> $exerciseId');
    viewable.showLoader = true;
    Map data = {'exercise_id':exerciseId};
    ApiHelper.fetchInnerExercises(data, ApiHelper.INNER_EXERCISES).then((value) {
      viewable.showLoader = false;
      if(value['status']){
        viewable.onResponse(value['data']);
      }
      else{
        viewable.onResponseError(value['message']);
      }
    }).catchError((e) {
      viewable.showLoader = false;
      print('SubExercisePresenter ${e.toString()}');
      viewable.onResponseError('empty');
      GlobalUtils.errorMessage('Can\'t load data, please try again');
    });
  }
}