class BillsResponseModel{
  int? status ;

}

class BillsResponseModelData {
  String? salesId;
  int? salesStatus;
  String? cUSTACCOUNT;
  String? customer;
  DELIVERYDATE? dELIVERYDATE;

  BillsResponseModelData(
      {this.salesId,
        this.salesStatus,
        this.cUSTACCOUNT,
        this.customer,
        this.dELIVERYDATE});

  BillsResponseModelData.fromJson(Map<String, dynamic> json) {
    salesId = json['SalesId'];
    salesStatus = json['SalesStatus'];
    cUSTACCOUNT = json['CUSTACCOUNT'];
    customer = json['Customer'];
    dELIVERYDATE = json['DELIVERYDATE'] != null
        ? DELIVERYDATE.fromJson(json['DELIVERYDATE'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['SalesId'] =salesId;
    data['SalesStatus'] =salesStatus;
    data['CUSTACCOUNT'] =cUSTACCOUNT;
    data['Customer'] =customer;
    if (dELIVERYDATE != null) {
      data['DELIVERYDATE'] =dELIVERYDATE!.toJson();
    }
    return data;
  }
}

class DELIVERYDATE {
  String? date;
  int? timezoneType;
  String? timezone;

  DELIVERYDATE({this.date, this.timezoneType, this.timezone});

  DELIVERYDATE.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    timezoneType = json['timezone_type'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['timezone_type'] = timezoneType;
    data['timezone'] = timezone;
    return data;
  }
}