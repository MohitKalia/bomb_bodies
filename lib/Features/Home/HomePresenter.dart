import 'package:bomb_bodies/BaseClasses/BasePresenter.dart';
import 'package:bomb_bodies/BaseUtils/GlobalUtils.dart';
import 'package:bomb_bodies/Features/Home/HomeView.dart';
import 'package:bomb_bodies/WebHelpers/ApiHelper.dart';

class HomePresenter extends BasePresenter<HomeView> {
  void loadData() async {
    ApiHelper.getReq(ApiHelper.sWorkouts).then((val) {
      if(val['status']) {
        viewable.onResponse(val['daily_workouts']);
      }
    }).catchError((err) => GlobalUtils.errorMessage(err.toString()));
  }
}
