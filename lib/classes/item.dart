class item {
  late String nama;
  late String jenis;
  late int harga;
  late int jumlah;
  String? catatan;

  item({required this.nama, required this.jenis,required this.harga, required this.jumlah, this.catatan});

  item.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    jenis = json['jenis'];
    harga = json['harga'];
    jumlah = json['jumlah'];
    catatan = json['catatan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama'] = this.nama;
    data['jenis'] = this.jenis;
    data['harga'] = this.harga;
    data['jumlah'] = this.jumlah;
    data['catatan'] = this.catatan;
    return data;
  }
}
