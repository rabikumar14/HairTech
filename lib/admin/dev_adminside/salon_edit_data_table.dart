import 'dart:io';

import 'package:Beautech/global/package_export.dart';
import 'package:Beautech/global/widget_export.dart';
import 'package:Beautech/models/product.dart';
import 'package:Beautech/models/salon.dart';
import 'package:Beautech/services/crud_model.dart';
import 'package:Beautech/services/uploadImage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

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

  File _image;
  final picker = ImagePicker();

  uploadProfileImage(String imageFile) async {
    //Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      //Select Image
      var file = File(imageFile);

      if (imageFile != null) {
        //Upload to Firebase
        var snapshot = await FirebaseStorage.instance
            .ref()
            .child('folderNames/' +
                imageFile.substring(imageFile.lastIndexOf('/')))
            .putFile(file)
            .whenComplete(() => null);

        var downloadUrl = await snapshot.ref.getDownloadURL();
      } else {
        print('No Path Received');
      }
    } else {
      print('Grant Permissions and try again');
    }
  }

  Future getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (salonCategoryDropdownValue == null)
      salonCategoryDropdownValue = widget.salon.salonCategory;
    if (salonServicesController == null || salonServicesController.length == 0)
      salonServicesController = widget.salon.salonServices;
    if (salonOutletController == null || salonOutletController.length == 0)
      salonOutletController = widget.salon.salonOutlets;

    showOutletEditDialog(String addOrEdit, int index, bool isAdd) {
      if (isAdd == false) {
        outletCloseTimeValue = widget.salon.salonOutlets[index].outletCloseTime;
        outletOpenTimeValue = widget.salon.salonOutlets[index].outletOpenTime;
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
                          ..text =
                              widget.salon.salonOutlets[index].addressLineOne),
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
                          ..text = widget
                              .salon.salonOutlets[index].outletPhoneNumber),
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
                              isOutletOpen:
                                  widget.salon.salonOutlets[index].isOutletOpen,
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
                          ..text =
                              widget.salon.salonServices[index].serviceName),
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
                          ..text = widget.salon.salonServices[index].serviceCost
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
                          ..text = widget
                              .salon.salonServices[index].serviceDescription),
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
                                    ? widget.salon.salonServices[index]
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
                       String img  ;

                      if(_image != null)
                      {
                      img  =  await uploadNewImage(_image.path);
                      }
                          
                      var updatedSalon = Salon(
                        salonID: widget.salon.salonID,
                        lastUpdated: DateTime.now(),
                        salonCoverImage:  _image == null ?  widget.salon.salonCoverImage : img,
                        salonName: salonNameController.text,
                        salonOwnerEmail: salonOwnerEmailController.text,
                        salonOwner: salonOwnerController.text,
                        salonCategory: salonCategoryDropdownValue,
                        salonOwnerPhoneNumber: salonOwnerPhoneController.text,
                        salonServices: salonServicesController,
                        salonOutlets: salonOutletController,
                        
                      );
                      await CRUD()
                          .editSalon(widget.salon, updatedSalon)
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
                        Container(
                          width: 350,
                          height: 300,
                          child: _image == null
                              ? Image.network(widget.salon.salonCoverImage)
                              : Image.file(_image),
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            "Change Salon Image",
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
                            ..text = widget.salon.salonOwner,
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
