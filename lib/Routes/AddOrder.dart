import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:warjo_order_management/classes/pesanan.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

import '../classes/item.dart';

final tempPesananProvider =
    ChangeNotifierProvider((ref) => pesanan().initPesanan());
var formatter = NumberFormat('###,###,###');

class AddOrder extends StatelessWidget {
  const AddOrder({Key? key}) : super(key: key);

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
                  const TabBar(tabs: [
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
                      width: MediaQuery.of(context).size.width,
                      child: TabBarView(children: [
                        Consumer(builder: (context, ref, _) {
                          final makananItems =
                              (ref.watch(tempPesananProvider).daftar_pesanan)
                                  ?.where((item) => item.jenis == "Makanan")
                                  .toList();
                          return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  (MediaQuery.of(context).size.width / 480)
                                      .round(),
                              mainAxisExtent: 120,
                            ),
                            itemCount: makananItems?.length,
                            itemBuilder: (context, index) {
                              return ItemCard(
                                  items: makananItems![index], id: index);
                            },
                          );
                        }),
                        Consumer(builder: (context, ref, _) {
                          final minumanItems =
                              (ref.watch(tempPesananProvider).daftar_pesanan)
                                  ?.where((item) => item.jenis == "Minuman")
                                  .toList();
                          return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  (MediaQuery.of(context).size.width / 400)
                                      .round(),
                              mainAxisExtent: 120,
                            ),
                            itemCount: minumanItems?.length,
                            itemBuilder: (context, index) {
                              return ItemCard(
                                  items: minumanItems![index],
                                  id: index +
                                      13); //13 is the start index of "minuman" items
                            },
                          );
                        }),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Simpan Pesanan",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                    Consumer(builder: (context, ref, _) {
                      return Text(
                        "Total Rp. ${formatter.format(ref.watch(tempPesananProvider).total_harga)}",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      );
                    }),
                  ],
                )),
          )),
    );
  }
}

class ItemCard extends ConsumerWidget {
  final item items;
  final int id;

  ItemCard({required this.items, required this.id});

  TextEditingController _catatanPesananController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Card(
        color: Theme.of(context).colorScheme.surface,
        child: SizedBox(
          width: 400,
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
                        items.nama?.toString() ?? "null",
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 16),
                      ),
                      Text(
                        "Rp. ${items.harga.toString()}",
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 14),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: SizedBox(
                          width: 300,
                          child: TextField(
                            controller: _catatanPesananController,
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
                            onSubmitted: (s) {
                              ref.read(tempPesananProvider).setCatatanPesanan(id, s);
                              _catatanPesananController.text = items.catatan!;
                              print("var s = ${s}, var items = ${items.catatan}");
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: WheelChooser.integer(
                      minValue: 0,
                      maxValue: 30,
                      initValue: ref
                          .read(tempPesananProvider)
                          .daftar_pesanan?[id]
                          .jumlah,
                      onValueChanged: (s) {
                        ref.read(tempPesananProvider).setItemCount(id, s);
                        print(ref
                            .read(tempPesananProvider)
                            .daftar_pesanan![id]
                            .jumlah);
                      },
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
