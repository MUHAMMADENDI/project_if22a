import 'dart:convert';
import 'package:get/get.dart';
import 'package:project/config/api.dart';
import 'package:project/event/event_pref.dart';
import 'package:project/model/dosen.dart';
import 'package:project/model/mahasiswa.dart';
import 'package:http/http.dart' as http;
import 'package:project/model/user.dart';
import 'package:project/screen/admin/dashboard_admin.dart';
import 'package:project/widget/info.dart';

class EventDb {
 static Future<List<Mahasiswa>> getMahasiswa() async {
    List<Mahasiswa> listMahasiswa = [];

    try {
      var response = await http.get(Uri.parse(Api.getMahasiswa));
      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          var mahasiswa = responBody['mahasiswa'];

          mahasiswa.forEach((mahasiswa) {
            listMahasiswa.add(Mahasiswa.fromJson(mahasiswa));
          });
        }
      }
    } catch (e) {
      print(e);
    }

    return listMahasiswa;
  }

  static Future<String> AddMahasiswa(
      String npm, String nama, String alamat) async {
    String reason;

    try {
      var response = await http.post(Uri.parse(Api.addMahasiswa), body: {
        'text_npm': npm,
        'text_nama': nama,
        'text_alamat': alamat
      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          reason = 'Add Mahasiswa Berhasil';
        } else {
          reason = responBody['reason'];
        }
      } else {
        reason = "Request Gagal";
      }
    } catch (e) {
      print(e);
      reason = e.toString();
    }

    return reason;

  }

 static Future<void> UpdateMahasiswa(
      String npm, String nama, String alamat) async {
    try {
      var response = await http.post(Uri.parse(Api.updateMahasiswa), body: {
        'text_npm': npm,
        'text_nama': nama,
        'text_alamat': alamat,
      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          Info.snackbar('Berhasil Update Mahasiswa');
        } else {
          Info.snackbar('Berhasil Update Mahasiswa');
        }
      }
    } catch (e) {
      print(e);
    }
  }
  static Future<void> deleteMahasiswa(String npm) async {
    try {
      var response = await http
          .post(Uri.parse(Api.deleteMahasiswa), body: {'npm': npm});

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          Info.snackbar('Berhasil Delete Mahasiswa');
        } else {
          Info.snackbar('Gagal Delete Mahasiswa');
        }
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<List<Dosen>> getDosen() async {
    List<Dosen> listDosen = [];

    try {
      var response = await http.get(Uri.parse(Api.getdosen));
      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          var dosen = responBody['dosen'];

          dosen.forEach((dosen) {
            listDosen.add(Dosen.fromJson(dosen));
          });
        }
      }
    } catch (e) {
      print(e);
    }

    return listDosen;
  }

  static Future<String> AddDosen(
      String nidn, String nama, String alamat, String prodi) async {
    String reason;

    try {
      var response = await http.post(Uri.parse(Api.addMahasiswa), body: {
        'nidn': nidn,
        'nama': nama,
        'alamat': alamat,
        'prodi': prodi

      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          reason = 'Add Dosen Berhasil';
        } else {
          reason = responBody['reason'];
        }
      } else {
        reason = "Request Gagal";
      }
    } catch (e) {
      print(e);
      reason = e.toString();
    }

    return reason;

  }

 static Future<void> UpdateDosen(
      String npm, String nama, String alamat, String prodi) async {
    try {
      var response = await http.post(Uri.parse(Api.updatedosen), body: {
        'nidn': npm,
        'nama': nama,
        'alamat': alamat,
        'prodi': prodi
      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          Info.snackbar('Berhasil Update Dosen');
        } else {
          Info.snackbar('Berhasil Update Dosen');
        }
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> deletedosen(String nidn) async {
    try {
      var response = await http
          .post(Uri.parse(Api.deleteMahasiswa), body: {'nidn': nidn});

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          Info.snackbar('Berhasil Delete Dosen');
        } else {
          Info.snackbar('Gagal Delete Doen');
        }
      }
    } catch (e) {
      print(e);
    }
  }
  
  static Future<User?> login(String username, String pass) async {
    User? user;

    try {
      var response = await http.post(Uri.parse(Api.login), body: {
        'text_username': username,
        'text_pass': pass,
      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);

        if (responBody['success']) {
          user = User.fromJson(responBody['user']);
          EventPref.saveUser(user);
          Info.snackbar('Login Berhasil');
          Future.delayed(Duration(milliseconds: 1700), () {
            Get.off(
              DashboardAdmin(),
            );
          });
        } else {
          Info.snackbar('Login Gagal');
        }
      } else {
        Info.snackbar('Request Login Gagal');
      }
    } catch (e) {
      print(e);
    }
    return user;
  }

}