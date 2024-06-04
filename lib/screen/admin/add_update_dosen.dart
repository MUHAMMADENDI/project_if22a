import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/config/asset.dart';
import 'package:project/event/event_db.dart';
import 'package:project/screen/admin/list_dosen.dart';
import 'package:project/widget/info.dart';
import 'package:project/model/dosen.dart';

class AddUpdateDosen extends StatefulWidget {
  final Dosen? dosen;
  AddUpdateDosen({this.dosen});

  @override
  State<AddUpdateDosen> createState() => _AddUpdateDosenState();
}

class _AddUpdateDosenState extends State<AddUpdateDosen> {
  final _formKey = GlobalKey<FormState>();
  final _controllernidn = TextEditingController();
  final _controllernama = TextEditingController();
  final _controlleralamat = TextEditingController();
  final _controllerprodi = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.dosen != null) {
      _controllernidn.text = widget.dosen!.nidn!;
      _controllernama.text = widget.dosen!.nama!;
      _controlleralamat.text = widget.dosen!.alamat!;
      _controllerprodi.text = widget.dosen!.prodi!;
    }
  }

  @override
  void dispose() {
    _controllernidn.dispose();
    _controllernama.dispose();
    _controlleralamat.dispose();
    _controllerprodi.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: widget.dosen != null ? Text('Update Dosen') : Text('Tambah Dosen'),
        backgroundColor: Asset.colorPrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                enabled: widget.dosen == null,
                validator: (value) => value!.isEmpty ? 'Jangan Kosong' : null,
                controller: _controllernidn,
                decoration: InputDecoration(
                  labelText: "NIDN",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                validator: (value) => value!.isEmpty ? 'Jangan Kosong' : null,
                controller: _controllernama,
                decoration: InputDecoration(
                  labelText: "Nama",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                validator: (value) => value!.isEmpty ? 'Jangan Kosong' : null,
                controller: _controlleralamat,
                decoration: InputDecoration(
                  labelText: "Alamat",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                validator: (value) => value!.isEmpty ? 'Jangan Kosong' : null,
                controller: _controllerprodi,
                decoration: InputDecoration(
                  labelText: "Prodi",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    String message;
                    if (widget.dosen == null) {
                      message = await EventDb.AddDosen(
                        _controllernidn.text,
                        _controllernama.text,
                        _controlleralamat.text,
                        _controllerprodi.text,
                      );
                      Info.snackbar(message);
                      if (message.contains('Berhasil')) {
                        _formKey.currentState!.reset();
                        Get.off(() => ListDosen());
                      }
                    } else {
                       EventDb.UpdateDosen(
                        _controllernidn.text,
                        _controllernama.text,
                        _controlleralamat.text,
                        _controllerprodi.text,
                      );
                      
                        Get.off(() => ListDosen(),
                        );

                    }
                  }
                },
                child: Text(widget.dosen == null ? 'Simpan' : 'Ubah', style: TextStyle(fontSize: 16)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Asset.colorAccent,
                  fixedSize: Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
