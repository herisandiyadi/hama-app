import 'package:hama_app/domain/entities/personal/absen_request.dart';

class AbsenModel {
  final String idPerson;
  final DateTime tanggal;
  final String keterangan;
  final String noOrder;

  AbsenModel({
    required this.idPerson,
    required this.tanggal,
    required this.keterangan,
    required this.noOrder,
  });

  factory AbsenModel.fromJson(Map<String, dynamic> json) => AbsenModel(
        idPerson: json["id_person"],
        tanggal: DateTime.parse(json["tanggal"]),
        keterangan: json["keterangan"],
        noOrder: json["noOrder"],
      );

  Map<String, dynamic> toJson() => {
        "id_person": idPerson,
        "tanggal":
            "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "keterangan": keterangan,
        "noOrder": noOrder
      };

  AbsenRequest toEntity() {
    return AbsenRequest(
      idPerson: idPerson,
      tanggal: tanggal,
      keterangan: keterangan,
      noOrder: '',
    );
  }

  factory AbsenModel.fromEntity(AbsenRequest data) => AbsenModel(
        idPerson: data.idPerson,
        tanggal: data.tanggal,
        keterangan: data.keterangan,
        noOrder: data.noOrder,
      );
}
