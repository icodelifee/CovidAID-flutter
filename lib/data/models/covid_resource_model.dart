// To parse this JSON data, do
//
//     final covidResourceModel = covidResourceModelFromJson(jsonString);

class CovidResources {
  CovidResources({required this.resources});

  List<CovidResourceModel> resources;

  factory CovidResources.fromJson(Map<String, dynamic> parsedJson) {
    final list = parsedJson['data'] as List;
    final List<CovidResourceModel> resourceList = list
        .map((resource) =>
            CovidResourceModel.fromJson(resource as Map<String, dynamic>))
        .toList();

    return CovidResources(resources: resourceList);
  }
}

class CovidResourceModel {
  CovidResourceModel({
    required this.upVotes,
    required this.description,
    required this.externalId,
    required this.isDuplicate,
    required this.title,
    required this.verificationStatus,
    required this.dataName,
    required this.dataId,
    required this.price,
    required this.state,
    required this.stateId,
    required this.email,
    required this.phone2,
    required this.phone1,
    required this.pincode,
    required this.address,
    required this.resourceType,
    required this.downvotes,
    required this.createdBy,
    required this.sourceLink,
    required this.verifiedBay,
    required this.deleted,
    required this.lastVerifiedOn,
    required this.createdOn,
    required this.district,
    required this.createdJob,
    required this.comment,
    required this.districtId,
    required this.category,
    required this.quantityAvailable,
    required this.assignedTo,
  });

  String upVotes;
  String description;
  String externalId;
  String isDuplicate;
  String title;
  String verificationStatus;
  String dataName;
  String dataId;
  String price;
  String state;
  String stateId;
  String email;
  String phone2;
  String phone1;
  String pincode;
  String address;
  String resourceType;
  String downvotes;
  String createdBy;
  String sourceLink;
  String verifiedBay;
  String deleted;
  String lastVerifiedOn;
  String createdOn;
  String district;
  String createdJob;
  String comment;
  String districtId;
  String category;
  String quantityAvailable;
  String assignedTo;

  factory CovidResourceModel.fromJson(Map<String, dynamic> json) =>
      CovidResourceModel(
        upVotes: json['upvotes'].toString(),
        description: json['description'].toString(),
        externalId: json['external_id'].toString(),
        isDuplicate: json['is_duplicate'].toString(),
        title: json['title'].toString(),
        verificationStatus: json['verification_status'].toString(),
        dataName: json['data_name'].toString(),
        dataId: json['data_id'].toString(),
        price: json['price'].toString(),
        state: json['state'].toString(),
        stateId: json['state_id'].toString(),
        email: json['email'].toString(),
        phone2: json['phone_2'].toString(),
        phone1: json['phone_1'].toString(),
        pincode: json['pincode'].toString(),
        address: json['address'].toString(),
        resourceType: json['resource_type'].toString(),
        downvotes: json['downvotes'].toString(),
        createdBy: json['created_by'].toString(),
        sourceLink: json['source_link'].toString(),
        verifiedBay: json['verified_bay'].toString(),
        deleted: json['deleted'].toString(),
        lastVerifiedOn: json['last_verified_on'].toString(),
        createdOn: json['created_on'].toString(),
        district: json['district'].toString(),
        createdJob: json['created_job'].toString(),
        comment: json['comment'].toString(),
        districtId: json['district_id'].toString(),
        category: json['category'].toString(),
        quantityAvailable: json['quantity_available'].toString(),
        assignedTo: json['assigned_to'].toString(),
      );

  Map<String, dynamic> toJson() => {
        'upvotes': upVotes,
        'description': description,
        'external_id': externalId,
        'is_duplicate': isDuplicate,
        'title': title,
        'verification_status': verificationStatus,
        'data_name': dataName,
        'data_id': dataId,
        'price': price,
        'state': state,
        'state_id': stateId,
        'email': email,
        'phone_2': phone2,
        'phone_1': phone1,
        'pincode': pincode,
        'address': address,
        'resource_type': resourceType,
        'downvotes': downvotes,
        'created_by': createdBy,
        'source_link': sourceLink,
        'verified_bay': verifiedBay,
        'deleted': deleted,
        'last_verified_on': lastVerifiedOn,
        'created_on': createdOn,
        'district': district,
        'created_job': createdJob,
        'comment': comment,
        'district_id': districtId,
        'category': category,
        'quantity_available': quantityAvailable,
        'assigned_to': assignedTo,
      };
}
