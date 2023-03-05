import 'package:flutter/material.dart';
import 'package:flutter_application/Services/Movies.dart';

import 'VideoPlayer.dart';

class About extends StatefulWidget {
  String? url;
  String? title;
  String? about;
  String? id;

  About({this.about, this.title, this.url, this.id});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey.shade600),
      //  height: MediaQuery.of(context).size.height / 3,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Image.network(
                        '${widget.url}',
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Container(
                      child: Flexible(
                        child:
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Container(
                                      child: Text(
                                        '${widget.title}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(
                                      Icons.close_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '${widget.about}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15.0),
                              )
                            ]),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Video(
                                          id: widget.id,
                                        )));
                          },
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Play',
                          style: TextStyle(color: Colors.white, fontSize: 15.0),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.download,
                          color: Colors.white,
                        ),
                        Text(
                          'Download',
                          style: TextStyle(color: Colors.white, fontSize: 15.0),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        Text(
                          'My List',
                          style: TextStyle(color: Colors.white, fontSize: 15.0),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.share,
                          color: Colors.white,
                        ),
                        Text(
                          'Share',
                          style: TextStyle(color: Colors.white, fontSize: 15.0),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
