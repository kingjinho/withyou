import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:withyou/component/NeumorphicBackground.dart';
import 'package:withyou/component/NeumorphicButton.dart';
import 'package:withyou/component/NeumorphicCalendar.dart';
import 'package:withyou/shared/ButtonTypeEnum.dart';
import 'package:withyou/shared/Colors.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isMyPictureSet = false;
  bool _isPartnerPicutreSet = false;
  bool _isStartingDateSet = false;
  String _upComingAnniversaryTitleText = "When Did It Begin?";
  String _upComingAnniversaryMonth = "Month";
  String _upComingAnniversaryDate = "Date";
  File _imageForMine;
  File _imageForPartner;
  DateTime _startingDate;
  // BuildContext _context;
  final _imagePicker = ImagePicker();

  Future selectImage(ButtonType type) async {
    final pickedFile = await _imagePicker.getImage(source: ImageSource.gallery);

    setState(() {
      if (type == ButtonType.mine) {
        _isMyPictureSet = true;
        _imageForMine = File(pickedFile.path);
      }
      if (type == ButtonType.partner) {
        _isPartnerPicutreSet = true;
        _imageForPartner = File(pickedFile.path);
      }
    });
  }

  File getImage(ButtonType type) {
    return type == ButtonType.mine ? _imageForMine : _imageForPartner;
  }

  Future setStartingDate() async {
    final startingDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1970),
        lastDate: DateTime(2060));

    setState(() {
      _startingDate = startingDate;
      _isStartingDateSet = _startingDate != null;
    });
  }

  Widget _loadMyPicture() => _isMyPictureSet
      ? GestureDetector(
          onTap: () {
            selectImage(ButtonType.mine);
          },
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: FileImage(getImage(ButtonType.mine)),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.all(Radius.circular(15)),
                boxShadow: []),
          ),
        )
      : Stack(
          alignment: Alignment.center,
          children: [
            NeumorphicBackground(100, 100, Color(0xFFEAEBF3), true, 15),
            Container(
              width: 100,
              height: 100,
              child: MaterialButton(
                onPressed: () {
                  selectImage(ButtonType.mine);
                },
                splashColor: Colors.white70,
                child: Icon(
                  Icons.add,
                  color: Color(0xff545454),
                  size: 40,
                ),
              ),
            )
          ],
        );

  Widget _loadPartnerPicture() => _isPartnerPicutreSet
      ? GestureDetector(
          onTap: () {
            selectImage(ButtonType.partner);
          },
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: FileImage(getImage(ButtonType.partner)),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.all(Radius.circular(15)),
                boxShadow: []),
          ),
        )
      : Stack(
          alignment: Alignment.center,
          children: [
            NeumorphicBackground(100, 100, Color(0xFFEAEBF3), true, 15),
            Container(
              width: 100,
              height: 100,
              child: MaterialButton(
                onPressed: () {
                  selectImage(ButtonType.partner);
                },
                splashColor: Colors.white70,
                child: Icon(
                  Icons.add,
                  color: Color(0xff545454),
                  size: 40,
                ),
              ),
            )
          ],
        );

  Widget _loadStartingDate() => Align(
        alignment: Alignment.topCenter,
        child: NeumorphicButton(
          height: 120,
          onPressed: () {
            setStartingDate();
          },
          child: _isStartingDateSet
              ? RichText(
                  text: TextSpan(
                      style: TextStyle(
                          color: colorNeuGrey,
                          fontFamily: "Dohyeon",
                          fontSize: 48),
                      children: <TextSpan>[
                      TextSpan(
                          text:
                              "${_startingDate.month}/${_startingDate.day}, ${_startingDate.year}")
                    ]))
              : Icon(
                  Icons.add,
                  color: Color(0xff545454),
                  size: 64,
                ),
          backgroundColor: Color(0xFFEAEBF3),
        ),
      )
      /* : Align(
          alignment: Alignment.topCenter,
          child: NeumorphicButton(
            height: 120,
            onPressed: () {
              setStartingDate();
            },
            icon: Icon(
              Icons.add,
              color: Color(0xff545454),
              size: 64,
            ),
            backgroundColor: Color(0xFFEAEBF3),
          ),
        ) */
      ;

  void _loadUpcomingAnniversary() {}

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Container(
      padding: EdgeInsets.only(top: 16, left: 16, right: 16),
      color: Color(0xFFEAEBF3),
      child: Column(
        children: [
          Flexible(
              flex: 3,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  NeumorphicBackground(
                      350, height * .4, Color(0xFFEAEBF3), false, 15),
                  Column(
                    children: [
                      Flexible(
                          flex: 1,
                          child: Container(
                              margin: EdgeInsets.only(top: 16),
                              child: Text(
                                _upComingAnniversaryTitleText,
                                style: TextStyle(
                                    fontSize: 48,
                                    fontWeight: FontWeight.w600,
                                    color: colorNeuGrey),
                              ))),
                      Flexible(
                          flex: 3,
                          child: Container(
                            width: width * .5,
                            child: NeumorphicCalendar(
                                width * .5,
                                width * .5,
                                Color(0xFFEAEBF3),
                                Text(_upComingAnniversaryMonth,
                                    style: TextStyle(
                                        fontSize: 32,
                                        color: Color(0xff545454))),
                                Text(
                                  _upComingAnniversaryDate,
                                  style: TextStyle(
                                      fontSize: 48, color: Color(0xff545454)),
                                ),
                                1,
                                3),
                          ))
                    ],
                  )
                ],
              )),
          Flexible(
              flex: 1,
              child: Container(
                height: height * .23,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: _loadMyPicture(),
                    ),
                    Flexible(
                        flex: 1,
                        child: Container(
                            child: Image.asset(
                          "assets/images/heart.png",
                          width: 80,
                          height: 80,
                        ))),
                    Flexible(flex: 1, child: _loadPartnerPicture())
                  ],
                ),
              )),
          Flexible(
              flex: 2,
              child: Container(
                height: height * .33,
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                        flex: 1,
                        child: Text(
                          "Dating Since...",
                          style: TextStyle(fontSize: 32, color: colorNeuGrey),
                        )),
                    Flexible(
                        flex: 3, child: Container(child: _loadStartingDate()))
                  ],
                ),
              ))
        ],
      ),
    ));
  }
}
