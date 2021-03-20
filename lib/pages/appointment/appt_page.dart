import 'package:hair_salon/global_items/package_export.dart';
import 'package:hair_salon/global_items/radio_button.dart';
import 'package:hair_salon/global_items/widget_export.dart';
import 'package:hair_salon/models/salon.dart';
import 'package:intl/intl.dart';

class ApptPage extends StatefulWidget {
  final Salon salon;
  final SalonServices salonServices;

  const ApptPage({Key key, this.salon, this.salonServices}) : super(key: key);
  @override
  _ApptPageState createState() => _ApptPageState();
}

class _ApptPageState extends State<ApptPage> {
  //choose outlet
  List<String> chooseOutlet = [];
  String outletValue = "(Select Outlet)";

  //choose time
  String selectedTimeSlot = "(Select Time)";

  //choose day
  String selectDate = DateTime.now().add(Duration(days: 0)).day.toString();
  String selectDay =
      DateFormat('EE').format(DateTime.now().add(Duration(days: 0)));
  String pos = '0';
  int selected = DateTime.now().day + 0;

  @override
  Widget build(BuildContext context) {
    //make a string list of the salon outlet can refactor
    if (chooseOutlet.length == 0) {
      widget.salon.salonOutlets.forEach((element) {
        chooseOutlet.add(element.addressLineOne);
      });
    }

    void changeOutletValue(String value) {
      setState(() {
        outletValue = value;
      });
    }

    String returnOutletGroup() {
      return outletValue;
    }

    //buttonTime
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: GlobalAppBar(
        "Select Timeslot and Outlet",
        color: Colors.grey[100],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(child: datePicker()),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 15),
                child: Text(
                  'Available Timeslots',
                  style: GoogleFonts.varelaRound(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ConstrainedBox(
                constraints: new BoxConstraints(
                    minHeight: 200.0,
                    minWidth: 200.0,
                    maxHeight: 500.0,
                    maxWidth: 500.0),
                child: _buildTimeSlots(),
              ),
              SizedBox(height: 10),
              Text(
                widget.salon.salonName + "'s \n Available Outlets",
                style: GoogleFonts.varelaRound(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Column(
                  children: radioButtonList(
                      chooseOutlet, changeOutletValue, returnOutletGroup)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _bottomSheetAppointment(),
    );
  }

  ///simple stateful date picker
  Widget datePicker() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[100],
      child: Column(
        children: <Widget>[
          Container(
              height: 90,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
              ),
              child: ListView.builder(
                  itemCount: 7,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, position) {
                    int day = DateTime.now().day + position;
                    return GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6.0, vertical: 5),
                          child: Container(
                            child: Column(
                              children: [
                                Text(
                                  DateFormat('EE').format(
                                    DateTime.now().add(
                                      Duration(days: position),
                                    ),
                                  ),
                                  style: GoogleFonts.varelaRound(
                                    fontSize: 14,
                                    color: selected == day
                                        ? Colors.black
                                        : Colors.grey[500],
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  decoration: BoxDecoration(
                                      border: new Border.all(
                                          width: 5,
                                          color: selected == day
                                              ? Theme.of(context).primaryColor
                                              : Colors.transparent),
                                      color: Colors.grey.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      DateTime.now()
                                          .add(Duration(days: position))
                                          .day
                                          .toString(),
                                      style: GoogleFonts.varelaRound(
                                        fontSize: 14,
                                        fontWeight: day == DateTime.now().day
                                            ? FontWeight.bold
                                            : FontWeight.bold,
                                        color: selected == day
                                            ? Colors.black
                                            : Colors.grey[500],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            selectDate = DateTime.now()
                                .add(Duration(days: position))
                                .day
                                .toString();
                            selectDay = DateFormat('EE').format(
                                DateTime.now().add(Duration(days: position)));
                            selected = DateTime.now().day + position;
                            pos = position.toString();
                          });
                        });
                  }))
        ],
      ),
    );
  }

  Widget _bottomSheetAppointment() {
    List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];

    return Container(
      height: 175,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RichText(
                    text: new TextSpan(
                      text: 'Service: ',
                      style: GoogleFonts.varelaRound(
                        fontSize: 14,
                        color: Colors.pink,
                        fontWeight: FontWeight.w400,
                      ),
                      children: <TextSpan>[
                        new TextSpan(
                          text: widget.salonServices.serviceName,
                          style: GoogleFonts.varelaRound(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  RichText(
                    text: new TextSpan(
                      text: 'Total: ',
                      style: GoogleFonts.varelaRound(
                        fontSize: 14,
                        color: Colors.pink,
                        fontWeight: FontWeight.w400,
                      ),
                      children: <TextSpan>[
                        new TextSpan(
                          text: '\$' +
                              widget.salonServices.serviceCost.toString(),
                          style: GoogleFonts.varelaRound(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: RichText(
                text: new TextSpan(
                  text: 'Date & Time: ',
                  style: GoogleFonts.varelaRound(
                    fontSize: 14,
                    color: Colors.pink,
                    fontWeight: FontWeight.w400,
                  ),
                  children: <TextSpan>[
                    new TextSpan(
                      text: selectDate +
                          ", " +
                          months[DateTime.now()
                                  .add(Duration(days: int.parse(pos)))
                                  .month -
                              1] +
                          ", " +
                          DateTime.now()
                              .add(Duration(days: int.parse(pos)))
                              .year
                              .toString() +
                          " at " +
                          selectedTimeSlot,
                      style: GoogleFonts.varelaRound(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: RichText(
                text: new TextSpan(
                  text: 'Outlet: ',
                  style: GoogleFonts.varelaRound(
                    fontSize: 14,
                    color: Colors.pink,
                    fontWeight: FontWeight.w400,
                  ),
                  children: <TextSpan>[
                    new TextSpan(
                      text: outletValue,
                      style: GoogleFonts.varelaRound(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: selectedTimeSlot == "(Select Time)" ||
                            outletValue == "(Select Outlet)"
                        ? Colors.black
                        : Colors.pink[300]),
                child: Text(
                  'Confirm booking',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if(selectedTimeSlot == "(Select Time)" || outletValue == "(Select Outlet)"){
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please select the time and outlet'), duration: Duration(seconds: 2),));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeSlots() {
    List<String> timeSlots = [
      "9:00 AM",
      "10:00 AM",
      "11:00 AM",
      "12:00 PM",
      "1:00 PM",
      "2:00 PM",
      "3:00 PM",
      "4:00 PM",
      "5:00 PM",
      "6:00 PM",
      "7:00 PM",
      "8:00 PM",
      "9:00 PM"
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 50 / 20,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: timeSlots.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedTimeSlot = timeSlots[index];
                });
              },
              child: Container(
                height: 20,
                width: 50,
                decoration: BoxDecoration(
                    border: new Border.all(
                        width: 5,
                        color: selectedTimeSlot == timeSlots[index]
                            ? Theme.of(context).primaryColor
                            : Colors.transparent),
                    color: Colors.pink[200].withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5.0)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      timeSlots[index],
                      style: GoogleFonts.varelaRound(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: selectedTimeSlot == timeSlots[index]
                            ? Colors.pinkAccent
                            : Colors.pink[200],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
