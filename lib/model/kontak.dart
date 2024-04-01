import 'dart:convert';

class Kontak {
  final String nama;
  final String email;
  final String alamat;
  final String noTelepon;
  final String gambar;

  Kontak({
    required this.nama,
    required this.email,
    required this.alamat,
    required this.noTelepon,
    required this.gambar,
  });

  Kontak copyWith({
    String? nama,
    String? email,
    String? alamat,
    String? noTelepon,
    String? gambar,
  }) {
    return Kontak(
      nama: nama ?? this.nama,
      email: email ?? this.email,
      alamat: alamat ?? this.alamat,
      noTelepon: noTelepon ?? this.noTelepon,
      gambar: gambar ?? this.gambar,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nama': nama,
      'email': email,
      'alamat': alamat,
      'noTelepon': noTelepon,
      'gambar': gambar,
    };
  }

  factory Kontak.fromMap(Map<String, dynamic> map) {
    return Kontak(
      nama: map['nama'] as String,
      email: map['email'] as String,
      alamat: map['alamat'] as String,
      noTelepon: map['noTelepon'] as String,
      gambar: map['gambar'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Kontak.fromJson(String source) =>
      Kontak.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Kontak(nama: $nama, email: $email, alamat: $alamat, noTelepon: $noTelepon, gambar: $gambar)';
  }

  @override
  bool operator ==(covariant Kontak other) {
    if (identical(this, other)) return true;

    return other.nama == nama &&
        other.email == email &&
        other.alamat == alamat &&
        other.noTelepon == noTelepon &&
        other.gambar == gambar;
  }

  @override
  int get hashCode {
    return nama.hashCode ^
        email.hashCode ^
        alamat.hashCode ^
        noTelepon.hashCode ^
        gambar.hashCode;
  }
}
