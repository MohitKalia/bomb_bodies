import 'package:bomb_bodies/BaseClasses/Viewable.dart';

class BasePresenter<T extends Viewable> {
  T viewable;

  getV() {
    return viewable;
  }

  setV(T view) {
    viewable = view;
  }
}
