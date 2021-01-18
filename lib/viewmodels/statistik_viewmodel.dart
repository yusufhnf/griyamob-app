import 'package:bezier_chart/bezier_chart.dart';
import 'package:griyabayar/configs/shared_preferences.dart';
import 'package:griyabayar/models/statistik_model.dart';
import 'package:griyabayar/models/user_model.dart';
import 'package:griyabayar/services/api_service.dart';
import 'package:stacked/stacked.dart';

class StatistikViewModel extends BaseViewModel {
  APIService _apiService = APIService();
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();
  String _name = '';
  String _nomorTelepon = '';
  int _countTransaksi = 0;
  int _pemasukan = 0;
  int _pengeluaran = 0;
  String _avatar;

  String get name => _name;
  String get avatar => _avatar;
  String get nomorTelepon => _nomorTelepon;
  String get countTransaksi => _countTransaksi.toString();
  int get pemasukan => _pemasukan;
  int get pengeluaran => _pengeluaran;
  var _id;

  UserModel resultUser;
  StatistikModel resultStatistik;
  List<DataPoint<DateTime>> resultDataPointDebet = [];
  List<DataPoint<DateTime>> resultDataPointKredit = [];
  Future initial() async {
    setBusy(true);
    _id = await UserSharedPreference.getUser();
    getUser();
    getStatistik();
    setBusy(false);
  }

  Future getStatistik() async {
    setBusy(true);
    setBusyForObject(resultStatistik, true);
    final data = await _apiService.statistik(_id);
    resultStatistik = statistikModelFromJson(data.body);
    for (var i = 0; i < resultStatistik.body.length; i++) {
      if (resultStatistik.body[i].action == "D") {
        resultDataPointDebet.add(DataPoint(
            value: resultStatistik.body[i].totalaksi.toDouble(),
            xAxis: resultStatistik.body[i].datetime));
      } else {
        resultDataPointKredit.add(DataPoint(
            value: resultStatistik.body[i].totalaksi.toDouble(),
            xAxis: resultStatistik.body[i].datetime));
      }
    }
    if (resultStatistik.body[0].datetime.month == DateTime.now().month) {
      if (resultStatistik.body[0].action == "K") {
        _pengeluaran = resultStatistik.body[0].totalnominal;
      }
      if (resultStatistik.body[1].action == "D") {
        _pemasukan = resultStatistik.body[1].totalnominal;
      }
      _countTransaksi =
          resultStatistik.body[0].totalaksi + resultStatistik.body[1].totalaksi;
    }
    setBusyForObject(resultStatistik, false);
    setBusy(false);
    notifyListeners();
  }

  Future getUser() async {
    setBusy(true);
    setBusyForObject(resultUser, true);
    final data = await _apiService.getUser(_id);
    resultUser = userModelFromJson(data.body);
    fromDate = resultUser.body[0].joined;
    _name = resultUser.body[0].fullname;
    _nomorTelepon = resultUser.body[0].phone;
    if (resultUser.body[0].avatar != null) {
      _avatar = _apiService.url + resultUser.body[0].avatar;
    }
    setBusyForObject(resultUser, false);
    setBusy(false);
    notifyListeners();
  }
}
