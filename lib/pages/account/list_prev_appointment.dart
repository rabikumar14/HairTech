import 'package:Beautech/global/package_export.dart';
import 'package:Beautech/global/widget_export.dart';
import 'package:Beautech/models/appointment.dart';
import 'package:Beautech/models/user.dart';
import 'package:Beautech/pages/account/widget/previous_apponintmens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ListAppointments extends StatefulWidget {

  final AppUser appUser;

   ListAppointments({Key key, this.appUser}) : super(key: key);
  @override
  _ListAppointmentsState createState() => _ListAppointmentsState();
}

class _ListAppointmentsState extends State<ListAppointments> {
  @override
  Widget build(BuildContext context) {

    final appointments = Provider.of<List<Appointment>>(context);
    print(appointments.length);
    return Scaffold(
      appBar: GlobalAppBar("Your appointments"),
      body: ListView.builder(
               
                  shrinkWrap: true,
                  itemCount: appointments.length,
                  itemBuilder: (BuildContext context, int index) {
                    Appointment listViewAppointment = appointments[index];
                    print(listViewAppointment.appointmentUserID + "   "+ FirebaseAuth.instance.currentUser.uid);
                    if (listViewAppointment.appointmentUserID == FirebaseAuth.instance.currentUser.uid)
                    {
                      return AppointmentWidget(appointment: listViewAppointment,);
                    }
                    else{
                      return Container();
                    }
                
                  },
                ),
    );
  }
}