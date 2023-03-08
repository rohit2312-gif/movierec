import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/Services/Movies.dart';
import '../../Services/Movies.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Video extends StatefulWidget {
  //const Video({super.key});
  String? id;

  Video({this.id});
  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  @override
  Player player = Player();
  late YoutubePlayerController _controller;

  @override
  void dispose() {
    //_controller.dispose(); // TODO: implement dispose
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: FutureBuilder(
          future: player.fetch(widget.id.toString()),
          builder: ((context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == "")
                return Center(child: Text('NO VIDEO FOUND'));
              else {
                _controller = YoutubePlayerController(
                  initialVideoId: snapshot.data,
                  flags: YoutubePlayerFlags(
                    autoPlay: true,
                  ),
                );

                return YoutubePlayerBuilder(
                    player: YoutubePlayer(controller: _controller),
                    builder: (context, player) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          player,
                        ],
                      );
                    });
              }
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          })),
    ));
  }
}
