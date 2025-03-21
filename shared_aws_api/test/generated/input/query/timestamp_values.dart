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

import 'timestamp_values.meta.dart';
export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Timestamp values
class TimestampValues {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  TimestampValues({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'TimestampValues',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
        ),
        shapes = shapesJson
            .map((key, value) => MapEntry(key, _s.Shape.fromJson(value)));

  Future<void> operationName0({
    DateTime? timeArg,
    DateTime? timeCustom,
    DateTime? timeFormat,
  }) async {
    final $request = <String, dynamic>{};
    timeArg?.also((arg) => $request['TimeArg'] = _s.iso8601ToJson(arg));
    timeCustom?.also((arg) =>
        $request['TimeCustom'] = _s.unixTimestampToJson(arg).toString());
    timeFormat?.also((arg) =>
        $request['TimeFormat'] = _s.unixTimestampToJson(arg).toString());
    await _protocol.send(
      $request,
      action: 'OperationName',
      version: '2014-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['InputShape'],
      shapes: shapes,
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
