// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Song _$SongFromJson(Map<String, dynamic> json) => _Song(
      name: json['name'] as String,
      artistName: json['artistName'] as String,
      albumImageUrl: json['albumImageUrl'] as String,
      previewUrl: json['previewUrl'] as String?,
    );

Map<String, dynamic> _$SongToJson(_Song instance) => <String, dynamic>{
      'name': instance.name,
      'artistName': instance.artistName,
      'albumImageUrl': instance.albumImageUrl,
      'previewUrl': instance.previewUrl,
    };
