class ImageModel {
  String id;
  String url;
  String title;

  ImageModel(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    url = parsedJson['urls']['regular'];
    title = parsedJson['user']['name'];
  }

  ImageModel.custom(this.id, this.url, this.title);
}