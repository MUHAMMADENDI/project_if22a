class Dosen {
  String? nidn;
  String? nama;
  String? alamat;
  String? prodi;

Dosen ({
  this.nidn,
  this.nama,
  this.alamat,
  this.prodi,
});

factory Dosen.fromJson(Map<String, dynamic> json) => Dosen(
  nidn: json['nidn'],
  nama: json['nama'],
  alamat: json['alamat'],
  prodi: json['prodi'],
  );

  Map<String, dynamic> toJson() => {
    'nidn':this.nidn,
    'nama':this.nama,
    'alamat':this.alamat,
    'prodi':this.prodi,
  };

}