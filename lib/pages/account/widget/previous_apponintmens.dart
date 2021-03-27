import 'package:Beautech/models/appointment.dart';
import 'package:flutter/material.dart';

class AppointmentWidget extends StatelessWidget {

  final Appointment appointment;

  const AppointmentWidget({Key key, this.appointment}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, bottom: 4.0, top: 8.0),
                      child: Text(
                        '#',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 4.0, top: 8.0),
                        child: Text(
                          appointment.appointmentID,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).accentColor,
                          ),
                        )),
                    Spacer(),
                    Card(
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(appointment.appointmentStatus,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              )),
                        ))
                  ],
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                      child: Text('Salon: ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).accentColor,
                          )),
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(appointment.appointmentSalonName,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ))),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                      child: Text('Outlet: ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).accentColor,
                          )),
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(appointment.appointmentSalonOutlet,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ))),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                      child: Text(
                        'Appointment Date: ',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).accentColor),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(appointment.appointmentTime.toString(),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ))),
                  ],
                ),
              ),

          
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Divider(
                  thickness: 0.2,
                  color: Colors.pink[500],
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                  children: [
                                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                      child: Text(
                        'Service: ',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).accentColor),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(appointment.appointmentService.toString(),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ))),
             
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                      child: Text(
                        'Total: ',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).accentColor),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text('\$' + appointment.appointmentCost.toString(),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ))),
                  ],
                ),
              ),
            ],
          ),
    );
  }
}