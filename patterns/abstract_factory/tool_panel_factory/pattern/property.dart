class Property<T> {
  final String name;
  final T Function() value;
  final void Function(T) onChange;

  Property({
    required this.name,
    required this.value,
    required this.onChange,
  });
}
