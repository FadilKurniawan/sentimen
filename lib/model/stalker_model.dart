class StalkerModel {
  StalkerModel({
    this.account,
    this.link,
    this.follower,
    this.sentiment,
    this.followUp,
    this.detail,
    this.captureLink,
    this.time,
  });

  String? account;
  String? link;
  String? follower;
  String? sentiment;
  String? followUp;
  String? detail;
  String? captureLink;
  String? time;

  factory StalkerModel.fromJson(Map<String, dynamic> json) => StalkerModel(
        account: json["account"] == null ? null : json["account"],
        link: json["link"] == null ? null : json["link"],
        follower: json["follower"] == null ? null : json["follower"],
        sentiment: json["sentiment"] == null ? null : json["sentiment"],
        followUp: json["follow_up"] == null ? null : json["follow_up"],
        detail: json["detail"] == null ? null : json["detail"],
        captureLink: json["capture_link"] == null ? null : json["capture_link"],
        time: json["time"] == null ? null : json["time"],
      );

  Map<String, dynamic> toJson() => {
        "account": account == null ? null : account,
        "link": link == null ? null : link,
        "follower": follower == null ? null : follower,
        "sentiment": sentiment == null ? null : sentiment,
        "follow_up": followUp == null ? null : followUp,
        "detail": detail == null ? null : detail,
        "capture_link": captureLink == null ? null : captureLink,
        "time": time == null ? null : time,
      };

  List<String> toList() => [
        time ?? '',
        account ?? '',
        link ?? '',
        follower ?? '',
        sentiment ?? '',
        followUp ?? '',
        detail ?? '',
        captureLink ?? ''
      ];
}
