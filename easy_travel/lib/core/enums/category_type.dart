enum CategoryType {
  all(label: 'All'),
  adventure(label: 'Adventure'),
  beach(label: 'Beach'),
  city(label: 'City'),
  cultural(label: 'Cultural');

  final String label;
  const CategoryType({required this.label});
}