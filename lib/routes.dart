import 'package:flutter/material.dart';
import 'package:griyabayar/utils/route_paths.dart' as routes;
import 'package:griyabayar/views/account_view.dart';
import 'package:griyabayar/views/detail_view.dart';
import 'package:griyabayar/views/history_view.dart';
import 'package:griyabayar/views/home_view.dart';
import 'package:griyabayar/views/landing_view.dart';
import 'package:griyabayar/views/login_view.dart';
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

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.LandingRoute:
      return MaterialPageRoute(builder: (context) => LandingView());
    case routes.HomeRoute:
      return MaterialPageRoute(builder: (context) => HomeView());
    case routes.SplashRoute:
      return MaterialPageRoute(builder: (context) => SplashView());
    case routes.LoginRoute:
      return MaterialPageRoute(builder: (context) => LoginView());
    case routes.RegisterRoute:
      return MaterialPageRoute(builder: (context) => RegisterView());
    case routes.VerificationRoute:
      return MaterialPageRoute(builder: (context) => VerificationView());
    case routes.AccountRoute:
      return MaterialPageRoute(builder: (context) => AccountView());
    case routes.HistoryRoute:
      return MaterialPageRoute(builder: (context) => HistoryView());
    case routes.DetailRoute:
      return MaterialPageRoute(builder: (context) => DetailView());
    case routes.TopUpRoute:
      return MaterialPageRoute(builder: (context) => TopUpView());
    case routes.NotificationRoute:
      return MaterialPageRoute(builder: (context) => NotificationView());
    case routes.TransaksiSuksesRoute:
      return MaterialPageRoute(builder: (context) => TransaksiSuksesView());
    case routes.PDAMRouteRoute:
      return MaterialPageRoute(builder: (context) => PDAMView());
    case routes.PrivasiRoute:
      return MaterialPageRoute(builder: (context) => PrivasiWebView());
    case routes.TransaksiDetailRoute:
      return MaterialPageRoute(builder: (context) => TransaksiDetailView());
    case routes.ShowQRRoute:
      return MaterialPageRoute(builder: (context) => ShowQRCodeView());
    case routes.ScanQRRoute:
      return MaterialPageRoute(builder: (context) => ScanQRView());
    case routes.TransferRoute:
      return MaterialPageRoute(builder: (context) => TransferView());
    case routes.PromoRoute:
      return MaterialPageRoute(builder: (context) => PromoView());
    case routes.StatistikRoute:
      return MaterialPageRoute(builder: (context) => StatistikView());

    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text('No path for ${settings.name}'),
          ),
        ),
      );
  }
}
