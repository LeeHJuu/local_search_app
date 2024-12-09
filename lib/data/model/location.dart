class Location {
  String title;
  String category;
  String roadAddress;
  String link;

  Location({
    required this.title,
    required this.category,
    required this.roadAddress,
    required this.link,
  });

  String replacedTitle() {
    return title.replaceAll(RegExp(r'<\/?b>'), '');
  }

  Location.fromJson(Map<String, dynamic> map)
      : this(
          title: map['title'],
          category: map['category'],
          roadAddress: map['roadAddress'],
          link: map['link'],
        );

  Map<String, dynamic> toJson() => {
        'title': title,
        'category': category,
        'roadAddress': roadAddress,
        'link': link,
      };
}


// "items": [
//     {
//       "title": "<b>광주</b>광역시청",
//       "link": "https://www.youtube.com/user/livegwangju",
//       "category": "공공,사회기관>특별,광역시청",
//       "description": "",
//       "telephone": "",
//       "address": "광주광역시 서구 치평동 1200 광주광역시청",
//       "roadAddress": "광주광역시 서구 내방로 111 광주광역시청",
//       "mapx": "1268513379",
//       "mapy": "351600320"
//     },