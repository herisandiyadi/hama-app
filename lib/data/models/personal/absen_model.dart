import 'package:hama_app/domain/entities/personal/absen_request.dart';

class AbsenModel {
  final String idPerson;
  final String tanggal;
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
        tanggal: json["tanggal"],
        keterangan: json["keterangan"],
        noOrder: json["noOrder"],
      );

  Map<String, dynamic> toJson() => {
        "id_person": idPerson,
        "tanggal": tanggal,
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
