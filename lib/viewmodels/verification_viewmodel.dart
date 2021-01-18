import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:griyabayar/configs/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class VerificationViewModel extends BaseViewModel {
  VerificationViewModel(
      {@required this.phone, @required this.context, this.id});
  String phone;
  TextEditingController smsCode = TextEditingController();
  final String id;
  int _status;
  String _message;
  String _verificationID;
  int _forceResendingToken;
  BuildContext context;
  Timer codeTimer;
  int _timeSecond = 60;
  int _timeTimer;
  Timer _timer;
  FirebaseAuth auth = FirebaseAuth.instance;
  int get status => _status;
  String get message => _message;
  int get timeTimer => _timeTimer;

  Future initial() async {
    auth.setLanguageCode('id-ID');
    requestVerification();
  }

  void startTimer() {
    _timeTimer = 60;
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_timeTimer == 0) {
        timer.cancel();
      } else {
        _timeTimer--;
      }
      notifyListeners();
    });
  }

  void setMessageToNull() {
    _message = null;
    notifyListeners();
  }

  Future requestVerification() async {
    setBusy(true);

    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      setBusy(true);
      smsCode.text = phoneAuthCredential.smsCode;
      try {
        final result = await auth.signInWithCredential(phoneAuthCredential);
        if (result.user != null) {
          _message = "loading";
          await UserSharedPreference.setUser(id);
          setBusy(false);
          notifyListeners();
          return Navigator.pushNamedAndRemoveUntil(
              context, '/home', (route) => false);
        } else {
          _message = "Code/Autentifikasi tidak valid";
          setBusy(false);
        }
      } on Function catch (e) {
        print(e);
        _message = "Terjadi kesalahan, silakan coba lagi";
        setBusy(false);
      }
    };

    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      print("=== Error: verificationFailed ${authException.message}");
      _message = "Gagal Verifikasi, Error Code: ${authException.code}";
    };

    PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      startTimer();
      _verificationID = verificationId;
      _forceResendingToken = forceResendingToken;
    };

    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      print("=== Error: codeAutoRetrievalTimeout");
      _verificationID = verificationId;
    };

    try {
      await auth.verifyPhoneNumber(
        forceResendingToken: _forceResendingToken,
        phoneNumber: '+62' + phone,
        timeout: Duration(seconds: _timeSecond),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } catch (e) {
      _message = "Terjadi Kesalahan: ${e.code}";
      print("=== FirebaseAuthException: ${e.message}");
    }
    setBusy(false);
    notifyListeners();
  }

  Future onFormSubmitted() async {
    setBusy(true);

    AuthCredential _authCredential = PhoneAuthProvider.credential(
        verificationId: _verificationID, smsCode: smsCode.text);

    try {
      final result = await auth.signInWithCredential(_authCredential);
      if (result.user != null) {
        _message = "loading";
        await UserSharedPreference.setUser(id);
        setBusy(false);
        notifyListeners();
        return Navigator.pushNamedAndRemoveUntil(
            context, '/home', (route) => false);
      } else {
        _message = "Code/Autentifikasi tidak valid";
        setBusy(false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.message.toString().contains(
          "The sms verification code used to create the phone auth credential is invalid.")) {
        print(e);
        _message = "Kode Verifikasi tidak valid";
      } else {
        print(e);
        _message = "Terjadi kesalahan, silakan coba lagi";
      }

      setBusy(false);
    }
  }
}
