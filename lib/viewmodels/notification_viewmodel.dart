import 'package:griyabayar/models/notification_model.dart';
import 'package:griyabayar/services/api_service.dart';
import 'package:stacked/stacked.dart';

class NotificationViewModel extends BaseViewModel {
  final _apiService = APIService();

  NotificationModel result;

  Future initial() async {
    setBusy(true);
    getNotification();
    notifyListeners();
    setBusy(false);
  }

  Future<NotificationModel> getNotification() async {
    setBusy(true);
    setBusyForObject(result, true);
    final data = await _apiService.getNotification();
    result = notificationModelFromJson(data.body);
    setBusyForObject(result, false);
    setBusy(false);
    notifyListeners();
    return result;
  }
}
