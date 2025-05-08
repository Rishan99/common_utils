class PaginationModel<T> {
  final int currentPage;
  final List<T> data;
  final int from;
  final int lastPage;
  final int perPage;
  final int total;
  final double dataTotalSummary;
  PaginationModel({
    required this.currentPage,
    required this.data,
    required this.from,
    required this.lastPage,
    required this.perPage,
    required this.total,
    required this.dataTotalSummary,
  });
}
