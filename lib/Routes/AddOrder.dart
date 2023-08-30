import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:warjo_order_management/classes/pesanan.dart';
import '../classes/item.dart';

final tempPesananProvider = ChangeNotifierProvider((ref) => pesanan().initPesanan());
var formatter = NumberFormat('###,###,###');

class AddOrder extends ConsumerWidget {
  const AddOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            title: const Text('Tambah Order'),
            actions: [
              TextButton(
                  onPressed: () {
                    Fluttertoast.showToast(msg: "Tahan tombol reset untuk melakukan reset");
                  },
                  onLongPress: () {
                    ref.read(tempPesananProvider).initPesanan();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.lock_reset_outlined,
                        color: Theme.of(context).colorScheme.error,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text("Reset", style: TextStyle(color: Theme.of(context).colorScheme.error)),
                    ],
                  ))
            ],
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
                  const TabBar(isScrollable: true, tabs: [
                    Tab(
                        child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [Text("Makanan")],
                    )),
                    Tab(
                        child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [Text("Minuman")],
                    )),
                    Tab(
                        child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [Text("Tambahan")],
                    )),
                    Tab(
                        child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [Text("Bungkus")],
                    )),
                  ]),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.66,
                      width: MediaQuery.of(context).size.width,
                      child: TabBarView(children: [
                        Consumer(builder: (context, ref, _) {
                          final makananItems =
                              (ref.watch(tempPesananProvider).daftarPesanan)?.where((data) => data.jenis == "Makanan").toList();
                          return GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: (MediaQuery.of(context).size.width / 480).round(),
                              mainAxisExtent: 120,
                            ),
                            itemCount: makananItems?.length,
                            itemBuilder: (context, index) {
                              return ItemCard(items: makananItems![index], id: makananItems[index].id);
                            },
                          );
                        }),
                        Consumer(builder: (context, ref, _) {
                          final minumanItems =
                              (ref.watch(tempPesananProvider).daftarPesanan)?.where((data) => data.jenis == "Minuman").toList();
                          return GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: (MediaQuery.of(context).size.width / 400).round(),
                                mainAxisExtent: 120,
                              ),
                              itemCount: minumanItems?.length,
                              itemBuilder: (context, index) {
                                return ItemCard(items: minumanItems![index], id: minumanItems[index].id);
                              });
                        }),
                        Consumer(builder: (context, ref, _) {
                          final tambahanItems =
                              (ref.watch(tempPesananProvider).daftarPesanan)?.where((data) => data.jenis == "Tambahan").toList();
                          return GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: (MediaQuery.of(context).size.width / 400).round(),
                                mainAxisExtent: 120,
                              ),
                              itemCount: tambahanItems?.length,
                              itemBuilder: (context, index) {
                                return ItemCard(items: tambahanItems![index], id: tambahanItems[index].id);
                              });
                        }),
                        Consumer(builder: (context, ref, _) {
                          final bungkusItems =
                              (ref.watch(tempPesananProvider).daftarPesanan)?.where((data) => data.jenis == "Bungkus").toList();
                          return GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: (MediaQuery.of(context).size.width / 400).round(),
                                mainAxisExtent: 120,
                              ),
                              itemCount: bungkusItems?.length,
                              itemBuilder: (context, index) {
                                return ItemCard(items: bungkusItems![index], id: bungkusItems[index].id);
                              });
                        }),
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Center(
                child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500, minHeight: 80),
              child: FilledButton(
                onPressed: () {
                  print("saved");
                },
                style: FilledButton.styleFrom(splashFactory: InkSparkle.splashFactory),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Simpan Pesanan", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                    const Spacer(),
                    Consumer(builder: (context, ref, _) {
                      return Text(
                        "Rp. ${formatter.format(ref.watch(tempPesananProvider).totalHarga)}",
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      );
                    }),
                    const SizedBox(
                      width: 12,
                    ),
                    const Icon(Icons.arrow_circle_right_rounded, size: 24)
                  ],
                ),
              ),
            )),
          )),
    );
  }
}

class ItemCard extends ConsumerStatefulWidget {
  const ItemCard({super.key, required this.items, required this.id});

  final item items;
  final int? id;

  @override
  ItemCardState createState() => ItemCardState();
}

class ItemCardState extends ConsumerState<ItemCard> {
  @override
  void initState() {
    super.initState();
    ref.read(tempPesananProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 1,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Theme.of(context).colorScheme.surface,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              flex: 1,
              child: ElevatedButton(
                  onPressed: () {
                    ref.read(tempPesananProvider).setItemCount(widget.id!, widget.items.jumlah! - 1);
                  },
                  onLongPress: () {
                    ref.read(tempPesananProvider).setItemCount(widget.id!, widget.items.jumlah! - 5);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
                      splashFactory: InkSparkle.splashFactory,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      )),
                  child: Icon(
                    Icons.remove,
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                  )),
            ),
            Flexible(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.items.nama.toString(),
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Rp. ${widget.items.harga} | Jumlah: ${widget.items.jumlah}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {
                                  _displayEditorCatatanPesanan(context, ref, widget.id!);
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.edit_note_outlined,
                                      size: 14,
                                      color: Theme.of(context).colorScheme.secondary,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      widget.items.catatan == "" ? "Catatan Pesanan..." : widget.items.catatan!,
                                      style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.secondary),
                                    )
                                  ],
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                )),
            Flexible(
              flex: 1,
              child: ElevatedButton(
                  onPressed: () {
                    ref.read(tempPesananProvider).setItemCount(widget.id!, widget.items.jumlah! + 1);
                  },
                  onLongPress: () {
                    ref.read(tempPesananProvider).setItemCount(widget.id!, widget.items.jumlah! + 5);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                      splashFactory: InkSparkle.splashFactory,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      )),
                  child: Icon(
                    Icons.add,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  )),
            ),
          ],
        ));
  }

  Future<void> _displayEditorCatatanPesanan(BuildContext context, WidgetRef ref, int id) async {
    final TextEditingController textFieldController = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Edit Catatan Pesanan"),
            content: TextField(
              controller: textFieldController,
              decoration: const InputDecoration(hintText: "Ganti catatan pesanan"),
            ),
            actions: [
              FilledButton(
                  onPressed: () {
                    ref.read(tempPesananProvider).setCatatanPesanan(id, textFieldController.text);
                    Navigator.pop(context);
                  },
                  child: const Text("Simpan")),
            ],
          );
        });
  }
}
