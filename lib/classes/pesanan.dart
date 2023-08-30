import 'package:flutter/cupertino.dart';
import 'item.dart';

class pesanan extends ChangeNotifier {
  int? no_meja;
  String? nama_pemesan;
  DateTime? waktu_pemesanan;
  List<item>? daftar_pesanan;
  int? total_harga;

  pesanan({this.no_meja, this.nama_pemesan, this.waktu_pemesanan, this.daftar_pesanan, this.total_harga}); //constructor?

  pesanan setNamaPemesan(String nama) {
    nama_pemesan = nama;
    return this;
  }

  pesanan setNoMeja(int no) {
    no_meja = no;
    return this;
  }

  pesanan initDaftarPesanan() {
    daftar_pesanan = item.makeMenu();
    return this;
  }

  pesanan initPesanan() {
    no_meja = 0;
    nama_pemesan = "";
    waktu_pemesanan = DateTime.now();
    daftar_pesanan = item.makeMenu();
    total_harga = 0;
    notifyListeners();
    return this;
  }

  int setTotalHarga() {
    int total = 0;
    daftar_pesanan!.forEach((element) {
      total = total + (element.harga! * element.jumlah!);
    });
    return total;
  }

  pesanan setItemCount (int id, int count) {
    List<item>? daftarTemp = daftar_pesanan;
    if (count >= 0) daftarTemp?[id].jumlah = count;
    total_harga = setTotalHarga();
    daftar_pesanan = daftarTemp;
    notifyListeners();
    return this;
  }

  pesanan setCatatanPesanan (int id, String catatan) {
    List<item>? daftarTemp = daftar_pesanan;
    daftarTemp?[id].catatan = catatan;
    daftar_pesanan = daftarTemp;
    notifyListeners();
    return this;
  }
}