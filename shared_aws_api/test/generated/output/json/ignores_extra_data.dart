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

/// Ignores extra data
class IgnoresExtraData {
  final _s.JsonProtocol _protocol;
  IgnoresExtraData({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'IgnoresExtraData',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        );

  Future<OutputShape> operationName0() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IgnoresExtraData.OperationName'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return OutputShape.fromJson(jsonResponse.body);
  }
}

class OutputShape {
  final String? strType;

  OutputShape({
    this.strType,
  });
  factory OutputShape.fromJson(Map<String, dynamic> json) {
    return OutputShape(
      strType: json['StrType'] as String?,
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
