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

/// String to string maps in querystring
class StringToStringMapsInQuerystring {
  final _s.RestJsonProtocol _protocol;
  StringToStringMapsInQuerystring({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'StringToStringMapsInQuerystring',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    required String pipelineId,
    Map<String, String>? queryDoc,
  }) async {
    ArgumentError.checkNotNull(pipelineId, 'pipelineId');
    final $query = <String, List<String>>{
      if (queryDoc != null)
        for (var e in queryDoc.entries) e.key: [e.value],
    };
    await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2014-01-01/jobsByPipeline/${Uri.encodeComponent(pipelineId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
