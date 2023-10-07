class Blog {
  final String id;
  final String imageUrl;
  final String title;
  bool isFavorite;
  bool isFollowing;

  Blog({
    required this.id,
    required this.imageUrl,
    required this.title,
    this.isFavorite = false,
    this.isFollowing = false,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
        id: json['id'] as String,
        title: json['title'] as String,
        imageUrl: json['image_url'] as String);
  }
}
