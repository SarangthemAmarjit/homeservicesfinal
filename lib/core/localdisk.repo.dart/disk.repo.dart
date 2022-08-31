import 'package:shared_preferences/shared_preferences.dart';

class DiskRepo {
  String retriveusername = '';
  String retrivemail = '';
  int? retrivestatuscode;
  int? retrivestatuscode2;
  int? retriveid;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  save({
    required String savekey1,
    required String savekey2,
    required String getusername,
    required int getcode,
    required int id,
    required String getemail,
  }) async {
    final SharedPreferences prefs = await _prefs;

    prefs.setString('jwt', savekey1.toString());
    prefs.setString('username', getusername.toString());
    prefs.setString('jwt', savekey2.toString());
    prefs.setInt('statuscode', getcode);
    prefs.setString('email', getemail.toString());
    prefs.setInt('id', id);
  }

  save2({required int getcode}) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setInt('statuscode', getcode);
  }

  retrieve1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    retriveusername = prefs.getString('username').toString();
    return retriveusername;
  }

  retrieve2<int>() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    retrivestatuscode = prefs.getInt('statuscode');
    return retrivestatuscode;
  }

  retrieve3() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    retrivemail = prefs.getString('email').toString();
    return retrivemail;
  }
}
