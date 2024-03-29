// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class person {
  final String nama;
  final String email;
  final String alamat;
  final String noTelepon;
  final String foto;
  person({
    required this.nama,
    required this.email,
    required this.alamat,
    required this.noTelepon,
    required this.foto,
  });

  person copyWith({
    String? nama,
    String? email,
    String? alamat,
    String? noTelepon,
    String? foto,
  }) {
    return person(
      nama: nama ?? this.nama,
      email: email ?? this.email,
      alamat: alamat ?? this.alamat,
      noTelepon: noTelepon ?? this.noTelepon,
      foto: foto ?? this.foto,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nama': nama,
      'email': email,
      'alamat': alamat,
      'noTelepon': noTelepon,
      'foto': foto,
    };
  }

  factory person.fromMap(Map<String, dynamic> map) {
    return person(
      nama: map['nama'] as String,
      email: map['email'] as String,
      alamat: map['alamat'] as String,
      noTelepon: map['noTelepon'] as String,
      foto: map['foto'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory person.fromJson(String source) =>
      person.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'person(nama: $nama, email: $email, alamat: $alamat, noTelepon: $noTelepon, foto: $foto)';
  }

  @override
  bool operator ==(covariant person other) {
    if (identical(this, other)) return true;

    return other.nama == nama &&
        other.email == email &&
        other.alamat == alamat &&
        other.noTelepon == noTelepon &&
        other.foto == foto;
  }

  @override
  int get hashCode {
    return nama.hashCode ^
        email.hashCode ^
        alamat.hashCode ^
        noTelepon.hashCode ^
        foto.hashCode;
  }
}
