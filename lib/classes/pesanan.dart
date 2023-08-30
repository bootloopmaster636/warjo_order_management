import 'package:flutter/cupertino.dart';
import 'item.dart';

class pesanan extends ChangeNotifier {
  int? noMeja;
  String? namaPemesan;
  DateTime? waktuPemesanan;
  List<item>? daftarPesanan;
  int? totalHarga;

  pesanan({this.noMeja, this.namaPemesan, this.waktuPemesanan, this.daftarPesanan, this.totalHarga}); //constructor?

  pesanan setNamaPemesan(String nama) {
    namaPemesan = nama;
    return this;
  }

  pesanan setNoMeja(int no) {
    noMeja = no;
    return this;
  }

  pesanan initDaftarPesanan() {
    daftarPesanan = item.makeMenu();
    return this;
  }

  pesanan initPesanan() {
    noMeja = 0;
    namaPemesan = "";
    waktuPemesanan = DateTime.now();
    daftarPesanan = item.makeMenu();
    totalHarga = 0;
    notifyListeners();
    return this;
  }

  int setTotalHarga() {
    int total = 0;
    for (var element in daftarPesanan!) {
      total = total + (element.harga! * element.jumlah!);
    }
    return total;
  }

  pesanan setItemCount (int id, int count) {
    List<item>? daftarTemp = daftarPesanan;
    if (count >= 0) daftarTemp?[id].jumlah = count;
    totalHarga = setTotalHarga();
    daftarPesanan = daftarTemp;
    notifyListeners();
    return this;
  }

  pesanan setCatatanPesanan (int id, String catatan) {
    List<item>? daftarTemp = daftarPesanan;
    daftarTemp?[id].catatan = catatan;
    daftarPesanan = daftarTemp;
    notifyListeners();
    return this;
  }
}