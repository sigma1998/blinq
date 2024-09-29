// Dart imports:
import 'dart:io';
import 'dart:ui';

// Flutter imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Package imports:
import 'package:path/path.dart' as p;
import 'package:video_player/video_player.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/loading.dart';

class DamagedMediaItem extends StatefulWidget {
  //
  final File file;
  final void Function(File) onRemove;

  const DamagedMediaItem({
    super.key,
    required this.file,
    required this.onRemove,
  });

  @override
  State<DamagedMediaItem> createState() => _DamagedMediaItemState();
}

class _DamagedMediaItemState extends State<DamagedMediaItem> {
  //
  VideoPlayerController? _controller;

  void updateState() => {if (mounted) setState(() {})};

  @override
  void initState() {
    super.initState();
    _initializeVideoController(widget.file);
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.darkGrey,
            border: Border.all(color: AppColors.grey1),
          ),
        ),
        fileWidget(widget.file),
        Positioned(
          right: 0,
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 8.0,
              right: 8,
            ),
            child: ClipOval(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  width: 36,
                  height: 36,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.grey2,
                    ),
                  ),
                  child: SvgPicture.asset(
                    width: 20,
                    height: 20,
                    AppDrawables.delete,
                    colorFilter: const ColorFilter.mode(
                      AppColors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        // Positioned(
        //   right: 0,
        //   bottom: 0,
        //   child: MyInkWell(
        //     onTap: () => widget.onRemove.call(widget.file),
        //     padding: const EdgeInsets.all(4),
        //     borderRadius: BorderRadius.circular(100),
        //     color: Theme.of(context).colorScheme.secondary,
        //     child: const Icon(
        //       Icons.close,
        //       color: Colors.white,
        //       size: 12,
        //     ),
        //   ),
        // ),
      ],
    );
  }

  Widget fileWidget(File file) {
    final fileExtension = p.extension(file.path).toLowerCase();

    if (fileExtension == '.mp4' || fileExtension == '.mov') {
      return Stack(
        children: [
          if (_controller != null) ...[
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: VideoPlayer(_controller!),
              ),
            ),
            Positioned(
              left: 10,
              bottom: 10,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(98),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 4,
                      height: 4,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      _formatDuration(_controller!.value.duration),
                      style: AppTextStyles.s13W400,
                    ),
                  ],
                ),
              ),
            ),
          ] else ...[
            const Loading(),
          ],
        ],
      );
    } else {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(1),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.file(
            file,
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }

  Future<void> _initializeVideoController(File file) async {
    _controller = VideoPlayerController.file(file);
    await _controller!.initialize();
    _controller!.play();
    updateState();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n >= 10 ? '$n' : '0$n';
    return '${twoDigits(duration.inMinutes)}:${twoDigits(duration.inSeconds.remainder(60))}';
  }
}
