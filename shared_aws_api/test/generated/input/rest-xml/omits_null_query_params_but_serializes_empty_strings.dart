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

/// Omits null query params, but serializes empty strings
class OmitsNullQueryParamsButSerializesEmptyStrings {
  final _s.RestXmlProtocol _protocol;
  OmitsNullQueryParamsButSerializesEmptyStrings({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'OmitsNullQueryParams,ButSerializesEmptyStrings',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    String? foo,
  }) async {
    final $query = <String, List<String>>{
      if (foo != null) 'param-name': [foo],
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/path',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName1({
    String? foo,
  }) async {
    final $query = <String, List<String>>{
      if (foo != null) 'param-name': [foo],
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/path?abc=mno',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
