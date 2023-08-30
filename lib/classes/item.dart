class item {
  String? _nama;
  String? _jenis;
  int? _harga;
  int? _jumlah;
  String? _catatan;
  int? _id;

  item(
      {int id = 0,
      String nama = "",
      String jenis = "",
      int harga = 0,
      int jumlah = 0,
      String? catatan})
      : _id = id,
        _nama = nama,
        _jenis = jenis,
        _harga = harga,
        _jumlah = jumlah,
        _catatan = "Tulis Catatan Pesanan...";


  static List<item> makeMenu() {
    final List<item> menu = [
      //menu utama
      item(id: 0, nama: "Bubur Ayam", jenis: "Makanan", harga: 8000, jumlah: 0),
      item(id: 1, nama: "Nasi Soto Ayam", jenis: "Makanan", harga: 8000, jumlah: 0),
      item(id: 2, nama: "Nasi Timlo", jenis: "Makanan", harga: 10000, jumlah: 0),
      item(id: 3, nama: "Nasi Bakmoy Ayam", jenis: "Makanan", harga: 10000, jumlah: 0),

      //menu utama upsize
      item(id: 4,
          nama: "Nasi Soto Ayam UPSIZE",
          jenis: "Makanan",
          harga: 12000,
          jumlah: 0),
      item(id: 5,
          nama: "Nasi Timlo UPSIZE", jenis: "Makanan", harga: 14000, jumlah: 0),
      item(id: 6,
          nama: "Nasi Bakmoy Ayam UPSIZE",
          jenis: "Makanan",
          harga: 14000,
          jumlah: 0),

      //tambahan
      item(id: 7, nama: "Nasi Putih", jenis: "Tambahan", harga: 4000, jumlah: 0),
      item(id: 8, nama: "Telor Kecap", jenis: "Tambahan", harga: 4000, jumlah: 0),

      //bungkus
      item(id: 9,
          nama: "(BUNGKUS) Bubur Ayam",
          jenis: "Bungkus",
          harga: 10000,
          jumlah: 0),
      item(id: 10,
          nama: "(BUNGKUS) Nasi Soto Ayam",
          jenis: "Bungkus",
          harga: 10000,
          jumlah: 0),
      item(id: 11,
          nama: "(BUNGKUS) Nasi Timlo",
          jenis: "Bungkus",
          harga: 12000,
          jumlah: 0),
      item(id: 12,
          nama: "(BUNGKUS) Nasi Bakmoy Ayam",
          jenis: "Bungkus",
          harga: 12000,
          jumlah: 0),
      //minuman
      item(id: 13, nama: "Teh Manis", jenis: "Minuman", harga: 3000, jumlah: 0),
      item(id: 14, nama: "Teh Tawar", jenis: "Minuman", harga: 3000, jumlah: 0),
      item(id: 15, nama: "Teh Mondo", jenis: "Minuman", harga: 3000, jumlah: 0),
      item(id: 16, nama: "Es Teh Manis", jenis: "Minuman", harga: 3000, jumlah: 0),
      item(id: 17, nama: "Es Teh Tawar", jenis: "Minuman", harga: 3000, jumlah: 0),
      item(id: 18, nama: "Es Teh Mondo", jenis: "Minuman", harga: 3000, jumlah: 0),
      item(id: 19, nama: "Teh Kampul", jenis: "Minuman", harga: 4000, jumlah: 0),
      item(id: 20, nama: "Es Teh Kampul", jenis: "Minuman", harga: 4000, jumlah: 0),
      item(id: 21,
          nama: "Jeruk Peras Hangat", jenis: "Minuman", harga: 4000, jumlah: 0),
      item(id: 22, nama: "Es Jeruk Peras", jenis: "Minuman", harga: 4000, jumlah: 0),
      item(id: 23, nama: "Kopi", jenis: "Minuman", harga: 5000, jumlah: 0),
      item(id: 24, nama: "Es Kopi", jenis: "Minuman", harga: 5000, jumlah: 0),
      item(id: 25, nama: "Air Hangat", jenis: "Minuman", harga: 1000, jumlah: 0),
      item(id: 26, nama: "Air Es", jenis: "Minuman", harga: 1000, jumlah: 0),
      item(id: 27, nama: "Air Mineral Botol", jenis: "Minuman", harga: 4000, jumlah: 0),
    ];
    return menu;
  }

  String? get nama => _nama;

  String? get jenis => _jenis;

  String? get catatan => _catatan;

  int? get jumlah => _jumlah;

  int? get harga => _harga;

  int? get id => _id;

  set jumlah(int? value) {
    _jumlah = value;
  }

  set catatan(String? note) {
    _catatan = note;
  }
}
