import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:griyabayar/utils/app_style.dart';
import 'package:griyabayar/views/account_view.dart';
import 'package:griyabayar/views/dompet_view.dart';
import 'package:griyabayar/views/history_view.dart';
import 'package:griyabayar/views/home_view.dart';
import 'package:line_icons/line_icons.dart';

class NavigationView extends StatefulWidget {
  @override
  _NavigationViewState createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  int _selectedIndex = 0;
  final _layoutPage = [
    HomeView(),
    HistoryView(),
    DompetView(),
    AccountView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoubleBackToCloseApp(
        child: _layoutPage.elementAt(_selectedIndex),
        snackBar: SnackBar(
          content: Text('Tekan sekali lagi untuk keluar'),
        ),
      ),
      resizeToAvoidBottomPadding: false,
      bottomNavigationBar: SnakeNavigationBar.color(
        shadowColor: Colors.grey,
        behaviour: SnakeBarBehaviour.floating,
        snakeShape: SnakeShape.indicator,
        padding: EdgeInsets.all(0.0),

        ///configuration for SnakeNavigationBar.color
        snakeViewColor: AppStyle.primaryColor,
        selectedItemColor: AppStyle.primaryColor,
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        unselectedItemColor: Colors.grey[600],

        ///configuration for SnakeNavigationBar.gradient
        //snakeViewGradient: selectedGradient,
        //selectedItemGradient: snakeShape == SnakeShape.indicator ? selectedGradient : null,
        //unselectedItemGradient: unselectedGradient,

        showUnselectedLabels: false,
        showSelectedLabels: true,

        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: [
          BottomNavigationBarItem(icon: Icon(LineIcons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(LineIcons.history), label: 'Riwayat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet_outlined),
              label: 'Dompet'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_outlined), label: 'Akun')
        ],
      ),
    );
  }
}
