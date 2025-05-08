import 'package:common_utils/model/filter_model.dart';

typedef FilterFormFunction = (FilterModel filterModel, Function(FilterModel) onSubmit);
mixin FilterMixin {
  FilterModel filterModel = FilterModel();

  updateFilter(FilterModel filterModel) {
    this.filterModel = filterModel;
  }
}
