import 'dart:convert';

import 'package:flutter_post_api/model/api_response.dart';
import 'package:flutter_post_api/model/note_for_listing.dart';
import 'package:flutter_post_api/views/note_list.dart';
import 'package:http/http.dart'as http;

//class NoteServices{
//  static const API="http://api.notes.programmingaddict.com";
//  static const headers={
//    "apikey" : "08d7b7eb-6736-182a-58ec-c5d1f50a07bf"
//  };
//  Future <ApiResponse<List<NoteForListing>>> getNotesList(){
//   return http.get(API+'/notes',headers: headers,).then((data) {
//   if (data.statusCode==200){
//     final jsonData =json.decode(data.body);
//     final notes =<NoteForListing>[];
//     for (var item in jsonData){
//       final note =NoteForListing(
//         noteID: item["noteId"],
//         createDateTime: DateTime.parse(item["createDateTime"]),
//         latestEditDateTime:item["latestEditDateTime"]!=null? DateTime.parse(item["latestEditDateTime"]):null,
//         noteTitle:item["noteTitle"]
//       );
//       notes.add(note);
//     }
//     return ApiResponse<List<NoteForListing>>(data: notes);
//   }
//   return ApiResponse<List<NoteForListing>>(error: true,errorMessage: "an error find");
//   }).catchError((_)=>ApiResponse<List<NoteForListing>>(error: true,errorMessage: "an error find"));
//  }
//
//   }

class NoteService {
  static const API = 'http://api.notes.programmingaddict.com';
  static const headers = {'apiKey': '08d7b7eb-6736-182a-58ec-c5d1f50a07bf'};

  Future<ApiResponse<List<NoteForListing>>> getNotesList() {
    return http.get(API + '/notes', headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <NoteForListing>[];
        for (var item in jsonData) {
          final note = NoteForListing(
            noteID: item['noteID'],
            noteTitle: item['noteTitle'],
            createDateTime: DateTime.parse(item['createDateTime']),
            latestEditDateTime: item['latestEditDateTime'] != null
                ? DateTime.parse(item['latestEditDateTime'])
                : null,
          );
          notes.add(note);
        }
        return ApiResponse<List<NoteForListing>>(data: notes);
      }
      return ApiResponse<List<NoteForListing>>(error: true, errorMessage: 'An error occured');
    })
        .catchError((_) => ApiResponse<List<NoteForListing>>(error: true, errorMessage: 'An error occured'));
  }
}








