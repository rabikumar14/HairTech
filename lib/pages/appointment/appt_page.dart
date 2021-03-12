import 'package:hair_salon/global_items/hairstylist_card.dart';
import 'package:hair_salon/global_items/package_export.dart';

import 'package:intl/intl.dart';

class ApptPage extends StatefulWidget {
  @override
  _ApptPageState createState() => _ApptPageState();
}

class _ApptPageState extends State<ApptPage> {
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

  String selectedTimeSlot = "";
  String selectDate = DateTime.now().add(Duration(days: 0)).day.toString();
  String selectDay =
      DateFormat('EE').format(DateTime.now().add(Duration(days: 0)));
  String pos = '0';
  int selected = DateTime.now().day + 0;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    //buttonTime
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: screenWidth,
        height: screenHeight,
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
                    fontSize: 18,
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
                'Available Hair Stylists',
                style: GoogleFonts.varelaRound(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    HairstylistCard(),
                    SizedBox(width: 10),
                    HairstylistCard(),
                    SizedBox(width: 10),
                    HairstylistCard(),
                    SizedBox(width: 10),
                    HairstylistCard(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ///simple stateful date picker
  Widget datePicker() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[100],
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              '$selectDate, ' +
                  months[
                      DateTime.now().add(Duration(days: int.parse(pos))).month -
                          1] +
                  ", " +
                  DateTime.now()
                      .add(Duration(days: int.parse(pos)))
                      .year
                      .toString(),
              style: GoogleFonts.varelaRound(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
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
                                    fontSize: 16,
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
                                        fontSize: 16,
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
                        fontSize: 16,
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
