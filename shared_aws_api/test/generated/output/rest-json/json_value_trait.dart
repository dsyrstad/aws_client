// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// JSON value trait
class JSONValueTrait {
  final _s.RestJsonProtocol _protocol;
  JSONValueTrait({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'JSONValueTrait',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        );

  Future<OutputShape> operationName0() async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return OutputShape(
      bodyField: $json['BodyField'] == null
          ? null
          : jsonDecode($json['BodyField'] as String),
      bodyListField: $json['BodyListField'] == null
          ? null
          : ($json['BodyListField'] as List)
              .map((v) => jsonDecode(v as String))
              .toList()
              .cast<Object>(),
      headerField: _s.extractHeaderJsonValue(response.headers, 'X-Amz-Foo'),
    );
  }

  Future<OutputShape> operationName1() async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return OutputShape(
      bodyField: $json['BodyField'] == null
          ? null
          : jsonDecode($json['BodyField'] as String),
      bodyListField: $json['BodyListField'] == null
          ? null
          : ($json['BodyListField'] as List)
              .map((v) => jsonDecode(v as String))
              .toList()
              .cast<Object>(),
      headerField: _s.extractHeaderJsonValue(response.headers, 'X-Amz-Foo'),
    );
  }
}

class OutputShape {
  final Object? bodyField;
  final List<Object>? bodyListField;
  final Object? headerField;

  OutputShape({
    this.bodyField,
    this.bodyListField,
    this.headerField,
  });
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
