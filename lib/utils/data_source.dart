import 'package:smart_light_iot/models/Light.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

enum LightsColumn { inDate, outDate, timeDifference }
//
// class LightDataSource extends DataGridSource {
//   LightDataSource({
//     required List<Light> lights
//   }) {
//     buildDataGrid(lights);
//   }
//
//   void buildDataGrid(List<Light> lights) => lights
//       .map<DataGridRow>(
//           (light) => DataGridRow(
//             cells: LightsColumn.values
//                 .map(
//                 (column) => DataGridCell<Light>(
//                     columnName: column.toString(),
//                     value: light,
//                 )
//             ).toList(),
//           ),
//     ).toList();
//
//   // @override
//   // DataGridRowAdapter buildRow(DataGridRow row) => DataGridRowAdapter(
//   //   cells: row.getCells().map<Widget>((dataGridCell) {
//   //     return Text('Hello');
//   //   }).toList()
//   // );
// }