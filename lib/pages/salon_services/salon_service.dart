import 'package:Beautech/models/salon.dart';
import 'package:Beautech/pages/appointment/appt_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllServicesPage extends StatefulWidget {
  final Salon salon;

  const AllServicesPage({Key key, this.salon}) : super(key: key);
  @override
  _AllServicesPageState createState() => _AllServicesPageState();
}

class _AllServicesPageState extends State<AllServicesPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(microseconds: 1)).then((value) {
      setState(() {
        _visible = false;
      });
    });
  }

  Size sizeFlexibleSpaceBar;
  bool _showBottomSheet = false;
  bool _visible = true;
  int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //    _copyFlexibleSpaceBar(),
          if (!_visible)
            Expanded(
              child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      iconTheme: IconThemeData(color: Colors.pink),
                      toolbarTextStyle: TextStyle(
                        color: Colors.black,
                      ),
                      centerTitle: true,
                      expandedHeight: 200,
                      pinned: true,
                      backgroundColor: Colors.white,
                      flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        title: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              widget.salon.salonName,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.varelaRound(
                                color: innerBoxIsScrolled == true
                                    ? Colors.pink
                                    : Colors.pink,
                                fontWeight: FontWeight.w500,
                                fontSize: innerBoxIsScrolled == true ? 16 : 16,
                              ),
                            ),
                          ),
                        ),
                        collapseMode: CollapseMode.pin,
                        background: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: NetworkImage(

                                //  appUser.photo),
                                widget.salon.salonCoverImage),
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.5),
                                BlendMode.overlay),
                            fit: BoxFit.cover,
                          )),
                        ),
                      ),
                    )
                  ];
                },
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ExpansionTile(
                        title: Text(
                          "View all outlets ",
                          style: GoogleFonts.varelaRound(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          "Number of outlets: " +
                              widget.salon.salonOutlets.length.toString(),
                          style: GoogleFonts.varelaRound(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500),
                        ),
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MediaQuery(
                                data: MediaQuery.of(context)
                                    .removePadding(removeTop: true),
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: widget.salon.salonOutlets.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    SalonOutlets salonOutlets =
                                        widget.salon.salonOutlets[index];
                                    return ListTile(
                                      title: Text(
                                        salonOutlets.addressLineOne,
                                        style: GoogleFonts.varelaRound(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      ListTile(
                        title: Text(
                          "Services offered by " + widget.salon.salonName,
                          style: GoogleFonts.varelaRound(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MediaQuery(
                        data: MediaQuery.of(context)
                            .removePadding(removeTop: true),
                        child: ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: widget.salon.salonServices.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider();
                          },
                          itemBuilder: (BuildContext context, int index) {
                            SalonServices salonService =
                                widget.salon.salonServices[index];
                            return ListTile(
                              tileColor: selectedIndex == index
                                  ? Colors.pink[50]
                                  : null,
                              leading: CircleAvatar(
                                backgroundColor: Colors.pink[50],
                                radius: 32,
                                child: Center(
                                  child: Text(
                                    "\$" + salonService.serviceCost.toString(),
                                    style: GoogleFonts.varelaRound(
                                      color: Colors.pink[500],
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  _showBottomSheet = true;
                                  selectedIndex = index;
                                });
                              },
                              title: Text(
                                salonService.serviceName,
                                style: GoogleFonts.varelaRound(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
      bottomSheet: _showBottomSheet
          ? BottomSheet(
              elevation: 10,
              backgroundColor: Colors.white,
              onClosing: () {
                // Do something
              },
              builder: (BuildContext context) => Container(
                  width: double.infinity,
                  height: 150,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, right: 10),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showBottomSheet = false;
                                });
                              },
                              child: Icon(
                                Icons.close,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Confirm appointment timings for " +
                            widget
                                .salon.salonServices[selectedIndex].serviceName,
                        style: GoogleFonts.varelaRound(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: FirebaseAuth.instance.currentUser == null
                                ? Colors.black
                                : Colors.pink[300]),
                        child: Text(
                          FirebaseAuth.instance.currentUser == null
                              ? 'You need to be logged in to confirm booking'
                              : 'Select timings and outlets',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          if (FirebaseAuth.instance.currentUser == null) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  'You need to be logged in to confirm booking'),
                              duration: Duration(seconds: 2),
                            ));
                          } else {
                            setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ApptPage(
                                          salon: widget.salon,
                                          salonServices: widget.salon
                                              .salonServices[selectedIndex],
                                        )),
                              );
                            });
                          }
                        },
                      ),
                    ],
                  )))
          : null,
    );
  }
}
