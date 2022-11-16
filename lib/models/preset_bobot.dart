class PresetBobot {
  int? code;
  Data? data;
  String? message;

  PresetBobot({this.code, this.data, this.message});

  PresetBobot.fromJson(Map<String, dynamic> json) {
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
  double? setoranAwal;
  double? setoranLanjutanMinimal;
  double? saldoMinimum;
  double? sukuBunga;
  double? fungsionalitas;
  double? biayaAdmin;
  double? biayaPenarikanHabis;
  double? kategoriUmurPengguna;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
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
