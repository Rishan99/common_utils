import 'package:common_utils/model/pagination_model.dart';

mixin PaginationMixin {
  int _currentPage = 1;
  int _maxPage = 2;
  int get currentPage => _currentPage;
  int get maxPage => _maxPage;

  bool get hasMoreData => _currentPage <= _maxPage;

  int totalDataCount = 0;

  bool isFetchingNextPage = false;

  updatePagination(PaginationModel maxPage) {
    totalDataCount = maxPage.total;
    _currentPage = maxPage.currentPage + 1;
    _maxPage = maxPage.lastPage;
    isFetchingNextPage = false;
  }

  updateGetNextPage() {
    isFetchingNextPage = true;
  }

  clearPagination() {
    _currentPage = 1;
    _maxPage = 2;
    isFetchingNextPage = false;
  }
}
