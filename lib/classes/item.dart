class item {
  late String nama;
  late String jenis;
  late int jumlah;
  String? catatan;

  item({required this.nama, required this.jenis, required this.jumlah, this.catatan});

  item.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    jenis = json['jenis'];
    jumlah = json['jumlah'];
    catatan = json['catatan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama'] = this.nama;
    data['jenis'] = this.jenis;
    data['jumlah'] = this.jumlah;
    data['catatan'] = this.catatan;
    return data;
  }
}
