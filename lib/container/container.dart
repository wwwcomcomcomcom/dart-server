class Container {
  final Map<String, dynamic> _beans = {};
  void registBeanByName(String name, dynamic bean) {
    _beans.putIfAbsent(name, () => bean);
  }

  void registBean(dynamic bean) {
    _beans.putIfAbsent(bean.runtimeType.toString(), () => bean);
  }

  T getBeanByType<T>() {
    for (var bean in _beans.values) {
      if (bean.runtimeType == T) {
        return bean;
      }
    }

    throw Exception("Bean not found");
  }

  dynamic getBeanByName(String name) {
    dynamic result = _beans[name];
    if (result != null) {
      return result;
    }

    throw Exception("Bean not found");
  }
}
