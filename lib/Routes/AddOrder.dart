import 'package:flutter/material.dart';

class AddOrder extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Order'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                  SizedBox(
                    width: 100,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'No. Meja',
                      ),
                    ),
                  ),
                 ],
               ),
               Text("a"),
             ],
          ),
        ),
      ),
    );
  }
}