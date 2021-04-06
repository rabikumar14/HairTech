import 'package:Beautech/models/appointment.dart';
import 'package:Beautech/models/export_models.dart';
import 'package:Beautech/services/crud_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServicesDataTable extends StatefulWidget {


  const ServicesDataTable({Key key}) : super(key: key);
  @override
  _ServicesDataTableState createState() => _ServicesDataTableState();
}

class _ServicesDataTableState extends State<ServicesDataTable> {
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

    SalonServices returnChangedBoolValue(
        bool isAvailable, SalonServices element) {
      return SalonServices(
          isServiceAvailable: isAvailable,
          serviceCost: element.serviceCost,
          serviceDescription: element.serviceDescription,
          serviceName: element.serviceName);
    }

    List<SalonServices> services = mySalon.salonServices;
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
                              'Service Name',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.pink),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Service Cost',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.pink),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Service Description',
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
                              ' Status',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.pink),
                            ),
                          ),
                        ],
                        rows: mySalon.salonServices
                            .map((element) => DataRow(cells: [
                                  DataCell(Text(element.serviceName)),
                                  DataCell(
                                    Text("\$" + element.serviceCost.toString()),
                                  ),
                                  DataCell(
                                    Container(
                                        width: 150,
                                        child: Text(
                                          element.serviceDescription,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                  ),
                                  DataCell(
                                    Text(element.isServiceAvailable.toString()),
                                  ),
                                  if (element.isServiceAvailable == true)
                                    DataCell(OutlinedButton(
                                      child: Text("Deactivate"),
                                      onPressed: () {
                                        int index = services.indexOf(element);
                                        services[index] =
                                            returnChangedBoolValue(
                                                false, element);
                                        CRUD().updateService(
                                            services, mySalon.salonID);
                                        setState(() {});
                                      },
                                    ))
                                  else if (element.isServiceAvailable == false)
                                    DataCell(OutlinedButton(
                                      child: Text("Activate"),
                                      onPressed: () {
                                        int index = services.indexOf(element);
                                        services[index] =
                                            returnChangedBoolValue(
                                                true, element);
                                        CRUD().updateService(
                                            services, mySalon.salonID);

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
