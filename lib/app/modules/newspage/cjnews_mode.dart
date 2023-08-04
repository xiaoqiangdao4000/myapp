// To parse this JSON data, do
//
//     final newsStocks = newsStocksFromJson(jsonString);

import 'dart:convert';

NewsStocks newsStocksFromJson(String str) => NewsStocks.fromJson(json.decode(str));

String newsStocksToJson(NewsStocks data) => json.encode(data.toJson());

class NewsStocks {
    List<Ba8Ee5GMwangning> ba8Ee5GMwangning;

    NewsStocks({
        required this.ba8Ee5GMwangning,
    });

    factory NewsStocks.fromJson(Map<String, dynamic> json) => NewsStocks(
        ba8Ee5GMwangning: List<Ba8Ee5GMwangning>.from(json["BA8EE5GMwangning"].map((x) => Ba8Ee5GMwangning.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "BA8EE5GMwangning": List<dynamic>.from(ba8Ee5GMwangning.map((x) => x.toJson())),
    };
}

class Ba8Ee5GMwangning {
    dynamic liveInfo;
    String docid;
    String source;
    String title;
    int priority;
    int? hasImg;
    String url;
    int commentCount;
    String imgsrc3Gtype;
    Stitle? stitle;
    String digest;
    String imgsrc;
    DateTime ptime;
    String? skipUrl;
    Stitle? specialId;
    String? skipType;

    Ba8Ee5GMwangning({
        this.liveInfo,
        required this.docid,
        required this.source,
        required this.title,
        required this.priority,
        this.hasImg,
        required this.url,
        required this.commentCount,
        required this.imgsrc3Gtype,
        required this.stitle,
        required this.digest,
        required this.imgsrc,
        required this.ptime,
        this.skipUrl,
        this.specialId,
        this.skipType,
    });

    factory Ba8Ee5GMwangning.fromJson(Map<String, dynamic> json) => Ba8Ee5GMwangning(
        liveInfo: json["liveInfo"],
        docid: json["docid"],
        source: json["source"],
        title: json["title"],
        priority: json["priority"],
        hasImg: json["hasImg"],
        url: json["url"],
        commentCount: json["commentCount"],
        imgsrc3Gtype: json["imgsrc3gtype"],
        stitle: stitleValues.map[json["stitle"]],
        digest: json["digest"],
        imgsrc: json["imgsrc"],
        ptime: DateTime.parse(json["ptime"]),
        skipUrl: json["skipURL"],
        specialId: stitleValues.map[json["specialID"]],
        skipType: json["skipType"],
    );

    Map<String, dynamic> toJson() => {
        "liveInfo": liveInfo,
        "docid": docid,
        "source": source,
        "title": title,
        "priority": priority,
        "hasImg": hasImg,
        "url": url,
        "commentCount": commentCount,
        "imgsrc3gtype": imgsrc3Gtype,
        "stitle": stitleValues.reverse[stitle],
        "digest": digest,
        "imgsrc": imgsrc,
        "ptime": ptime.toIso8601String(),
        "skipURL": skipUrl,
        "specialID": stitleValues.reverse[specialId],
        "skipType": skipType,
    };
}

enum Stitle { EMPTY, S1690955014871 }

final stitleValues = EnumValues({
    "": Stitle.EMPTY,
    "S1690955014871": Stitle.S1690955014871
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
