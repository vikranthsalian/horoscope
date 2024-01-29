class SortUtil {
  sort(int id, list) {
    print("Sorting--------");
    print(id);

    switch (id) {
      case 0:
        //by revisitCount
        list.sort((a, b) {
          int a1 = int.parse((b.revisitCount));
          int a2 = int.parse((a.revisitCount));

          return a1.compareTo(a2);
        });
        return list;
      case 1:
        //by revisitCount
        list.sort((a, b) {
          int a1 = int.parse((b.revisitCount));
          int a2 = int.parse((a.revisitCount));

          return a1.compareTo(a2);
        });
        return list;
      case 2:
        //tagCount
        list.sort((a, b) {
          int a1 = int.parse((b.tagCount));
          int a2 = int.parse((a.tagCount));

          return a1.compareTo(a2);
        });
        return list;
    }
  }
}
