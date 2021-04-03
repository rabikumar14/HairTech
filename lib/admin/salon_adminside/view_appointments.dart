import 'package:Beautech/admin/dev_adminside/product_edit_data.dart';
import 'package:Beautech/models/appointment.dart';
import 'package:Beautech/models/product.dart';
import 'package:Beautech/models/salon.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class AppointmentDataTable extends StatefulWidget {

  final Salon salon;

  const AppointmentDataTable({Key key, this.salon}) : super(key: key);
  @override
  _AppointmentDataTableState createState() => _AppointmentDataTableState();
}

class _AppointmentDataTableState extends State<AppointmentDataTable> {
  @override
  Widget build(BuildContext context) {
    final appointment = Provider.of<List<Appointment>>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Center(
          child: Scrollbar(
            isAlwaysShown: true,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: TextButton.icon(
                        label: Text(
                          'Edit Service Availablity',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.blue),
                        onPressed: () {},
                      ),
                    ),
                        Container(
                      padding: EdgeInsets.only(left: 20),
                      child: TextButton.icon(
                        label: Text(
                          'Edit Outlet Availablity',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.blue),
                        onPressed: () {},
                      ),
                    ),
                    DataTable(
                        columns: <DataColumn>[
                          DataColumn(
                            label: Text(
                              'Appointment ID',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.pink),
                            ),
                          ),
                                 DataColumn(
                            label: Text(
                              'Appointment Date',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.pink),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Customer Name',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.pink),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Service',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.pink),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Outlet',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.pink),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Cancel Appointment',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.pink),
                            ),
                          ),
                        ],
                        rows: appointment
                            .map((element) => DataRow(cells: [
                                  DataCell(Text(element.appointmentID)),
                                   DataCell(
                                    Text(element.appointmentTime.toString()),
                                  ),
                                  DataCell(
                                    Text(element.appointmentUserName),
                                  ),
                                  DataCell(
                                    Text(element.appointmentService),
                                  ),
                                  DataCell(
                                    Container(
                                        width: 150,
                                        child: Text(
                                          element.appointmentSalonOutlet,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                  ),
                                  DataCell(IconButton(
                                      icon: Icon(Icons.cancel),
                                      onPressed: () {
                                  
                                      })),
                                ]))
                            .toList()),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
