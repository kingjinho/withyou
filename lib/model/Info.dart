class Info {
  String myPicture;
  String partnerPicture;
  DateTime startingDate;

  Info({this.myPicture, this.partnerPicture, this.startingDate});

  Map<String, dynamic> toMap() => {
        'MyPicture': myPicture,
        'PartnerPicture': partnerPicture,
        'StartingDate': startingDate,
      };
}
