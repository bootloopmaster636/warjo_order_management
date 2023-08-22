class item {
  late String nama;
  late String jenis;
  late int harga;
  late int jumlah;
  String? catatan;

  item(
      {required this.nama, required this.jenis, required this.harga, required this.jumlah, this.catatan});

  static List<item> makeMenuMakanan() {
    final List<item> menu = [
      //menu utama
      item(nama: "Bubur Ayam", jenis: "Makanan", harga: 8000, jumlah: 0),
      item(nama: "Nasi Soto Ayam", jenis: "Makanan", harga: 8000, jumlah: 0),
      item(nama: "Nasi Timlo", jenis: "Makanan", harga: 10000, jumlah: 0),
      item(nama: "Nasi Bakmoy Ayam", jenis: "Makanan", harga: 10000, jumlah: 0),

      //menu utama upsize
      item(nama: "Nasi Soto Ayam UPSIZE", jenis: "Makanan", harga: 12000, jumlah: 0),
      item(nama: "Nasi Timlo UPSIZE", jenis: "Makanan", harga: 14000, jumlah: 0),
      item(nama: "Nasi Bakmoy Ayam UPSIZE", jenis: "Makanan", harga: 14000, jumlah: 0),

      //tambahan
      item(nama: "Nasi Putih", jenis:"Makanan", harga: 4000, jumlah: 0),
      item(nama: "Telor Kecap", jenis:"Makanan", harga: 4000, jumlah: 0),

      //bungkus
      item(nama: "(BUNGKUS) Bubur Ayam", jenis: "Makanan", harga: 10000, jumlah: 0),
      item(nama: "(BUNGKUS) Nasi Soto Ayam", jenis: "Makanan", harga: 10000, jumlah: 0),
      item(nama: "(BUNGKUS) Nasi Timlo", jenis: "Makanan", harga: 12000, jumlah: 0),
      item(nama: "(BUNGKUS) Nasi Bakmoy Ayam", jenis: "Makanan", harga: 12000, jumlah: 0),
    ];
    return menu;
  }

  static List<item> makeMenuMinuman() {
    final List<item> menu = [
      //minuman
      item(nama: "Teh Manis", jenis: "Minuman", harga: 3000, jumlah: 0),
      item(nama: "Teh Tawar", jenis: "Minuman", harga: 3000, jumlah: 0),
      item(nama: "Teh Mondo", jenis: "Minuman", harga: 3000, jumlah: 0),
      item(nama: "Es Teh Manis", jenis: "Minuman", harga: 3000, jumlah: 0),
      item(nama: "Es Teh Tawar", jenis: "Minuman", harga: 3000, jumlah: 0),
      item(nama: "Es Teh Mondo", jenis: "Minuman", harga: 3000, jumlah: 0),
      item(nama: "Teh Kampul", jenis: "Minuman", harga: 4000, jumlah: 0),
      item(nama: "Es Teh Kampul", jenis: "Minuman", harga: 4000, jumlah: 0),
      item(nama: "Jeruk Peras Hangat", jenis: "Minuman", harga: 4000, jumlah: 0),
      item(nama: "Es Jeruk Peras", jenis: "Minuman", harga: 4000, jumlah: 0),
      item(nama: "Kopi", jenis: "Minuman", harga: 5000, jumlah: 0),
      item(nama: "Es Kopi", jenis: "Minuman", harga: 5000, jumlah: 0),
      item(nama: "Air Hangat", jenis: "Minuman", harga: 1000, jumlah: 0),
      item(nama: "Air Es", jenis: "Minuman", harga: 1000, jumlah: 0),
      item(nama: "Air Mineral Botol", jenis: "Minuman", harga: 4000, jumlah: 0),
    ];
    return menu;
  }
}