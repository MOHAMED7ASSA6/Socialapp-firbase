import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        leading: Icon(
          Icons.menu,
        ),
        title: Text('First App'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notification_important,
            ),
            onPressed: () {
              print('notification clicked');
            },
          ),
          IconButton(
              icon: Icon(
                Icons.search,
              ),
              onPressed: () {
                print('search pressed');
              }),
        ],
      ),
      body: Column(
        children:
        [
          Container(
            width: 300.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    20.0,
                  ),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Stack(
                    alignment: Alignment.bottomCenter,
                    children:
                    [
                      Image(
                        image: NetworkImage(
                            'https://cdn.akamai.steamstatic.com/steam/apps/534380/capsule_616x353.jpg'
                        ),
                        height: 300.0,
                        width:300.0,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: double.infinity,
                        color:Colors.pink.withOpacity(0.6),
                        padding: EdgeInsets.symmetric(
                          vertical: 20.0,
                        ),
                        child: Text(
                          'Daying light 2',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                    ]
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
