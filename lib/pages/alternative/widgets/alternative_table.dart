import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/constants/controller.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/pages/alternative_edit/alternative_edit_page.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/services/alternative_services.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/widgets/custom_text.dart';

import '../../../models/tabungan.dart';
import '../../alternative_detail/alternative_detail_page.dart';

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
              label: Center(child: Text("Action")),
            ),
          ],
          rows: List<DataRow>.generate(
              tabungans.data!.length,
              (index) => DataRow(cells: [
                    DataCell(Text("${index + 1}")),
                    DataCell(Text("${data[index]["nama_tabungan"]}")),
                    DataCell(
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () async {
                              await AlternativeServices.getTabunganById(
                                      data[index]["id"])
                                  .then((value) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AlternativeDetailPage(
                                                tabungan: value)));
                              });
                            },
                            icon: const Icon(
                              Icons.screen_search_desktop_outlined,
                              size: 26,
                            ),
                            tooltip: "Detail",
                          ),
                          IconButton(
                            onPressed: () async {
                              await AlternativeServices.getTabunganById(
                                      data[index]["id"])
                                  .then((value) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AlternativeEditPage(
                                                tabungan: value)));
                              });
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.blue,
                            ),
                            tooltip: "Edit",
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.do_not_disturb_on_outlined,
                              color: Colors.red,
                            ),
                            tooltip: "Delete",
                            onPressed: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const CustomText(
                                  text: "Warning!",
                                  weight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                                content: const Text(
                                  'Are you sure want to delete this?',
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => Navigator.pop(
                                      context,
                                      'Cancel',
                                    ),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      await alternativeController
                                          .onDeleteAlternative(
                                              data[index]["id"])
                                          .then((_) {
                                        Navigator.pop(context, 'OK');
                                      });
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]))),
    );
  }
}
