import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:warjo_order_management/classes/pesanan.dart';

final tempPesananProvider =
    ChangeNotifierProvider((ref) => pesanan().initPesanan());
var formatter = NumberFormat('###,###,###');

class AddOrder extends StatelessWidget {
  const AddOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            title: const Text('Tambah Order'),
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
                              (ref.watch(tempPesananProvider).daftar_pesanan)
                                  ?.where((item) => item.jenis == "Makanan")
                                  .toList();
                          return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  (MediaQuery.of(context).size.width / 400)
                                      .round(),
                              mainAxisExtent: 120,
                            ),
                            itemCount: makananItems?.length,
                            itemBuilder: (context, index) {
                              return ItemCard();
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
                              return Text(
                                  "test"); //13 is the start index of "minuman" items
                            },
                          );
                        }),
                        Consumer(builder: (context, ref, _) {
                          final tambahanItems =
                              (ref.watch(tempPesananProvider).daftar_pesanan)
                                  ?.where((item) => item.jenis == "Tambahan")
                                  .toList();
                          return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  (MediaQuery.of(context).size.width / 400)
                                      .round(),
                              mainAxisExtent: 120,
                            ),
                            itemCount: tambahanItems?.length,
                            itemBuilder: (context, index) {
                              return Text(
                                  "test"); //13 is the start index of "minuman" items
                            },
                          );
                        }),
                        Consumer(builder: (context, ref, _) {
                          final bungkusItems =
                              (ref.watch(tempPesananProvider).daftar_pesanan)
                                  ?.where((item) => item.jenis == "Bungkus")
                                  .toList();
                          return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  (MediaQuery.of(context).size.width / 400)
                                      .round(),
                              mainAxisExtent: 120,
                            ),
                            itemCount: bungkusItems?.length,
                            itemBuilder: (context, index) {
                              return Text(
                                  "test"); //13 is the start index of "minuman" items
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
              style: FilledButton.styleFrom(
                  splashFactory: InkSparkle.splashFactory),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Simpan Pesanan",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  const Spacer(),
                  Consumer(builder: (context, ref, _) {
                    return Text(
                      "Rp. ${formatter.format(ref.watch(tempPesananProvider).total_harga)}",
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
    );
  }
}

// class ItemCard extends ConsumerWidget {
//   final item items;
//   final int id;
//
//   ItemCard({super.key, required this.items, required this.id});
//
//   final TextEditingController _catatanPesananController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Card(
//       color: Theme.of(context).colorScheme.surface,
//       child: SizedBox(
//         width: 400,
//         height: 112,
//         child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Row(
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       items.nama?.toString() ?? "null",
//                       textAlign: TextAlign.start,
//                       style: const TextStyle(
//                           fontWeight: FontWeight.w800, fontSize: 16),
//                     ),
//                     Text(
//                       "Rp. ${items.harga.toString()}",
//                       textAlign: TextAlign.start,
//                       style: const TextStyle(
//                           fontWeight: FontWeight.w400, fontSize: 14),
//                     ),
//                     Align(
//                       alignment: Alignment.bottomLeft,
//                       child: AnimatedSwitcher(
//                         duration: Duration(milliseconds: 300),
//                         child: [
//                           //edit button and text
//                           Row(
//                             Text("edit button and text"),
//                           ),
//
//                           //text input and submit button
//                           Row(
//                             Text("textInput and button"),
//                           )
//                         ],
//                       )
//                     )
//                   ],
//                 ),
//                 Spacer(),
//                 ConstrainedBox (
//                   constraints: BoxConstraints(
//                     maxWidth: 60,
//                     minWidth: 10
//                   ),
//                   child: WheelChooser.integer(
//                     minValue: 0,
//                     maxValue: 30,
//                     initValue: ref
//                         .read(tempPesananProvider)
//                         .daftar_pesanan?[id]
//                         .jumlah,
//                     onValueChanged: (s) {
//                       ref.read(tempPesananProvider).setItemCount(id, s);
//                       print(ref
//                           .read(tempPesananProvider)
//                           .daftar_pesanan![id]
//                           .jumlah);
//                     },
//                   ),
//                 )
//               ],
//             )),
//       ),
//     );
//   }
// }

class ItemCard extends ConsumerStatefulWidget {
  const ItemCard({Key? key}) : super(key: key);

  @override
  ItemCardState createState() => ItemCardState();
}

class ItemCardState extends ConsumerState<ItemCard> {
  @override
  void initState() {
    super.initState();
    ref.read(tempPesananProvider);
  }

  Widget build(BuildContext context) {
    return Card(
        elevation: 3,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              flex: 1,
              child: ElevatedButton(
                  onPressed: () {
                    print("counter decrement");
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.tertiary,
                      splashFactory: InkSparkle.splashFactory,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      )),
                  child: Icon(Icons.remove, color: Theme.of(context).colorScheme.onTertiary,)),
            ),
            Flexible(
              flex: 2,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Nama Makanan", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      Text("Rp. 10.000 | Jumlah 2", style: TextStyle(fontSize: 14),),
                    ],
                  ),
                )
            ),
            Flexible(
              flex: 1,
              child: ElevatedButton(
                  onPressed: () {
                    print("counter increment");
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      splashFactory: InkSparkle.splashFactory,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      )),
                  child: Icon(Icons.add, color: Theme.of(context).colorScheme.onSecondary,)),
            ),
          ],
        ));
  }
}
