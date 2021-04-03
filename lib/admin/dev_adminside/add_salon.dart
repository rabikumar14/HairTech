import 'package:Beautech/global/package_export.dart';
import 'package:Beautech/global/widget_export.dart';

import 'package:Beautech/models/salon.dart';
import 'package:Beautech/services/crud_model.dart';

import 'package:Beautech/services/firebase_storage.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

class AddNewSalon extends StatefulWidget {
  const AddNewSalon({Key key}) : super(key: key);
  @override
  _AddNewSalonState createState() => _AddNewSalonState();
}

class _AddNewSalonState extends State<AddNewSalon> {
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
  TextEditingController outletPhoneNumber = new TextEditingController();

  List<String> outletDaysOpenController;
  String outletOpenTimeValue;
  String outletCloseTimeValue;
  String salonCategoryDropdownValue;
  List<SalonServices> salonServicesController = [];
  List<SalonOutlets> salonOutletController = [];

  String hintText;
  String labelText;
  IconData icon;

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

  @override
  Widget build(BuildContext context) {
    showOutletEditDialog(String addOrEdit, int index, bool isAdd) {
      if (isAdd == false) {
        outletCloseTimeValue = salonOutletController[index].outletOpenTime;
        outletOpenTimeValue = salonOutletController[index].outletCloseTime;
      }

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
                    controller: isAdd == true
                        ? (outletAddressController..text = "")
                        : (outletAddressController
                          ..text = salonOutletController[index].addressLineOne),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'You cannot leave this field empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      focusColor: Colors.pink[500],
                      hintText: "Address Outlet",
                      labelText: "Address",
                    ),
                  ),
                  TextFormField(
                    maxLines: null,
                    keyboardType: TextInputType.number,
                    controller: isAdd == true
                        ? (outletPhoneNumber..text = "")
                        : (outletPhoneNumber
                          ..text =
                              salonOutletController[index].outletPhoneNumber),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'You cannot leave this field empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      focusColor: Colors.pink[500],
                      hintText: "Address Outlet",
                      labelText: "Address",
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      StatefulBuilder(builder:
                          (BuildContext context, StateSetter dropDownState) {
                        return Container(
                          child: DropdownButton<String>(
                            hint: Text("Open Time"),
                            value: outletOpenTimeValue,
                            icon: const Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: Colors.black),
                            underline: Container(
                              height: 2,
                              color: Colors.black,
                            ),
                            onChanged: (String newValue) {
                              dropDownState(() {
                                outletOpenTimeValue = newValue;
                              });
                            },
                            items: timeSlots
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        );
                      }),
                      StatefulBuilder(builder: (BuildContext context,
                          StateSetter dropDownStateClose) {
                        return Container(
                          child: DropdownButton<String>(
                            hint: Text("Close Time"),
                            value: outletCloseTimeValue,
                            icon: const Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: Colors.black),
                            underline: Container(
                              height: 2,
                              color: Colors.black,
                            ),
                            onChanged: (String newValue) {
                              dropDownStateClose(() {
                                outletCloseTimeValue = newValue;
                              });
                            },
                            items: timeSlots
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        );
                      }),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        onPressed: () async {
                          if (updateServiceKey.currentState.validate()) {
                            SalonOutlets formSalonOutlets = SalonOutlets(
                              addressLineOne: outletAddressController.text,
                              googleMapLocationURL: " ",
                              outletOpenTime: outletOpenTimeValue,
                              outletCloseTime: outletCloseTimeValue,
                              isOutletOpen: true,
                              outletPhoneNumber: outletPhoneNumber.text,
                            );
                            if (isAdd == false) {
                              setState(() {
                                salonOutletController[index] = formSalonOutlets;
                                Navigator.of(context).pop();
                              });
                            } else {
                              setState(() {
                                salonOutletController.add(formSalonOutlets);
                                Navigator.of(context).pop();
                              });
                            }
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

    showServiceEditDialog(String addOrEdit, int index, bool isAdd) {
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
                    controller: isAdd == true
                        ? (serviceNameController..text = "")
                        : (serviceNameController
                          ..text = salonServicesController[index].serviceName),
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
                    controller: isAdd == true
                        ? (servicePriceController..text = "")
                        : (servicePriceController
                          ..text = salonServicesController[index]
                              .serviceCost
                              .toString()),
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
                    controller: isAdd == true
                        ? (serviceInfoController..text = "")
                        : (serviceInfoController
                          ..text = salonServicesController[index]
                              .serviceDescription),
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
                            SalonServices formSalonService = SalonServices(
                                isServiceAvailable: isAdd == false
                                    ? salonServicesController[index]
                                        .isServiceAvailable
                                    : true,
                                serviceCost:
                                    double.parse((servicePriceController.text)),
                                serviceDescription: serviceInfoController.text,
                                serviceName: serviceNameController.text);
                            if (isAdd == false) {
                              setState(() {
                                salonServicesController[index] =
                                    formSalonService;
                                Navigator.of(context).pop();
                              });
                            } else {
                              setState(() {
                                salonServicesController.add(formSalonService);
                                Navigator.of(context).pop();
                              });
                            }
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
            "Edit Salon",
            color: Colors.white,
            elevation: 5,
            action: [
              IconButton(
                  icon: Icon(Icons.save),
                  onPressed: () async {
                    if (formKey.currentState.validate()) {
                      var newSalon = Salon(
                        lastUpdated: DateTime.now(),
                        salonName: salonNameController.text,
                        salonOwnerEmail: salonOwnerEmailController.text,
                        salonOwner: salonOwnerController.text,
                        salonCategory: salonCategoryDropdownValue,
                        salonOwnerPhoneNumber: salonOwnerPhoneController.text,
                        salonServices: salonServicesController,
                        salonOutlets: salonOutletController,
                      );
                      await CRUD()
                          .addNewSalon(newSalon)
                          .then((value) => Navigator.of(context).pop());
                      // await CRUD()
                      //     .editProduct(widget.product, updatedProduct)
                      //     .then((value) => Navigator.of(context).pop());
                    }
                  })
            ],
          ),
          body: Center(
            child: ConstrainedBox(
              constraints: new BoxConstraints(
                minWidth: 300,
                maxWidth: 600,
              ),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: Column(
                      children: [
                        // OutlinedButton(
                        //   onPressed: () async {
                        //     return await uploadImageWeb(
                        //         onSelected: (file) async {
                        //       final dateTime = DateTime.now();
                        //       final path = 'salonImages/$dateTime';
                        //       fb
                        //           .storage()
                        //           .refFromURL('gs://hairtech-sg.appspot.com')
                        //           .child(path)
                        //           .put(file);

                        //       setState(() {
                        //         pathGlobal = path;
                        //       });
                        //     });
                        //   },
                        //   child: Text(
                        //     "Change Salon Image",
                        //     style: GoogleFonts.varelaRound(
                        //         color: Colors.pink[500]),
                        //   ),
                        // ),
                        TextFormField(
                          controller: salonNameController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'You cannot leave this field empty';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            focusColor: Colors.pink[500],
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
                          controller: salonOwnerController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'You cannot leave this field empty';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            focusColor: Colors.pink[500],
                            hintText: "Owner Name",
                            labelText: "Owner Name",
                          ),
                        ),
                        TextFormField(
                          controller: salonOwnerEmailController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'You cannot leave this field empty';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            focusColor: Colors.pink[500],
                            hintText: "Owner Email",
                            labelText: "Owner Email",
                          ),
                        ),
                        TextFormField(
                          controller: salonOwnerPhoneController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'You cannot leave this field empty';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            focusColor: Colors.pink[500],
                            hintText: "Owner Number",
                            labelText: "Owner Number",
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              OutlinedButton(
                                onPressed: () {
                                  showServiceEditDialog("Add", 0, true);
                                },
                                child: Text(
                                  "Add Service",
                                  style: GoogleFonts.varelaRound(
                                      color: Colors.pink[500]),
                                ),
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  showOutletEditDialog("Add", 0, true);
                                },
                                child: Text(
                                  "Add Outlet",
                                  style: GoogleFonts.varelaRound(
                                      color: Colors.pink[500]),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ExpansionTile(
                          title: Text(
                            "Salon Services",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: ListView.separated(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: salonServicesController.length,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return Divider();
                                },
                                itemBuilder: (BuildContext context, int index) {
                                  SalonServices salonService =
                                      salonServicesController[index];
                                  return ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.pink[50],
                                      radius: 32,
                                      child: Center(
                                        child: Text(
                                          "\$" +
                                              salonService.serviceCost
                                                  .toString(),
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
                                    trailing: IconButton(
                                        icon: Icon(Icons.edit),
                                        onPressed: () {
                                          showServiceEditDialog(
                                              "Edit", index, false);
                                        }),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        ExpansionTile(
                          title: Text(
                            "Salon Outlets",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          children: [
                            Column(
                              children: [
                                ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: salonOutletController.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    SalonOutlets salonOutlets =
                                        salonOutletController[index];
                                    return ListTile(
                                      title: Text(
                                        salonOutlets.addressLineOne,
                                        style: GoogleFonts.varelaRound(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),
                                      ),
                                      trailing: IconButton(
                                          icon: Icon(Icons.edit),
                                          onPressed: () {
                                            showOutletEditDialog(
                                                "Edit", index, false);
                                          }),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
