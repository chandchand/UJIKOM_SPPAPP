import 'package:flutter/material.dart';
// import 'package:spp_app/screens/admin/home.dart';
import 'package:spp_app/screens/transaksi/laporan.dart';
// import 'package:spp_app/screens/profile.dart';
import 'package:spp_app/screens/transaksi/transaksi.dart';
import 'package:spp_app/screens/admin/home.dart';
import 'package:spp_app/setting.dart';
// import 'package:spp_app/screens/laporan.dart';
// import 'package:spp_app/screens/nav.dart';
// import 'package:spp_app/screens/transaksi.dart';
// import 'package:spp_app/setting.dart';

class TabNavigatorAdminRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigatorAdmin extends StatelessWidget {
  TabNavigatorAdmin({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  @override
  Widget build(BuildContext context) {

    Widget child ;
    if(tabItem == "Home")
      child = HomeAdmin();
    else if(tabItem == "Transaksi")
      child = Transaksi();
    else if(tabItem == "Laporan")
      child = Laporan();
    else if(tabItem == "Setting")
      child = Setting();
    
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => child
        );
      },
    );
  }
}
