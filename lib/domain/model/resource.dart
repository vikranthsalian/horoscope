import 'package:adithya_horoscope/domain/model/page_model.dart';

class Resource {
  final dynamic body;
  final bool status;
  String message;
  PageModel? pageModel;

  Resource({this.body, this.status = true, this.message = "", this.pageModel});

  Resource copyWith({dynamic data, bool status = true, String message = ""}) {
    Resource resource = Resource(
        body: data, status: status, message: message, pageModel: pageModel);
    return resource;
  }

  @override
  int get hashCode =>
      body.hashCode ^ status.hashCode ^ message.hashCode ^ pageModel.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Resource &&
          runtimeType == other.runtimeType &&
          body == other.body &&
          status == other.status &&
          pageModel == other.pageModel &&
          message == other.message;

  @override
  String toString() {
    return 'Resource{data: $body, status: $status, message: $message, pageModel: $pageModel}';
  }
}
