// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_notes_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllNotesResp _$GetAllNotesRespFromJson(Map<String, dynamic> json) =>
    GetAllNotesResp(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => NoteModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$GetAllNotesRespToJson(GetAllNotesResp instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
