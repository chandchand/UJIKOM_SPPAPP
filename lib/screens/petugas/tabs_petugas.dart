import 'package:flutter/material.dart';
import 'package:spp_app/screens/transaksi/laporan.dart';
import 'package:spp_app/screens/petugas/home.dart';
import 'package:spp_app/screens/transaksi/transaksi.dart';
import 'package:spp_app/setting.dart';

class TabNavigatorPetugasRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigatorPetugas extends StatelessWidget {
  TabNavigatorPetugas({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  @override
  Widget build(BuildContext context) {

    Widget child ;
    if(tabItem == "Home")
      child = HomePetugas();
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
