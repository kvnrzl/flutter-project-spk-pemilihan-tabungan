import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/services/user_services.dart';

import '../../../models/tabungan.dart';
import '../alternative_detail_page.dart';

/// Example without a datasource
class AlternativeTable extends StatelessWidget {
  final ListTabungan tabungans;
  const AlternativeTable({super.key, required this.tabungans});

  @override
  Widget build(BuildContext context) {
    final tabungansJson = tabungans.toJson();
    final data = tabungansJson["data"];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: DataTable2(
          columnSpacing: 12,
          horizontalMargin: 12,
          minWidth: 600,
          columns: const [
            DataColumn2(
              label: Text("No"),
            ),
            DataColumn(
              label: Text("Nama Tabungan"),
            ),
            DataColumn(
              label: Text("Action"),
            ),
          ],
          rows: List<DataRow>.generate(
              10,
              (index) => DataRow(cells: [
                    DataCell(Text("${index + 1}")),
                    DataCell(Text("${data[index]["nama_tabungan"]}")),
                    DataCell(ElevatedButton(
                        onPressed: () async {
                          await UserServices.getTabunganById(data[index]["id"])
                              .then((value) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AlternativeDetailPage(
                                        tabungan: value)));
                          });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             AlternativeDetailPage(id: index)));
                        },
                        child: const Text("Detail"))),
                  ]))),
    );
  }
}
