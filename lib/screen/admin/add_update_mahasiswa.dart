import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/config/asset.dart';
import 'package:project/event/event_db.dart';
import 'package:project/model/mahasiswa.dart';
import 'package:project/screen/admin/list_mahasiswa.dart';
import 'package:project/widget/info.dart';

class AddUpdateMahasiswa extends StatefulWidget {
  final Mahasiswa? mahasiswa;
  AddUpdateMahasiswa({this.mahasiswa});

  @override
  State<AddUpdateMahasiswa> createState() => _AddUpdateMahasiswaState();
}

class _AddUpdateMahasiswaState extends State<AddUpdateMahasiswa> {

 var _formKey = GlobalKey<FormState>();
  var _controllerNpm = TextEditingController();
  var _controllerNama = TextEditingController();
  var _controllerAlamat = TextEditingController();

 bool _isHidden = true;

  @override
  void initState() {
    // TODO: implement initState
    if (widget.mahasiswa != null) {
      _controllerNpm.text = widget.mahasiswa!.npm!;
      _controllerNama.text = widget.mahasiswa!.nama!;
      _controllerAlamat.text = widget.mahasiswa!.alamat!;
    }
    super.initState();
    }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // titleSpacing: 0,
        title: widget.mahasiswa != null
            ? Text('Update Mahasiswa')
            : Text('Tambah Mahasiswa'),
        backgroundColor: Asset.colorPrimary,
      ),
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                TextFormField(
                  enabled: widget.mahasiswa == null ? true : false,
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerNpm,
                  decoration: InputDecoration(
                      labelText: "NPM",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerNama,
                  decoration: InputDecoration(
                      labelText: "Nama",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerAlamat,
                  decoration: InputDecoration(
                      labelText: "Alamat",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (widget.mahasiswa == null) {
                        String message = await EventDb.AddMahasiswa(
                          _controllerNpm.text,
                          _controllerNama.text,
                          _controllerAlamat.text,
                        );
                        Info.snackbar(message);
                        if (message.contains('Berhasil')) {
                          _controllerNpm.clear();
                          _controllerNama.clear();
                          _controllerAlamat.clear();
                          Get.off(
                            ListMahasiswa(),
                          );
                        }
                      } else {
                        EventDb.UpdateMahasiswa(
                          _controllerNpm.text,
                          _controllerNama.text,
                          _controllerAlamat.text,
                        );
                        Get.off(
                          ListMahasiswa(),
                        );
                      }
                    }
                  },
                  child: Text(
                    widget.mahasiswa == null ? 'Simpan' : 'Ubah',
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Asset.colorAccent,
                      fixedSize: Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}