// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

// Project imports:
import 'package:blinq/presentation/main_screen/main_screen.dart';
import 'package:blinq/presentation/success_video/success_video_bloc.dart';
import 'package:blinq/utils/navigation_service.dart';

class SuccessVideoScreen extends StatefulWidget {
  static const String route = 'success_video_screen';

  const SuccessVideoScreen({Key? key}) : super(key: key);

  @override
  State<SuccessVideoScreen> createState() => _SuccessVideoScreenState();
}

class _SuccessVideoScreenState extends State<SuccessVideoScreen> {
  late final SuccessVideoBloc bloc;
  @override
  void initState() {
     bloc = context.read();
    bloc.play();
    Future.delayed(const Duration(
      seconds: 3,
    )).then((value) => NavigationService.newRootScreen(MainScreen.route));
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SuccessVideoBloc bloc = context.watch();

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: VideoPlayer(bloc.controller),
        ),
      ),
    );
  }
}
