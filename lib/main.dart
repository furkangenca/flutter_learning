import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: FurkansRealm()
  ));
}

class FurkansRealm extends StatefulWidget {


  @override
  State<FurkansRealm> createState() => _FurkansRealmState();
}

class _FurkansRealmState extends State<FurkansRealm> {

  int age = 22;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[850],

        appBar: AppBar(
          title: Text("Profile",
            style: TextStyle(
                fontSize: 21,
                color: Colors.white,
                fontFamily: 'Montserrat',
                letterSpacing: 2.0,
            ),

          ),
          centerTitle: true,
          backgroundColor: Colors.grey[900],
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  backgroundImage:AssetImage('assets/ben.jpg') ,
                  radius: 100,
                ),
              ),

              Divider(
                height: 30.0,
                color: Colors.grey[600],
              ),

              Text(
                  'NAME',
                  style: TextStyle(
                    color: Colors.brown,
                    fontSize: 18,
                    letterSpacing:1.5, )
              ),
              SizedBox(height: 10.0,),
              Text(
                  'Furkan Gença',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[400],
                    letterSpacing:1.5,
                    fontFamily: 'Montserrat',
                  )
              ),
              Divider(
                height: 30.0,
                color: Colors.grey[600],
              ),

              Text(
                  'Age',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.brown,
                    letterSpacing:1.5,
                    fontFamily: 'Montserrat',
                  )
              ),
              SizedBox(height: 10.0,),
              Text(
                  '$age',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[400],
                    letterSpacing:1.5, )
              ),
              Divider(
                height: 30.0,
                color: Colors.grey[600],
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 5.0,),
                  Text(
                      'furkangenca@hotmail.com',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontFamily: 'Montserrat',

                    ),
                  )

                ],
              )


            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              age += 1;
            });
          },
          backgroundColor: Colors.grey[900],
          child: Icon(Icons.add, color: Colors.white,)


      ),



    );
  }
}

