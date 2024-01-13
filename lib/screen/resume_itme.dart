class Resume {
  final List<ResumeItem> items;

  Resume({required this.items});
}

class ResumeItem {
  String title;
  String content;

  ResumeItem({required this.title, required this.content});
}
