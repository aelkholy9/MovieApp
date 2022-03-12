import 'dart:convert';

/// avatar : {"gravatar":{"hash":"ad19eb532d28f230aa1bca518239c822"},"tmdb":{"avatar_path":null}}
/// id : 12065845
/// iso_639_1 : "en"
/// iso_3166_1 : "EG"
/// name : ""
/// include_adult : false
/// username : "kholy1"

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.avatar,
    this.id,
    this.iso6391,
    this.iso31661,
    this.name,
    this.includeAdult,
    this.username,
  });

  User.fromJson(dynamic json) {
    avatar = json['avatar'] != null ? Avatar.fromJson(json['avatar']) : null;
    id = json['id'];
    iso6391 = json['iso_639_1'];
    iso31661 = json['iso_3166_1'];
    name = json['name'];
    includeAdult = json['include_adult'];
    username = json['username'];
  }
  Avatar? avatar;
  int? id;
  String? iso6391;
  String? iso31661;
  String? name;
  bool? includeAdult;
  String? username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (avatar != null) {
      map['avatar'] = avatar?.toJson();
    }
    map['id'] = id;
    map['iso_639_1'] = iso6391;
    map['iso_3166_1'] = iso31661;
    map['name'] = name;
    map['include_adult'] = includeAdult;
    map['username'] = username;
    return map;
  }
}

/// gravatar : {"hash":"ad19eb532d28f230aa1bca518239c822"}
/// tmdb : {"avatar_path":null}

Avatar avatarFromJson(String str) => Avatar.fromJson(json.decode(str));
String avatarToJson(Avatar data) => json.encode(data.toJson());

class Avatar {
  Avatar({
    this.gravatar,
    this.tmdb,
  });

  Avatar.fromJson(dynamic json) {
    gravatar =
        json['gravatar'] != null ? Gravatar.fromJson(json['gravatar']) : null;
    tmdb = json['tmdb'] != null ? Tmdb.fromJson(json['tmdb']) : null;
  }
  Gravatar? gravatar;
  Tmdb? tmdb;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (gravatar != null) {
      map['gravatar'] = gravatar?.toJson();
    }
    if (tmdb != null) {
      map['tmdb'] = tmdb?.toJson();
    }
    return map;
  }
}

/// avatar_path : null

Tmdb tmdbFromJson(String str) => Tmdb.fromJson(json.decode(str));
String tmdbToJson(Tmdb data) => json.encode(data.toJson());

class Tmdb {
  Tmdb({
    this.avatarPath,
  });

  Tmdb.fromJson(dynamic json) {
    avatarPath = json['avatar_path'];
  }
  dynamic avatarPath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['avatar_path'] = avatarPath;
    return map;
  }
}

/// hash : "ad19eb532d28f230aa1bca518239c822"

Gravatar gravatarFromJson(String str) => Gravatar.fromJson(json.decode(str));
String gravatarToJson(Gravatar data) => json.encode(data.toJson());

class Gravatar {
  Gravatar({
    this.hash,
  });

  Gravatar.fromJson(dynamic json) {
    hash = json['hash'];
  }
  String? hash;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['hash'] = hash;
    return map;
  }
}
