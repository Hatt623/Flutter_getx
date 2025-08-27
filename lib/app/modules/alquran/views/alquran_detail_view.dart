import 'package:flutter/material.dart';
import 'package:xiirpl1getx/app/data/models/alquran.dart';

class AlquranDetailView extends StatelessWidget {
  final Alquran alquran;

  AlquranDetailView({Key? key, required this.alquran}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Surat ${alquran.asma}", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Header Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal, Colors.tealAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Text(
                    alquran.nama,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Surah #${alquran.nomor}",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white70,
                        ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Image Card
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ]),
                // looks weird becasue the image is not fitting
                // child: Image.network(
                //   'https://picsum.photos/id/${alquran.ayat % 1000}/400/250',
                //   fit: BoxFit.cover,
                // ),
              ),
            ),

            const SizedBox(height: 24),

            // Description
            Text(
              alquran.keterangan,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    height: 1.5,
                  ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}