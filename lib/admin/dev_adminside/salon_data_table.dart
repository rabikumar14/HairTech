import 'package:Beautech/admin/dev_adminside/add_salon.dart';
import 'package:Beautech/admin/dev_adminside/salon_edit_data_table.dart';
import 'package:Beautech/models/salon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SalonDataTable extends StatefulWidget {
  @override
  _SalonDataTableState createState() => _SalonDataTableState();
}

class _SalonDataTableState extends State<SalonDataTable> {
  @override
  int a;
  List<String> ada = [];
  Widget build(BuildContext context) {
    final salons = Provider.of<List<Salon>>(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Scrollbar(
            isAlwaysShown: true,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: TextButton.icon(
                      label: Text(
                        'Add New Salon',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      style: TextButton.styleFrom(backgroundColor: Colors.blue),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder:  (context)=> AddNewSalon()));
                     
                      },
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                        columns: <DataColumn>[
                          DataColumn(
                            label: Text(
                              'Name',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.pink),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Owner',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.pink),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Email',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.pink),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Phone Number',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.pink),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Services',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.pink),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Outlets',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.pink),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Edit Salon',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.pink),
                            ),
                          ),
                        ],
                        rows: salons
                            .map((element) => DataRow(cells: [
                                  DataCell(Text(element.salonName)),
                                  DataCell(
                                    Text(element.salonOwner),
                                  ),
                                  DataCell(
                                    Text(element.salonOwnerEmail),
                                  ),
                                  DataCell(
                                    Text(
                                      element.salonOwnerPhoneNumber,
                                    ),
                                  ),
                                  DataCell(
                                    Text(element.salonServices.length
                                        .toString()),
                                  ),
                                  DataCell(
                                    Text(
                                        element.salonOutlets.length.toString()),
                                  ),
                                  DataCell(IconButton(
                                      icon: Icon(Icons.edit),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SalonEditDataTable(
                                                        salon: element)));
                                      })),
                                ]))
                            .toList()),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
