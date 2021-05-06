class NotificationQueriesModel {
  NotificationQueriesModel({
    required this.docid,
    required this.uid,
    required this.district,
    required this.state,
    required this.lastmodified,
    required this.active,
    required this.resource,
  });

  String docid;
  String uid;
  String district;
  String state;
  String lastmodified;
  bool active;
  String resource;

  factory NotificationQueriesModel.fromJson(Map<String, dynamic> json) =>
      NotificationQueriesModel(
          docid: json['docid'].toString(),
          uid: json['uid'].toString(),
          district: json['district'].toString(),
          state: json['state'].toString(),
          lastmodified: json['lastmodified'].toString(),
          active: json['active'] == true,
          resource: json['resource'].toString());

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['docid'] = docid;
    data['uid'] = uid;
    data['district'] = district;
    data['state'] = state;
    data['lastmodified'] = lastmodified;
    data['active'] = active;
    data['resource'] = resource;
    return data;
  }
}
