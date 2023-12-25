// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:video_player/video_player.dart';

// Project imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/domain/repositories/auth_repository.dart';
import 'package:blinq/presentation/splash_screen/splash_screen_bloc.dart';

class SplashScreen extends StatefulWidget {
  static const String route = '/';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/video/logo.mp4");
    _controller.initialize();

    _controller.setLooping(false);
    _controller.play();
    SplashScreenBloc bloc =
        SplashScreenBloc(authRepository: getIt<AuthRepositoryImpl>());
    bloc.checkStatus();
  }

  @override
  void dispose() {
    _controller.pause();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: VideoPlayer(_controller),
      ),
    );
  }
}
