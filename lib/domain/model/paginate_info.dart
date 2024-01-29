import 'package:adithya_horoscope/domain/model/page_model.dart';

class PaginateInfo {
  int? pageSize;
  int page;
  int? previous;
  int? next;
  int? count;
  bool isLast;
  PageModel? pageModel;

  PaginateInfo({
    required this.page,
    this.pageSize,
    this.previous,
    this.next,
    this.isLast = false,
    this.count,
    this.pageModel,
  });
}
