class Resource {
  Resource({this.name, this.url});
  String? name;
  String? url;

  factory Resource.fromJson(Map<String, dynamic> json) =>
      Resource(name: json['name'].toString(), url: json['url'].toString());
}
