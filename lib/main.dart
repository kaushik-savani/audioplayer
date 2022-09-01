import 'package:audioplayer/allsongs.dart';
import 'package:audioplayer/utils.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MaterialApp(
    home: splash(),
  ));
}

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  OnAudioQuery _audioQuery = OnAudioQuery();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadmusic();
  }

  loadmusic() async {
    var status = await Permission.storage.status;
    if (status.isDenied) {
      await [
        Permission.storage,
      ].request();
    }
    utils.songlist = await _audioQuery.querySongs();

    print(utils.songlist);
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return allsongs();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("audio Player"),
      ),
      body: Center(
        child: Text("Loading.."),
      ),
    );
  }
}
