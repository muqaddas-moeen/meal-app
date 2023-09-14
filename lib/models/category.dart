class Categoryy {
  const Categoryy(
      {required this.id,
      required this.title,
      required this.image,
      required this.leftMargin,
      required this.rightMargin,
      required this.onTap});

  final String id;
  final String title;
  final String image;
  final double leftMargin;
  final double rightMargin;
  final void Function() onTap;
}
