import 'package:griyabayar/configs/shared_preferences.dart';
import 'package:griyabayar/configs/string_format.dart';
import 'package:griyabayar/models/promo_model.dart';
import 'package:griyabayar/models/user_model.dart';
import 'package:griyabayar/services/api_service.dart';
import 'package:griyabayar/widgets/menu_utama_item.dart';
import 'package:griyabayar/widgets/menu_saldo_item.dart';
import 'package:line_icons/line_icons.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final _apiService = APIService();
  String _greeting;
  String _namaUser;
  StringFormat _format = StringFormat();
  String _saldo;
  PromoModel promoResult;
  UserModel result;

  List<MenuSaldoItem> menuSaldoItem = [
    MenuSaldoItem(
      icon: LineIcons.plus_circle,
      label: "Top up",
      navigateTo: '/topup',
    ),
    MenuSaldoItem(
      icon: LineIcons.share_square_o,
      label: "Transfer",
      navigateTo: '/transfer',
    ),
    MenuSaldoItem(
      icon: LineIcons.qrcode,
      label: "Scan",
      navigateTo: '/scanqr',
    ),
    MenuSaldoItem(
      icon: LineIcons.bar_chart,
      label: "Statistik",
      navigateTo: '/statistik',
    ),
  ];

  List<MenuUtamaItem> menuUtamaItem = [
    MenuUtamaItem(
      icon: 'assets/icons/listrik-icon.svg',
      label: "PLN",
      navigateTo: null,
    ),
    MenuUtamaItem(
      icon: 'assets/icons/pdam-icon.svg',
      label: "PDAM",
      navigateTo: '/pdam',
    ),
    MenuUtamaItem(
      icon: 'assets/icons/pulsa-icon.svg',
      label: "Pulsa",
      navigateTo: null,
    ),
    MenuUtamaItem(
      icon: 'assets/icons/pendidikan-icon.svg',
      label: "Pendidikan",
      navigateTo: null,
    ),
    MenuUtamaItem(
      icon: 'assets/icons/invest-icon.svg',
      label: "Emas",
      navigateTo: null,
    ),
    MenuUtamaItem(
      icon: 'assets/icons/streaming-icon.svg',
      label: "Streaming",
      navigateTo: null,
    ),
    MenuUtamaItem(
      icon: 'assets/icons/internet-icon.svg',
      label: "Internet",
      navigateTo: null,
    ),
    MenuUtamaItem(
      icon: 'assets/icons/tiket-icon.svg',
      label: "Tiket",
      navigateTo: null,
    ),
  ];

  String get greeting => _greeting;
  String get namaUser => _namaUser;
  String get saldo => _saldo;

  Future initial() async {
    setBusy(true);
    getUser();
    getPromo();
    greetingMessage();
    notifyListeners();
    setBusy(false);
  }

  Future greetingMessage() async {
    // final DateTime now = DateTime.now();
    notifyListeners();
  }

  Future getUser() async {
    setBusy(true);
    setBusyForObject(result, true);
    var id = await UserSharedPreference.getUser();
    final data = await _apiService.getUser(id);
    result = userModelFromJson(data.body);
    _namaUser = result.body[0].fullname;
    _saldo = _format.getRupiahCurrency(result.body[0].saldo);
    if (result.body[0].saldo < 10000) {
      _greeting = "Segera isi saldomu ya";
    } else {
      _greeting = "Mau Transaksi apa";
    }
    setBusyForObject(result, false);
    setBusy(false);
    notifyListeners();
  }

  Future<PromoModel> getPromo() async {
    setBusy(true);
    setBusyForObject(promoResult, true);
    final data = await _apiService.getPromo();
    promoResult = promoModelFromJson(data.body);
    setBusyForObject(promoResult, false);
    setBusy(false);
    notifyListeners();
    return promoResult;
  }
}
