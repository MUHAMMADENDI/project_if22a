import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/config/asset.dart';
import 'package:project/event/event_db.dart';
import 'package:project/model/mahasiswa.dart';
import 'package:project/screen/admin/add_update_mahasiswa.dart';

class ListMahasiswa extends StatefulWidget {
  const ListMahasiswa({super.key});

  @override
  State<ListMahasiswa> createState() => _ListMahasiswaState();
}

class _ListMahasiswaState extends State<ListMahasiswa> {
  List<Mahasiswa> _listMahasiswa = [];

  void getMahasiswa() async {
    _listMahasiswa = await EventDb.getMahasiswa();

    setState(() {});
  }
  
  @override

  void initState() {
    getMahasiswa();
    super.initState();
  }

  void showOption(Mahasiswa? mahasiswa) async {
    var result = await Get.dialog(
        SimpleDialog(
          children: [
            ListTile(
              onTap: () => Get.back(result: 'update'),
              title: Text('Update'),
            ),
            ListTile(
              onTap: () => Get.back(result: 'delete'),
              title: Text('Delete'),
            ),
            ListTile(
              onTap: () => Get.back(),
              title: Text('Close'),
            )
          ],
        ),
        barrierDismissible: false);
    switch (result) {
      case 'update':
      Get.to(AddUpdateMahasiswa(mahasiswa: mahasiswa))
      ?.then((value) => getMahasiswa());
        break;
      case 'delete':
      EventDb.deleteMahasiswa(mahasiswa!.npm!)
      .then((Value) => getMahasiswa());
        break;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white,),
        title: Text(
          "Data Mahasiswa",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Asset.colorPrimary,
      ),
      body: Stack(
        children: [
          _listMahasiswa.length > 0
              ? ListView.builder(
                  itemCount: _listMahasiswa.length,
                  itemBuilder: (context, index) {
                    Mahasiswa mahasiswa = _listMahasiswa[index];
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                        backgroundColor: Colors.white,
                      ),
                      title: Text(mahasiswa.nama ?? ''),
                      subtitle: Text(mahasiswa.npm ?? ''),
                      trailing: IconButton(
                          onPressed: () {
                            showOption(mahasiswa);
                          }, icon: Icon(Icons.more_vert)),
                    );
                  },
                )
              : Center(
                  child: Text("Data Kosong"),
                ),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              onPressed: () => Get.to(AddUpdateMahasiswa())?.then((value) => getMahasiswa()),
              backgroundColor: Asset.colorAccent,
              child: Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}