class Api{
  static const _host = "http://192.168.56.1/api_if22a";

  static String _mahasiswa ="$_host/mahasiswa";
  static String login ="$_host/login.php";

  //mahasiswa
  static String getMahasiswa ="$_mahasiswa/view.php";
  static String addMahasiswa ="$_mahasiswa/add.php";
  static String updateMahasiswa ="$_mahasiswa/update.php";
  static String deleteMahasiswa ="$_mahasiswa/delete.php";

  
  static String _dosen ="$_host/dosen";

  //dosen
  static String getdosen ="$_dosen/view.php";
  static String adddosen ="$_dosen/add.php";
  static String updatedosen ="$_dosen/update.php";
  static String deletedosen ="$_dosen/delete.php";

  

}
