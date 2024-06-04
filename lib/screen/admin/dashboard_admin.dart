import 'package:flutter/material.dart';
import 'package:project/config/asset.dart';
import 'package:project/navbar_1.dart';
import 'package:project/screen/admin/homescreen.dart';

class DashboardAdmin extends StatefulWidget {
  const DashboardAdmin({super.key});

  @override
  State<DashboardAdmin> createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {
  int _selectedIndex = 0;
  String _title ='';

  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Navbar1(),
  ];
  @override
  void initState(){
    super.initState();
    _title = 'default';
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: AppBar(
          elevation: 2,
          toolbarHeight: 60,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          centerTitle: true,
          title: _title == 'default' ? Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: [
                                Text(
                                  'Hai, ',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Asset.colorPrimary,
                                  ),
                                ),
                                Text(
                                  'Muhammad Endi',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Asset.colorPrimary,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Developer',
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 12,
                                // fontWeight: FontWeight.bold,
                                color: Asset.colorPrimaryDark,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Asset.colorAccent,
                        child: CircleAvatar(
                          radius: 27,
                          backgroundImage:
                              const AssetImage('asset/images/teknokrat.png'),
                          backgroundColor: Asset.colorPrimaryDark,
                        ),
                      ),
                    ],
            ),
          )
          :Text(_title,
          maxLines: 1,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          ),
        ),
        preferredSize: Size.fromHeight(70.0)
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _selectedIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: Color.fromARGB(149, 167, 116, 116),
          selectedItemColor: Asset.colorPrimary,
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "navbar 1",
              icon: Icon(Icons.explore),
            ),
            BottomNavigationBarItem(
              label: "navbar 2",
              icon: Icon(Icons.bar_chart),
            ),
            BottomNavigationBarItem(
              label: "navbar 3",
              icon: Icon(Icons.calendar_today),
            ),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          {
            _title = 'default';
          }
          break;
        case 1:
          {
            _title = 'navbar 1';
          }
          break;
        case 2:
          {
            _title = 'navbar 2';
          }
          break;
        case 3:
          {
            _title = 'navbar 3';
          }
          break;
      }
    });
  }
}