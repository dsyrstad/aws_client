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

/// AWS IoT-Data enables secure, bi-directional communication between
/// Internet-connected things (such as sensors, actuators, embedded devices, or
/// smart appliances) and the AWS cloud. It implements a broker for applications
/// and things to publish messages over HTTP (Publish) and retrieve, update, and
/// delete shadows. A shadow is a persistent representation of your things and
/// their state in the AWS cloud.
class IoTDataPlane {
  final _s.RestJsonProtocol _protocol;
  IoTDataPlane({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'data.iot',
            signingName: 'iotdata',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        );

  /// Deletes the shadow for the specified thing.
  ///
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/iot/latest/developerguide/API_DeleteThingShadow.html">DeleteThingShadow</a>
  /// in the AWS IoT Developer Guide.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [MethodNotAllowedException].
  /// May throw [UnsupportedDocumentEncodingException].
  ///
  /// Parameter [thingName] :
  /// The name of the thing.
  ///
  /// Parameter [shadowName] :
  /// The name of the shadow.
  Future<DeleteThingShadowResponse> deleteThingShadow({
    required String thingName,
    String? shadowName,
  }) async {
    ArgumentError.checkNotNull(thingName, 'thingName');
    _s.validateStringLength(
      'thingName',
      thingName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'shadowName',
      shadowName,
      1,
      64,
    );
    final $query = <String, List<String>>{
      if (shadowName != null) 'name': [shadowName],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'DELETE',
      requestUri: '/things/${Uri.encodeComponent(thingName)}/shadow',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteThingShadowResponse(
      payload: await response.stream.toBytes(),
    );
  }

  /// Gets the shadow for the specified thing.
  ///
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/iot/latest/developerguide/API_GetThingShadow.html">GetThingShadow</a>
  /// in the AWS IoT Developer Guide.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [MethodNotAllowedException].
  /// May throw [UnsupportedDocumentEncodingException].
  ///
  /// Parameter [thingName] :
  /// The name of the thing.
  ///
  /// Parameter [shadowName] :
  /// The name of the shadow.
  Future<GetThingShadowResponse> getThingShadow({
    required String thingName,
    String? shadowName,
  }) async {
    ArgumentError.checkNotNull(thingName, 'thingName');
    _s.validateStringLength(
      'thingName',
      thingName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'shadowName',
      shadowName,
      1,
      64,
    );
    final $query = <String, List<String>>{
      if (shadowName != null) 'name': [shadowName],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/things/${Uri.encodeComponent(thingName)}/shadow',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetThingShadowResponse(
      payload: await response.stream.toBytes(),
    );
  }

  /// Lists the shadows for the specified thing.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [MethodNotAllowedException].
  ///
  /// Parameter [thingName] :
  /// The name of the thing.
  ///
  /// Parameter [nextToken] :
  /// The token to retrieve the next set of results.
  ///
  /// Parameter [pageSize] :
  /// The result page size.
  Future<ListNamedShadowsForThingResponse> listNamedShadowsForThing({
    required String thingName,
    String? nextToken,
    int? pageSize,
  }) async {
    ArgumentError.checkNotNull(thingName, 'thingName');
    _s.validateStringLength(
      'thingName',
      thingName,
      1,
      128,
      isRequired: true,
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (nextToken != null) 'nextToken': [nextToken],
      if (pageSize != null) 'pageSize': [pageSize.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/api/things/shadow/ListNamedShadowsForThing/${Uri.encodeComponent(thingName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListNamedShadowsForThingResponse.fromJson(response);
  }

  /// Publishes state information.
  ///
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/iot/latest/developerguide/protocols.html#http">HTTP
  /// Protocol</a> in the AWS IoT Developer Guide.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [MethodNotAllowedException].
  ///
  /// Parameter [topic] :
  /// The name of the MQTT topic.
  ///
  /// Parameter [payload] :
  /// The state information, in JSON format.
  ///
  /// Parameter [qos] :
  /// The Quality of Service (QoS) level.
  Future<void> publish({
    required String topic,
    Uint8List? payload,
    int? qos,
  }) async {
    ArgumentError.checkNotNull(topic, 'topic');
    _s.validateNumRange(
      'qos',
      qos,
      0,
      1,
    );
    final $query = <String, List<String>>{
      if (qos != null) 'qos': [qos.toString()],
    };
    await _protocol.send(
      payload: payload,
      method: 'POST',
      requestUri: '/topics/${Uri.encodeComponent(topic)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the shadow for the specified thing.
  ///
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/iot/latest/developerguide/API_UpdateThingShadow.html">UpdateThingShadow</a>
  /// in the AWS IoT Developer Guide.
  ///
  /// May throw [ConflictException].
  /// May throw [RequestEntityTooLargeException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [MethodNotAllowedException].
  /// May throw [UnsupportedDocumentEncodingException].
  ///
  /// Parameter [payload] :
  /// The state information, in JSON format.
  ///
  /// Parameter [thingName] :
  /// The name of the thing.
  ///
  /// Parameter [shadowName] :
  /// The name of the shadow.
  Future<UpdateThingShadowResponse> updateThingShadow({
    required Uint8List payload,
    required String thingName,
    String? shadowName,
  }) async {
    ArgumentError.checkNotNull(payload, 'payload');
    ArgumentError.checkNotNull(thingName, 'thingName');
    _s.validateStringLength(
      'thingName',
      thingName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'shadowName',
      shadowName,
      1,
      64,
    );
    final $query = <String, List<String>>{
      if (shadowName != null) 'name': [shadowName],
    };
    final response = await _protocol.sendRaw(
      payload: payload,
      method: 'POST',
      requestUri: '/things/${Uri.encodeComponent(thingName)}/shadow',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateThingShadowResponse(
      payload: await response.stream.toBytes(),
    );
  }
}

/// The output from the DeleteThingShadow operation.
class DeleteThingShadowResponse {
  /// The state information, in JSON format.
  final Uint8List payload;

  DeleteThingShadowResponse({
    required this.payload,
  });
}

/// The output from the GetThingShadow operation.
class GetThingShadowResponse {
  /// The state information, in JSON format.
  final Uint8List? payload;

  GetThingShadowResponse({
    this.payload,
  });
}

class ListNamedShadowsForThingResponse {
  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  /// The list of shadows for the specified thing.
  final List<String>? results;

  /// The Epoch date and time the response was generated by AWS IoT.
  final int? timestamp;

  ListNamedShadowsForThingResponse({
    this.nextToken,
    this.results,
    this.timestamp,
  });
  factory ListNamedShadowsForThingResponse.fromJson(Map<String, dynamic> json) {
    return ListNamedShadowsForThingResponse(
      nextToken: json['nextToken'] as String?,
      results: (json['results'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      timestamp: json['timestamp'] as int?,
    );
  }
}

/// The output from the UpdateThingShadow operation.
class UpdateThingShadowResponse {
  /// The state information, in JSON format.
  final Uint8List? payload;

  UpdateThingShadowResponse({
    this.payload,
  });
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalFailureException extends _s.GenericAwsException {
  InternalFailureException({String? type, String? message})
      : super(type: type, code: 'InternalFailureException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class MethodNotAllowedException extends _s.GenericAwsException {
  MethodNotAllowedException({String? type, String? message})
      : super(type: type, code: 'MethodNotAllowedException', message: message);
}

class RequestEntityTooLargeException extends _s.GenericAwsException {
  RequestEntityTooLargeException({String? type, String? message})
      : super(
            type: type,
            code: 'RequestEntityTooLargeException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String? type, String? message})
      : super(type: type, code: 'UnauthorizedException', message: message);
}

class UnsupportedDocumentEncodingException extends _s.GenericAwsException {
  UnsupportedDocumentEncodingException({String? type, String? message})
      : super(
            type: type,
            code: 'UnsupportedDocumentEncodingException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalFailureException': (type, message) =>
      InternalFailureException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'MethodNotAllowedException': (type, message) =>
      MethodNotAllowedException(type: type, message: message),
  'RequestEntityTooLargeException': (type, message) =>
      RequestEntityTooLargeException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'UnauthorizedException': (type, message) =>
      UnauthorizedException(type: type, message: message),
  'UnsupportedDocumentEncodingException': (type, message) =>
      UnsupportedDocumentEncodingException(type: type, message: message),
};
