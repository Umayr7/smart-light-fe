import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_light_iot/models/Light.dart';
import 'package:smart_light_iot/models/lights.dart';
import 'package:smart_light_iot/utils/data_source.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  void initState() {
    super.initState();

    final data = Provider.of<Lights>(context, listen: false);
    data.fetchDate();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Lights>(
      builder: (context,lights,child){
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Tracking screen',
            ),
          ),
          body: SfDataGrid(
            columns: buildGridColumns(),
          ),
          // body: Column(
          //   children: [
          //     // Center(
          //     //     child: ElevatedButton(onPressed: (){
          //     //       lights.turnOn();
          //     //     },
          //     //         child: Text(lights.isOn==false?'On':'OFF')
          //     //     )
          //     // ),
          //     ListView.builder(
          //       shrinkWrap: true,
          //       itemCount: lights.lightData.length,
          //       itemBuilder: (context, index) {
          //           return ListTile(
          //             title: Text(
          //                 "${lights.lightData[index].inDate} - ${lights.lightData[index].outDate} - ${lights.lightData[index].timeDifference}",
          //                 style: TextStyle(
          //                     color: Colors.black
          //                 ),
          //             )
          //           );
          //       },
          //     ),
          //   ],
          // ),
        );
      },
    );
  }


  List<GridColumn> buildGridColumns() => <GridColumn>[
    GridTextColumn(
      columnName: LightsColumn.inDate.toString(),
      label: buildLabel('inDate'),
    ),
    GridTextColumn(
      columnName: LightsColumn.outDate.toString(),
      label: buildLabel('outDate'),
    ),
    GridTextColumn(
      columnName: LightsColumn.timeDifference.toString(),
      label: buildLabel('timeDifference'),
    ),
  ];

  Widget buildLabel(String text) => Text(
      text
  );
}
