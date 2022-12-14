class InputRecomendation {
  NilaiIdeal? nilaiIdeal;
  PresetKriteria? presetKriteria;

  InputRecomendation({this.nilaiIdeal, this.presetKriteria});

  InputRecomendation.fromJson(Map<String, dynamic> json) {
    nilaiIdeal = json['nilai_ideal'] != null
        ? NilaiIdeal.fromJson(json['nilai_ideal'])
        : null;
    presetKriteria = json['preset_kriteria'] != null
        ? PresetKriteria.fromJson(json['preset_kriteria'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (nilaiIdeal != null) {
      data['nilai_ideal'] = nilaiIdeal!.toJson();
    }
    if (presetKriteria != null) {
      data['bobot_kriteria'] = presetKriteria!.toJson();
    }
    return data;
  }
}

class NilaiIdeal {
  int? setoranAwal;
  int? setoranLanjutanMinimal;
  int? saldoMinimum;
  double? sukuBunga;
  Fungsionalitas? fungsionalitas;
  int? biayaAdmin;
  int? biayaPenarikanHabis;
  KategoriUmurPengguna? kategoriUmurPengguna;

  NilaiIdeal(
      {this.setoranAwal,
      this.setoranLanjutanMinimal,
      this.saldoMinimum,
      this.sukuBunga,
      this.fungsionalitas,
      this.biayaAdmin,
      this.biayaPenarikanHabis,
      this.kategoriUmurPengguna});

  NilaiIdeal.fromJson(Map<String, dynamic> json) {
    setoranAwal = json['setoran_awal'];
    setoranLanjutanMinimal = json['setoran_lanjutan_minimal'];
    saldoMinimum = json['saldo_minimum'];
    sukuBunga = json['suku_bunga'];
    fungsionalitas = json['fungsionalitas'] != null
        ? Fungsionalitas.fromJson(json['fungsionalitas'])
        : null;
    biayaAdmin = json['biaya_admin'];
    biayaPenarikanHabis = json['biaya_penarikan_habis'];
    kategoriUmurPengguna = json['kategori_umur_pengguna'] != null
        ? KategoriUmurPengguna.fromJson(json['kategori_umur_pengguna'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['setoran_awal'] = setoranAwal;
    data['setoran_lanjutan_minimal'] = setoranLanjutanMinimal;
    data['saldo_minimum'] = saldoMinimum;
    data['suku_bunga'] = sukuBunga;
    if (fungsionalitas != null) {
      data['fungsionalitas'] = fungsionalitas!.toJson();
    }
    data['biaya_admin'] = biayaAdmin;
    data['biaya_penarikan_habis'] = biayaPenarikanHabis;
    if (kategoriUmurPengguna != null) {
      data['kategori_umur_pengguna'] = kategoriUmurPengguna!.toJson();
    }
    return data;
  }
}

class Fungsionalitas {
  int? bisnis;
  int? investasi;
  int? transaksional;

  Fungsionalitas({this.bisnis, this.investasi, this.transaksional});

  Fungsionalitas.fromJson(Map<String, dynamic> json) {
    bisnis = json['bisnis'];
    investasi = json['investasi'];
    transaksional = json['transaksional'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bisnis'] = bisnis;
    data['investasi'] = investasi;
    data['transaksional'] = transaksional;
    return data;
  }
}

class KategoriUmurPengguna {
  int? dewasa;
  int? remaja;
  int? anak;

  KategoriUmurPengguna({this.dewasa, this.remaja, this.anak});

  KategoriUmurPengguna.fromJson(Map<String, dynamic> json) {
    dewasa = json['dewasa'];
    remaja = json['remaja'];
    anak = json['anak'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dewasa'] = dewasa;
    data['remaja'] = remaja;
    data['anak'] = anak;
    return data;
  }
}

class PresetKriteria {
  double? setoranAwal;
  double? setoranLanjutanMinimal;
  double? saldoMinimum;
  double? sukuBunga;
  double? fungsionalitas;
  double? biayaAdmin;
  double? biayaPenarikanHabis;
  double? kategoriUmurPengguna;

  PresetKriteria(
      {this.setoranAwal,
      this.setoranLanjutanMinimal,
      this.saldoMinimum,
      this.sukuBunga,
      this.fungsionalitas,
      this.biayaAdmin,
      this.biayaPenarikanHabis,
      this.kategoriUmurPengguna});

  PresetKriteria.fromJson(Map<String, dynamic> json) {
    setoranAwal = json['setoran_awal'];
    setoranLanjutanMinimal = json['setoran_lanjutan_minimal'];
    saldoMinimum = json['saldo_minimum'];
    sukuBunga = json['suku_bunga'];
    fungsionalitas = json['fungsionalitas'];
    biayaAdmin = json['biaya_admin'];
    biayaPenarikanHabis = json['biaya_penarikan_habis'];
    kategoriUmurPengguna = json['kategori_umur_pengguna'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['setoran_awal'] = setoranAwal;
    data['setoran_lanjutan_minimal'] = setoranLanjutanMinimal;
    data['saldo_minimum'] = saldoMinimum;
    data['suku_bunga'] = sukuBunga;
    data['fungsionalitas'] = fungsionalitas;
    data['biaya_admin'] = biayaAdmin;
    data['biaya_penarikan_habis'] = biayaPenarikanHabis;
    data['kategori_umur_pengguna'] = kategoriUmurPengguna;
    return data;
  }
}
