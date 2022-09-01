import 'package:audioplayer/utils.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class allsongs extends StatefulWidget {
  const allsongs({Key? key}) : super(key: key);

  @override
  State<allsongs> createState() => _allsongsState();
}

class _allsongsState extends State<allsongs> {
  AudioPlayer player = AudioPlayer();

  List<bool> statuslist = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    statuslist = List.filled(utils.songlist.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Song")),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            trailing: statuslist[index]
                ? IconButton(
                    onPressed: () async {
                      setState(() {
                        statuslist = List.filled(utils.songlist.length, false);
                      });
                      print(statuslist);
                      await player.stop();
                    },
                    icon: Icon(Icons.pause))
                : IconButton(
                    onPressed: () async {
                      await player.stop();
                      setState(() {
                        statuslist = List.filled(utils.songlist.length, false);
                        statuslist[index]=true;
                      });
                      await player.play(DeviceFileSource(utils.songlist[index].data));
                    },
                    icon: Icon(Icons.play_arrow)),
            title: Text("${utils.songlist[index].displayNameWOExt}"),
            subtitle: Text("${utils.songlist[index].duration}"),
          );
        },
      ),
    );
  }
}
