import 'package:flutter/material.dart';
import 'package:flutter_application/Services/Movies.dart';
import 'package:flutter_application/Services/Networking.dart';
import 'package:flutter_application/Views/Widgets/VideoPlayer.dart';
import 'package:video_player/video_player.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                          height: 30.0,
                          width: 30.0,
                          child: Image(
                            image: NetworkImage(
                                'https://ih0.redbubble.net/image.618427277.3222/flat,1000x1000,075,f.u1.jpg'),
                            fit: BoxFit.fill,
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2)),
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      hintText: 'Search for a show,movie,genre etc'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 8.0, right: 8.0),
                child: Text(
                  'Top Searches',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                child: FutureBuilder(
                    future: getData(),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        return Expanded(
                          child: ListView.builder(
                              //  shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: snapshot.data.length,
                              itemBuilder: ((context, index) {
                                return Container(
                                  color: Colors.grey.withOpacity(0.2),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.15,
                                            child: Image(
                                                image: NetworkImage(
                                                    snapshot.data[index].url),
                                                fit: BoxFit.fill)),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            // color: Colors.grey.withOpacity(0.7),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    snapshot.data[index]
                                                                .title !=
                                                            null
                                                        ? snapshot
                                                            .data[index].title
                                                        : snapshot
                                                            .data[index].name,
                                                    style: TextStyle(
                                                        //  overflow: ,

                                                        color: Colors.white,
                                                        fontSize: 15.0),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                ((context) {
                                                      return Video(
                                                        id: snapshot
                                                            .data[index].id
                                                            .toString(),
                                                      );
                                                    })));
                                                  },
                                                  child: Icon(
                                                    Icons.play_circle,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              })),
                        );
                      } else
                        return CircularProgressIndicator();
                    })),
              )
            ],
          )),
    );
  }
}
