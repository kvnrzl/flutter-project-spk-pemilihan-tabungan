class ListTabungan {
  int? code;
  List<Data>? data;
  String? message;

  ListTabungan({this.code, this.data, this.message});

  ListTabungan.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class Tabungan {
  int? code;
  Data? data;
  String? message;

  Tabungan({this.code, this.data, this.message});

  Tabungan.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  int? id;
  String? namaTabungan;
  int? setoranAwal;
  int? setoranLanjutanMinimal;
  int? saldoMinimum;
  double? sukuBunga;
  String? fungsionalitas;
  int? biayaAdmin;
  int? biayaPenarikanHabis;
  String? kategoriUmurPengguna;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.namaTabungan,
      this.setoranAwal,
      this.setoranLanjutanMinimal,
      this.saldoMinimum,
      this.sukuBunga,
      this.fungsionalitas,
      this.biayaAdmin,
      this.biayaPenarikanHabis,
      this.kategoriUmurPengguna,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaTabungan = json['nama_tabungan'];
    setoranAwal = json['setoran_awal'];
    setoranLanjutanMinimal = json['setoran_lanjutan_minimal'];
    saldoMinimum = json['saldo_minimum'];
    sukuBunga = json['suku_bunga'];
    fungsionalitas = json['fungsionalitas'];
    biayaAdmin = json['biaya_admin'];
    biayaPenarikanHabis = json['biaya_penarikan_habis'];
    kategoriUmurPengguna = json['kategori_umur_pengguna'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama_tabungan'] = namaTabungan;
    data['setoran_awal'] = setoranAwal;
    data['setoran_lanjutan_minimal'] = setoranLanjutanMinimal;
    data['saldo_minimum'] = saldoMinimum;
    data['suku_bunga'] = sukuBunga;
    data['fungsionalitas'] = fungsionalitas;
    data['biaya_admin'] = biayaAdmin;
    data['biaya_penarikan_habis'] = biayaPenarikanHabis;
    data['kategori_umur_pengguna'] = kategoriUmurPengguna;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
