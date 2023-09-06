import '/providers/_base.dart';

class CustomTabBarProvider extends BaseProvider {
  int? _selectedWidgetId;

  int? get selectedWidgetId {
    _selectedWidgetId ??= 0;
    return _selectedWidgetId;
  }

  set setSelectedWidgetId(int? value) {
    _selectedWidgetId = value;
    notifyListeners();
  }
}
