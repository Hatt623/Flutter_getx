class Alquran{
  final int ayat;
  final String arti, asma, nama, urut, nomor, keterangan;

  Alquran({
    required this.ayat,
    required this.arti,
    required this.asma,
    required this.nama,

    required this.urut,
    required this.nomor,
    required this.keterangan,

  });

  factory Alquran.fromJson(Map<String, dynamic> json){
    return Alquran(
      ayat: json['ayat'],
      arti: json['arti'],
      asma: json['asma'],
      nama: json['nama'],

      urut: json['urut'],
      nomor: json['nomor'],
      keterangan: json['keterangan'],

    );
  }

  
}