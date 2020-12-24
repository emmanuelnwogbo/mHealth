import 'package:flutter/material.dart';

import '../lists/hospitals.dart';
import '../lists/pharmacies.dart';
import '../lists/laboratories.dart';
import '../lists/diagnosis.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(
          top: mediaQuery.size.height / 10, left: 15, right: 15),
      height: mediaQuery.size.height,
      color: Color(0xFFFFFFFF),
      child: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Hello, Tayo',
            style: TextStyle(
              //background: paint,
              fontSize: 38.0,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.none,
              color: Color(0xFF665EFF),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'How can we help you today?',
            style: TextStyle(
                color: Colors.black54,
                decoration: TextDecoration.none,
                fontSize: 17.0,
                fontWeight: FontWeight.w500),
          ),
          Expanded(
              child: GridView.count(
            primary: false,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            childAspectRatio:
                (mediaQuery.size.height * .8 / mediaQuery.size.width * .5),
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Diagnosis()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 20.0),
                          width: double.infinity,
                          child: Text(
                            'Diagnosis',
                            style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.none,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(0),
                              bottomLeft: Radius.circular(10.0),
                              topLeft: Radius.circular(0),
                              bottomRight: Radius.circular(10.0),
                            ),
                            color: Color(0xFF353A50),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: new DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1560582861-45078880e48e?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=634&q=80'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Hospitals()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 20.0),
                          width: double.infinity,
                          child: Text(
                            'Hospitals',
                            style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.none,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(0),
                              bottomLeft: Radius.circular(10.0),
                              topLeft: Radius.circular(0),
                              bottomRight: Radius.circular(10.0),
                            ),
                            color: Color(0xFF353A50),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: new DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1516574187841-cb9cc2ca948b?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1050&q=80'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Pharmacies()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 20.0),
                          width: double.infinity,
                          child: Text(
                            'Consult a Doctor',
                            style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.none,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(0),
                              bottomLeft: Radius.circular(10.0),
                              topLeft: Radius.circular(0),
                              bottomRight: Radius.circular(10.0),
                            ),
                            color: Color(0xFF353A50),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: new DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1542884748-2b87b36c6b90?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Laboratories()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 20.0),
                          width: double.infinity,
                          child: Text(
                            'Laboratories',
                            style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.none,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(0),
                              bottomLeft: Radius.circular(10.0),
                              topLeft: Radius.circular(0),
                              bottomRight: Radius.circular(10.0),
                            ),
                            color: Color(0xFF353A50),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: new DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1579165466991-467135ad3110?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Pharmacies()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 20.0),
                          width: double.infinity,
                          child: Text(
                            'Pharmacies',
                            style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.none,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(0),
                              bottomLeft: Radius.circular(10.0),
                              topLeft: Radius.circular(0),
                              bottomRight: Radius.circular(10.0),
                            ),
                            color: Color(0xFF353A50),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: new DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1549504537-57b91460ba7c?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1189&q=80'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
            ],
          )),
          SizedBox(
            height: 20.0,
          )
        ],
      )),
    ));
  }
}
