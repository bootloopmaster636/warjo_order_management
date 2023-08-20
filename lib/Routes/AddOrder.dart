import 'package:flutter/material.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class AddOrder extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  "Makanan",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: ListView(
                  children: [ItemCard(), ItemCard(), ItemCard(), ItemCard()],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  "Minuman",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: ListView(
                  children: [ItemCard(), ItemCard(), ItemCard(), ItemCard()],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Center(
                  child: FilledButton(
                      onPressed: () {
                        print("saved");
                      },
                      child: Text("Simpan Pesanan")),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
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
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nama Makanan",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 16),
                      ),
                      Align(
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
                  Expanded(
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
