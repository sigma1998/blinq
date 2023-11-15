import 'package:blinq/presentation/points_of_impact/bloc/points_of_impact_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PointsOfImpactBloc extends Cubit<PointsOfImpactScreenState> {
  PointsOfImpactBloc() : super(const PointsOfImpactScreenState());

  void onArrowPressed({required PointOfImpact pointOfImpact}) {
    switch (pointOfImpact) {
      case PointOfImpact.bottom:
        emit(state.copyWith(isBottomActive: !state.isBottomActive));
      case PointOfImpact.bottomRight:
        emit(state.copyWith(isBottomRightActive: !state.isBottomRightActive));
      case PointOfImpact.bottomLeft:
        emit(state.copyWith(isBottomLeftActive: !state.isBottomLeftActive));
      case PointOfImpact.left:
        emit(state.copyWith(isLeftActive: !state.isLeftActive));
      case PointOfImpact.right:
        emit(state.copyWith(isRightActive: !state.isRightActive));
      case PointOfImpact.top:
        emit(state.copyWith(isTopActive: !state.isTopActive));
      case PointOfImpact.topRight:
        emit(state.copyWith(isTopRightActive: !state.isTopRightActive));
      case PointOfImpact.topLeft:
        emit(state.copyWith(isTopLeftActive: !state.isTopLeftActive));
    }
  }
}

enum PointOfImpact {
  top,
  topRight,
  topLeft,
  left,
  right,
  bottom,
  bottomLeft,
  bottomRight
}
