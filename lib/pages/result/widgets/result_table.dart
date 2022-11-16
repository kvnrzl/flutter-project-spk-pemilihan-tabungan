import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/services/alternative_services.dart';

import '../../../models/result.dart';
import '../../alternative_detail/alternative_detail_page.dart';

/// Example without a datasource
class ResultTable extends StatelessWidget {
  final Result result;
  const ResultTable({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final mapResult = result.toJson();
    final data = mapResult["data"];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: DataTable2(
          columnSpacing: 12,
          horizontalMargin: 12,
          minWidth: 600,
          columns: const [
            DataColumn2(
              label: Text('No.'),
              size: ColumnSize.S,
            ),
            DataColumn(
              label: Text('Nama Tabungan'),
            ),
            DataColumn(
              label: Text('Skor'),
              // numeric: true,
            ),
            DataColumn(
              label: Text('Action'),
            ),
          ],
          rows: List<DataRow>.generate(
              result.data!.length,
              (index) => DataRow(cells: [
                    DataCell(Text('${index + 1}')),
                    DataCell(Text("${data[index]["nama_tabungan"]}")),
                    DataCell(Text("${data[index]["skor"]}")),
                    DataCell(ElevatedButton(
                      onPressed: () async {
                        await AlternativeServices.getTabunganById(
                                data[index]["id"])
                            .then(
                          (value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AlternativeDetailPage(
                                tabungan: value,
                              ),
                            ),
                          ),
                        );
                      },
                      child: const Text("Detail"),
                    )),
                  ]))),
    );
  }
}
