import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static Future<void> saveStudentData({
    required String name,
    required String roll,
    required String email,
    required String mobile,
    required String branch,
    required String cgpa,
    required bool interested,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("name", name);
    await prefs.setString("roll", roll);
    await prefs.setString("email", email);
    await prefs.setString("mobile", mobile);
    await prefs.setString("branch", branch);
    await prefs.setString("cgpa", cgpa);
    await prefs.setBool("interested", interested);
  }

  static Future<Map<String, dynamic>> getStudentData() async {
    final prefs = await SharedPreferences.getInstance();

    return {
      "name": prefs.getString("name") ?? "",
      "roll": prefs.getString("roll") ?? "",
      "email": prefs.getString("email") ?? "",
      "mobile": prefs.getString("mobile") ?? "",
      "branch": prefs.getString("branch") ?? "",
      "cgpa": prefs.getString("cgpa") ?? "",
      "interested": prefs.getBool("interested") ?? false,
    };
  }

  static Future<void> clearData() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.clear();
  }
}
