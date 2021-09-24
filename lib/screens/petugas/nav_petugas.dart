import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spp_app/screens/petugas/home.dart';
import 'package:spp_app/screens/petugas/tabs_petugas.dart';
import 'package:spp_app/screens/profile.dart';
import 'package:spp_app/setting.dart';

import '../transaksi/laporan.dart';
import '../transaksi/transaksi.dart';

class NavPetugas extends StatefulWidget {
  NavPetugas({Key key}) : super(key: key);

  @override
  _NavPetugasState createState() => _NavPetugasState();
}

class _NavPetugasState extends State<NavPetugas> {
   int _currentIndex = 0;
  final List<Widget>_children = [
    HomePetugas(),
    Transaksi(),
    Laporan(),
  ];
  // PageController _pageController = PageController();
  // List<Widget> _screens = [
  //   Transaksi(),Laporan()
  // ];
  void _onPageChanged(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  // void _onItemTapped(int selectedIndex){
  //   _pageController.jumpToPage(selectedIndex);
  // }
  // final tabs =[
  //   HomeAdmin(),
  //   Transaksi(),
  //   Laporan(),
  //   Setting(),
  //   Profile()
  //   // Center(child: Text("Transaksi")),
  //   // Center(child: Text("Home")),
  //   // Center(child: Text("Laporan")),
  // ];

  // String _currentPage = "Home";
  // List<String> pagekeys =["Home", "Transaksi", "Laporan", "Setting"];
  // Map<String, GlobalKey<NavigatorState>> _navigatorKeys={
  //   "Home":GlobalKey<NavigatorState>(),
  //   "Transaksi":GlobalKey<NavigatorState>(),
  //   "Laporan":GlobalKey<NavigatorState>(),
  //   "Setting":GlobalKey<NavigatorState>(),
  // };
  // void _selectTab(String tabItem, int index) {
  //   if(tabItem == _currentPage ){
  //     _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
  //   } else {
  //     setState(() {
  //       _currentPage = pagekeys[index];
  //       _selectedIndex = index;
  //     });
  //   }
  // }

  // GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // key: _globalKey,
        
      // onWillPop: () async{
      //   final isFirstRouteInCurrentTab =
      //       !await _navigatorKeys[_currentPage].currentState.maybePop();
      //   if (isFirstRouteInCurrentTab) {
      //     if (_currentPage != "Home") {
      //       _selectTab("Home", 1);

      //       return false;
      //     }
      //   }
      //   // let system handle back button if we're on the first route
      //   return isFirstRouteInCurrentTab;
      // },
      // child: Scaffold(
      //   body: Stack(
      //     children:<Widget>[
      //       _buildOffstageNavigator("Home"),
      //       _buildOffstageNavigator("Transaksi"),
      //       _buildOffstageNavigator("Laporan"),
      //       _buildOffstageNavigator("Setting"),
      //     ],
      //   ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (int index) {_onPageChanged(index);},
        // selectedIndex: _selectedIndex,
        // onItemSelected: (int index) {_selectTab(pagekeys[index], index);},
        // type: BottomNavigationBarType.shifting,
        iconSize: 30.0,
        items: [
         BottomNavyBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.blue[300],
            ),
            title: Text(
              "Home",
              style: GoogleFonts.inter(
                  color: Colors.blue[300],
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            // backgroundColor: Colors.blueAccent,
          ),
          BottomNavyBarItem(
            icon: Icon(
              Icons.money,
              color: Colors.blue[300],
            ),
            title: Text(
              "Transaksi",
              style: GoogleFonts.inter(
                  color: Colors.blue[300],
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            // backgroundColor: Colors.redAccent,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.archive, color: Colors.blue[300]),
            title: Text(
              "Laporan",
              style: GoogleFonts.inter(
                  color: Colors.blue[300],
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            // backgroundColor: Colors.greenAccent,
          ),
        ],
      ),
      // ),
    );
  }
  // Widget _buildOffstageNavigator(String tabItem) {
  //   return Offstage(
  //     offstage: _currentPage != tabItem,
  //     child: TabNavigatorAdmin(
  //       navigatorKey: _navigatorKeys[tabItem],
  //       tabItem: tabItem,
  //     ),
  //   );
  // }
}