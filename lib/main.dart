import 'package:flutter/material.dart';

var fab = true;
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mission 1',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mission 1'),
          backgroundColor: const Color(0xFF6B1827),
        ),
        floatingActionButton: Container(
            margin: EdgeInsets.only(top: 80),
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  if (fab) {
                    fab = false;
                  } else {
                    fab = true;
                  }
                });
              },
              child: Icon(
                Icons.favorite,
                color: fab ? const Color(0xFF111723) : const Color(0xFFF74050),
              ),
              backgroundColor: const Color(0xFFffffff),
              elevation: 1,
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        body: Stack(
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                      const Color(0xFF111723),
                      const Color(0xFFF74050)
                    ],
                        begin: new Alignment(0.0, 0.0),
                        end: new Alignment(0.0, 2.8))),
                child: Column(
                  children: [
                    Flexible(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('images/valo_banner.jpg'),
                                  fit: BoxFit.cover)),
                        )),
                    Flexible(
                        flex: 1,
                        child: Container(
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'images/jett-avatar.jpg'),
                                        fit: BoxFit.cover)),
                              )),
                              Expanded(
                                  child: Container(
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'images/phoenix-avatar.jpg'),
                                        fit: BoxFit.cover)),
                              )),
                              Expanded(
                                  child: Container(
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'images/raze-avatar.jpg'),
                                        fit: BoxFit.cover)),
                              )),
                              Expanded(
                                  child: Container(
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'images/reyna-avatar.jpg'),
                                        fit: BoxFit.cover)),
                              )),
                            ],
                          ),
                        )),
                    Flexible(
                        flex: 4,
                        child: Column(
                          children: [
                            Flexible(
                                flex: 1,
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  child: Text(
                                    "Welcome to Valorant's Duelist Agents",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                )),
                            Flexible(
                                flex: 4,
                                child: ListView(
                                  padding:
                                      EdgeInsets.only(left: 10.0, right: 10.0),
                                  children: [
                                    Text(
                                      'Jett is the fastest of the agents, and only one that can levitate from boosted places without making any noise. She has 3 powerful smokes called Cloudburst, that can be instantly thrown in front of her.\n',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                    Text(
                                      'Phoenix is a universal and a self-sufficient duelist. He can flash enemies with his Curveballs, or just respawn after a death when using his Run it Back ultimate. Phoenix can burn enemies with Blaze or Hot Hands, but in the same time heal himself in his own fire.\n',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                    Text(
                                      "Raze's all four abilities explode causing massive damage to her enemies. Raze can clear corners with her Boom Bot, or kill a whole enemy team with her ultimate. You never know where you should aim when Raze is jumping with her Blast Packs.\n",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                    Text(
                                      'Reyna also known as a vampire is entry fragger agent, that gains Soul Orbs when she kills her enemies. Reyna is feast or famine, and a big "get frags" agent. Her abilities only last a few seconds.',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ],
                                  scrollDirection: Axis.vertical,
                                ))
                          ],
                        )),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
