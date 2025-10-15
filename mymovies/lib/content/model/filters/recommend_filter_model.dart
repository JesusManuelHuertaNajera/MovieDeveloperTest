class RecommendFilterModel {
  final String textScreen;
  final String text;
  final int typeFilter; //1 languaje - 2  year
  bool isSelected;
  RecommendFilterModel({
    required this.textScreen,
    required this.text,
    required this.typeFilter,
    this.isSelected = false,
  });
}
