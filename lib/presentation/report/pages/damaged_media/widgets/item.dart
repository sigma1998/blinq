// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:blinq/utils/custom_widgets/loading.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:video_player/video_player.dart';
import 'package:path/path.dart' as p;

// Project imports:
import 'package:blinq/utils/custom_widgets/buttons/default_ink_well.dart';

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
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
          child: fileWidget(widget.file),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: MyInkWell(
            onTap: () => widget.onRemove.call(widget.file),
            padding: const EdgeInsets.all(4),
            borderRadius: BorderRadius.circular(100),
            color: Theme.of(context).colorScheme.secondary,
            child: const Icon(
              Icons.close,
              color: Colors.white,
              size: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget fileWidget(File file) {
    final fileExtension = p.extension(file.path).toLowerCase();

    if (fileExtension == '.mp4' || fileExtension == '.mov') {
      return Stack(
        children: [
          if (_controller != null) ...[
            VideoPlayer(_controller!),
            Positioned(
              bottom: 10,
              right: 10,
              child: Text(
                _formatDuration(_controller!.value.duration),
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ] else ...[
            const Loading(),
          ],
        ],
      );
    } else {
      return Image.file(
        file,
        width: 126,
        height: 170,
        fit: BoxFit.cover,
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
