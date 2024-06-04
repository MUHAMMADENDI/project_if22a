import 'package:get/get.dart';
import 'package:project/model/mahasiswa.dart';


class Cmahasiswa extends GetxController {
  Rx<Mahasiswa> _mahasiswa = Mahasiswa().obs;

  Mahasiswa get mahasiswa => _mahasiswa.value;

  void setMahasiswa(Mahasiswa dataMahasiswa) => 
  _mahasiswa.value = dataMahasiswa;
}

