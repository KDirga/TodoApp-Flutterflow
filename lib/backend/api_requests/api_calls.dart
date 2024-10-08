import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SendEmailToUserCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? displayName = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${email}",
  "displayName": "${displayName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SendEmailToUser',
      apiUrl:
          'https://us-central1-todo-xq05fp.cloudfunctions.net/sendWelcomeEmail',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SendWelcomeEmailCall {
  static Future<ApiCallResponse> call({
    String? to = '',
    String? subject = '',
    String? text = '',
  }) async {
    final ffApiRequestBody = '''
{
  "From": "keanna.dirga@uri.edu",
  "To": "${to}",
  "Subject": "${subject}",
  "HtmlBody": "${text}",
  "MessageStream": "test"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SendWelcomeEmail',
      apiUrl: 'https://api.postmarkapp.com/email',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'X-Postmark-Server-Token': '13bd0e12-5a56-4221-9ab4-0752896a3213',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
