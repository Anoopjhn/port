/// thumbnailImage : "https://img.youtube.com/vi/hDVZykwl13I/sddefault.jpg"
/// videoUrl : "https://www.youtube.com/watch?v=hDVZykwl13I&t=20s"
/// title : "Top 70 Flutter Tips, Widgets & Packages"
/// publishDate : "23 Jul 2021"

class VideoModel {
  VideoModel({
      String? thumbnailImage, 
      String? videoUrl, 
      String? title, 
      String? publishDate,}){
    _thumbnailImage = thumbnailImage;
    _videoUrl = videoUrl;
    _title = title;
    _publishDate = publishDate;
}

  VideoModel.fromJson(dynamic json) {
    _thumbnailImage = json['thumbnailImage'];
    _videoUrl = json['videoUrl'];
    _title = json['title'];
    _publishDate = json['publishDate'];
  }
  String? _thumbnailImage;
  String? _videoUrl;
  String? _title;
  String? _publishDate;
VideoModel copyWith({  String? thumbnailImage,
  String? videoUrl,
  String? title,
  String? publishDate,
}) => VideoModel(  thumbnailImage: thumbnailImage ?? _thumbnailImage,
  videoUrl: videoUrl ?? _videoUrl,
  title: title ?? _title,
  publishDate: publishDate ?? _publishDate,
);
  String? get thumbnailImage => _thumbnailImage;
  String? get videoUrl => _videoUrl;
  String? get title => _title;
  String? get publishDate => _publishDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['thumbnailImage'] = _thumbnailImage;
    map['videoUrl'] = _videoUrl;
    map['title'] = _title;
    map['publishDate'] = _publishDate;
    return map;
  }

}