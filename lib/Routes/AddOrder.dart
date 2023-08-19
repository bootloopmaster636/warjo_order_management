import 'package:flutter/material.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class AddOrder extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .surface,
      appBar: AppBar(
        title: Text('Tambah Order'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
              const SizedBox(width: 80, height: 20),
              ListView(
                shrinkWrap: true,
                children: [
                  ItemCard(),
                  ItemCard(),
                  ItemCard()
                ],
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
        color: Theme
            .of(context)
            .colorScheme
            .surfaceVariant,
        child: SizedBox(
          width: 420,
          height: 120,
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nasi Soto Ayam Kampung",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 18),
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
                                EdgeInsets.symmetric(vertical: 6)),
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
