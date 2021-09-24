import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:spp_app/screens/admin/home.dart';
// import 'package:spp_app/screens/admin/tabs_admin.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:spp_app/screens/transaksi/laporan.dart';
import 'package:spp_app/screens/profile.dart';
import 'package:spp_app/screens/transaksi/transaksi.dart';
import 'package:spp_app/setting.dart';

class Nav extends StatefulWidget {
  Nav({Key key}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  DateTime backButtonPressed;

  Future<bool> onWillPop() async {
    DateTime currentTime = DateTime.now();
    bool backButton = backButtonPressed == null ||
        currentTime.difference(backButtonPressed) > Duration(seconds: 3);

    if (backButton) {
      backButtonPressed = currentTime;
      Fluttertoast.showToast(
        msg: "Double Click To Exit",
        backgroundColor: Colors.grey,
        textColor: Colors.redAccent,
      );

      return false;
    }
    return exit(0);
  }

  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeAdmin(),
    Transaksi(),
    Laporan(),
  ];
  // PageController _pageController = PageController();
  // List<Widget> _screens = [
  //   Transaksi(),Laporan()
  // ];
  void _onPageChanged(int index) {
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
      body: WillPopScope(onWillPop: onWillPop, child: _children[_currentIndex]),
      bottomNavigationBar: BottomNavyBar(
        // onItemSelected: _onPageChanged,
        selectedIndex: _currentIndex,
        onItemSelected: (int index) {
          _onPageChanged(index);
        },
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
