import 'package:blogexplorer/models/blog_model.dart';
import 'package:hive/hive.dart';

class BlogAdapter extends TypeAdapter<Blog> {
  @override
  final typeId = 0; // Unique ID for the model

  @override
  Blog read(BinaryReader reader) {
    return Blog(
      id: reader.readString(),
      title: reader.readString(),
      imageUrl: reader.readString(),
      isFavorite: reader.readBool(),
      isFollowing: reader.readBool(),
    );
  }

  @override
  void write(BinaryWriter writer, Blog obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.title);
    writer.writeString(obj.imageUrl);
    writer.writeBool(obj.isFavorite);
    writer.writeBool(obj.isFollowing);
  }
}
