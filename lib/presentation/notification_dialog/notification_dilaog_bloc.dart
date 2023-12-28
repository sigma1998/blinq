import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationDialogBloc extends Cubit<GenericBlocState<bool>> {

  final AccidentRepository accidentRepository;

  NotificationDialogBloc({required this.accidentRepository})
      : super(GenericBlocState.initial());

  Future<void> sendAnswer(bool isAgree, accidentId) async {
    emit(GenericBlocState.loading());

    try {
      await accidentRepository.respondToNotification(
          accidentId: accidentId, isAgree: isAgree);
      emit(GenericBlocState.loading());
      NavigationService.back();
    } catch (e) {
      emit(GenericBlocState.initial());
    }
  }
}
