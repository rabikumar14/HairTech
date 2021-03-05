import 'package:hair_salon/global_items/package_export.dart';
import 'package:hair_salon/global_items/widget_export.dart';

class EditAccount extends StatefulWidget {
  @override
  _EditAccountState createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        centerTitle: true,
        title: Text(
          'Edit Account',
          style: GoogleFonts.varelaRound(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            FancyCard(
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.email,
                    ),
                    title: Text("Change Email"),
                    onTap: () {},
                  ),
                  CustomDivider(),
                  ListTile(
                    leading: Icon(
                      Icons.lock_outline,
                    ),
                    title: Text("Change Password"),
                    onTap: () {},
                  ),
                  CustomDivider(),
                  ListTile(
                    leading: Icon(
                      Icons.phone,
                    ),
                    title: Text("Change Phone Number"),
                    onTap: () {},
                  ),
                  CustomDivider(),
                  ListTile(
                    leading: Icon(
                      Icons.home,
                    ),
                    title: Text("Change Address"),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
