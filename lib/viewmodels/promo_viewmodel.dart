import 'package:griyabayar/models/promo_model.dart';
import 'package:griyabayar/services/api_service.dart';
import 'package:stacked/stacked.dart';

class PromoViewModel extends BaseViewModel {
  final _apiService = APIService();
  PromoModel resultPromo;
  Future initial() async {
    getPromo();
  }

  Future<PromoModel> getPromo() async {
    setBusy(true);
    setBusyForObject(resultPromo, true);
    final data = await _apiService.getPromo();
    setBusyForObject(resultPromo, false);
    setBusy(false);
    notifyListeners();
    resultPromo = promoModelFromJson(data.body);
    return resultPromo;
  }
}
