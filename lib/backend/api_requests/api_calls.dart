import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ViaCEPCall {
  static Future<ApiCallResponse> call({
    String? cep = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'ViaCEP',
      apiUrl: 'https://viacep.com.br/ws/${cep}/json/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? rua(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.logradouro''',
      ));
  static String? bairro(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.bairro''',
      ));
}

class EnviarDadosCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? senha = '',
    String? nome = '',
    String? celular = '',
    String? cpf = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": ${nome == null ? 'null' : '"${escapeStringForJson(nome)}"'},
  "email": ${email == null ? 'null' : '"${escapeStringForJson(email)}"'},
  "password": ${senha == null ? 'null' : '"${escapeStringForJson(senha)}"'},
  "papel_id": 6,
  "codigo_opt": 0,
  "data_expiracao": null,
  "celular": ${celular == null ? 'null' : '"${escapeStringForJson(celular)}"'},
  "cpf": ${cpf == null ? 'null' : '"${escapeStringForJson(cpf)}"'},
  "status_cliente_id": 1,
  "user_id": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'EnviarDados',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:OyLzSznU/user',
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

class ValidarOTPCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? otp = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": ${email == null ? 'null' : '"${escapeStringForJson(email)}"'},
  "codigo_digitado": ${otp == null ? 'null' : '"${escapeStringForJson(otp)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ValidarOTP',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:OyLzSznU/validarotp',
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

class CadastrarEnderecoCall {
  static Future<ApiCallResponse> call({
    String? rua = '',
    String? bairro = '',
    String? complemento = '',
    String? referencia = '',
    String? numero = '',
  }) async {
    final ffApiRequestBody = '''
{
  "logradouro": ${rua == null ? 'null' : '"${escapeStringForJson(rua)}"'},
  "numero": ${numero == null ? 'null' : '"${escapeStringForJson(numero)}"'},
  "complemento": ${complemento == null ? 'null' : '"${escapeStringForJson(complemento)}"'},
  "bairro": ${bairro == null ? 'null' : '"${escapeStringForJson(bairro)}"'},
  "referencia": ${referencia == null ? 'null' : '"${escapeStringForJson(referencia)}"'},
  "padrao": false,
  "tipoendereco_id": 1
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CadastrarEndereco',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:OyLzSznU/endereco',
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

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  final encoded = jsonEncode(input);
  return encoded.substring(1, encoded.length - 1);
}
