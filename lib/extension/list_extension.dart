extension IterableExtension<T> on Iterable<T> {
  ///Group By Key [k]
  Map<K, List<T>> groupBy<K>(K Function(T) keyFunction) => fold(<K, List<T>>{}, (Map<K, List<T>> map, T element) => map..putIfAbsent(keyFunction(element), () => <T>[]).add(element));

  Iterable<T> distinctBy(Object Function(T e) getCompareValue) {
    var idSet = <Object>{};
    var distinct = <T>[];
    for (var d in this) {
      if (idSet.add(getCompareValue(d))) {
        distinct.add(d);
      }
    }
    return distinct;
  }
}
