import 'item.dart';

class pesanan {
  late int no_meja;
  String? nama_pemesan;
  late DateTime waktu_pemesanan;
  late List<item> daftar_pesanan;

  pesanan({required this.no_meja, this.nama_pemesan, required this.waktu_pemesanan, required this.daftar_pesanan}); //constructor?

}