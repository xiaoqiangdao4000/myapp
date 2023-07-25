// To parse this JSON data, do
//
//     final wynewsMode = wynewsModeFromJson(jsonString);

import 'dart:convert';

WynewsMode wynewsModeFromJson(String str) => WynewsMode.fromJson(json.decode(str));

String wynewsModeToJson(WynewsMode data) => json.encode(data.toJson());

class WynewsMode {
    List<Bbm54PgAwangning> bbm54PgAwangning;

    WynewsMode({
        required this.bbm54PgAwangning,
    });

    factory WynewsMode.fromJson(Map<String, dynamic> json) => WynewsMode(
        bbm54PgAwangning: List<Bbm54PgAwangning>.from(json["BBM54PGAwangning"].map((x) => Bbm54PgAwangning.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "BBM54PGAwangning": List<dynamic>.from(bbm54PgAwangning.map((x) => x.toJson())),
    };
}

class Bbm54PgAwangning {
    dynamic liveInfo;
    String docid;
    String source;
    String title;
    int priority;
    int? hasImg;
    String url;
    int commentCount;
    String imgsrc3Gtype;
    String stitle;
    String digest;
    String imgsrc;
    DateTime ptime;
    String? skipUrl;
    String? skipType;
    String? modelmode;

    Bbm54PgAwangning({
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
        this.skipType,
        this.modelmode,
    });

    factory Bbm54PgAwangning.fromJson(Map<String, dynamic> json) => Bbm54PgAwangning(
        liveInfo: json["liveInfo"],
        docid: json["docid"],
        source: json["source"],
        title: json["title"],
        priority: json["priority"],
        hasImg: json["hasImg"],
        url: json["url"],
        commentCount: json["commentCount"],
        imgsrc3Gtype: json["imgsrc3gtype"],
        stitle: json["stitle"],
        digest: json["digest"],
        imgsrc: json["imgsrc"],
        ptime: DateTime.parse(json["ptime"]),
        skipUrl: json["skipURL"],
        skipType: json["skipType"],
        modelmode: json["modelmode"],
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
        "stitle": stitle,
        "digest": digest,
        "imgsrc": imgsrc,
        "ptime": ptime.toIso8601String(),
        "skipURL": skipUrl,
        "skipType": skipType,
        "modelmode": modelmode,
    };
}