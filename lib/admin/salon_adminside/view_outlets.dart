import 'package:Beautech/models/appointment.dart';
import 'package:Beautech/models/export_models.dart';
import 'package:Beautech/services/crud_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OutletsDataTable extends StatefulWidget {
  const OutletsDataTable({Key key}) : super(key: key);
  @override
  _OutletsDataTableState createState() => _OutletsDataTableState();
}

class _OutletsDataTableState extends State<OutletsDataTable> {
  @override
  Widget build(BuildContext context) {
    final salons = Provider.of<List<Salon>>(context);

    String currentUserEmail = FirebaseAuth.instance.currentUser.email;
    Salon mySalon;

    salons.forEach((element) {
      if (element.salonOwnerEmail == currentUserEmail) {
        mySalon = element;
      }
    });

    SalonOutlets returnChangedBoolValue(
        bool isAvailable, SalonOutlets element) {
      return SalonOutlets(
          outletCloseTime: element.outletCloseTime,
          outletOpenTime: element.outletOpenTime,
          isOutletOpen: isAvailable,
          addressLineOne: element.addressLineOne);
    }

    List<SalonOutlets> outlets = mySalon.salonOutlets;
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
                    DataTable(
                        columns: <DataColumn>[
                          DataColumn(
                            label: Text(
                              'Address',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.pink),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Open Time',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.pink),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Close Time',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.pink),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Outlet Status',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.pink),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Status',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.pink),
                            ),
                          ),
                        ],
                        rows: mySalon.salonOutlets
                            .map((element) => DataRow(cells: [
                                  DataCell(Text(element.addressLineOne)),
                                  DataCell(Text(element.outletOpenTime)),
                                  DataCell(Text(element.outletCloseTime)),
                                  DataCell(
                                    Text(element.isOutletOpen.toString()),
                                  ),
                                  if (element.isOutletOpen == true)
                                    DataCell(OutlinedButton(
                                      child: Text("Close"),
                                      onPressed: () {
                                        int index = outlets.indexOf(element);
                                        outlets[index] = returnChangedBoolValue(
                                            false, element);
                                        CRUD().updateOutlet(
                                            outlets, mySalon.salonID);
                                        setState(() {});
                                      },
                                    ))
                                  else if (element.isOutletOpen == false)
                                    DataCell(OutlinedButton(
                                      child: Text("Open"),
                                      onPressed: () {
                                        int index = outlets.indexOf(element);
                                        outlets[index] = returnChangedBoolValue(
                                            true, element);
                                        CRUD().updateOutlet(
                                            outlets, mySalon.salonID);

                                        setState(() {});
                                      },
                                    ))
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
