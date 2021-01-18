import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:griyabayar/configs/shared_preferences.dart';
import 'package:griyabayar/models/user_model.dart';
import 'package:griyabayar/services/api_service.dart';
import 'package:stacked/stacked.dart';

class AccountViewModel extends BaseViewModel {
  final _apiService = APIService();
  FirebaseAuth auth = FirebaseAuth.instance;

  String _nameUser;
  String _phoneUser;
  String _avatarPath;
  String _urlBarcode;

  String get nameUser => _nameUser;
  String get phoneUser => _phoneUser;
  String get avatarPath => _avatarPath;
  String get urlBarcode => _urlBarcode;

  Future initial() async {
    setBusy(true);
    getUser();
    notifyListeners();
    setBusy(false);
  }

  Future getUser() async {
    notifyListeners();
    setBusy(true);
    var id = await UserSharedPreference.getUser();
    final data = await _apiService.getUser(id);
    UserModel result = UserModel.fromJson(json.decode(data.body));
    _nameUser = result.body[0].fullname;
    if (result.body[0].avatar != null) {
      _avatarPath = _apiService.url + result.body[0].avatar;
    }
    _phoneUser = result.body[0].phone;
    _urlBarcode = _apiService.baseURL + '/getinfouser/$_phoneUser';
    setBusy(false);
  }

  Future logOutUser() async {
    await UserSharedPreference.removeUser();
    await auth.signOut();
  }
}
