class Result {
  int? code;
  List<Data>? data;
  String? message;

  Result({this.code, this.data, this.message});

  Result.fromJson(Map<String, dynamic> json) {
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

class Data {
  String? namaTabungan;
  double? skor;

  Data({this.namaTabungan, this.skor});

  Data.fromJson(Map<String, dynamic> json) {
    namaTabungan = json['nama_tabungan'];
    skor = json['skor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama_tabungan'] = namaTabungan;
    data['skor'] = skor;
    return data;
  }
}
