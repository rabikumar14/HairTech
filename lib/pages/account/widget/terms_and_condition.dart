import 'package:Beautech/global/package_export.dart';
import 'package:Beautech/global/widget_export.dart';

class TermsAndConditions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        centerTitle: true,
        title: Text(
          'Terms & Conditions',
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
                'Acceptance of Terms & Condition',
                style: GoogleFonts.varelaRound(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height:15),
              Text(
                'You agree to the terms and conditions outlined below with respect to BeauTech and the mobile/web application. This terms & condition is specifically for the users on this platform and not for the service providers utilising this platform.',
                style: GoogleFonts.varelaRound(
                  color: Colors.grey,
                ),
              ),
              CustomDivider(),
              Text(
                'Copyright',
                style: GoogleFonts.varelaRound(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height:15),
              Text(
                'The content, designs, organisation and other matters related to BeauTech and applications are protected under the applicable copyrights, trademarks and other proprietary rights. Copying, redistribution, use or publication of any such matters is strictly prohibited. Posting of information or materials on the platform does not constitute a waiver of any right in such information and materials.',
                style: GoogleFonts.varelaRound(
                  color: Colors.grey,
                ),
              ),
              CustomDivider(),
              Text(
                'Third Party Content',
                style: GoogleFonts.varelaRound(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),SizedBox(height:15),
              Text(
                'Third party content may appear on the platform or may be accessible via links from the platform. BeauTech and ErrorStacker are not responsible for and assume no liability for any mistakes, misstatements of law, defamation, omissions, falsehood, obscenity, pornography or profanity in the statements, opinions, representations or any other form of content on the platforms.',
                style: GoogleFonts.varelaRound(
                  color: Colors.grey,
                ),
              ),
              CustomDivider(),
              Text(
                'Unlawful Activity',
                style: GoogleFonts.varelaRound(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),SizedBox(height:15),
              Text(
                'ErrorStacker reserves the right to investigate complaints or reported violations of this Agreement and to take any action we deem appropriate, including but not limited to reporting any suspected unlawful activity to law enforcement officials, regulators, or other third parties or entities relating to your profile, email address, usage history, posted materials, IP addresses and traffic information.',
                style: GoogleFonts.varelaRound(
                  color: Colors.grey,
                ),
              ),
              CustomDivider(),
              Text(
                'Payment',
                style: GoogleFonts.varelaRound(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),SizedBox(height:15),
              Text(
                'BeauTech accepts online payments such as Visa or MasterCard. Cash payments will depend on the service provider you are acquiring the service from.',
                style: GoogleFonts.varelaRound(
                  color: Colors.grey,
                ),
              ),
              CustomDivider(),
              Text(
                'Refunds',
                style: GoogleFonts.varelaRound(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),SizedBox(height:15),
              Text(
                'Refunds will take a few days to process once the service provider has requested for it. A small transaction fee will apply to the service provider for the processing fee.',
                style: GoogleFonts.varelaRound(
                  color: Colors.grey,
                ),
              ),
              CustomDivider(),
              Text(
                'Cancellations',
                style: GoogleFonts.varelaRound(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),SizedBox(height:15),
              Text(
                'Cancellation of services are not handled by BeauTech. Please check with the involved service provider on the terms of cancellations or changes.',
                style: GoogleFonts.varelaRound(
                  color: Colors.grey,
                ),
              ),
              CustomDivider(),
              Text(
                'Changes to Terms',
                style: GoogleFonts.varelaRound(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),SizedBox(height:15),
              Text(
                'ErrorStacker reserves the right to change the Terms under which Services and BeauTech are offered. The latest Terms will supersede all previous versions.',
                style: GoogleFonts.varelaRound(
                  color: Colors.grey,
                ),
              ),
              CustomDivider(),
              Text(
                'Contact Us',
                style: GoogleFonts.varelaRound(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),SizedBox(height:15),
              Text(
                'ErrorStacker\nerrorstacker.com.sg \nJackson Square 11 Blk A,\nLor 3 Toa Payoh, #01-01,\nSingapore - 319579',
              ),
            ],
          ),
        ),
      ),
    );
    
  }
}