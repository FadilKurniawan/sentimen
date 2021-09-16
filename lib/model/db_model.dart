class DBModel {
  DBModel({
    this.columnHeadersStalker,
    this.sentiments,
    this.followuper,
    this.intervals,
  });

  List<StringId>? columnHeadersStalker;
  List<StringId>? sentiments;
  List<StringId>? followuper;
  List<Intervals>? intervals;

  factory DBModel.fromJson(Map<String, dynamic> json) => DBModel(
        columnHeadersStalker: json["columnHeadersStalker"] == null
            ? null
            : List<StringId>.from(
                json["columnHeadersStalker"].map((x) => StringId.fromJson(x))),
        sentiments: json["sentiments"] == null
            ? null
            : List<StringId>.from(
                json["sentiments"].map((x) => StringId.fromJson(x))),
        followuper: json["followuper"] == null
            ? null
            : List<StringId>.from(
                json["followuper"].map((x) => StringId.fromJson(x))),
        intervals: json["intervals"] == null
            ? null
            : List<Intervals>.from(
                json["intervals"].map((x) => Intervals.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "columnHeadersStalker": columnHeadersStalker == null
            ? null
            : List<dynamic>.from(columnHeadersStalker!.map((x) => x.toJson())),
        "sentiments": sentiments == null
            ? null
            : List<dynamic>.from(sentiments!.map((x) => x.toJson())),
        "followuper": followuper == null
            ? null
            : List<dynamic>.from(followuper!.map((x) => x.toJson())),
        "intervals": intervals == null
            ? null
            : List<dynamic>.from(intervals!.map((x) => x.toJson())),
      };
}

class StringId {
  StringId({
    this.id,
    this.value,
  });

  int? id;
  String? value;

  factory StringId.fromJson(Map<String, dynamic> json) => StringId(
        id: json["id"] == null ? null : json["id"],
        value: json["value"] == null ? null : json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "value": value == null ? null : value,
      };
}

class Intervals {
  Intervals({
    this.id,
    this.value,
    this.time,
  });

  int? id;
  String? value;
  List<StringId>? time;

  factory Intervals.fromJson(Map<String, dynamic> json) => Intervals(
        id: json["id"] == null ? null : json["id"],
        value: json["value"] == null ? null : json["value"],
        time: json["time"] == null
            ? null
            : List<StringId>.from(
                json["time"].map((x) => StringId.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "value": value == null ? null : value,
        "time": time == null
            ? null
            : List<dynamic>.from(time!.map((x) => x.toJson())),
      };
}
