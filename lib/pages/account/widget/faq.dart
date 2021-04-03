import 'package:Beautech/global/package_export.dart';
import 'package:Beautech/global/widget_export.dart';

class FAQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        centerTitle: true,
        title: Text(
          'Frequently Asked Questions',
          style: GoogleFonts.varelaRound(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: FancyCard(
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'What is BeauTech?',
                style: GoogleFonts.varelaRound(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height:15),
              Text(
                'BeauTech allows consumers to view participating businesses in the beauty industry and choose the services that are being offered.',
                style: GoogleFonts.varelaRound(
                  color: Colors.grey,
                ),
              ),
              CustomDivider(),
              Text(
                'What are the services being offered?',
                style: GoogleFonts.varelaRound(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),SizedBox(height:15),
              Text(
                'There are many services on offer depending on what each businesses provide. The services category can be found on the main page, while the services of each business can be seen in their info section.',
                style: GoogleFonts.varelaRound(
                  color: Colors.grey,
                ),
              ),
              CustomDivider(),
              Text(
                'How do i request for a refund/cancellation?',
                style: GoogleFonts.varelaRound(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),SizedBox(height:15),
              Text(
                'Refunds and Cancellations are handled by businesses themselves. Please check each business\'s refund and cancellation policies. BeauTech will only process the refund once the business party confirms the refund.',
                style: GoogleFonts.varelaRound(
                  color: Colors.grey,
                ),
              ),
              CustomDivider(),
              Text(
                'WHat payment methods are accepted?',
                style: GoogleFonts.varelaRound(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),SizedBox(height:15),
              Text(
                'BeauTech accepts online payments such as Visa or MasterCard. Cash payments will depend on the business you are acquiring the service from.',
                style: GoogleFonts.varelaRound(
                  color: Colors.grey,
                ),
              ),
              CustomDivider(),
              Text(
                'Still unsure? Have more questions?',
                style: GoogleFonts.varelaRound(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),SizedBox(height:15),
              Text(
                'ErrorStacker\nerrorstacker.com.sg ',style: GoogleFonts.varelaRound(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}