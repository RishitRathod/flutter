import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:ecom_app/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';

import 'cart_screen.dart';
import 'seetings_screen.dart';

class MasterScreen extends StatefulWidget {
  const MasterScreen({super.key});

  @override
  State<MasterScreen> createState() => _MasterScreenState();
}

class _MasterScreenState extends State<MasterScreen> {
  String unm = '';
  int currIdx = 0;
  List screens = [DashboardScreen(), CartScreen(), SettingsScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi' $unm),
      ),
      body: screens[currIdx],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currIdx,
          onTap: (v) {
            currIdx = v;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ]),
    );
  }
}                                   


//create app to set limit and price per sheet then book the ticket  with person name and 
//display total price 
//thrid scren booking scren/history display total revenue (using getx)