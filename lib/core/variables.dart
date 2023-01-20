import 'package:shared_preferences/shared_preferences.dart';

import 'data_access.dart';

class Variables{

  static DataAccess dataAccess = DataAccess();
  static String? taskName;
  static SharedPreferences? taskShPreference;

}