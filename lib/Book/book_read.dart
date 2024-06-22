import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../common/color.dart';

import '../common/audio.dart'; // Assuming you defined this class

class BookRead extends StatefulWidget {
  final String bookurl;
  final String title;
  final List<AudioTrack> audioTracks;

  const BookRead({
    Key? key,
    required this.bookurl,
    required this.title,
    required this.audioTracks,
  }) : super(key: key);

  @override
  _BookReadState createState() => _BookReadState();
}

class _BookReadState extends State<BookRead> {
  AudioPlayer audioPlayer = AudioPlayer();
  String? selectedAudioUrl;
  bool isPlaying = false;
  bool isPaused = false;

  @override
  void initState() {
    super.initState();
    selectedAudioUrl = widget.audioTracks.first.url; // Default to the first track
    initAudioPlayer();
  }

  void initAudioPlayer() {
    audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
        isPaused = false;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> toggleAudio() async {
    if (isPlaying) {
      if (!isPaused) {
        await audioPlayer.pause();
        isPaused = true;
      } else {
        await audioPlayer.resume();
        isPaused = false;
      }
    } else {
      if (selectedAudioUrl != null) {
        await audioPlayer.play(UrlSource(selectedAudioUrl!));
        isPlaying = true;
        isPaused = false;
      }
    }
    setState(() {});
  }

  Future<void> stopAudio() async {
    await audioPlayer.stop();
    setState(() {
      isPlaying = false;
      isPaused = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(widget.title, style: TextStyle(color: TColor.text, fontWeight: FontWeight.w700)),
      ),
      body: Column(
        children: [
          Expanded(child: SfPdfViewer.network(widget.bookurl)),
          DropdownButton<String>(
            value: selectedAudioUrl,
            onChanged: (String? newValue) {
              setState(() {
                selectedAudioUrl = newValue!;
              });
              stopAudio();  // Stop any currently playing audio
            },
            items: widget.audioTracks.map<DropdownMenuItem<String>>((AudioTrack track) {
              return DropdownMenuItem<String>(
                value: track.url,
                child: Text(track.title),
              );
            }).toList(),
          ),
        ],
      ),
      floatingActionButton: isPlaying
          ? Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: toggleAudio,
            child: Icon(isPaused ? Icons.play_arrow : Icons.pause),
            backgroundColor: Colors.white54,
          ),
          FloatingActionButton(
            onPressed: stopAudio,
            child: Icon(Icons.stop),
            backgroundColor: Colors.red,
          ),
        ],
      )
          : FloatingActionButton(
        onPressed: toggleAudio,
        child: Icon(Icons.play_arrow),
        backgroundColor: Colors.white54,
      ),
    );
  }
}
