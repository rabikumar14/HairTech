
import 'package:Beautech/global/breakpoints.dart';
import 'package:Beautech/global/package_export.dart';
import 'package:Beautech/models/salon.dart';
import 'package:Beautech/pages/salon_services/salon_service.dart';
import 'package:flutter/material.dart';

class OutletCard extends StatefulWidget {
  final String bgImage;
  final Salon salon;

  const OutletCard({Key key, this.bgImage, this.salon}) : super(key: key);

  @override
  _OutletCardState createState() => _OutletCardState();
}

class _OutletCardState extends State<OutletCard> {
  List<String> services = [];
  @override
  Widget build(BuildContext context) {
    if (services.length == 0) {
      widget.salon.salonServices.forEach((element) {
        services.add(element.serviceName);
      });
    }

    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        width: isDisplayDesktop(context) == true
            ? (MediaQuery.of(context).size.width)
            : MediaQuery.of(context).size.width * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: isDisplayDesktop(context) == true
                  ? (MediaQuery.of(context).size.width - 300)
                  : MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.1), BlendMode.darken),
                      image: NetworkImage(widget.salon.salonCoverImage),
                      fit: BoxFit.cover)),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    right: 25,
                    bottom: 15,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AllServicesPage(
                                    salon: widget.salon,
                                  )),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text("Book now",
                            style: GoogleFonts.varelaRound(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            )),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Theme.of(context).backgroundColor),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(widget.salon.salonName,
                style: GoogleFonts.varelaRound(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                )),
            Text(
              "Services : " +
                  services
                      .toString()
                      .substring(1, services.toString().length - 1),
              style: GoogleFonts.varelaRound(
                color: Colors.grey[500],
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Text("Tag: " + widget.salon.salonCategory,
                style: GoogleFonts.varelaRound(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                )),
          ],
        ),
      ),
    );
  }
}
