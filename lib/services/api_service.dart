import 'package:griyabayar/models/inquiryrequest_model.dart';
import 'package:griyabayar/models/mkmrequest_model.dart';
import 'package:http/http.dart' as http;

class APIService {
  static String _url = "http://192.168.36.192:3000";
  static String _baseURL = _url + '/griyatest/users';
  static String _mkmURL =
      _url + '/h2hmkm-trial/h2hmkm-trial/iface_h2hmkm/interface.php';

  String get baseURL => _baseURL;
  String get url => _url;

  Future loginUser(String email, String password) async {
    var request = {"email": email, "password": password};
    var response = http.post("$_baseURL/login", body: request);
    return response;
  }

  Future createUser(
      String email, String phone, String fullname, String password) async {
    var request = {
      "email": email,
      "phone": phone,
      "fullname": fullname,
      "password": password
    };
    var response = http.post("$_baseURL/register", body: request);
    return response;
  }

  Future getUser(String id) {
    var request = {
      "idusers": id,
    };
    var response = http.post("$_baseURL/summary", body: request);
    return response;
  }

  Future requestTopup(String id, String nominal) {
    var request = {
      "iduser": id,
      "jumlah": nominal,
    };
    var response = http.post("$_baseURL/topup", body: request);
    return response;
  }

  Future getNotification() {
    var response = http.get("$_baseURL/notification");
    return response;
  }

  Future getTransferUser(String url) {
    final response = http.get(url);
    return response;
  }

  Future getPromo() {
    var response = http.get("$_baseURL/promo");
    return response;
  }

  Future getAllTopup(String id) {
    var request = {
      "iduser": id,
    };
    var response = http.post("$_baseURL/alltopup", body: request);
    return response;
  }

  Future getAllHistory(String id) {
    var request = {
      "iduser": id,
    };
    var response = http.post("$_baseURL/history", body: request);
    return response;
  }

  Future getAllPDAM() {
    var response = http.get("$_baseURL/pdamloc");
    return response;
  }

  Future inquiryMKM(InquiryRequest request) {
    var req = inquiryRequestToJson(request);
    var response = http.post("$_mkmURL", body: req);
    return response;
  }

  Future paymentAdviceMKM(MkmRequest request) {
    var req = mkmRequestToJson(request);
    var response = http.post("$_mkmURL", body: req);
    return response;
  }

  Future paymentTransaction(String jumlah, String id) {
    var request = {"iduser": id, "jumlah": jumlah};
    var response = http.post("$_baseURL/pay", body: request);
    return response;
  }

  Future addHistory(String jumlah, String iduser, String action, String noref,
      String detail, String sumbertarget) {
    var request = {
      "iduser": iduser,
      "jumlah": jumlah,
      "action": action,
      "noref": noref,
      "detail": detail,
      "sumbertarget": sumbertarget
    };
    var response = http.post("$_baseURL/savehistory", body: request);
    return response;
  }

  Future saveHistory(String action, int jumlah, String noref, String detail,
      String iduser, String sumberTarget) {
    var request = {
      "action": action,
      "jumlah": jumlah,
      "noref": noref,
      "detail": detail,
      "iduser": iduser,
      "sumbertarget": sumberTarget,
    };

    var response = http.post("$_baseURL/savehistory", body: request);
    return response;
  }

  Future transferTransaction(String iduser, String namauser, String idtarget,
      String namaTarget, String jumlah) {
    var request = {
      "iduser": iduser,
      "namauser": namauser,
      "namatarget": namaTarget,
      "idtarget": idtarget,
      "jumlah": jumlah
    };
    var response = http.post("$_baseURL/transfer", body: request);
    return response;
  }

  Future statistik(String id) {
    var request = {
      "idusers": id,
    };
    var response = http.post("$_baseURL/statistik", body: request);
    return response;
  }
}
