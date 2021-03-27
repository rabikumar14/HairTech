import 'package:Beautech/global/package_export.dart';
import 'package:Beautech/global/widget_export.dart';
import 'package:Beautech/models/product.dart';
import 'package:Beautech/models/salon.dart';
import 'package:Beautech/services/crud_model.dart';
import 'package:flutter/material.dart';

class SalonEditDataTable extends StatefulWidget {
  final Salon salon;

  const SalonEditDataTable({Key key, this.salon}) : super(key: key);
  @override
  _SalonEditDataTableState createState() => _SalonEditDataTableState();
}

class _SalonEditDataTableState extends State<SalonEditDataTable> {
  final formKey = GlobalKey<FormState>();
  final updateServiceKey = GlobalKey<FormState>();
  final updateOutletKey = GlobalKey<FormState>();

  TextEditingController salonNameController = new TextEditingController();
  TextEditingController salonOwnerController = new TextEditingController();
  TextEditingController salonOwnerEmailController = new TextEditingController();
  TextEditingController salonOwnerPhoneController = new TextEditingController();

  TextEditingController serviceNameController = new TextEditingController();
  TextEditingController servicePriceController = new TextEditingController();
  TextEditingController serviceInfoController = new TextEditingController();

  TextEditingController outletAddressController = new TextEditingController();
  TextEditingController outletGoogleMapLink = new TextEditingController();
  String outletOpenTimeValue;
  String outlerCloseTimeVaue;
  List<String> outletDaysOpenController;

  String salonCategoryDropdownValue;
  List<SalonServices> salonServicesController = [];
  List<SalonOutlets> salonOutletController = [];

  String hintText;
  String labelText;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    if (salonCategoryDropdownValue == null)
      salonCategoryDropdownValue = widget.salon.salonCategory;
    if (salonServicesController == null || salonServicesController.length == 0)
      salonServicesController = widget.salon.salonServices;
    if (salonOutletController == null || salonOutletController.length == 0)
      salonOutletController = widget.salon.salonOutlets;

