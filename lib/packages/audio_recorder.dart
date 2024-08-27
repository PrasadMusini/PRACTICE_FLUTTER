import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:record/record.dart';

class AudioxRecorder extends StatefulWidget {
  const AudioxRecorder({super.key});

  @override
  State<AudioxRecorder> createState() => _AudioxRecorderState();
}

class _AudioxRecorderState extends State<AudioxRecorder> {
  final AudioRecorder _record = AudioRecorder();
  final AudioPlayer _audioPlayer = AudioPlayer();
  String? _audioFilePath;
  bool _isRecording = false;
  bool _isPlaying = false;

  @override
  void dispose() {
    _record.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _startRecording() async {
    if (await _record.hasPermission()) {
      setState(() {
        _isRecording = true;
      });
      await _record.start(
          const RecordConfig(androidConfig: AndroidRecordConfig()),
          path: 'audio.aac');
    }
  }

  Future<void> _stopRecording() async {
    final path = await _record.stop();
    setState(() {
      _isRecording = false;
      _audioFilePath = path;
    });
  }

  Future<void> _playAudio() async {
    if (_audioFilePath != null) {
      setState(() {
        _isPlaying = true;
      });
      await _audioPlayer.play(DeviceFileSource(_audioFilePath!));
      _audioPlayer.onPlayerComplete.listen((event) {
        setState(() {
          _isPlaying = false;
        });
      });
    }
  }

  Future<void> _stopAudio() async {
    await _audioPlayer.stop();
    setState(() {
      _isPlaying = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Recorder'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              iconSize: 80,
              icon: Icon(
                _isRecording
                    ? Icons.stop_circle
                    : (_isPlaying ? Icons.pause_circle : Icons.mic),
                color: _isRecording
                    ? Colors.red
                    : (_isPlaying ? Colors.blue : Colors.green),
              ),
              onPressed: () async {
                if (_isRecording) {
                  await _stopRecording();
                } else if (_isPlaying) {
                  await _stopAudio();
                } else if (_audioFilePath == null || !_isPlaying) {
                  await _startRecording();
                } else {
                  await _playAudio();
                }
              },
            ),
            /* if (_audioFilePath != null && !_isRecording)
              Slider(
                // value: _audioPlayer.position.inSeconds.toDouble(),
                // min: 0.0,
                // max: _audioPlayer.duration?.inSeconds.toDouble() ?? 0.0,
                onChanged: (value) {
                  _audioPlayer.seek(Duration(seconds: value.toInt()));
                }, value: _audioPlayer.onPositionChanged,
              ), */
          ],
        ),
      ),
    );
  }
}
