import 'dart:convert';

Latest latestFromJson(String str) => Latest.fromJson(json.decode(str));

String latestToJson(Latest data) => json.encode(data.toJson());

class Latest {
    Latest({
        this.motd,
        this.success,
        this.base,
        this.date,
        this.rates,
    });

    Motd motd;
    bool success;
    String base;
    DateTime date;
    Map<String, double> rates;

    factory Latest.fromJson(Map<String, dynamic> json) => Latest(
        motd: Motd.fromJson(json["motd"]),
        success: json["success"],
        base: json["base"],
        date: DateTime.parse(json["date"]),
        rates: Map.from(json["rates"]).map((k, v) => MapEntry<String, double>(k, v.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "motd": motd.toJson(),
        "success": success,
        "base": base,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "rates": Map.from(rates).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}

class Motd {
    Motd({
        this.msg,
        this.url,
    });

    String msg;
    String url;

    factory Motd.fromJson(Map<String, dynamic> json) => Motd(
        msg: json["msg"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "url": url,
    };
}
