import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class AddOrder extends StatelessWidget {
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            title: Text('Tambah Order'),
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 1,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'No. Meja',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Flexible(
                        flex: 3,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Nama (opsional)',
                          ),
                        ),
                      ),
                    ],
                  ),
                  TabBar(tabs: [
                    Tab(
                        child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.food_bank_outlined),
                        SizedBox(
                          width: 8,
                        ),
                        Text("Makanan")
                      ],
                    )),
                    Tab(
                        child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.local_drink_outlined),
                        SizedBox(
                          width: 8,
                        ),
                        Text("Minuman")
                      ],
                    )),
                  ]),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.66,
                      child: TabBarView(children: [
                        ListView(
                          children: [
                            ItemCard(nama_item: "Soto"),
                            ItemCard(nama_item: "Bubur"),
                            ItemCard(nama_item: "Timlo"),
                            ItemCard(nama_item: "Bakmoy"),
                            ItemCard(nama_item: "naso"),
                            ItemCard(nama_item: "asdasdad")
                          ],
                        ),
                        ListView(
                          children: [
                            ItemCard(nama_item: "Teh"),
                            ItemCard(nama_item: "Jeruk"),
                            ItemCard(nama_item: "Teh Kampul"),
                            ItemCard(nama_item: "Kopi")
                          ],
                        ),
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: FilledButton(
                onPressed: () {
                  print("saved");
                },
                child: Text("Simpan Pesanan",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
          )),
    );
  }
}

class ItemCard extends StatelessWidget {
  final String nama_item;

  ItemCard({required this.nama_item});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Theme.of(context).colorScheme.surface,
        child: SizedBox(
          width: 420,
          height: 112,
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nama_item,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 16),
                      ),
                      const Align(
                        alignment: Alignment.bottomLeft,
                        child: SizedBox(
                          width: 300,
                          child: TextField(
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.edit,
                                  size: 16,
                                ),
                                labelText: "Catatan Pesanan",
                                isDense: true,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 0)),
                            style: TextStyle(fontSize: 14),
                            maxLines: 1,
                          ),
                        ),
                      )
                    ],
                  ),
                  Flexible(
                    child: WheelChooser.integer(
                      minValue: 0,
                      maxValue: 30,
                      initValue: 0,
                      onValueChanged: (s) {
                        print(s.toString());
                      },
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}

List MakeList_makanan(String json_data) {
  final List item_list = jsonDecode(json_data);
  return item_list;
}

Future<String?> getDownloadsDirectory() async {
  Directory? directory;
  try {
    if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    } else {
      directory = Directory('/storage/emulated/0/Download');
      // Put file in global download folder, if for an unknown reason it didn't exist, we fallback
      // ignore: avoid_slow_async_io
      if (!await directory.exists()) directory = await getExternalStorageDirectory();
    }
  } catch (err, stack) {
    print("Cannot get download folder path");
  }
  return directory?.path;
}

