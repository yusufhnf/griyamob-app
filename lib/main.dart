import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:griyabayar/locator.dart';
import 'package:griyabayar/views/account_view.dart';
import 'package:griyabayar/views/detail_view.dart';
import 'package:griyabayar/views/history_view.dart';
import 'package:griyabayar/views/landing_view.dart';
import 'package:griyabayar/views/login_view.dart';
import 'package:griyabayar/views/navigation_view.dart';
import 'package:griyabayar/views/notification_view.dart';
import 'package:griyabayar/views/pdam_view.dart';
import 'package:griyabayar/views/privasirule_webview.dart';
import 'package:griyabayar/views/promo_view.dart';
import 'package:griyabayar/views/register_view.dart';
import 'package:griyabayar/views/scanqr_view.dart';
import 'package:griyabayar/views/showqrcode_view.dart';
import 'package:griyabayar/views/splash_view.dart';
import 'package:griyabayar/views/statistik_view.dart';
import 'package:griyabayar/views/topup_view.dart';
import 'package:griyabayar/views/transaksidetail_view.dart';
import 'package:griyabayar/views/transaksisukses_view.dart';
import 'package:griyabayar/views/transfer_view.dart';
import 'package:griyabayar/views/verification_view.dart';

void main() async {
  /*  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent)); */
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GriyaMobile',
      routes: {
        '/landing': (context) => LandingView(),
        '/login': (context) => LoginView(),
        '/register': (context) => RegisterView(),
        '/home': (context) => NavigationView(),
        '/account': (context) => AccountView(),
        '/history': (context) => HistoryView(),
        '/detail': (context) => DetailView(),
        '/topup': (context) => TopUpView(),
        '/notifikasi': (context) => NotificationView(),
        '/transaksisukses': (context) => TransaksiSuksesView(),
        '/pdam': (context) => PDAMView(),
        '/privasi': (context) => PrivasiWebView(),
        '/transaksidetail': (context) => TransaksiDetailView(),
        '/showqr': (context) => ShowQRCodeView(),
        '/scanqr': (context) => ScanQRView(),
        '/transfer': (context) => TransferView(),
        '/verification': (context) => VerificationView(),
        '/promo': (context) => PromoView(),
        '/statistik': (context) => StatistikView()
      },
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: GoogleFonts.poppins().fontFamily),
      home: SplashView(),
    );
  }
}
