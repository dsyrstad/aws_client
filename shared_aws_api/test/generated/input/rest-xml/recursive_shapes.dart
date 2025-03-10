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

/// Recursive shapes
class RecursiveShapes {
  final _s.RestXmlProtocol _protocol;
  RecursiveShapes({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'RecursiveShapes',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    RecursiveStructType? recursiveStruct,
  }) async {
    await _protocol.send(
      method: 'POST',
      requestUri: '/path',
      payload: InputShape(recursiveStruct: recursiveStruct).toXml(
        'OperationRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'), 'https://foo/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName1({
    RecursiveStructType? recursiveStruct,
  }) async {
    await _protocol.send(
      method: 'POST',
      requestUri: '/path',
      payload: InputShape(recursiveStruct: recursiveStruct).toXml(
        'OperationRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'), 'https://foo/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName2({
    RecursiveStructType? recursiveStruct,
  }) async {
    await _protocol.send(
      method: 'POST',
      requestUri: '/path',
      payload: InputShape(recursiveStruct: recursiveStruct).toXml(
        'OperationRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'), 'https://foo/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName3({
    RecursiveStructType? recursiveStruct,
  }) async {
    await _protocol.send(
      method: 'POST',
      requestUri: '/path',
      payload: InputShape(recursiveStruct: recursiveStruct).toXml(
        'OperationRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'), 'https://foo/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName4({
    RecursiveStructType? recursiveStruct,
  }) async {
    await _protocol.send(
      method: 'POST',
      requestUri: '/path',
      payload: InputShape(recursiveStruct: recursiveStruct).toXml(
        'OperationRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'), 'https://foo/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName5({
    RecursiveStructType? recursiveStruct,
  }) async {
    await _protocol.send(
      method: 'POST',
      requestUri: '/path',
      payload: InputShape(recursiveStruct: recursiveStruct).toXml(
        'OperationRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'), 'https://foo/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
  }
}

class InputShape {
  final RecursiveStructType? recursiveStruct;

  InputShape({
    this.recursiveStruct,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final recursiveStruct = this.recursiveStruct;
    final $children = <_s.XmlNode>[
      if (recursiveStruct != null) recursiveStruct.toXml('RecursiveStruct'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

class RecursiveStructType {
  final String? noRecurse;
  final List<RecursiveStructType>? recursiveList;
  final Map<String, RecursiveStructType>? recursiveMap;
  final RecursiveStructType? recursiveStruct;

  RecursiveStructType({
    this.noRecurse,
    this.recursiveList,
    this.recursiveMap,
    this.recursiveStruct,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final noRecurse = this.noRecurse;
    final recursiveList = this.recursiveList;
    final recursiveMap = this.recursiveMap;
    final recursiveStruct = this.recursiveStruct;
    final $children = <_s.XmlNode>[
      if (noRecurse != null) _s.encodeXmlStringValue('NoRecurse', noRecurse),
      if (recursiveStruct != null) recursiveStruct.toXml('RecursiveStruct'),
      if (recursiveList != null)
        _s.XmlElement(_s.XmlName('RecursiveList'), [],
            recursiveList.map((e) => e.toXml('member'))),
      if (recursiveMap != null)
        _s.XmlElement(
            _s.XmlName('RecursiveMap'),
            [],
            recursiveMap.entries.map((e) => _s.XmlElement(
                    _s.XmlName('entry'), [], <_s.XmlNode>[
                  _s.encodeXmlStringValue('key', e.key),
                  e.value.toXml('value')
                ]))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
