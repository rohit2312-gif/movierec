import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/Views/Screens/Search_Page.dart';
import 'package:flutter_application/Views/Widgets/Dropdown.dart';
import 'package:flutter_application/Views/Widgets/VideoPlayer.dart';
import '../../Services/Networking.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    //getData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      //   leading: Text(
      //     'M',
      //     style: TextStyle(
      //         color: Colors.red, fontSize: 20.0, fontWeight: FontWeight.w700),
      //   ),
      // ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              //Row(
              // children: [

              // ],
              // ),
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: double.infinity,
                    child: Image(
                      image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500/9PFonBhy4cQy7Jz20NpMygczOkv.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'M',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.w700),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Container(
                                          height: 30.0,
                                          width: 30.0,
                                          child: Image(
                                            image: NetworkImage(
                                                'https://ih0.redbubble.net/image.618427277.3222/flat,1000x1000,075,f.u1.jpg'),
                                            fit: BoxFit.fill,
                                          )),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return Search();
                                        }));
                                      },
                                      child: Icon(
                                        Icons.search,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'TV Shows',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'Movies',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'Categories',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            Text(''),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.4,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0)),
                          padding: EdgeInsets.all(10.0),
                          width: 90.0,
                          child: Center(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.play_arrow,
                                  color: Colors.black,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    //ADD WEDNESDAY ID
                                  },
                                  child: Text(
                                    'Play',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Trending Now',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: FutureBuilder(
                          future: getData(),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (!snapshot.hasData) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasData) {
                              return Container(
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot.data.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            showBottomSheet(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return About(
                                                  id: snapshot.data[index].id
                                                      .toString(),
                                                  title: snapshot.data[index]
                                                              .title !=
                                                          null
                                                      ? snapshot
                                                          .data[index].title
                                                      : snapshot
                                                          .data[index].name,
                                                  url: snapshot.data[index].url,
                                                  about: snapshot
                                                      .data[index].overview,
                                                );
                                              },
                                            );
                                          },
                                          child: Container(
                                            child: Image(
                                              image: NetworkImage(
                                                  snapshot.data[index].url),
                                              fit: BoxFit.fill,
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0)),
                                          ),
                                        ),
                                      );
                                    }),
                              );
                            }
                            return CircularProgressIndicator();
                          }),
                    ),
                    Text(
                      'Made in India',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: FutureBuilder(
                          future: getIndian(),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (!snapshot.hasData) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasData) {
                              return Container(
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot.data.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            showBottomSheet(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return About(
                                                  id: snapshot.data[index].id
                                                      .toString(),
                                                  title: snapshot
                                                      .data[index].title,
                                                  url: snapshot.data[index].url,
                                                  about: snapshot
                                                      .data[index].overview,
                                                );
                                              },
                                            );
                                          },
                                          child: Container(
                                            child: Image(
                                              image: NetworkImage(
                                                  snapshot.data[index].url),
                                              fit: BoxFit.fill,
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0)),
                                          ),
                                        ),
                                      );
                                    }),
                              );
                            }
                            return CircularProgressIndicator();
                          }),
                    ),
                    Text(
                      'Award winning shows',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: FutureBuilder(
                          future: getTop(),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (!snapshot.hasData) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasData) {
                              return Container(
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot.data.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            showBottomSheet(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return About(
                                                    id: snapshot.data[index].id
                                                        .toString(),
                                                    title: snapshot
                                                        .data[index].title,
                                                    url: snapshot
                                                        .data[index].url,
                                                    about: snapshot
                                                        .data[index].overview,
                                                  );
                                                });
                                          },
                                          child: Container(
                                            child: Image(
                                              image: NetworkImage(
                                                  snapshot.data[index].url),
                                              fit: BoxFit.fill,
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0)),
                                          ),
                                        ),
                                      );
                                    }),
                              );
                            }
                            return CircularProgressIndicator();
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