    showServiceEditDialog(String addOrEdit, int index) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              addOrEdit,
              style: GoogleFonts.varelaRound(
                  fontSize: 16,
                  color: Colors.pink[500],
                  fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
            ),
            content: Form(
              key: updateServiceKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    controller: serviceNameController
                      ..text = widget.salon.salonServices[index].serviceName,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'You cannot leave this field empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      focusColor: Colors.pink[500],
                      hintText: "Head Massage",
                      labelText: "Service Name",
                    ),
                  ),
                  TextFormField(
                    maxLines: null,
                    keyboardType: TextInputType.number,
                    controller: servicePriceController
                      ..text = widget.salon.salonServices[index].serviceCost
                          .toString(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'You cannot leave this field empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      focusColor: Colors.pink[500],
                      hintText: "25.00",
                      labelText: "Service Price",
                    ),
                  ),
                  TextFormField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    controller: serviceInfoController
                      ..text =
                          widget.salon.salonServices[index].serviceDescription,
                    decoration: InputDecoration(
                      focusColor: Colors.pink[500],
                      hintText: "Head Massage with great essential oils",
                      labelText: "Service Description (optional)",
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        onPressed: () async {
                          if (updateServiceKey.currentState.validate()) {
                            // await CRUD()
                            //     .updateAddress(appUser.appUserID,
                            //         addressEditingController.text)
                            //     .then((value) => Navigator.of(context).pop());
                          }
                        },
                        child: Text(
                          "Save",
                          style: GoogleFonts.varelaRound(
                              fontSize: 16,
                              color: Colors.pink[500],
                              fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () async {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Cancel",
                          style: GoogleFonts.varelaRound(
                              fontSize: 16,
                              color: Colors.pink[500],
                              fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      );
    }

    return Form(
      key: formKey,
      child: Scaffold(
          appBar: GlobalAppBar(
            "Edit Product",
            color: Colors.white,
            elevation: 5,
            action: [
              IconButton(
                  icon: Icon(Icons.save),
                  onPressed: () async {
                    if (formKey.currentState.validate()) {
                      // await CRUD()
                      //     .editProduct(widget.product, updatedProduct)
                      //     .then((value) => Navigator.of(context).pop());
                    }
                  })
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: new BoxConstraints(
                  minWidth: 300,
                  maxWidth: 600,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: 350,
                          height: 300,
                          child: Image.network(widget.salon.salonCoverImage),
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            "Change Product Image",
                            style: GoogleFonts.varelaRound(
                                color: Colors.pink[500]),
                          ),
                        ),
                        TextFormField(
                          controller: salonNameController
                            ..text = widget.salon.salonName,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'You cannot leave this field empty';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            focusColor: Colors.pink[500],
                            suffixIcon: Icon(Icons.tab_outlined),
                            hintText: "Le Muler",
                            labelText: "Salon Name",
                          ),
                        ),
                        Center(
                          child: Container(
                            child: DropdownButton<String>(
                              value: salonCategoryDropdownValue,
                              icon: const Icon(Icons.arrow_drop_down),
                              iconSize: 24,
                              elevation: 16,
                              style: TextStyle(color: Colors.black),
                              underline: Container(
                                height: 2,
                                color: Colors.black,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  salonCategoryDropdownValue = newValue;
                                });
                              },
                              items: <String>[
                                "Massage Salon",
                                "Hair Salon",
                                "Spa",
                                "Nail Salon",
                                "Beauty Salon"
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: salonOwnerController
                            ..text = widget.salon.salonOwnerPhoneNumber,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'You cannot leave this field empty';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            focusColor: Colors.pink[500],
                            suffixIcon: Icon(Icons.tab_outlined),
                            hintText: "Owner Name",
                            labelText: "Owner Name",
                          ),
                        ),
                        TextFormField(
                          controller: salonOwnerEmailController
                            ..text = widget.salon.salonOwnerEmail,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'You cannot leave this field empty';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            focusColor: Colors.pink[500],
                            suffixIcon: Icon(Icons.tab_outlined),
                            hintText: "Owner Email",
                            labelText: "Owner Email",
                          ),
                        ),
                        TextFormField(
                          controller: salonOwnerPhoneController
                            ..text = widget.salon.salonOwnerPhoneNumber,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'You cannot leave this field empty';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            focusColor: Colors.pink[500],
                            suffixIcon: Icon(Icons.tab_outlined),
                            hintText: "Owner Email",
                            labelText: "Owner Email",
                          ),
                        ),
                        SizedBox(height: 15),
                        ExpansionTile(
                          title: Text(
                            "Salon Services",
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          children: <Widget>[
                            ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: widget.salon.salonServices.length,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return Divider();
                              },
                              itemBuilder: (BuildContext context, int index) {
                                SalonServices salonService =
                                    widget.salon.salonServices[index];
                                return ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.pink[50],
                                    radius: 32,
                                    child: Center(
                                      child: Text(
                                        "\$" +
                                            salonService.serviceCost.toString(),
                                        style: GoogleFonts.varelaRound(
                                          color: Colors.pink[500],
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    salonService.serviceName,
                                    style: GoogleFonts.varelaRound(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                  trailing: Row(
                                    children: [
                                      IconButton(
                                          icon: Icon(Icons.edit),
                                          onPressed: () {}),
                                      IconButton(
                                          icon: Icon(Icons.delete),
                                          onPressed: () {
                                            salonServicesController
                                                .remove(salonService);
                                            setState(() {});
                                          })
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        ExpansionTile(
                          title: Text(
                            "Salon Services",
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          children: <Widget>[
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: widget.salon.salonOutlets.length,
                              itemBuilder: (BuildContext context, int index) {
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
                                  trailing: Row(
                                    children: [
                                      IconButton(
                                          icon: Icon(Icons.edit),
                                          onPressed: () {}),
                                      IconButton(
                                          icon: Icon(Icons.delete),
                                          onPressed: () {
                                            salonOutletController
                                                .remove(salonOutlets);
                                            setState(() {});
                                          })
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
