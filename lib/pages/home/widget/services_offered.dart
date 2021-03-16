import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceIcons extends StatelessWidget {
  final String svgPath;
  final String serviceName;

  const ServiceIcons({Key key, @required this.svgPath, @required this.serviceName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.pink[100], radius: 34,
                      child: CircleAvatar(
    
              backgroundColor: Colors.pink[50],
              radius: 32,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(svgPath, 
                      color: Colors.pink[300]),
                ),
              ),

            ),
          ),
          SizedBox(height:5),
          Text(serviceName, style: GoogleFonts.varelaRound(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,),)
        ],
      ),
    );
  }
}
