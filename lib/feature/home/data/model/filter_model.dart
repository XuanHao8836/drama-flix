class FilterModel {
  final String id;
  final String name;

  const FilterModel({required this.id, required this.name});

  const FilterModel.popular() : this(id: 'popular', name: 'Phổ biến');
  const FilterModel.newest() : this(id: 'newest', name: 'Mới nhất');
  const FilterModel.trending() : this(id: 'trending', name: 'Tiền hiệp');
  const FilterModel.genre() : this(id: 'genre', name: 'Quyền mưu');
  const FilterModel.language() : this(id: 'language', name: 'Ngôn');

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is FilterModel &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;
}