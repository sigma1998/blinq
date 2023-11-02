import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class SuccessVideoBloc extends Bloc {
  late VideoPlayerController controller;

  SuccessVideoBloc() : super(GenericBlocState.initial()) {
    controller = VideoPlayerController.asset("assets/video/vid2.mp4");
    controller.setLooping(false);
    controller.initialize();
  }

  void play() {
    controller.play();

  }

  void dispose() {
    controller.dispose();
  }
}
