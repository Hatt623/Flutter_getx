import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class ResultsScreenView extends GetView {
  const ResultsScreenView({
    super.key,
    required this.name,
    required this.gender,
    required this.dateOfBirth,
    required this.phone,
  });

  final String name;
  final String gender;
  final DateTime dateOfBirth;
  final String phone;

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd-MM-yyyy').format(dateOfBirth);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Pengguna'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.person, size: 80, color: Colors.deepPurple),
                const SizedBox(height: 16),
                _buildInfoRow(Icons.badge, 'Nama', name),
                _buildInfoRow(Icons.wc, 'Jenis Kelamin', gender),
                _buildInfoRow(Icons.cake, 'Tanggal Lahir', formattedDate),
                _buildInfoRow(Icons.phone, 'Nomor HP', phone),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.deepPurple),
          const SizedBox(width: 12),
          Text(
            '$label:',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}