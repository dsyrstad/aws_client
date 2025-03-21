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

/// Amazon Comprehend is an AWS service for gaining insight into the content of
/// documents. Use these actions to determine the topics contained in your
/// documents, the topics they discuss, the predominant sentiment expressed in
/// them, the predominant language used, and more.
class Comprehend {
  final _s.JsonProtocol _protocol;
  Comprehend({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'comprehend',
            signingName: 'comprehend',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        );

  /// Determines the dominant language of the input text for a batch of
  /// documents. For a list of languages that Amazon Comprehend can detect, see
  /// <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/how-languages.html">Amazon
  /// Comprehend Supported Languages</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TextSizeLimitExceededException].
  /// May throw [BatchSizeLimitExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [textList] :
  /// A list containing the text of the input documents. The list can contain a
  /// maximum of 25 documents. Each document should contain at least 20
  /// characters and must contain fewer than 5,000 bytes of UTF-8 encoded
  /// characters.
  Future<BatchDetectDominantLanguageResponse> batchDetectDominantLanguage({
    required List<String> textList,
  }) async {
    ArgumentError.checkNotNull(textList, 'textList');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.BatchDetectDominantLanguage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TextList': textList,
      },
    );

    return BatchDetectDominantLanguageResponse.fromJson(jsonResponse.body);
  }

  /// Inspects the text of a batch of documents for named entities and returns
  /// information about them. For more information about named entities, see
  /// <a>how-entities</a>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TextSizeLimitExceededException].
  /// May throw [UnsupportedLanguageException].
  /// May throw [BatchSizeLimitExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [languageCode] :
  /// The language of the input documents. You can specify any of the primary
  /// languages supported by Amazon Comprehend. All documents must be in the
  /// same language.
  ///
  /// Parameter [textList] :
  /// A list containing the text of the input documents. The list can contain a
  /// maximum of 25 documents. Each document must contain fewer than 5,000 bytes
  /// of UTF-8 encoded characters.
  Future<BatchDetectEntitiesResponse> batchDetectEntities({
    required LanguageCode languageCode,
    required List<String> textList,
  }) async {
    ArgumentError.checkNotNull(languageCode, 'languageCode');
    ArgumentError.checkNotNull(textList, 'textList');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.BatchDetectEntities'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LanguageCode': languageCode.toValue(),
        'TextList': textList,
      },
    );

    return BatchDetectEntitiesResponse.fromJson(jsonResponse.body);
  }

  /// Detects the key noun phrases found in a batch of documents.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TextSizeLimitExceededException].
  /// May throw [UnsupportedLanguageException].
  /// May throw [BatchSizeLimitExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [languageCode] :
  /// The language of the input documents. You can specify any of the primary
  /// languages supported by Amazon Comprehend. All documents must be in the
  /// same language.
  ///
  /// Parameter [textList] :
  /// A list containing the text of the input documents. The list can contain a
  /// maximum of 25 documents. Each document must contain fewer that 5,000 bytes
  /// of UTF-8 encoded characters.
  Future<BatchDetectKeyPhrasesResponse> batchDetectKeyPhrases({
    required LanguageCode languageCode,
    required List<String> textList,
  }) async {
    ArgumentError.checkNotNull(languageCode, 'languageCode');
    ArgumentError.checkNotNull(textList, 'textList');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.BatchDetectKeyPhrases'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LanguageCode': languageCode.toValue(),
        'TextList': textList,
      },
    );

    return BatchDetectKeyPhrasesResponse.fromJson(jsonResponse.body);
  }

  /// Inspects a batch of documents and returns an inference of the prevailing
  /// sentiment, <code>POSITIVE</code>, <code>NEUTRAL</code>,
  /// <code>MIXED</code>, or <code>NEGATIVE</code>, in each one.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TextSizeLimitExceededException].
  /// May throw [UnsupportedLanguageException].
  /// May throw [BatchSizeLimitExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [languageCode] :
  /// The language of the input documents. You can specify any of the primary
  /// languages supported by Amazon Comprehend. All documents must be in the
  /// same language.
  ///
  /// Parameter [textList] :
  /// A list containing the text of the input documents. The list can contain a
  /// maximum of 25 documents. Each document must contain fewer that 5,000 bytes
  /// of UTF-8 encoded characters.
  Future<BatchDetectSentimentResponse> batchDetectSentiment({
    required LanguageCode languageCode,
    required List<String> textList,
  }) async {
    ArgumentError.checkNotNull(languageCode, 'languageCode');
    ArgumentError.checkNotNull(textList, 'textList');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.BatchDetectSentiment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LanguageCode': languageCode.toValue(),
        'TextList': textList,
      },
    );

    return BatchDetectSentimentResponse.fromJson(jsonResponse.body);
  }

  /// Inspects the text of a batch of documents for the syntax and part of
  /// speech of the words in the document and returns information about them.
  /// For more information, see <a>how-syntax</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TextSizeLimitExceededException].
  /// May throw [UnsupportedLanguageException].
  /// May throw [BatchSizeLimitExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [languageCode] :
  /// The language of the input documents. You can specify any of the following
  /// languages supported by Amazon Comprehend: German ("de"), English ("en"),
  /// Spanish ("es"), French ("fr"), Italian ("it"), or Portuguese ("pt"). All
  /// documents must be in the same language.
  ///
  /// Parameter [textList] :
  /// A list containing the text of the input documents. The list can contain a
  /// maximum of 25 documents. Each document must contain fewer that 5,000 bytes
  /// of UTF-8 encoded characters.
  Future<BatchDetectSyntaxResponse> batchDetectSyntax({
    required SyntaxLanguageCode languageCode,
    required List<String> textList,
  }) async {
    ArgumentError.checkNotNull(languageCode, 'languageCode');
    ArgumentError.checkNotNull(textList, 'textList');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.BatchDetectSyntax'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LanguageCode': languageCode.toValue(),
        'TextList': textList,
      },
    );

    return BatchDetectSyntaxResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new document classification request to analyze a single document
  /// in real-time, using a previously created and trained custom model and an
  /// endpoint.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceUnavailableException].
  /// May throw [TextSizeLimitExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [endpointArn] :
  /// The Amazon Resource Number (ARN) of the endpoint.
  ///
  /// Parameter [text] :
  /// The document text to be analyzed.
  Future<ClassifyDocumentResponse> classifyDocument({
    required String endpointArn,
    required String text,
  }) async {
    ArgumentError.checkNotNull(endpointArn, 'endpointArn');
    _s.validateStringLength(
      'endpointArn',
      endpointArn,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(text, 'text');
    _s.validateStringLength(
      'text',
      text,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.ClassifyDocument'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndpointArn': endpointArn,
        'Text': text,
      },
    );

    return ClassifyDocumentResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new document classifier that you can use to categorize
  /// documents. To create a classifier, you provide a set of training documents
  /// that labeled with the categories that you want to use. After the
  /// classifier is trained you can use it to categorize a set of labeled
  /// documents into the categories. For more information, see
  /// <a>how-document-classification</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceInUseException].
  /// May throw [TooManyTagsException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [UnsupportedLanguageException].
  /// May throw [KmsKeyValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of the AWS Identity and Management (IAM)
  /// role that grants Amazon Comprehend read access to your input data.
  ///
  /// Parameter [documentClassifierName] :
  /// The name of the document classifier.
  ///
  /// Parameter [inputDataConfig] :
  /// Specifies the format and location of the input data for the job.
  ///
  /// Parameter [languageCode] :
  /// The language of the input documents. You can specify any of the following
  /// languages supported by Amazon Comprehend: German ("de"), English ("en"),
  /// Spanish ("es"), French ("fr"), Italian ("it"), or Portuguese ("pt"). All
  /// documents must be in the same language.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for the request. If you don't set the client request
  /// token, Amazon Comprehend generates one.
  ///
  /// Parameter [mode] :
  /// Indicates the mode in which the classifier will be trained. The classifier
  /// can be trained in multi-class mode, which identifies one and only one
  /// class for each document, or multi-label mode, which identifies one or more
  /// labels for each document. In multi-label mode, multiple labels for an
  /// individual document are separated by a delimiter. The default delimiter
  /// between labels is a pipe (|).
  ///
  /// Parameter [outputDataConfig] :
  /// Enables the addition of output results configuration parameters for custom
  /// classifier jobs.
  ///
  /// Parameter [tags] :
  /// Tags to be associated with the document classifier being created. A tag is
  /// a key-value pair that adds as a metadata to a resource used by Amazon
  /// Comprehend. For example, a tag with "Sales" as the key might be added to a
  /// resource to indicate its use by the sales department.
  ///
  /// Parameter [volumeKmsKeyId] :
  /// ID for the AWS Key Management Service (KMS) key that Amazon Comprehend
  /// uses to encrypt data on the storage volume attached to the ML compute
  /// instance(s) that process the analysis job. The VolumeKmsKeyId can be
  /// either of the following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [vpcConfig] :
  /// Configuration parameters for an optional private Virtual Private Cloud
  /// (VPC) containing the resources you are using for your custom classifier.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon
  /// VPC</a>.
  Future<CreateDocumentClassifierResponse> createDocumentClassifier({
    required String dataAccessRoleArn,
    required String documentClassifierName,
    required DocumentClassifierInputDataConfig inputDataConfig,
    required LanguageCode languageCode,
    String? clientRequestToken,
    DocumentClassifierMode? mode,
    DocumentClassifierOutputDataConfig? outputDataConfig,
    List<Tag>? tags,
    String? volumeKmsKeyId,
    VpcConfig? vpcConfig,
  }) async {
    ArgumentError.checkNotNull(dataAccessRoleArn, 'dataAccessRoleArn');
    _s.validateStringLength(
      'dataAccessRoleArn',
      dataAccessRoleArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        documentClassifierName, 'documentClassifierName');
    _s.validateStringLength(
      'documentClassifierName',
      documentClassifierName,
      0,
      63,
      isRequired: true,
    );
    ArgumentError.checkNotNull(inputDataConfig, 'inputDataConfig');
    ArgumentError.checkNotNull(languageCode, 'languageCode');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringLength(
      'volumeKmsKeyId',
      volumeKmsKeyId,
      0,
      2048,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.CreateDocumentClassifier'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataAccessRoleArn': dataAccessRoleArn,
        'DocumentClassifierName': documentClassifierName,
        'InputDataConfig': inputDataConfig,
        'LanguageCode': languageCode.toValue(),
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (mode != null) 'Mode': mode.toValue(),
        if (outputDataConfig != null) 'OutputDataConfig': outputDataConfig,
        if (tags != null) 'Tags': tags,
        if (volumeKmsKeyId != null) 'VolumeKmsKeyId': volumeKmsKeyId,
        if (vpcConfig != null) 'VpcConfig': vpcConfig,
      },
    );

    return CreateDocumentClassifierResponse.fromJson(jsonResponse.body);
  }

  /// Creates a model-specific endpoint for synchronous inference for a
  /// previously trained custom model
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [TooManyTagsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [desiredInferenceUnits] :
  /// The desired number of inference units to be used by the model using this
  /// endpoint. Each inference unit represents of a throughput of 100 characters
  /// per second.
  ///
  /// Parameter [endpointName] :
  /// This is the descriptive suffix that becomes part of the
  /// <code>EndpointArn</code> used for all subsequent requests to this
  /// resource.
  ///
  /// Parameter [modelArn] :
  /// The Amazon Resource Number (ARN) of the model to which the endpoint will
  /// be attached.
  ///
  /// Parameter [clientRequestToken] :
  /// An idempotency token provided by the customer. If this token matches a
  /// previous endpoint creation request, Amazon Comprehend will not return a
  /// <code>ResourceInUseException</code>.
  ///
  /// Parameter [tags] :
  /// Tags associated with the endpoint being created. A tag is a key-value pair
  /// that adds metadata to the endpoint. For example, a tag with "Sales" as the
  /// key might be added to an endpoint to indicate its use by the sales
  /// department.
  Future<CreateEndpointResponse> createEndpoint({
    required int desiredInferenceUnits,
    required String endpointName,
    required String modelArn,
    String? clientRequestToken,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(desiredInferenceUnits, 'desiredInferenceUnits');
    _s.validateNumRange(
      'desiredInferenceUnits',
      desiredInferenceUnits,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(endpointName, 'endpointName');
    _s.validateStringLength(
      'endpointName',
      endpointName,
      0,
      40,
      isRequired: true,
    );
    ArgumentError.checkNotNull(modelArn, 'modelArn');
    _s.validateStringLength(
      'modelArn',
      modelArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.CreateEndpoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DesiredInferenceUnits': desiredInferenceUnits,
        'EndpointName': endpointName,
        'ModelArn': modelArn,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateEndpointResponse.fromJson(jsonResponse.body);
  }

  /// Creates an entity recognizer using submitted files. After your
  /// <code>CreateEntityRecognizer</code> request is submitted, you can check
  /// job status using the API.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceInUseException].
  /// May throw [TooManyTagsException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [UnsupportedLanguageException].
  /// May throw [KmsKeyValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of the AWS Identity and Management (IAM)
  /// role that grants Amazon Comprehend read access to your input data.
  ///
  /// Parameter [inputDataConfig] :
  /// Specifies the format and location of the input data. The S3 bucket
  /// containing the input data must be located in the same region as the entity
  /// recognizer being created.
  ///
  /// Parameter [languageCode] :
  /// You can specify any of the following languages supported by Amazon
  /// Comprehend: English ("en"), Spanish ("es"), French ("fr"), Italian ("it"),
  /// German ("de"), or Portuguese ("pt"). All documents must be in the same
  /// language.
  ///
  /// Parameter [recognizerName] :
  /// The name given to the newly created recognizer. Recognizer names can be a
  /// maximum of 256 characters. Alphanumeric characters, hyphens (-) and
  /// underscores (_) are allowed. The name must be unique in the
  /// account/region.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for the request. If you don't set the client request
  /// token, Amazon Comprehend generates one.
  ///
  /// Parameter [tags] :
  /// Tags to be associated with the entity recognizer being created. A tag is a
  /// key-value pair that adds as a metadata to a resource used by Amazon
  /// Comprehend. For example, a tag with "Sales" as the key might be added to a
  /// resource to indicate its use by the sales department.
  ///
  /// Parameter [volumeKmsKeyId] :
  /// ID for the AWS Key Management Service (KMS) key that Amazon Comprehend
  /// uses to encrypt data on the storage volume attached to the ML compute
  /// instance(s) that process the analysis job. The VolumeKmsKeyId can be
  /// either of the following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [vpcConfig] :
  /// Configuration parameters for an optional private Virtual Private Cloud
  /// (VPC) containing the resources you are using for your custom entity
  /// recognizer. For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon
  /// VPC</a>.
  Future<CreateEntityRecognizerResponse> createEntityRecognizer({
    required String dataAccessRoleArn,
    required EntityRecognizerInputDataConfig inputDataConfig,
    required LanguageCode languageCode,
    required String recognizerName,
    String? clientRequestToken,
    List<Tag>? tags,
    String? volumeKmsKeyId,
    VpcConfig? vpcConfig,
  }) async {
    ArgumentError.checkNotNull(dataAccessRoleArn, 'dataAccessRoleArn');
    _s.validateStringLength(
      'dataAccessRoleArn',
      dataAccessRoleArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(inputDataConfig, 'inputDataConfig');
    ArgumentError.checkNotNull(languageCode, 'languageCode');
    ArgumentError.checkNotNull(recognizerName, 'recognizerName');
    _s.validateStringLength(
      'recognizerName',
      recognizerName,
      0,
      63,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringLength(
      'volumeKmsKeyId',
      volumeKmsKeyId,
      0,
      2048,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.CreateEntityRecognizer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataAccessRoleArn': dataAccessRoleArn,
        'InputDataConfig': inputDataConfig,
        'LanguageCode': languageCode.toValue(),
        'RecognizerName': recognizerName,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (tags != null) 'Tags': tags,
        if (volumeKmsKeyId != null) 'VolumeKmsKeyId': volumeKmsKeyId,
        if (vpcConfig != null) 'VpcConfig': vpcConfig,
      },
    );

    return CreateEntityRecognizerResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a previously created document classifier
  ///
  /// Only those classifiers that are in terminated states (IN_ERROR, TRAINED)
  /// will be deleted. If an active inference job is using the model, a
  /// <code>ResourceInUseException</code> will be returned.
  ///
  /// This is an asynchronous action that puts the classifier into a DELETING
  /// state, and it is then removed by a background job. Once removed, the
  /// classifier disappears from your account and is no longer available for
  /// use.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceUnavailableException].
  /// May throw [ResourceInUseException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [documentClassifierArn] :
  /// The Amazon Resource Name (ARN) that identifies the document classifier.
  Future<void> deleteDocumentClassifier({
    required String documentClassifierArn,
  }) async {
    ArgumentError.checkNotNull(documentClassifierArn, 'documentClassifierArn');
    _s.validateStringLength(
      'documentClassifierArn',
      documentClassifierArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DeleteDocumentClassifier'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DocumentClassifierArn': documentClassifierArn,
      },
    );
  }

  /// Deletes a model-specific endpoint for a previously-trained custom model.
  /// All endpoints must be deleted in order for the model to be deleted.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [endpointArn] :
  /// The Amazon Resource Number (ARN) of the endpoint being deleted.
  Future<void> deleteEndpoint({
    required String endpointArn,
  }) async {
    ArgumentError.checkNotNull(endpointArn, 'endpointArn');
    _s.validateStringLength(
      'endpointArn',
      endpointArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DeleteEndpoint'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndpointArn': endpointArn,
      },
    );
  }

  /// Deletes an entity recognizer.
  ///
  /// Only those recognizers that are in terminated states (IN_ERROR, TRAINED)
  /// will be deleted. If an active inference job is using the model, a
  /// <code>ResourceInUseException</code> will be returned.
  ///
  /// This is an asynchronous action that puts the recognizer into a DELETING
  /// state, and it is then removed by a background job. Once removed, the
  /// recognizer disappears from your account and is no longer available for
  /// use.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceUnavailableException].
  /// May throw [ResourceInUseException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [entityRecognizerArn] :
  /// The Amazon Resource Name (ARN) that identifies the entity recognizer.
  Future<void> deleteEntityRecognizer({
    required String entityRecognizerArn,
  }) async {
    ArgumentError.checkNotNull(entityRecognizerArn, 'entityRecognizerArn');
    _s.validateStringLength(
      'entityRecognizerArn',
      entityRecognizerArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DeleteEntityRecognizer'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EntityRecognizerArn': entityRecognizerArn,
      },
    );
  }

  /// Gets the properties associated with a document classification job. Use
  /// this operation to get the status of a classification job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [JobNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier that Amazon Comprehend generated for the job. The operation
  /// returns this identifier in its response.
  Future<DescribeDocumentClassificationJobResponse>
      describeDocumentClassificationJob({
    required String jobId,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      32,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DescribeDocumentClassificationJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
      },
    );

    return DescribeDocumentClassificationJobResponse.fromJson(
        jsonResponse.body);
  }

  /// Gets the properties associated with a document classifier.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [documentClassifierArn] :
  /// The Amazon Resource Name (ARN) that identifies the document classifier.
  /// The operation returns this identifier in its response.
  Future<DescribeDocumentClassifierResponse> describeDocumentClassifier({
    required String documentClassifierArn,
  }) async {
    ArgumentError.checkNotNull(documentClassifierArn, 'documentClassifierArn');
    _s.validateStringLength(
      'documentClassifierArn',
      documentClassifierArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DescribeDocumentClassifier'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DocumentClassifierArn': documentClassifierArn,
      },
    );

    return DescribeDocumentClassifierResponse.fromJson(jsonResponse.body);
  }

  /// Gets the properties associated with a dominant language detection job. Use
  /// this operation to get the status of a detection job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [JobNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier that Amazon Comprehend generated for the job. The operation
  /// returns this identifier in its response.
  Future<DescribeDominantLanguageDetectionJobResponse>
      describeDominantLanguageDetectionJob({
    required String jobId,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      32,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DescribeDominantLanguageDetectionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
      },
    );

    return DescribeDominantLanguageDetectionJobResponse.fromJson(
        jsonResponse.body);
  }

  /// Gets the properties associated with a specific endpoint. Use this
  /// operation to get the status of an endpoint.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [endpointArn] :
  /// The Amazon Resource Number (ARN) of the endpoint being described.
  Future<DescribeEndpointResponse> describeEndpoint({
    required String endpointArn,
  }) async {
    ArgumentError.checkNotNull(endpointArn, 'endpointArn');
    _s.validateStringLength(
      'endpointArn',
      endpointArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DescribeEndpoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndpointArn': endpointArn,
      },
    );

    return DescribeEndpointResponse.fromJson(jsonResponse.body);
  }

  /// Gets the properties associated with an entities detection job. Use this
  /// operation to get the status of a detection job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [JobNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier that Amazon Comprehend generated for the job. The operation
  /// returns this identifier in its response.
  Future<DescribeEntitiesDetectionJobResponse> describeEntitiesDetectionJob({
    required String jobId,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      32,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DescribeEntitiesDetectionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
      },
    );

    return DescribeEntitiesDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Provides details about an entity recognizer including status, S3 buckets
  /// containing training data, recognizer metadata, metrics, and so on.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [entityRecognizerArn] :
  /// The Amazon Resource Name (ARN) that identifies the entity recognizer.
  Future<DescribeEntityRecognizerResponse> describeEntityRecognizer({
    required String entityRecognizerArn,
  }) async {
    ArgumentError.checkNotNull(entityRecognizerArn, 'entityRecognizerArn');
    _s.validateStringLength(
      'entityRecognizerArn',
      entityRecognizerArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DescribeEntityRecognizer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EntityRecognizerArn': entityRecognizerArn,
      },
    );

    return DescribeEntityRecognizerResponse.fromJson(jsonResponse.body);
  }

  /// Gets the status and details of an events detection job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [JobNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier of the events detection job.
  Future<DescribeEventsDetectionJobResponse> describeEventsDetectionJob({
    required String jobId,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      32,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DescribeEventsDetectionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
      },
    );

    return DescribeEventsDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Gets the properties associated with a key phrases detection job. Use this
  /// operation to get the status of a detection job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [JobNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier that Amazon Comprehend generated for the job. The operation
  /// returns this identifier in its response.
  Future<DescribeKeyPhrasesDetectionJobResponse>
      describeKeyPhrasesDetectionJob({
    required String jobId,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      32,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DescribeKeyPhrasesDetectionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
      },
    );

    return DescribeKeyPhrasesDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Gets the properties associated with a PII entities detection job. For
  /// example, you can use this operation to get the job status.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [JobNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier that Amazon Comprehend generated for the job. The operation
  /// returns this identifier in its response.
  Future<DescribePiiEntitiesDetectionJobResponse>
      describePiiEntitiesDetectionJob({
    required String jobId,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      32,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DescribePiiEntitiesDetectionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
      },
    );

    return DescribePiiEntitiesDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Gets the properties associated with a sentiment detection job. Use this
  /// operation to get the status of a detection job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [JobNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier that Amazon Comprehend generated for the job. The operation
  /// returns this identifier in its response.
  Future<DescribeSentimentDetectionJobResponse> describeSentimentDetectionJob({
    required String jobId,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      32,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DescribeSentimentDetectionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
      },
    );

    return DescribeSentimentDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Gets the properties associated with a topic detection job. Use this
  /// operation to get the status of a detection job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [JobNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier assigned by the user to the detection job.
  Future<DescribeTopicsDetectionJobResponse> describeTopicsDetectionJob({
    required String jobId,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      32,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DescribeTopicsDetectionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
      },
    );

    return DescribeTopicsDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Determines the dominant language of the input text. For a list of
  /// languages that Amazon Comprehend can detect, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/how-languages.html">Amazon
  /// Comprehend Supported Languages</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TextSizeLimitExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [text] :
  /// A UTF-8 text string. Each string should contain at least 20 characters and
  /// must contain fewer that 5,000 bytes of UTF-8 encoded characters.
  Future<DetectDominantLanguageResponse> detectDominantLanguage({
    required String text,
  }) async {
    ArgumentError.checkNotNull(text, 'text');
    _s.validateStringLength(
      'text',
      text,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DetectDominantLanguage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Text': text,
      },
    );

    return DetectDominantLanguageResponse.fromJson(jsonResponse.body);
  }

  /// Inspects text for named entities, and returns information about them. For
  /// more information, about named entities, see <a>how-entities</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceUnavailableException].
  /// May throw [TextSizeLimitExceededException].
  /// May throw [UnsupportedLanguageException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [text] :
  /// A UTF-8 text string. Each string must contain fewer that 5,000 bytes of
  /// UTF-8 encoded characters.
  ///
  /// Parameter [endpointArn] :
  /// The Amazon Resource Name of an endpoint that is associated with a custom
  /// entity recognition model. Provide an endpoint if you want to detect
  /// entities by using your own custom model instead of the default model that
  /// is used by Amazon Comprehend.
  ///
  /// If you specify an endpoint, Amazon Comprehend uses the language of your
  /// custom model, and it ignores any language code that you provide in your
  /// request.
  ///
  /// Parameter [languageCode] :
  /// The language of the input documents. You can specify any of the primary
  /// languages supported by Amazon Comprehend. All documents must be in the
  /// same language.
  ///
  /// If your request includes the endpoint for a custom entity recognition
  /// model, Amazon Comprehend uses the language of your custom model, and it
  /// ignores any language code that you specify here.
  Future<DetectEntitiesResponse> detectEntities({
    required String text,
    String? endpointArn,
    LanguageCode? languageCode,
  }) async {
    ArgumentError.checkNotNull(text, 'text');
    _s.validateStringLength(
      'text',
      text,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringLength(
      'endpointArn',
      endpointArn,
      0,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DetectEntities'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Text': text,
        if (endpointArn != null) 'EndpointArn': endpointArn,
        if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      },
    );

    return DetectEntitiesResponse.fromJson(jsonResponse.body);
  }

  /// Detects the key noun phrases found in the text.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TextSizeLimitExceededException].
  /// May throw [UnsupportedLanguageException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [languageCode] :
  /// The language of the input documents. You can specify any of the primary
  /// languages supported by Amazon Comprehend. All documents must be in the
  /// same language.
  ///
  /// Parameter [text] :
  /// A UTF-8 text string. Each string must contain fewer that 5,000 bytes of
  /// UTF-8 encoded characters.
  Future<DetectKeyPhrasesResponse> detectKeyPhrases({
    required LanguageCode languageCode,
    required String text,
  }) async {
    ArgumentError.checkNotNull(languageCode, 'languageCode');
    ArgumentError.checkNotNull(text, 'text');
    _s.validateStringLength(
      'text',
      text,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DetectKeyPhrases'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LanguageCode': languageCode.toValue(),
        'Text': text,
      },
    );

    return DetectKeyPhrasesResponse.fromJson(jsonResponse.body);
  }

  /// Inspects the input text for entities that contain personally identifiable
  /// information (PII) and returns information about them.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TextSizeLimitExceededException].
  /// May throw [UnsupportedLanguageException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [languageCode] :
  /// The language of the input documents.
  ///
  /// Parameter [text] :
  /// A UTF-8 text string. Each string must contain fewer that 5,000 bytes of
  /// UTF-8 encoded characters.
  Future<DetectPiiEntitiesResponse> detectPiiEntities({
    required LanguageCode languageCode,
    required String text,
  }) async {
    ArgumentError.checkNotNull(languageCode, 'languageCode');
    ArgumentError.checkNotNull(text, 'text');
    _s.validateStringLength(
      'text',
      text,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DetectPiiEntities'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LanguageCode': languageCode.toValue(),
        'Text': text,
      },
    );

    return DetectPiiEntitiesResponse.fromJson(jsonResponse.body);
  }

  /// Inspects text and returns an inference of the prevailing sentiment
  /// (<code>POSITIVE</code>, <code>NEUTRAL</code>, <code>MIXED</code>, or
  /// <code>NEGATIVE</code>).
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TextSizeLimitExceededException].
  /// May throw [UnsupportedLanguageException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [languageCode] :
  /// The language of the input documents. You can specify any of the primary
  /// languages supported by Amazon Comprehend. All documents must be in the
  /// same language.
  ///
  /// Parameter [text] :
  /// A UTF-8 text string. Each string must contain fewer that 5,000 bytes of
  /// UTF-8 encoded characters.
  Future<DetectSentimentResponse> detectSentiment({
    required LanguageCode languageCode,
    required String text,
  }) async {
    ArgumentError.checkNotNull(languageCode, 'languageCode');
    ArgumentError.checkNotNull(text, 'text');
    _s.validateStringLength(
      'text',
      text,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DetectSentiment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LanguageCode': languageCode.toValue(),
        'Text': text,
      },
    );

    return DetectSentimentResponse.fromJson(jsonResponse.body);
  }

  /// Inspects text for syntax and the part of speech of words in the document.
  /// For more information, <a>how-syntax</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TextSizeLimitExceededException].
  /// May throw [UnsupportedLanguageException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [languageCode] :
  /// The language code of the input documents. You can specify any of the
  /// following languages supported by Amazon Comprehend: German ("de"), English
  /// ("en"), Spanish ("es"), French ("fr"), Italian ("it"), or Portuguese
  /// ("pt").
  ///
  /// Parameter [text] :
  /// A UTF-8 string. Each string must contain fewer that 5,000 bytes of UTF
  /// encoded characters.
  Future<DetectSyntaxResponse> detectSyntax({
    required SyntaxLanguageCode languageCode,
    required String text,
  }) async {
    ArgumentError.checkNotNull(languageCode, 'languageCode');
    ArgumentError.checkNotNull(text, 'text');
    _s.validateStringLength(
      'text',
      text,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DetectSyntax'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LanguageCode': languageCode.toValue(),
        'Text': text,
      },
    );

    return DetectSyntaxResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of the documentation classification jobs that you have
  /// submitted.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidFilterException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filter] :
  /// Filters the jobs that are returned. You can filter jobs on their names,
  /// status, or the date and time that they were submitted. You can only set
  /// one filter at a time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in each page. The default is 100.
  ///
  /// Parameter [nextToken] :
  /// Identifies the next page of results to return.
  Future<ListDocumentClassificationJobsResponse>
      listDocumentClassificationJobs({
    DocumentClassificationJobFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.ListDocumentClassificationJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListDocumentClassificationJobsResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of the document classifiers that you have created.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidFilterException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filter] :
  /// Filters the jobs that are returned. You can filter jobs on their name,
  /// status, or the date and time that they were submitted. You can only set
  /// one filter at a time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in each page. The default is 100.
  ///
  /// Parameter [nextToken] :
  /// Identifies the next page of results to return.
  Future<ListDocumentClassifiersResponse> listDocumentClassifiers({
    DocumentClassifierFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.ListDocumentClassifiers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListDocumentClassifiersResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of the dominant language detection jobs that you have
  /// submitted.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidFilterException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filter] :
  /// Filters that jobs that are returned. You can filter jobs on their name,
  /// status, or the date and time that they were submitted. You can only set
  /// one filter at a time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in each page. The default is 100.
  ///
  /// Parameter [nextToken] :
  /// Identifies the next page of results to return.
  Future<ListDominantLanguageDetectionJobsResponse>
      listDominantLanguageDetectionJobs({
    DominantLanguageDetectionJobFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.ListDominantLanguageDetectionJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListDominantLanguageDetectionJobsResponse.fromJson(
        jsonResponse.body);
  }

  /// Gets a list of all existing endpoints that you've created.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filter] :
  /// Filters the endpoints that are returned. You can filter endpoints on their
  /// name, model, status, or the date and time that they were created. You can
  /// only set one filter at a time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in each page. The default is 100.
  ///
  /// Parameter [nextToken] :
  /// Identifies the next page of results to return.
  Future<ListEndpointsResponse> listEndpoints({
    EndpointFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.ListEndpoints'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListEndpointsResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of the entity detection jobs that you have submitted.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidFilterException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filter] :
  /// Filters the jobs that are returned. You can filter jobs on their name,
  /// status, or the date and time that they were submitted. You can only set
  /// one filter at a time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in each page. The default is 100.
  ///
  /// Parameter [nextToken] :
  /// Identifies the next page of results to return.
  Future<ListEntitiesDetectionJobsResponse> listEntitiesDetectionJobs({
    EntitiesDetectionJobFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.ListEntitiesDetectionJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListEntitiesDetectionJobsResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of the properties of all entity recognizers that you created,
  /// including recognizers currently in training. Allows you to filter the list
  /// of recognizers based on criteria such as status and submission time. This
  /// call returns up to 500 entity recognizers in the list, with a default
  /// number of 100 recognizers in the list.
  ///
  /// The results of this list are not in any particular order. Please get the
  /// list and sort locally if needed.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidFilterException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filter] :
  /// Filters the list of entities returned. You can filter on
  /// <code>Status</code>, <code>SubmitTimeBefore</code>, or
  /// <code>SubmitTimeAfter</code>. You can only set one filter at a time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return on each page. The default is 100.
  ///
  /// Parameter [nextToken] :
  /// Identifies the next page of results to return.
  Future<ListEntityRecognizersResponse> listEntityRecognizers({
    EntityRecognizerFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.ListEntityRecognizers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListEntityRecognizersResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of the events detection jobs that you have submitted.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidFilterException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filter] :
  /// Filters the jobs that are returned. You can filter jobs on their name,
  /// status, or the date and time that they were submitted. You can only set
  /// one filter at a time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in each page.
  ///
  /// Parameter [nextToken] :
  /// Identifies the next page of results to return.
  Future<ListEventsDetectionJobsResponse> listEventsDetectionJobs({
    EventsDetectionJobFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.ListEventsDetectionJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListEventsDetectionJobsResponse.fromJson(jsonResponse.body);
  }

  /// Get a list of key phrase detection jobs that you have submitted.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidFilterException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filter] :
  /// Filters the jobs that are returned. You can filter jobs on their name,
  /// status, or the date and time that they were submitted. You can only set
  /// one filter at a time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in each page. The default is 100.
  ///
  /// Parameter [nextToken] :
  /// Identifies the next page of results to return.
  Future<ListKeyPhrasesDetectionJobsResponse> listKeyPhrasesDetectionJobs({
    KeyPhrasesDetectionJobFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.ListKeyPhrasesDetectionJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListKeyPhrasesDetectionJobsResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of the PII entity detection jobs that you have submitted.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidFilterException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filter] :
  /// Filters the jobs that are returned. You can filter jobs on their name,
  /// status, or the date and time that they were submitted. You can only set
  /// one filter at a time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in each page.
  ///
  /// Parameter [nextToken] :
  /// Identifies the next page of results to return.
  Future<ListPiiEntitiesDetectionJobsResponse> listPiiEntitiesDetectionJobs({
    PiiEntitiesDetectionJobFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.ListPiiEntitiesDetectionJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListPiiEntitiesDetectionJobsResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of sentiment detection jobs that you have submitted.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidFilterException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filter] :
  /// Filters the jobs that are returned. You can filter jobs on their name,
  /// status, or the date and time that they were submitted. You can only set
  /// one filter at a time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in each page. The default is 100.
  ///
  /// Parameter [nextToken] :
  /// Identifies the next page of results to return.
  Future<ListSentimentDetectionJobsResponse> listSentimentDetectionJobs({
    SentimentDetectionJobFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.ListSentimentDetectionJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListSentimentDetectionJobsResponse.fromJson(jsonResponse.body);
  }

  /// Lists all tags associated with a given Amazon Comprehend resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the given Amazon Comprehend resource you
  /// are querying.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of the topic detection jobs that you have submitted.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidFilterException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filter] :
  /// Filters the jobs that are returned. Jobs can be filtered on their name,
  /// status, or the date and time that they were submitted. You can set only
  /// one filter at a time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in each page. The default is 100.
  ///
  /// Parameter [nextToken] :
  /// Identifies the next page of results to return.
  Future<ListTopicsDetectionJobsResponse> listTopicsDetectionJobs({
    TopicsDetectionJobFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.ListTopicsDetectionJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListTopicsDetectionJobsResponse.fromJson(jsonResponse.body);
  }

  /// Starts an asynchronous document classification job. Use the operation to
  /// track the progress of the job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceUnavailableException].
  /// May throw [KmsKeyValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that grants Amazon Comprehend read access to your input data.
  ///
  /// Parameter [documentClassifierArn] :
  /// The Amazon Resource Name (ARN) of the document classifier to use to
  /// process the job.
  ///
  /// Parameter [inputDataConfig] :
  /// Specifies the format and location of the input data for the job.
  ///
  /// Parameter [outputDataConfig] :
  /// Specifies where to send the output files.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for the request. If you do not set the client request
  /// token, Amazon Comprehend generates one.
  ///
  /// Parameter [jobName] :
  /// The identifier of the job.
  ///
  /// Parameter [volumeKmsKeyId] :
  /// ID for the AWS Key Management Service (KMS) key that Amazon Comprehend
  /// uses to encrypt data on the storage volume attached to the ML compute
  /// instance(s) that process the analysis job. The VolumeKmsKeyId can be
  /// either of the following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [vpcConfig] :
  /// Configuration parameters for an optional private Virtual Private Cloud
  /// (VPC) containing the resources you are using for your document
  /// classification job. For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon
  /// VPC</a>.
  Future<StartDocumentClassificationJobResponse>
      startDocumentClassificationJob({
    required String dataAccessRoleArn,
    required String documentClassifierArn,
    required InputDataConfig inputDataConfig,
    required OutputDataConfig outputDataConfig,
    String? clientRequestToken,
    String? jobName,
    String? volumeKmsKeyId,
    VpcConfig? vpcConfig,
  }) async {
    ArgumentError.checkNotNull(dataAccessRoleArn, 'dataAccessRoleArn');
    _s.validateStringLength(
      'dataAccessRoleArn',
      dataAccessRoleArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(documentClassifierArn, 'documentClassifierArn');
    _s.validateStringLength(
      'documentClassifierArn',
      documentClassifierArn,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(inputDataConfig, 'inputDataConfig');
    ArgumentError.checkNotNull(outputDataConfig, 'outputDataConfig');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringLength(
      'jobName',
      jobName,
      1,
      256,
    );
    _s.validateStringLength(
      'volumeKmsKeyId',
      volumeKmsKeyId,
      0,
      2048,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.StartDocumentClassificationJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataAccessRoleArn': dataAccessRoleArn,
        'DocumentClassifierArn': documentClassifierArn,
        'InputDataConfig': inputDataConfig,
        'OutputDataConfig': outputDataConfig,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (jobName != null) 'JobName': jobName,
        if (volumeKmsKeyId != null) 'VolumeKmsKeyId': volumeKmsKeyId,
        if (vpcConfig != null) 'VpcConfig': vpcConfig,
      },
    );

    return StartDocumentClassificationJobResponse.fromJson(jsonResponse.body);
  }

  /// Starts an asynchronous dominant language detection job for a collection of
  /// documents. Use the operation to track the status of a job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [KmsKeyValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that grants Amazon Comprehend read access to your input data.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions">https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions</a>.
  ///
  /// Parameter [inputDataConfig] :
  /// Specifies the format and location of the input data for the job.
  ///
  /// Parameter [outputDataConfig] :
  /// Specifies where to send the output files.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for the request. If you do not set the client request
  /// token, Amazon Comprehend generates one.
  ///
  /// Parameter [jobName] :
  /// An identifier for the job.
  ///
  /// Parameter [volumeKmsKeyId] :
  /// ID for the AWS Key Management Service (KMS) key that Amazon Comprehend
  /// uses to encrypt data on the storage volume attached to the ML compute
  /// instance(s) that process the analysis job. The VolumeKmsKeyId can be
  /// either of the following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [vpcConfig] :
  /// Configuration parameters for an optional private Virtual Private Cloud
  /// (VPC) containing the resources you are using for your dominant language
  /// detection job. For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon
  /// VPC</a>.
  Future<StartDominantLanguageDetectionJobResponse>
      startDominantLanguageDetectionJob({
    required String dataAccessRoleArn,
    required InputDataConfig inputDataConfig,
    required OutputDataConfig outputDataConfig,
    String? clientRequestToken,
    String? jobName,
    String? volumeKmsKeyId,
    VpcConfig? vpcConfig,
  }) async {
    ArgumentError.checkNotNull(dataAccessRoleArn, 'dataAccessRoleArn');
    _s.validateStringLength(
      'dataAccessRoleArn',
      dataAccessRoleArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(inputDataConfig, 'inputDataConfig');
    ArgumentError.checkNotNull(outputDataConfig, 'outputDataConfig');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringLength(
      'jobName',
      jobName,
      1,
      256,
    );
    _s.validateStringLength(
      'volumeKmsKeyId',
      volumeKmsKeyId,
      0,
      2048,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.StartDominantLanguageDetectionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataAccessRoleArn': dataAccessRoleArn,
        'InputDataConfig': inputDataConfig,
        'OutputDataConfig': outputDataConfig,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (jobName != null) 'JobName': jobName,
        if (volumeKmsKeyId != null) 'VolumeKmsKeyId': volumeKmsKeyId,
        if (vpcConfig != null) 'VpcConfig': vpcConfig,
      },
    );

    return StartDominantLanguageDetectionJobResponse.fromJson(
        jsonResponse.body);
  }

  /// Starts an asynchronous entity detection job for a collection of documents.
  /// Use the operation to track the status of a job.
  ///
  /// This API can be used for either standard entity detection or custom entity
  /// recognition. In order to be used for custom entity recognition, the
  /// optional <code>EntityRecognizerArn</code> must be used in order to provide
  /// access to the recognizer being used to detect the custom entity.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceUnavailableException].
  /// May throw [KmsKeyValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that grants Amazon Comprehend read access to your input data.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions">https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions</a>.
  ///
  /// Parameter [inputDataConfig] :
  /// Specifies the format and location of the input data for the job.
  ///
  /// Parameter [languageCode] :
  /// The language of the input documents. All documents must be in the same
  /// language. You can specify any of the languages supported by Amazon
  /// Comprehend. If custom entities recognition is used, this parameter is
  /// ignored and the language used for training the model is used instead.
  ///
  /// Parameter [outputDataConfig] :
  /// Specifies where to send the output files.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for the request. If you don't set the client request
  /// token, Amazon Comprehend generates one.
  ///
  /// Parameter [entityRecognizerArn] :
  /// The Amazon Resource Name (ARN) that identifies the specific entity
  /// recognizer to be used by the <code>StartEntitiesDetectionJob</code>. This
  /// ARN is optional and is only used for a custom entity recognition job.
  ///
  /// Parameter [jobName] :
  /// The identifier of the job.
  ///
  /// Parameter [volumeKmsKeyId] :
  /// ID for the AWS Key Management Service (KMS) key that Amazon Comprehend
  /// uses to encrypt data on the storage volume attached to the ML compute
  /// instance(s) that process the analysis job. The VolumeKmsKeyId can be
  /// either of the following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [vpcConfig] :
  /// Configuration parameters for an optional private Virtual Private Cloud
  /// (VPC) containing the resources you are using for your entity detection
  /// job. For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon
  /// VPC</a>.
  Future<StartEntitiesDetectionJobResponse> startEntitiesDetectionJob({
    required String dataAccessRoleArn,
    required InputDataConfig inputDataConfig,
    required LanguageCode languageCode,
    required OutputDataConfig outputDataConfig,
    String? clientRequestToken,
    String? entityRecognizerArn,
    String? jobName,
    String? volumeKmsKeyId,
    VpcConfig? vpcConfig,
  }) async {
    ArgumentError.checkNotNull(dataAccessRoleArn, 'dataAccessRoleArn');
    _s.validateStringLength(
      'dataAccessRoleArn',
      dataAccessRoleArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(inputDataConfig, 'inputDataConfig');
    ArgumentError.checkNotNull(languageCode, 'languageCode');
    ArgumentError.checkNotNull(outputDataConfig, 'outputDataConfig');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringLength(
      'entityRecognizerArn',
      entityRecognizerArn,
      0,
      256,
    );
    _s.validateStringLength(
      'jobName',
      jobName,
      1,
      256,
    );
    _s.validateStringLength(
      'volumeKmsKeyId',
      volumeKmsKeyId,
      0,
      2048,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.StartEntitiesDetectionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataAccessRoleArn': dataAccessRoleArn,
        'InputDataConfig': inputDataConfig,
        'LanguageCode': languageCode.toValue(),
        'OutputDataConfig': outputDataConfig,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (entityRecognizerArn != null)
          'EntityRecognizerArn': entityRecognizerArn,
        if (jobName != null) 'JobName': jobName,
        if (volumeKmsKeyId != null) 'VolumeKmsKeyId': volumeKmsKeyId,
        if (vpcConfig != null) 'VpcConfig': vpcConfig,
      },
    );

    return StartEntitiesDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Starts an asynchronous event detection job for a collection of documents.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [KmsKeyValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that grants Amazon Comprehend read access to your input data.
  ///
  /// Parameter [inputDataConfig] :
  /// Specifies the format and location of the input data for the job.
  ///
  /// Parameter [languageCode] :
  /// The language code of the input documents.
  ///
  /// Parameter [outputDataConfig] :
  /// Specifies where to send the output files.
  ///
  /// Parameter [targetEventTypes] :
  /// The types of events to detect in the input documents.
  ///
  /// Parameter [clientRequestToken] :
  /// An unique identifier for the request. If you don't set the client request
  /// token, Amazon Comprehend generates one.
  ///
  /// Parameter [jobName] :
  /// The identifier of the events detection job.
  Future<StartEventsDetectionJobResponse> startEventsDetectionJob({
    required String dataAccessRoleArn,
    required InputDataConfig inputDataConfig,
    required LanguageCode languageCode,
    required OutputDataConfig outputDataConfig,
    required List<String> targetEventTypes,
    String? clientRequestToken,
    String? jobName,
  }) async {
    ArgumentError.checkNotNull(dataAccessRoleArn, 'dataAccessRoleArn');
    _s.validateStringLength(
      'dataAccessRoleArn',
      dataAccessRoleArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(inputDataConfig, 'inputDataConfig');
    ArgumentError.checkNotNull(languageCode, 'languageCode');
    ArgumentError.checkNotNull(outputDataConfig, 'outputDataConfig');
    ArgumentError.checkNotNull(targetEventTypes, 'targetEventTypes');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringLength(
      'jobName',
      jobName,
      1,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.StartEventsDetectionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataAccessRoleArn': dataAccessRoleArn,
        'InputDataConfig': inputDataConfig,
        'LanguageCode': languageCode.toValue(),
        'OutputDataConfig': outputDataConfig,
        'TargetEventTypes': targetEventTypes,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (jobName != null) 'JobName': jobName,
      },
    );

    return StartEventsDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Starts an asynchronous key phrase detection job for a collection of
  /// documents. Use the operation to track the status of a job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [KmsKeyValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that grants Amazon Comprehend read access to your input data.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions">https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions</a>.
  ///
  /// Parameter [inputDataConfig] :
  /// Specifies the format and location of the input data for the job.
  ///
  /// Parameter [languageCode] :
  /// The language of the input documents. You can specify any of the primary
  /// languages supported by Amazon Comprehend. All documents must be in the
  /// same language.
  ///
  /// Parameter [outputDataConfig] :
  /// Specifies where to send the output files.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for the request. If you don't set the client request
  /// token, Amazon Comprehend generates one.
  ///
  /// Parameter [jobName] :
  /// The identifier of the job.
  ///
  /// Parameter [volumeKmsKeyId] :
  /// ID for the AWS Key Management Service (KMS) key that Amazon Comprehend
  /// uses to encrypt data on the storage volume attached to the ML compute
  /// instance(s) that process the analysis job. The VolumeKmsKeyId can be
  /// either of the following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [vpcConfig] :
  /// Configuration parameters for an optional private Virtual Private Cloud
  /// (VPC) containing the resources you are using for your key phrases
  /// detection job. For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon
  /// VPC</a>.
  Future<StartKeyPhrasesDetectionJobResponse> startKeyPhrasesDetectionJob({
    required String dataAccessRoleArn,
    required InputDataConfig inputDataConfig,
    required LanguageCode languageCode,
    required OutputDataConfig outputDataConfig,
    String? clientRequestToken,
    String? jobName,
    String? volumeKmsKeyId,
    VpcConfig? vpcConfig,
  }) async {
    ArgumentError.checkNotNull(dataAccessRoleArn, 'dataAccessRoleArn');
    _s.validateStringLength(
      'dataAccessRoleArn',
      dataAccessRoleArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(inputDataConfig, 'inputDataConfig');
    ArgumentError.checkNotNull(languageCode, 'languageCode');
    ArgumentError.checkNotNull(outputDataConfig, 'outputDataConfig');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringLength(
      'jobName',
      jobName,
      1,
      256,
    );
    _s.validateStringLength(
      'volumeKmsKeyId',
      volumeKmsKeyId,
      0,
      2048,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.StartKeyPhrasesDetectionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataAccessRoleArn': dataAccessRoleArn,
        'InputDataConfig': inputDataConfig,
        'LanguageCode': languageCode.toValue(),
        'OutputDataConfig': outputDataConfig,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (jobName != null) 'JobName': jobName,
        if (volumeKmsKeyId != null) 'VolumeKmsKeyId': volumeKmsKeyId,
        if (vpcConfig != null) 'VpcConfig': vpcConfig,
      },
    );

    return StartKeyPhrasesDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Starts an asynchronous PII entity detection job for a collection of
  /// documents.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [KmsKeyValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that grants Amazon Comprehend read access to your input data.
  ///
  /// Parameter [inputDataConfig] :
  /// The input properties for a PII entities detection job.
  ///
  /// Parameter [languageCode] :
  /// The language of the input documents.
  ///
  /// Parameter [mode] :
  /// Specifies whether the output provides the locations (offsets) of PII
  /// entities or a file in which PII entities are redacted.
  ///
  /// Parameter [outputDataConfig] :
  /// Provides conﬁguration parameters for the output of PII entity detection
  /// jobs.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for the request. If you don't set the client request
  /// token, Amazon Comprehend generates one.
  ///
  /// Parameter [jobName] :
  /// The identifier of the job.
  ///
  /// Parameter [redactionConfig] :
  /// Provides configuration parameters for PII entity redaction.
  ///
  /// This parameter is required if you set the <code>Mode</code> parameter to
  /// <code>ONLY_REDACTION</code>. In that case, you must provide a
  /// <code>RedactionConfig</code> definition that includes the
  /// <code>PiiEntityTypes</code> parameter.
  Future<StartPiiEntitiesDetectionJobResponse> startPiiEntitiesDetectionJob({
    required String dataAccessRoleArn,
    required InputDataConfig inputDataConfig,
    required LanguageCode languageCode,
    required PiiEntitiesDetectionMode mode,
    required OutputDataConfig outputDataConfig,
    String? clientRequestToken,
    String? jobName,
    RedactionConfig? redactionConfig,
  }) async {
    ArgumentError.checkNotNull(dataAccessRoleArn, 'dataAccessRoleArn');
    _s.validateStringLength(
      'dataAccessRoleArn',
      dataAccessRoleArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(inputDataConfig, 'inputDataConfig');
    ArgumentError.checkNotNull(languageCode, 'languageCode');
    ArgumentError.checkNotNull(mode, 'mode');
    ArgumentError.checkNotNull(outputDataConfig, 'outputDataConfig');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringLength(
      'jobName',
      jobName,
      1,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.StartPiiEntitiesDetectionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataAccessRoleArn': dataAccessRoleArn,
        'InputDataConfig': inputDataConfig,
        'LanguageCode': languageCode.toValue(),
        'Mode': mode.toValue(),
        'OutputDataConfig': outputDataConfig,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (jobName != null) 'JobName': jobName,
        if (redactionConfig != null) 'RedactionConfig': redactionConfig,
      },
    );

    return StartPiiEntitiesDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Starts an asynchronous sentiment detection job for a collection of
  /// documents. use the operation to track the status of a job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [KmsKeyValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that grants Amazon Comprehend read access to your input data.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions">https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions</a>.
  ///
  /// Parameter [inputDataConfig] :
  /// Specifies the format and location of the input data for the job.
  ///
  /// Parameter [languageCode] :
  /// The language of the input documents. You can specify any of the primary
  /// languages supported by Amazon Comprehend. All documents must be in the
  /// same language.
  ///
  /// Parameter [outputDataConfig] :
  /// Specifies where to send the output files.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for the request. If you don't set the client request
  /// token, Amazon Comprehend generates one.
  ///
  /// Parameter [jobName] :
  /// The identifier of the job.
  ///
  /// Parameter [volumeKmsKeyId] :
  /// ID for the AWS Key Management Service (KMS) key that Amazon Comprehend
  /// uses to encrypt data on the storage volume attached to the ML compute
  /// instance(s) that process the analysis job. The VolumeKmsKeyId can be
  /// either of the following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [vpcConfig] :
  /// Configuration parameters for an optional private Virtual Private Cloud
  /// (VPC) containing the resources you are using for your sentiment detection
  /// job. For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon
  /// VPC</a>.
  Future<StartSentimentDetectionJobResponse> startSentimentDetectionJob({
    required String dataAccessRoleArn,
    required InputDataConfig inputDataConfig,
    required LanguageCode languageCode,
    required OutputDataConfig outputDataConfig,
    String? clientRequestToken,
    String? jobName,
    String? volumeKmsKeyId,
    VpcConfig? vpcConfig,
  }) async {
    ArgumentError.checkNotNull(dataAccessRoleArn, 'dataAccessRoleArn');
    _s.validateStringLength(
      'dataAccessRoleArn',
      dataAccessRoleArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(inputDataConfig, 'inputDataConfig');
    ArgumentError.checkNotNull(languageCode, 'languageCode');
    ArgumentError.checkNotNull(outputDataConfig, 'outputDataConfig');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringLength(
      'jobName',
      jobName,
      1,
      256,
    );
    _s.validateStringLength(
      'volumeKmsKeyId',
      volumeKmsKeyId,
      0,
      2048,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.StartSentimentDetectionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataAccessRoleArn': dataAccessRoleArn,
        'InputDataConfig': inputDataConfig,
        'LanguageCode': languageCode.toValue(),
        'OutputDataConfig': outputDataConfig,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (jobName != null) 'JobName': jobName,
        if (volumeKmsKeyId != null) 'VolumeKmsKeyId': volumeKmsKeyId,
        if (vpcConfig != null) 'VpcConfig': vpcConfig,
      },
    );

    return StartSentimentDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Starts an asynchronous topic detection job. Use the
  /// <code>DescribeTopicDetectionJob</code> operation to track the status of a
  /// job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [KmsKeyValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that grants Amazon Comprehend read access to your input data.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions">https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions</a>.
  ///
  /// Parameter [inputDataConfig] :
  /// Specifies the format and location of the input data for the job.
  ///
  /// Parameter [outputDataConfig] :
  /// Specifies where to send the output files. The output is a compressed
  /// archive with two files, <code>topic-terms.csv</code> that lists the terms
  /// associated with each topic, and <code>doc-topics.csv</code> that lists the
  /// documents associated with each topic
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for the request. If you do not set the client request
  /// token, Amazon Comprehend generates one.
  ///
  /// Parameter [jobName] :
  /// The identifier of the job.
  ///
  /// Parameter [numberOfTopics] :
  /// The number of topics to detect.
  ///
  /// Parameter [volumeKmsKeyId] :
  /// ID for the AWS Key Management Service (KMS) key that Amazon Comprehend
  /// uses to encrypt data on the storage volume attached to the ML compute
  /// instance(s) that process the analysis job. The VolumeKmsKeyId can be
  /// either of the following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [vpcConfig] :
  /// Configuration parameters for an optional private Virtual Private Cloud
  /// (VPC) containing the resources you are using for your topic detection job.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon
  /// VPC</a>.
  Future<StartTopicsDetectionJobResponse> startTopicsDetectionJob({
    required String dataAccessRoleArn,
    required InputDataConfig inputDataConfig,
    required OutputDataConfig outputDataConfig,
    String? clientRequestToken,
    String? jobName,
    int? numberOfTopics,
    String? volumeKmsKeyId,
    VpcConfig? vpcConfig,
  }) async {
    ArgumentError.checkNotNull(dataAccessRoleArn, 'dataAccessRoleArn');
    _s.validateStringLength(
      'dataAccessRoleArn',
      dataAccessRoleArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(inputDataConfig, 'inputDataConfig');
    ArgumentError.checkNotNull(outputDataConfig, 'outputDataConfig');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringLength(
      'jobName',
      jobName,
      1,
      256,
    );
    _s.validateNumRange(
      'numberOfTopics',
      numberOfTopics,
      1,
      100,
    );
    _s.validateStringLength(
      'volumeKmsKeyId',
      volumeKmsKeyId,
      0,
      2048,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.StartTopicsDetectionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataAccessRoleArn': dataAccessRoleArn,
        'InputDataConfig': inputDataConfig,
        'OutputDataConfig': outputDataConfig,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (jobName != null) 'JobName': jobName,
        if (numberOfTopics != null) 'NumberOfTopics': numberOfTopics,
        if (volumeKmsKeyId != null) 'VolumeKmsKeyId': volumeKmsKeyId,
        if (vpcConfig != null) 'VpcConfig': vpcConfig,
      },
    );

    return StartTopicsDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Stops a dominant language detection job in progress.
  ///
  /// If the job state is <code>IN_PROGRESS</code> the job is marked for
  /// termination and put into the <code>STOP_REQUESTED</code> state. If the job
  /// completes before it can be stopped, it is put into the
  /// <code>COMPLETED</code> state; otherwise the job is stopped and put into
  /// the <code>STOPPED</code> state.
  ///
  /// If the job is in the <code>COMPLETED</code> or <code>FAILED</code> state
  /// when you call the <code>StopDominantLanguageDetectionJob</code> operation,
  /// the operation returns a 400 Internal Request Exception.
  ///
  /// When a job is stopped, any documents already processed are written to the
  /// output location.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [JobNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier of the dominant language detection job to stop.
  Future<StopDominantLanguageDetectionJobResponse>
      stopDominantLanguageDetectionJob({
    required String jobId,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      32,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.StopDominantLanguageDetectionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
      },
    );

    return StopDominantLanguageDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Stops an entities detection job in progress.
  ///
  /// If the job state is <code>IN_PROGRESS</code> the job is marked for
  /// termination and put into the <code>STOP_REQUESTED</code> state. If the job
  /// completes before it can be stopped, it is put into the
  /// <code>COMPLETED</code> state; otherwise the job is stopped and put into
  /// the <code>STOPPED</code> state.
  ///
  /// If the job is in the <code>COMPLETED</code> or <code>FAILED</code> state
  /// when you call the <code>StopDominantLanguageDetectionJob</code> operation,
  /// the operation returns a 400 Internal Request Exception.
  ///
  /// When a job is stopped, any documents already processed are written to the
  /// output location.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [JobNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier of the entities detection job to stop.
  Future<StopEntitiesDetectionJobResponse> stopEntitiesDetectionJob({
    required String jobId,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      32,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.StopEntitiesDetectionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
      },
    );

    return StopEntitiesDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Stops an events detection job in progress.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [JobNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier of the events detection job to stop.
  Future<StopEventsDetectionJobResponse> stopEventsDetectionJob({
    required String jobId,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      32,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.StopEventsDetectionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
      },
    );

    return StopEventsDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Stops a key phrases detection job in progress.
  ///
  /// If the job state is <code>IN_PROGRESS</code> the job is marked for
  /// termination and put into the <code>STOP_REQUESTED</code> state. If the job
  /// completes before it can be stopped, it is put into the
  /// <code>COMPLETED</code> state; otherwise the job is stopped and put into
  /// the <code>STOPPED</code> state.
  ///
  /// If the job is in the <code>COMPLETED</code> or <code>FAILED</code> state
  /// when you call the <code>StopDominantLanguageDetectionJob</code> operation,
  /// the operation returns a 400 Internal Request Exception.
  ///
  /// When a job is stopped, any documents already processed are written to the
  /// output location.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [JobNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier of the key phrases detection job to stop.
  Future<StopKeyPhrasesDetectionJobResponse> stopKeyPhrasesDetectionJob({
    required String jobId,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      32,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.StopKeyPhrasesDetectionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
      },
    );

    return StopKeyPhrasesDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Stops a PII entities detection job in progress.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [JobNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier of the PII entities detection job to stop.
  Future<StopPiiEntitiesDetectionJobResponse> stopPiiEntitiesDetectionJob({
    required String jobId,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      32,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.StopPiiEntitiesDetectionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
      },
    );

    return StopPiiEntitiesDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Stops a sentiment detection job in progress.
  ///
  /// If the job state is <code>IN_PROGRESS</code> the job is marked for
  /// termination and put into the <code>STOP_REQUESTED</code> state. If the job
  /// completes before it can be stopped, it is put into the
  /// <code>COMPLETED</code> state; otherwise the job is be stopped and put into
  /// the <code>STOPPED</code> state.
  ///
  /// If the job is in the <code>COMPLETED</code> or <code>FAILED</code> state
  /// when you call the <code>StopDominantLanguageDetectionJob</code> operation,
  /// the operation returns a 400 Internal Request Exception.
  ///
  /// When a job is stopped, any documents already processed are written to the
  /// output location.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [JobNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier of the sentiment detection job to stop.
  Future<StopSentimentDetectionJobResponse> stopSentimentDetectionJob({
    required String jobId,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      32,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.StopSentimentDetectionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
      },
    );

    return StopSentimentDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Stops a document classifier training job while in progress.
  ///
  /// If the training job state is <code>TRAINING</code>, the job is marked for
  /// termination and put into the <code>STOP_REQUESTED</code> state. If the
  /// training job completes before it can be stopped, it is put into the
  /// <code>TRAINED</code>; otherwise the training job is stopped and put into
  /// the <code>STOPPED</code> state and the service sends back an HTTP 200
  /// response with an empty HTTP body.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [documentClassifierArn] :
  /// The Amazon Resource Name (ARN) that identifies the document classifier
  /// currently being trained.
  Future<void> stopTrainingDocumentClassifier({
    required String documentClassifierArn,
  }) async {
    ArgumentError.checkNotNull(documentClassifierArn, 'documentClassifierArn');
    _s.validateStringLength(
      'documentClassifierArn',
      documentClassifierArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.StopTrainingDocumentClassifier'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DocumentClassifierArn': documentClassifierArn,
      },
    );
  }

  /// Stops an entity recognizer training job while in progress.
  ///
  /// If the training job state is <code>TRAINING</code>, the job is marked for
  /// termination and put into the <code>STOP_REQUESTED</code> state. If the
  /// training job completes before it can be stopped, it is put into the
  /// <code>TRAINED</code>; otherwise the training job is stopped and putted
  /// into the <code>STOPPED</code> state and the service sends back an HTTP 200
  /// response with an empty HTTP body.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [entityRecognizerArn] :
  /// The Amazon Resource Name (ARN) that identifies the entity recognizer
  /// currently being trained.
  Future<void> stopTrainingEntityRecognizer({
    required String entityRecognizerArn,
  }) async {
    ArgumentError.checkNotNull(entityRecognizerArn, 'entityRecognizerArn');
    _s.validateStringLength(
      'entityRecognizerArn',
      entityRecognizerArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.StopTrainingEntityRecognizer'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EntityRecognizerArn': entityRecognizerArn,
      },
    );
  }

  /// Associates a specific tag with an Amazon Comprehend resource. A tag is a
  /// key-value pair that adds as a metadata to a resource used by Amazon
  /// Comprehend. For example, a tag with "Sales" as the key might be added to a
  /// resource to indicate its use by the sales department.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyTagsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the given Amazon Comprehend resource to
  /// which you want to associate the tags.
  ///
  /// Parameter [tags] :
  /// Tags being associated with a specific Amazon Comprehend resource. There
  /// can be a maximum of 50 tags (both existing and pending) associated with a
  /// specific resource.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'Tags': tags,
      },
    );
  }

  /// Removes a specific tag associated with an Amazon Comprehend resource.
  ///
  /// May throw [TooManyTagKeysException].
  /// May throw [InvalidRequestException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the given Amazon Comprehend resource
  /// from which you want to remove the tags.
  ///
  /// Parameter [tagKeys] :
  /// The initial part of a key-value pair that forms a tag being removed from a
  /// given resource. For example, a tag with "Sales" as the key might be added
  /// to a resource to indicate its use by the sales department. Keys must be
  /// unique and cannot be duplicated for a particular resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'TagKeys': tagKeys,
      },
    );
  }

  /// Updates information about the specified endpoint.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceUnavailableException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [desiredInferenceUnits] :
  /// The desired number of inference units to be used by the model using this
  /// endpoint. Each inference unit represents of a throughput of 100 characters
  /// per second.
  ///
  /// Parameter [endpointArn] :
  /// The Amazon Resource Number (ARN) of the endpoint being updated.
  Future<void> updateEndpoint({
    required int desiredInferenceUnits,
    required String endpointArn,
  }) async {
    ArgumentError.checkNotNull(desiredInferenceUnits, 'desiredInferenceUnits');
    _s.validateNumRange(
      'desiredInferenceUnits',
      desiredInferenceUnits,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(endpointArn, 'endpointArn');
    _s.validateStringLength(
      'endpointArn',
      endpointArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.UpdateEndpoint'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DesiredInferenceUnits': desiredInferenceUnits,
        'EndpointArn': endpointArn,
      },
    );
  }
}

/// An augmented manifest file that provides training data for your custom
/// model. An augmented manifest file is a labeled dataset that is produced by
/// Amazon SageMaker Ground Truth.
class AugmentedManifestsListItem {
  /// The JSON attribute that contains the annotations for your training
  /// documents. The number of attribute names that you specify depends on whether
  /// your augmented manifest file is the output of a single labeling job or a
  /// chained labeling job.
  ///
  /// If your file is the output of a single labeling job, specify the
  /// LabelAttributeName key that was used when the job was created in Ground
  /// Truth.
  ///
  /// If your file is the output of a chained labeling job, specify the
  /// LabelAttributeName key for one or more jobs in the chain. Each
  /// LabelAttributeName key provides the annotations from an individual job.
  final List<String> attributeNames;

  /// The Amazon S3 location of the augmented manifest file.
  final String s3Uri;

  AugmentedManifestsListItem({
    required this.attributeNames,
    required this.s3Uri,
  });
  factory AugmentedManifestsListItem.fromJson(Map<String, dynamic> json) {
    return AugmentedManifestsListItem(
      attributeNames: (json['AttributeNames'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      s3Uri: json['S3Uri'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final attributeNames = this.attributeNames;
    final s3Uri = this.s3Uri;
    return {
      'AttributeNames': attributeNames,
      'S3Uri': s3Uri,
    };
  }
}

/// The result of calling the operation. The operation returns one object for
/// each document that is successfully processed by the operation.
class BatchDetectDominantLanguageItemResult {
  /// The zero-based index of the document in the input list.
  final int? index;

  /// One or more <a>DominantLanguage</a> objects describing the dominant
  /// languages in the document.
  final List<DominantLanguage>? languages;

  BatchDetectDominantLanguageItemResult({
    this.index,
    this.languages,
  });
  factory BatchDetectDominantLanguageItemResult.fromJson(
      Map<String, dynamic> json) {
    return BatchDetectDominantLanguageItemResult(
      index: json['Index'] as int?,
      languages: (json['Languages'] as List?)
          ?.whereNotNull()
          .map((e) => DominantLanguage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class BatchDetectDominantLanguageResponse {
  /// A list containing one object for each document that contained an error. The
  /// results are sorted in ascending order by the <code>Index</code> field and
  /// match the order of the documents in the input list. If there are no errors
  /// in the batch, the <code>ErrorList</code> is empty.
  final List<BatchItemError> errorList;

  /// A list of objects containing the results of the operation. The results are
  /// sorted in ascending order by the <code>Index</code> field and match the
  /// order of the documents in the input list. If all of the documents contain an
  /// error, the <code>ResultList</code> is empty.
  final List<BatchDetectDominantLanguageItemResult> resultList;

  BatchDetectDominantLanguageResponse({
    required this.errorList,
    required this.resultList,
  });
  factory BatchDetectDominantLanguageResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchDetectDominantLanguageResponse(
      errorList: (json['ErrorList'] as List)
          .whereNotNull()
          .map((e) => BatchItemError.fromJson(e as Map<String, dynamic>))
          .toList(),
      resultList: (json['ResultList'] as List)
          .whereNotNull()
          .map((e) => BatchDetectDominantLanguageItemResult.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// The result of calling the operation. The operation returns one object for
/// each document that is successfully processed by the operation.
class BatchDetectEntitiesItemResult {
  /// One or more <a>Entity</a> objects, one for each entity detected in the
  /// document.
  final List<Entity>? entities;

  /// The zero-based index of the document in the input list.
  final int? index;

  BatchDetectEntitiesItemResult({
    this.entities,
    this.index,
  });
  factory BatchDetectEntitiesItemResult.fromJson(Map<String, dynamic> json) {
    return BatchDetectEntitiesItemResult(
      entities: (json['Entities'] as List?)
          ?.whereNotNull()
          .map((e) => Entity.fromJson(e as Map<String, dynamic>))
          .toList(),
      index: json['Index'] as int?,
    );
  }
}

class BatchDetectEntitiesResponse {
  /// A list containing one object for each document that contained an error. The
  /// results are sorted in ascending order by the <code>Index</code> field and
  /// match the order of the documents in the input list. If there are no errors
  /// in the batch, the <code>ErrorList</code> is empty.
  final List<BatchItemError> errorList;

  /// A list of objects containing the results of the operation. The results are
  /// sorted in ascending order by the <code>Index</code> field and match the
  /// order of the documents in the input list. If all of the documents contain an
  /// error, the <code>ResultList</code> is empty.
  final List<BatchDetectEntitiesItemResult> resultList;

  BatchDetectEntitiesResponse({
    required this.errorList,
    required this.resultList,
  });
  factory BatchDetectEntitiesResponse.fromJson(Map<String, dynamic> json) {
    return BatchDetectEntitiesResponse(
      errorList: (json['ErrorList'] as List)
          .whereNotNull()
          .map((e) => BatchItemError.fromJson(e as Map<String, dynamic>))
          .toList(),
      resultList: (json['ResultList'] as List)
          .whereNotNull()
          .map((e) =>
              BatchDetectEntitiesItemResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// The result of calling the operation. The operation returns one object for
/// each document that is successfully processed by the operation.
class BatchDetectKeyPhrasesItemResult {
  /// The zero-based index of the document in the input list.
  final int? index;

  /// One or more <a>KeyPhrase</a> objects, one for each key phrase detected in
  /// the document.
  final List<KeyPhrase>? keyPhrases;

  BatchDetectKeyPhrasesItemResult({
    this.index,
    this.keyPhrases,
  });
  factory BatchDetectKeyPhrasesItemResult.fromJson(Map<String, dynamic> json) {
    return BatchDetectKeyPhrasesItemResult(
      index: json['Index'] as int?,
      keyPhrases: (json['KeyPhrases'] as List?)
          ?.whereNotNull()
          .map((e) => KeyPhrase.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class BatchDetectKeyPhrasesResponse {
  /// A list containing one object for each document that contained an error. The
  /// results are sorted in ascending order by the <code>Index</code> field and
  /// match the order of the documents in the input list. If there are no errors
  /// in the batch, the <code>ErrorList</code> is empty.
  final List<BatchItemError> errorList;

  /// A list of objects containing the results of the operation. The results are
  /// sorted in ascending order by the <code>Index</code> field and match the
  /// order of the documents in the input list. If all of the documents contain an
  /// error, the <code>ResultList</code> is empty.
  final List<BatchDetectKeyPhrasesItemResult> resultList;

  BatchDetectKeyPhrasesResponse({
    required this.errorList,
    required this.resultList,
  });
  factory BatchDetectKeyPhrasesResponse.fromJson(Map<String, dynamic> json) {
    return BatchDetectKeyPhrasesResponse(
      errorList: (json['ErrorList'] as List)
          .whereNotNull()
          .map((e) => BatchItemError.fromJson(e as Map<String, dynamic>))
          .toList(),
      resultList: (json['ResultList'] as List)
          .whereNotNull()
          .map((e) => BatchDetectKeyPhrasesItemResult.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// The result of calling the operation. The operation returns one object for
/// each document that is successfully processed by the operation.
class BatchDetectSentimentItemResult {
  /// The zero-based index of the document in the input list.
  final int? index;

  /// The sentiment detected in the document.
  final SentimentType? sentiment;

  /// The level of confidence that Amazon Comprehend has in the accuracy of its
  /// sentiment detection.
  final SentimentScore? sentimentScore;

  BatchDetectSentimentItemResult({
    this.index,
    this.sentiment,
    this.sentimentScore,
  });
  factory BatchDetectSentimentItemResult.fromJson(Map<String, dynamic> json) {
    return BatchDetectSentimentItemResult(
      index: json['Index'] as int?,
      sentiment: (json['Sentiment'] as String?)?.toSentimentType(),
      sentimentScore: json['SentimentScore'] != null
          ? SentimentScore.fromJson(
              json['SentimentScore'] as Map<String, dynamic>)
          : null,
    );
  }
}

class BatchDetectSentimentResponse {
  /// A list containing one object for each document that contained an error. The
  /// results are sorted in ascending order by the <code>Index</code> field and
  /// match the order of the documents in the input list. If there are no errors
  /// in the batch, the <code>ErrorList</code> is empty.
  final List<BatchItemError> errorList;

  /// A list of objects containing the results of the operation. The results are
  /// sorted in ascending order by the <code>Index</code> field and match the
  /// order of the documents in the input list. If all of the documents contain an
  /// error, the <code>ResultList</code> is empty.
  final List<BatchDetectSentimentItemResult> resultList;

  BatchDetectSentimentResponse({
    required this.errorList,
    required this.resultList,
  });
  factory BatchDetectSentimentResponse.fromJson(Map<String, dynamic> json) {
    return BatchDetectSentimentResponse(
      errorList: (json['ErrorList'] as List)
          .whereNotNull()
          .map((e) => BatchItemError.fromJson(e as Map<String, dynamic>))
          .toList(),
      resultList: (json['ResultList'] as List)
          .whereNotNull()
          .map((e) => BatchDetectSentimentItemResult.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// The result of calling the operation. The operation returns one object that
/// is successfully processed by the operation.
class BatchDetectSyntaxItemResult {
  /// The zero-based index of the document in the input list.
  final int? index;

  /// The syntax tokens for the words in the document, one token for each word.
  final List<SyntaxToken>? syntaxTokens;

  BatchDetectSyntaxItemResult({
    this.index,
    this.syntaxTokens,
  });
  factory BatchDetectSyntaxItemResult.fromJson(Map<String, dynamic> json) {
    return BatchDetectSyntaxItemResult(
      index: json['Index'] as int?,
      syntaxTokens: (json['SyntaxTokens'] as List?)
          ?.whereNotNull()
          .map((e) => SyntaxToken.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class BatchDetectSyntaxResponse {
  /// A list containing one object for each document that contained an error. The
  /// results are sorted in ascending order by the <code>Index</code> field and
  /// match the order of the documents in the input list. If there are no errors
  /// in the batch, the <code>ErrorList</code> is empty.
  final List<BatchItemError> errorList;

  /// A list of objects containing the results of the operation. The results are
  /// sorted in ascending order by the <code>Index</code> field and match the
  /// order of the documents in the input list. If all of the documents contain an
  /// error, the <code>ResultList</code> is empty.
  final List<BatchDetectSyntaxItemResult> resultList;

  BatchDetectSyntaxResponse({
    required this.errorList,
    required this.resultList,
  });
  factory BatchDetectSyntaxResponse.fromJson(Map<String, dynamic> json) {
    return BatchDetectSyntaxResponse(
      errorList: (json['ErrorList'] as List)
          .whereNotNull()
          .map((e) => BatchItemError.fromJson(e as Map<String, dynamic>))
          .toList(),
      resultList: (json['ResultList'] as List)
          .whereNotNull()
          .map((e) =>
              BatchDetectSyntaxItemResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Describes an error that occurred while processing a document in a batch. The
/// operation returns on <code>BatchItemError</code> object for each document
/// that contained an error.
class BatchItemError {
  /// The numeric error code of the error.
  final String? errorCode;

  /// A text description of the error.
  final String? errorMessage;

  /// The zero-based index of the document in the input list.
  final int? index;

  BatchItemError({
    this.errorCode,
    this.errorMessage,
    this.index,
  });
  factory BatchItemError.fromJson(Map<String, dynamic> json) {
    return BatchItemError(
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      index: json['Index'] as int?,
    );
  }
}

/// Describes the result metrics for the test data associated with an
/// documentation classifier.
class ClassifierEvaluationMetrics {
  /// The fraction of the labels that were correct recognized. It is computed by
  /// dividing the number of labels in the test documents that were correctly
  /// recognized by the total number of labels in the test documents.
  final double? accuracy;

  /// A measure of how accurate the classifier results are for the test data. It
  /// is derived from the <code>Precision</code> and <code>Recall</code> values.
  /// The <code>F1Score</code> is the harmonic average of the two scores. The
  /// highest score is 1, and the worst score is 0.
  final double? f1Score;

  /// Indicates the fraction of labels that are incorrectly predicted. Also seen
  /// as the fraction of wrong labels compared to the total number of labels.
  /// Scores closer to zero are better.
  final double? hammingLoss;

  /// A measure of how accurate the classifier results are for the test data. It
  /// is a combination of the <code>Micro Precision</code> and <code>Micro
  /// Recall</code> values. The <code>Micro F1Score</code> is the harmonic mean of
  /// the two scores. The highest score is 1, and the worst score is 0.
  final double? microF1Score;

  /// A measure of the usefulness of the recognizer results in the test data. High
  /// precision means that the recognizer returned substantially more relevant
  /// results than irrelevant ones. Unlike the Precision metric which comes from
  /// averaging the precision of all available labels, this is based on the
  /// overall score of all precision scores added together.
  final double? microPrecision;

  /// A measure of how complete the classifier results are for the test data. High
  /// recall means that the classifier returned most of the relevant results.
  /// Specifically, this indicates how many of the correct categories in the text
  /// that the model can predict. It is a percentage of correct categories in the
  /// text that can found. Instead of averaging the recall scores of all labels
  /// (as with Recall), micro Recall is based on the overall score of all recall
  /// scores added together.
  final double? microRecall;

  /// A measure of the usefulness of the classifier results in the test data. High
  /// precision means that the classifier returned substantially more relevant
  /// results than irrelevant ones.
  final double? precision;

  /// A measure of how complete the classifier results are for the test data. High
  /// recall means that the classifier returned most of the relevant results.
  final double? recall;

  ClassifierEvaluationMetrics({
    this.accuracy,
    this.f1Score,
    this.hammingLoss,
    this.microF1Score,
    this.microPrecision,
    this.microRecall,
    this.precision,
    this.recall,
  });
  factory ClassifierEvaluationMetrics.fromJson(Map<String, dynamic> json) {
    return ClassifierEvaluationMetrics(
      accuracy: json['Accuracy'] as double?,
      f1Score: json['F1Score'] as double?,
      hammingLoss: json['HammingLoss'] as double?,
      microF1Score: json['MicroF1Score'] as double?,
      microPrecision: json['MicroPrecision'] as double?,
      microRecall: json['MicroRecall'] as double?,
      precision: json['Precision'] as double?,
      recall: json['Recall'] as double?,
    );
  }
}

/// Provides information about a document classifier.
class ClassifierMetadata {
  /// Describes the result metrics for the test data associated with an
  /// documentation classifier.
  final ClassifierEvaluationMetrics? evaluationMetrics;

  /// The number of labels in the input data.
  final int? numberOfLabels;

  /// The number of documents in the input data that were used to test the
  /// classifier. Typically this is 10 to 20 percent of the input documents, up to
  /// 10,000 documents.
  final int? numberOfTestDocuments;

  /// The number of documents in the input data that were used to train the
  /// classifier. Typically this is 80 to 90 percent of the input documents.
  final int? numberOfTrainedDocuments;

  ClassifierMetadata({
    this.evaluationMetrics,
    this.numberOfLabels,
    this.numberOfTestDocuments,
    this.numberOfTrainedDocuments,
  });
  factory ClassifierMetadata.fromJson(Map<String, dynamic> json) {
    return ClassifierMetadata(
      evaluationMetrics: json['EvaluationMetrics'] != null
          ? ClassifierEvaluationMetrics.fromJson(
              json['EvaluationMetrics'] as Map<String, dynamic>)
          : null,
      numberOfLabels: json['NumberOfLabels'] as int?,
      numberOfTestDocuments: json['NumberOfTestDocuments'] as int?,
      numberOfTrainedDocuments: json['NumberOfTrainedDocuments'] as int?,
    );
  }
}

class ClassifyDocumentResponse {
  /// The classes used by the document being analyzed. These are used for
  /// multi-class trained models. Individual classes are mutually exclusive and
  /// each document is expected to have only a single class assigned to it. For
  /// example, an animal can be a dog or a cat, but not both at the same time.
  final List<DocumentClass>? classes;

  /// The labels used the document being analyzed. These are used for multi-label
  /// trained models. Individual labels represent different categories that are
  /// related in some manner and are not mutually exclusive. For example, a movie
  /// can be just an action movie, or it can be an action movie, a science fiction
  /// movie, and a comedy, all at the same time.
  final List<DocumentLabel>? labels;

  ClassifyDocumentResponse({
    this.classes,
    this.labels,
  });
  factory ClassifyDocumentResponse.fromJson(Map<String, dynamic> json) {
    return ClassifyDocumentResponse(
      classes: (json['Classes'] as List?)
          ?.whereNotNull()
          .map((e) => DocumentClass.fromJson(e as Map<String, dynamic>))
          .toList(),
      labels: (json['Labels'] as List?)
          ?.whereNotNull()
          .map((e) => DocumentLabel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class CreateDocumentClassifierResponse {
  /// The Amazon Resource Name (ARN) that identifies the document classifier.
  final String? documentClassifierArn;

  CreateDocumentClassifierResponse({
    this.documentClassifierArn,
  });
  factory CreateDocumentClassifierResponse.fromJson(Map<String, dynamic> json) {
    return CreateDocumentClassifierResponse(
      documentClassifierArn: json['DocumentClassifierArn'] as String?,
    );
  }
}

class CreateEndpointResponse {
  /// The Amazon Resource Number (ARN) of the endpoint being created.
  final String? endpointArn;

  CreateEndpointResponse({
    this.endpointArn,
  });
  factory CreateEndpointResponse.fromJson(Map<String, dynamic> json) {
    return CreateEndpointResponse(
      endpointArn: json['EndpointArn'] as String?,
    );
  }
}

class CreateEntityRecognizerResponse {
  /// The Amazon Resource Name (ARN) that identifies the entity recognizer.
  final String? entityRecognizerArn;

  CreateEntityRecognizerResponse({
    this.entityRecognizerArn,
  });
  factory CreateEntityRecognizerResponse.fromJson(Map<String, dynamic> json) {
    return CreateEntityRecognizerResponse(
      entityRecognizerArn: json['EntityRecognizerArn'] as String?,
    );
  }
}

class DeleteDocumentClassifierResponse {
  DeleteDocumentClassifierResponse();
  factory DeleteDocumentClassifierResponse.fromJson(Map<String, dynamic> _) {
    return DeleteDocumentClassifierResponse();
  }
}

class DeleteEndpointResponse {
  DeleteEndpointResponse();
  factory DeleteEndpointResponse.fromJson(Map<String, dynamic> _) {
    return DeleteEndpointResponse();
  }
}

class DeleteEntityRecognizerResponse {
  DeleteEntityRecognizerResponse();
  factory DeleteEntityRecognizerResponse.fromJson(Map<String, dynamic> _) {
    return DeleteEntityRecognizerResponse();
  }
}

class DescribeDocumentClassificationJobResponse {
  /// An object that describes the properties associated with the document
  /// classification job.
  final DocumentClassificationJobProperties?
      documentClassificationJobProperties;

  DescribeDocumentClassificationJobResponse({
    this.documentClassificationJobProperties,
  });
  factory DescribeDocumentClassificationJobResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeDocumentClassificationJobResponse(
      documentClassificationJobProperties:
          json['DocumentClassificationJobProperties'] != null
              ? DocumentClassificationJobProperties.fromJson(
                  json['DocumentClassificationJobProperties']
                      as Map<String, dynamic>)
              : null,
    );
  }
}

class DescribeDocumentClassifierResponse {
  /// An object that contains the properties associated with a document
  /// classifier.
  final DocumentClassifierProperties? documentClassifierProperties;

  DescribeDocumentClassifierResponse({
    this.documentClassifierProperties,
  });
  factory DescribeDocumentClassifierResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeDocumentClassifierResponse(
      documentClassifierProperties: json['DocumentClassifierProperties'] != null
          ? DocumentClassifierProperties.fromJson(
              json['DocumentClassifierProperties'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DescribeDominantLanguageDetectionJobResponse {
  /// An object that contains the properties associated with a dominant language
  /// detection job.
  final DominantLanguageDetectionJobProperties?
      dominantLanguageDetectionJobProperties;

  DescribeDominantLanguageDetectionJobResponse({
    this.dominantLanguageDetectionJobProperties,
  });
  factory DescribeDominantLanguageDetectionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeDominantLanguageDetectionJobResponse(
      dominantLanguageDetectionJobProperties:
          json['DominantLanguageDetectionJobProperties'] != null
              ? DominantLanguageDetectionJobProperties.fromJson(
                  json['DominantLanguageDetectionJobProperties']
                      as Map<String, dynamic>)
              : null,
    );
  }
}

class DescribeEndpointResponse {
  /// Describes information associated with the specific endpoint.
  final EndpointProperties? endpointProperties;

  DescribeEndpointResponse({
    this.endpointProperties,
  });
  factory DescribeEndpointResponse.fromJson(Map<String, dynamic> json) {
    return DescribeEndpointResponse(
      endpointProperties: json['EndpointProperties'] != null
          ? EndpointProperties.fromJson(
              json['EndpointProperties'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DescribeEntitiesDetectionJobResponse {
  /// An object that contains the properties associated with an entities detection
  /// job.
  final EntitiesDetectionJobProperties? entitiesDetectionJobProperties;

  DescribeEntitiesDetectionJobResponse({
    this.entitiesDetectionJobProperties,
  });
  factory DescribeEntitiesDetectionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeEntitiesDetectionJobResponse(
      entitiesDetectionJobProperties: json['EntitiesDetectionJobProperties'] !=
              null
          ? EntitiesDetectionJobProperties.fromJson(
              json['EntitiesDetectionJobProperties'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DescribeEntityRecognizerResponse {
  /// Describes information associated with an entity recognizer.
  final EntityRecognizerProperties? entityRecognizerProperties;

  DescribeEntityRecognizerResponse({
    this.entityRecognizerProperties,
  });
  factory DescribeEntityRecognizerResponse.fromJson(Map<String, dynamic> json) {
    return DescribeEntityRecognizerResponse(
      entityRecognizerProperties: json['EntityRecognizerProperties'] != null
          ? EntityRecognizerProperties.fromJson(
              json['EntityRecognizerProperties'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DescribeEventsDetectionJobResponse {
  /// An object that contains the properties associated with an event detection
  /// job.
  final EventsDetectionJobProperties? eventsDetectionJobProperties;

  DescribeEventsDetectionJobResponse({
    this.eventsDetectionJobProperties,
  });
  factory DescribeEventsDetectionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeEventsDetectionJobResponse(
      eventsDetectionJobProperties: json['EventsDetectionJobProperties'] != null
          ? EventsDetectionJobProperties.fromJson(
              json['EventsDetectionJobProperties'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DescribeKeyPhrasesDetectionJobResponse {
  /// An object that contains the properties associated with a key phrases
  /// detection job.
  final KeyPhrasesDetectionJobProperties? keyPhrasesDetectionJobProperties;

  DescribeKeyPhrasesDetectionJobResponse({
    this.keyPhrasesDetectionJobProperties,
  });
  factory DescribeKeyPhrasesDetectionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeKeyPhrasesDetectionJobResponse(
      keyPhrasesDetectionJobProperties:
          json['KeyPhrasesDetectionJobProperties'] != null
              ? KeyPhrasesDetectionJobProperties.fromJson(
                  json['KeyPhrasesDetectionJobProperties']
                      as Map<String, dynamic>)
              : null,
    );
  }
}

class DescribePiiEntitiesDetectionJobResponse {
  final PiiEntitiesDetectionJobProperties? piiEntitiesDetectionJobProperties;

  DescribePiiEntitiesDetectionJobResponse({
    this.piiEntitiesDetectionJobProperties,
  });
  factory DescribePiiEntitiesDetectionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribePiiEntitiesDetectionJobResponse(
      piiEntitiesDetectionJobProperties:
          json['PiiEntitiesDetectionJobProperties'] != null
              ? PiiEntitiesDetectionJobProperties.fromJson(
                  json['PiiEntitiesDetectionJobProperties']
                      as Map<String, dynamic>)
              : null,
    );
  }
}

class DescribeSentimentDetectionJobResponse {
  /// An object that contains the properties associated with a sentiment detection
  /// job.
  final SentimentDetectionJobProperties? sentimentDetectionJobProperties;

  DescribeSentimentDetectionJobResponse({
    this.sentimentDetectionJobProperties,
  });
  factory DescribeSentimentDetectionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeSentimentDetectionJobResponse(
      sentimentDetectionJobProperties:
          json['SentimentDetectionJobProperties'] != null
              ? SentimentDetectionJobProperties.fromJson(
                  json['SentimentDetectionJobProperties']
                      as Map<String, dynamic>)
              : null,
    );
  }
}

class DescribeTopicsDetectionJobResponse {
  /// The list of properties for the requested job.
  final TopicsDetectionJobProperties? topicsDetectionJobProperties;

  DescribeTopicsDetectionJobResponse({
    this.topicsDetectionJobProperties,
  });
  factory DescribeTopicsDetectionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeTopicsDetectionJobResponse(
      topicsDetectionJobProperties: json['TopicsDetectionJobProperties'] != null
          ? TopicsDetectionJobProperties.fromJson(
              json['TopicsDetectionJobProperties'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DetectDominantLanguageResponse {
  /// The languages that Amazon Comprehend detected in the input text. For each
  /// language, the response returns the RFC 5646 language code and the level of
  /// confidence that Amazon Comprehend has in the accuracy of its inference. For
  /// more information about RFC 5646, see <a
  /// href="https://tools.ietf.org/html/rfc5646">Tags for Identifying
  /// Languages</a> on the <i>IETF Tools</i> web site.
  final List<DominantLanguage>? languages;

  DetectDominantLanguageResponse({
    this.languages,
  });
  factory DetectDominantLanguageResponse.fromJson(Map<String, dynamic> json) {
    return DetectDominantLanguageResponse(
      languages: (json['Languages'] as List?)
          ?.whereNotNull()
          .map((e) => DominantLanguage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class DetectEntitiesResponse {
  /// A collection of entities identified in the input text. For each entity, the
  /// response provides the entity text, entity type, where the entity text begins
  /// and ends, and the level of confidence that Amazon Comprehend has in the
  /// detection.
  ///
  /// If your request uses a custom entity recognition model, Amazon Comprehend
  /// detects the entities that the model is trained to recognize. Otherwise, it
  /// detects the default entity types. For a list of default entity types, see
  /// <a>how-entities</a>.
  final List<Entity>? entities;

  DetectEntitiesResponse({
    this.entities,
  });
  factory DetectEntitiesResponse.fromJson(Map<String, dynamic> json) {
    return DetectEntitiesResponse(
      entities: (json['Entities'] as List?)
          ?.whereNotNull()
          .map((e) => Entity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class DetectKeyPhrasesResponse {
  /// A collection of key phrases that Amazon Comprehend identified in the input
  /// text. For each key phrase, the response provides the text of the key phrase,
  /// where the key phrase begins and ends, and the level of confidence that
  /// Amazon Comprehend has in the accuracy of the detection.
  final List<KeyPhrase>? keyPhrases;

  DetectKeyPhrasesResponse({
    this.keyPhrases,
  });
  factory DetectKeyPhrasesResponse.fromJson(Map<String, dynamic> json) {
    return DetectKeyPhrasesResponse(
      keyPhrases: (json['KeyPhrases'] as List?)
          ?.whereNotNull()
          .map((e) => KeyPhrase.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class DetectPiiEntitiesResponse {
  /// A collection of PII entities identified in the input text. For each entity,
  /// the response provides the entity type, where the entity text begins and
  /// ends, and the level of confidence that Amazon Comprehend has in the
  /// detection.
  final List<PiiEntity>? entities;

  DetectPiiEntitiesResponse({
    this.entities,
  });
  factory DetectPiiEntitiesResponse.fromJson(Map<String, dynamic> json) {
    return DetectPiiEntitiesResponse(
      entities: (json['Entities'] as List?)
          ?.whereNotNull()
          .map((e) => PiiEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class DetectSentimentResponse {
  /// The inferred sentiment that Amazon Comprehend has the highest level of
  /// confidence in.
  final SentimentType? sentiment;

  /// An object that lists the sentiments, and their corresponding confidence
  /// levels.
  final SentimentScore? sentimentScore;

  DetectSentimentResponse({
    this.sentiment,
    this.sentimentScore,
  });
  factory DetectSentimentResponse.fromJson(Map<String, dynamic> json) {
    return DetectSentimentResponse(
      sentiment: (json['Sentiment'] as String?)?.toSentimentType(),
      sentimentScore: json['SentimentScore'] != null
          ? SentimentScore.fromJson(
              json['SentimentScore'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DetectSyntaxResponse {
  /// A collection of syntax tokens describing the text. For each token, the
  /// response provides the text, the token type, where the text begins and ends,
  /// and the level of confidence that Amazon Comprehend has that the token is
  /// correct. For a list of token types, see <a>how-syntax</a>.
  final List<SyntaxToken>? syntaxTokens;

  DetectSyntaxResponse({
    this.syntaxTokens,
  });
  factory DetectSyntaxResponse.fromJson(Map<String, dynamic> json) {
    return DetectSyntaxResponse(
      syntaxTokens: (json['SyntaxTokens'] as List?)
          ?.whereNotNull()
          .map((e) => SyntaxToken.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Specifies the class that categorizes the document being analyzed
class DocumentClass {
  /// The name of the class.
  final String? name;

  /// The confidence score that Amazon Comprehend has this class correctly
  /// attributed.
  final double? score;

  DocumentClass({
    this.name,
    this.score,
  });
  factory DocumentClass.fromJson(Map<String, dynamic> json) {
    return DocumentClass(
      name: json['Name'] as String?,
      score: json['Score'] as double?,
    );
  }
}

/// Provides information for filtering a list of document classification jobs.
/// For more information, see the operation. You can provide only one filter
/// parameter in each request.
class DocumentClassificationJobFilter {
  /// Filters on the name of the job.
  final String? jobName;

  /// Filters the list based on job status. Returns only jobs with the specified
  /// status.
  final JobStatus? jobStatus;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted after the specified time. Jobs are
  /// returned in descending order, newest to oldest.
  final DateTime? submitTimeAfter;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted before the specified time. Jobs are
  /// returned in ascending order, oldest to newest.
  final DateTime? submitTimeBefore;

  DocumentClassificationJobFilter({
    this.jobName,
    this.jobStatus,
    this.submitTimeAfter,
    this.submitTimeBefore,
  });
  Map<String, dynamic> toJson() {
    final jobName = this.jobName;
    final jobStatus = this.jobStatus;
    final submitTimeAfter = this.submitTimeAfter;
    final submitTimeBefore = this.submitTimeBefore;
    return {
      if (jobName != null) 'JobName': jobName,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (submitTimeAfter != null)
        'SubmitTimeAfter': unixTimestampToJson(submitTimeAfter),
      if (submitTimeBefore != null)
        'SubmitTimeBefore': unixTimestampToJson(submitTimeBefore),
    };
  }
}

/// Provides information about a document classification job.
class DocumentClassificationJobProperties {
  /// The Amazon Resource Name (ARN) of the AWS identity and Access Management
  /// (IAM) role that grants Amazon Comprehend read access to your input data.
  final String? dataAccessRoleArn;

  /// The Amazon Resource Name (ARN) that identifies the document classifier.
  final String? documentClassifierArn;

  /// The time that the document classification job completed.
  final DateTime? endTime;

  /// The input data configuration that you supplied when you created the document
  /// classification job.
  final InputDataConfig? inputDataConfig;

  /// The identifier assigned to the document classification job.
  final String? jobId;

  /// The name that you assigned to the document classification job.
  final String? jobName;

  /// The current status of the document classification job. If the status is
  /// <code>FAILED</code>, the <code>Message</code> field shows the reason for the
  /// failure.
  final JobStatus? jobStatus;

  /// A description of the status of the job.
  final String? message;

  /// The output data configuration that you supplied when you created the
  /// document classification job.
  final OutputDataConfig? outputDataConfig;

  /// The time that the document classification job was submitted for processing.
  final DateTime? submitTime;

  /// ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses
  /// to encrypt data on the storage volume attached to the ML compute instance(s)
  /// that process the analysis job. The VolumeKmsKeyId can be either of the
  /// following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  final String? volumeKmsKeyId;

  /// Configuration parameters for a private Virtual Private Cloud (VPC)
  /// containing the resources you are using for your document classification job.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon
  /// VPC</a>.
  final VpcConfig? vpcConfig;

  DocumentClassificationJobProperties({
    this.dataAccessRoleArn,
    this.documentClassifierArn,
    this.endTime,
    this.inputDataConfig,
    this.jobId,
    this.jobName,
    this.jobStatus,
    this.message,
    this.outputDataConfig,
    this.submitTime,
    this.volumeKmsKeyId,
    this.vpcConfig,
  });
  factory DocumentClassificationJobProperties.fromJson(
      Map<String, dynamic> json) {
    return DocumentClassificationJobProperties(
      dataAccessRoleArn: json['DataAccessRoleArn'] as String?,
      documentClassifierArn: json['DocumentClassifierArn'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      inputDataConfig: json['InputDataConfig'] != null
          ? InputDataConfig.fromJson(
              json['InputDataConfig'] as Map<String, dynamic>)
          : null,
      jobId: json['JobId'] as String?,
      jobName: json['JobName'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
      message: json['Message'] as String?,
      outputDataConfig: json['OutputDataConfig'] != null
          ? OutputDataConfig.fromJson(
              json['OutputDataConfig'] as Map<String, dynamic>)
          : null,
      submitTime: timeStampFromJson(json['SubmitTime']),
      volumeKmsKeyId: json['VolumeKmsKeyId'] as String?,
      vpcConfig: json['VpcConfig'] != null
          ? VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }
}

enum DocumentClassifierDataFormat {
  comprehendCsv,
  augmentedManifest,
}

extension on DocumentClassifierDataFormat {
  String toValue() {
    switch (this) {
      case DocumentClassifierDataFormat.comprehendCsv:
        return 'COMPREHEND_CSV';
      case DocumentClassifierDataFormat.augmentedManifest:
        return 'AUGMENTED_MANIFEST';
    }
  }
}

extension on String {
  DocumentClassifierDataFormat toDocumentClassifierDataFormat() {
    switch (this) {
      case 'COMPREHEND_CSV':
        return DocumentClassifierDataFormat.comprehendCsv;
      case 'AUGMENTED_MANIFEST':
        return DocumentClassifierDataFormat.augmentedManifest;
    }
    throw Exception('$this is not known in enum DocumentClassifierDataFormat');
  }
}

/// Provides information for filtering a list of document classifiers. You can
/// only specify one filtering parameter in a request. For more information, see
/// the operation.
class DocumentClassifierFilter {
  /// Filters the list of classifiers based on status.
  final ModelStatus? status;

  /// Filters the list of classifiers based on the time that the classifier was
  /// submitted for processing. Returns only classifiers submitted after the
  /// specified time. Classifiers are returned in descending order, newest to
  /// oldest.
  final DateTime? submitTimeAfter;

  /// Filters the list of classifiers based on the time that the classifier was
  /// submitted for processing. Returns only classifiers submitted before the
  /// specified time. Classifiers are returned in ascending order, oldest to
  /// newest.
  final DateTime? submitTimeBefore;

  DocumentClassifierFilter({
    this.status,
    this.submitTimeAfter,
    this.submitTimeBefore,
  });
  Map<String, dynamic> toJson() {
    final status = this.status;
    final submitTimeAfter = this.submitTimeAfter;
    final submitTimeBefore = this.submitTimeBefore;
    return {
      if (status != null) 'Status': status.toValue(),
      if (submitTimeAfter != null)
        'SubmitTimeAfter': unixTimestampToJson(submitTimeAfter),
      if (submitTimeBefore != null)
        'SubmitTimeBefore': unixTimestampToJson(submitTimeBefore),
    };
  }
}

/// The input properties for training a document classifier.
///
/// For more information on how the input file is formatted, see
/// <a>how-document-classification-training-data</a>.
class DocumentClassifierInputDataConfig {
  /// A list of augmented manifest files that provide training data for your
  /// custom model. An augmented manifest file is a labeled dataset that is
  /// produced by Amazon SageMaker Ground Truth.
  ///
  /// This parameter is required if you set <code>DataFormat</code> to
  /// <code>AUGMENTED_MANIFEST</code>.
  final List<AugmentedManifestsListItem>? augmentedManifests;

  /// The format of your training data:
  ///
  /// <ul>
  /// <li>
  /// <code>COMPREHEND_CSV</code>: A two-column CSV file, where labels are
  /// provided in the first column, and documents are provided in the second. If
  /// you use this value, you must provide the <code>S3Uri</code> parameter in
  /// your request.
  /// </li>
  /// <li>
  /// <code>AUGMENTED_MANIFEST</code>: A labeled dataset that is produced by
  /// Amazon SageMaker Ground Truth. This file is in JSON lines format. Each line
  /// is a complete JSON object that contains a training document and its
  /// associated labels.
  ///
  /// If you use this value, you must provide the <code>AugmentedManifests</code>
  /// parameter in your request.
  /// </li>
  /// </ul>
  /// If you don't specify a value, Amazon Comprehend uses
  /// <code>COMPREHEND_CSV</code> as the default.
  final DocumentClassifierDataFormat? dataFormat;

  /// Indicates the delimiter used to separate each label for training a
  /// multi-label classifier. The default delimiter between labels is a pipe (|).
  /// You can use a different character as a delimiter (if it's an allowed
  /// character) by specifying it under Delimiter for labels. If the training
  /// documents use a delimiter other than the default or the delimiter you
  /// specify, the labels on that line will be combined to make a single unique
  /// label, such as LABELLABELLABEL.
  final String? labelDelimiter;

  /// The Amazon S3 URI for the input data. The S3 bucket must be in the same
  /// region as the API endpoint that you are calling. The URI can point to a
  /// single input file or it can provide the prefix for a collection of input
  /// files.
  ///
  /// For example, if you use the URI <code>S3://bucketName/prefix</code>, if the
  /// prefix is a single file, Amazon Comprehend uses that file as input. If more
  /// than one file begins with the prefix, Amazon Comprehend uses all of them as
  /// input.
  ///
  /// This parameter is required if you set <code>DataFormat</code> to
  /// <code>COMPREHEND_CSV</code>.
  final String? s3Uri;

  DocumentClassifierInputDataConfig({
    this.augmentedManifests,
    this.dataFormat,
    this.labelDelimiter,
    this.s3Uri,
  });
  factory DocumentClassifierInputDataConfig.fromJson(
      Map<String, dynamic> json) {
    return DocumentClassifierInputDataConfig(
      augmentedManifests: (json['AugmentedManifests'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AugmentedManifestsListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      dataFormat:
          (json['DataFormat'] as String?)?.toDocumentClassifierDataFormat(),
      labelDelimiter: json['LabelDelimiter'] as String?,
      s3Uri: json['S3Uri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final augmentedManifests = this.augmentedManifests;
    final dataFormat = this.dataFormat;
    final labelDelimiter = this.labelDelimiter;
    final s3Uri = this.s3Uri;
    return {
      if (augmentedManifests != null) 'AugmentedManifests': augmentedManifests,
      if (dataFormat != null) 'DataFormat': dataFormat.toValue(),
      if (labelDelimiter != null) 'LabelDelimiter': labelDelimiter,
      if (s3Uri != null) 'S3Uri': s3Uri,
    };
  }
}

enum DocumentClassifierMode {
  multiClass,
  multiLabel,
}

extension on DocumentClassifierMode {
  String toValue() {
    switch (this) {
      case DocumentClassifierMode.multiClass:
        return 'MULTI_CLASS';
      case DocumentClassifierMode.multiLabel:
        return 'MULTI_LABEL';
    }
  }
}

extension on String {
  DocumentClassifierMode toDocumentClassifierMode() {
    switch (this) {
      case 'MULTI_CLASS':
        return DocumentClassifierMode.multiClass;
      case 'MULTI_LABEL':
        return DocumentClassifierMode.multiLabel;
    }
    throw Exception('$this is not known in enum DocumentClassifierMode');
  }
}

/// Provides output results configuration parameters for custom classifier jobs.
class DocumentClassifierOutputDataConfig {
  /// ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses
  /// to encrypt the output results from an analysis job. The KmsKeyId can be one
  /// of the following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// KMS Key Alias: <code>"alias/ExampleAlias"</code>
  /// </li>
  /// <li>
  /// ARN of a KMS Key Alias:
  /// <code>"arn:aws:kms:us-west-2:111122223333:alias/ExampleAlias"</code>
  /// </li>
  /// </ul>
  final String? kmsKeyId;

  /// When you use the <code>OutputDataConfig</code> object while creating a
  /// custom classifier, you specify the Amazon S3 location where you want to
  /// write the confusion matrix. The URI must be in the same region as the API
  /// endpoint that you are calling. The location is used as the prefix for the
  /// actual location of this output file.
  ///
  /// When the custom classifier job is finished, the service creates the output
  /// file in a directory specific to the job. The <code>S3Uri</code> field
  /// contains the location of the output file, called <code>output.tar.gz</code>.
  /// It is a compressed archive that contains the confusion matrix.
  final String? s3Uri;

  DocumentClassifierOutputDataConfig({
    this.kmsKeyId,
    this.s3Uri,
  });
  factory DocumentClassifierOutputDataConfig.fromJson(
      Map<String, dynamic> json) {
    return DocumentClassifierOutputDataConfig(
      kmsKeyId: json['KmsKeyId'] as String?,
      s3Uri: json['S3Uri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final kmsKeyId = this.kmsKeyId;
    final s3Uri = this.s3Uri;
    return {
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (s3Uri != null) 'S3Uri': s3Uri,
    };
  }
}

/// Provides information about a document classifier.
class DocumentClassifierProperties {
  /// Information about the document classifier, including the number of documents
  /// used for training the classifier, the number of documents used for test the
  /// classifier, and an accuracy rating.
  final ClassifierMetadata? classifierMetadata;

  /// The Amazon Resource Name (ARN) of the AWS Identity and Management (IAM) role
  /// that grants Amazon Comprehend read access to your input data.
  final String? dataAccessRoleArn;

  /// The Amazon Resource Name (ARN) that identifies the document classifier.
  final String? documentClassifierArn;

  /// The time that training the document classifier completed.
  final DateTime? endTime;

  /// The input data configuration that you supplied when you created the document
  /// classifier for training.
  final DocumentClassifierInputDataConfig? inputDataConfig;

  /// The language code for the language of the documents that the classifier was
  /// trained on.
  final LanguageCode? languageCode;

  /// Additional information about the status of the classifier.
  final String? message;

  /// Indicates the mode in which the specific classifier was trained. This also
  /// indicates the format of input documents and the format of the confusion
  /// matrix. Each classifier can only be trained in one mode and this cannot be
  /// changed once the classifier is trained.
  final DocumentClassifierMode? mode;

  /// Provides output results configuration parameters for custom classifier jobs.
  final DocumentClassifierOutputDataConfig? outputDataConfig;

  /// The status of the document classifier. If the status is <code>TRAINED</code>
  /// the classifier is ready to use. If the status is <code>FAILED</code> you can
  /// see additional information about why the classifier wasn't trained in the
  /// <code>Message</code> field.
  final ModelStatus? status;

  /// The time that the document classifier was submitted for training.
  final DateTime? submitTime;

  /// The time that training of the document classifier was completed. Indicates
  /// the time when the training completes on documentation classifiers. You are
  /// billed for the time interval between this time and the value of
  /// TrainingStartTime.
  final DateTime? trainingEndTime;

  /// Indicates the time when the training starts on documentation classifiers.
  /// You are billed for the time interval between this time and the value of
  /// TrainingEndTime.
  final DateTime? trainingStartTime;

  /// ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses
  /// to encrypt data on the storage volume attached to the ML compute instance(s)
  /// that process the analysis job. The VolumeKmsKeyId can be either of the
  /// following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  final String? volumeKmsKeyId;

  /// Configuration parameters for a private Virtual Private Cloud (VPC)
  /// containing the resources you are using for your custom classifier. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon
  /// VPC</a>.
  final VpcConfig? vpcConfig;

  DocumentClassifierProperties({
    this.classifierMetadata,
    this.dataAccessRoleArn,
    this.documentClassifierArn,
    this.endTime,
    this.inputDataConfig,
    this.languageCode,
    this.message,
    this.mode,
    this.outputDataConfig,
    this.status,
    this.submitTime,
    this.trainingEndTime,
    this.trainingStartTime,
    this.volumeKmsKeyId,
    this.vpcConfig,
  });
  factory DocumentClassifierProperties.fromJson(Map<String, dynamic> json) {
    return DocumentClassifierProperties(
      classifierMetadata: json['ClassifierMetadata'] != null
          ? ClassifierMetadata.fromJson(
              json['ClassifierMetadata'] as Map<String, dynamic>)
          : null,
      dataAccessRoleArn: json['DataAccessRoleArn'] as String?,
      documentClassifierArn: json['DocumentClassifierArn'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      inputDataConfig: json['InputDataConfig'] != null
          ? DocumentClassifierInputDataConfig.fromJson(
              json['InputDataConfig'] as Map<String, dynamic>)
          : null,
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
      message: json['Message'] as String?,
      mode: (json['Mode'] as String?)?.toDocumentClassifierMode(),
      outputDataConfig: json['OutputDataConfig'] != null
          ? DocumentClassifierOutputDataConfig.fromJson(
              json['OutputDataConfig'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.toModelStatus(),
      submitTime: timeStampFromJson(json['SubmitTime']),
      trainingEndTime: timeStampFromJson(json['TrainingEndTime']),
      trainingStartTime: timeStampFromJson(json['TrainingStartTime']),
      volumeKmsKeyId: json['VolumeKmsKeyId'] as String?,
      vpcConfig: json['VpcConfig'] != null
          ? VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Specifies one of the label or labels that categorize the document being
/// analyzed.
class DocumentLabel {
  /// The name of the label.
  final String? name;

  /// The confidence score that Amazon Comprehend has this label correctly
  /// attributed.
  final double? score;

  DocumentLabel({
    this.name,
    this.score,
  });
  factory DocumentLabel.fromJson(Map<String, dynamic> json) {
    return DocumentLabel(
      name: json['Name'] as String?,
      score: json['Score'] as double?,
    );
  }
}

/// Returns the code for the dominant language in the input text and the level
/// of confidence that Amazon Comprehend has in the accuracy of the detection.
class DominantLanguage {
  /// The RFC 5646 language code for the dominant language. For more information
  /// about RFC 5646, see <a href="https://tools.ietf.org/html/rfc5646">Tags for
  /// Identifying Languages</a> on the <i>IETF Tools</i> web site.
  final String? languageCode;

  /// The level of confidence that Amazon Comprehend has in the accuracy of the
  /// detection.
  final double? score;

  DominantLanguage({
    this.languageCode,
    this.score,
  });
  factory DominantLanguage.fromJson(Map<String, dynamic> json) {
    return DominantLanguage(
      languageCode: json['LanguageCode'] as String?,
      score: json['Score'] as double?,
    );
  }
}

/// Provides information for filtering a list of dominant language detection
/// jobs. For more information, see the operation.
class DominantLanguageDetectionJobFilter {
  /// Filters on the name of the job.
  final String? jobName;

  /// Filters the list of jobs based on job status. Returns only jobs with the
  /// specified status.
  final JobStatus? jobStatus;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted after the specified time. Jobs are
  /// returned in descending order, newest to oldest.
  final DateTime? submitTimeAfter;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted before the specified time. Jobs are
  /// returned in ascending order, oldest to newest.
  final DateTime? submitTimeBefore;

  DominantLanguageDetectionJobFilter({
    this.jobName,
    this.jobStatus,
    this.submitTimeAfter,
    this.submitTimeBefore,
  });
  Map<String, dynamic> toJson() {
    final jobName = this.jobName;
    final jobStatus = this.jobStatus;
    final submitTimeAfter = this.submitTimeAfter;
    final submitTimeBefore = this.submitTimeBefore;
    return {
      if (jobName != null) 'JobName': jobName,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (submitTimeAfter != null)
        'SubmitTimeAfter': unixTimestampToJson(submitTimeAfter),
      if (submitTimeBefore != null)
        'SubmitTimeBefore': unixTimestampToJson(submitTimeBefore),
    };
  }
}

/// Provides information about a dominant language detection job.
class DominantLanguageDetectionJobProperties {
  /// The Amazon Resource Name (ARN) that gives Amazon Comprehend read access to
  /// your input data.
  final String? dataAccessRoleArn;

  /// The time that the dominant language detection job completed.
  final DateTime? endTime;

  /// The input data configuration that you supplied when you created the dominant
  /// language detection job.
  final InputDataConfig? inputDataConfig;

  /// The identifier assigned to the dominant language detection job.
  final String? jobId;

  /// The name that you assigned to the dominant language detection job.
  final String? jobName;

  /// The current status of the dominant language detection job. If the status is
  /// <code>FAILED</code>, the <code>Message</code> field shows the reason for the
  /// failure.
  final JobStatus? jobStatus;

  /// A description for the status of a job.
  final String? message;

  /// The output data configuration that you supplied when you created the
  /// dominant language detection job.
  final OutputDataConfig? outputDataConfig;

  /// The time that the dominant language detection job was submitted for
  /// processing.
  final DateTime? submitTime;

  /// ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses
  /// to encrypt data on the storage volume attached to the ML compute instance(s)
  /// that process the analysis job. The VolumeKmsKeyId can be either of the
  /// following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  final String? volumeKmsKeyId;

  /// Configuration parameters for a private Virtual Private Cloud (VPC)
  /// containing the resources you are using for your dominant language detection
  /// job. For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon
  /// VPC</a>.
  final VpcConfig? vpcConfig;

  DominantLanguageDetectionJobProperties({
    this.dataAccessRoleArn,
    this.endTime,
    this.inputDataConfig,
    this.jobId,
    this.jobName,
    this.jobStatus,
    this.message,
    this.outputDataConfig,
    this.submitTime,
    this.volumeKmsKeyId,
    this.vpcConfig,
  });
  factory DominantLanguageDetectionJobProperties.fromJson(
      Map<String, dynamic> json) {
    return DominantLanguageDetectionJobProperties(
      dataAccessRoleArn: json['DataAccessRoleArn'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      inputDataConfig: json['InputDataConfig'] != null
          ? InputDataConfig.fromJson(
              json['InputDataConfig'] as Map<String, dynamic>)
          : null,
      jobId: json['JobId'] as String?,
      jobName: json['JobName'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
      message: json['Message'] as String?,
      outputDataConfig: json['OutputDataConfig'] != null
          ? OutputDataConfig.fromJson(
              json['OutputDataConfig'] as Map<String, dynamic>)
          : null,
      submitTime: timeStampFromJson(json['SubmitTime']),
      volumeKmsKeyId: json['VolumeKmsKeyId'] as String?,
      vpcConfig: json['VpcConfig'] != null
          ? VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// The filter used to determine which endpoints are returned. You can filter
/// jobs on their name, model, status, or the date and time that they were
/// created. You can only set one filter at a time.
class EndpointFilter {
  /// Specifies a date after which the returned endpoint or endpoints were
  /// created.
  final DateTime? creationTimeAfter;

  /// Specifies a date before which the returned endpoint or endpoints were
  /// created.
  final DateTime? creationTimeBefore;

  /// The Amazon Resource Number (ARN) of the model to which the endpoint is
  /// attached.
  final String? modelArn;

  /// Specifies the status of the endpoint being returned. Possible values are:
  /// Creating, Ready, Updating, Deleting, Failed.
  final EndpointStatus? status;

  EndpointFilter({
    this.creationTimeAfter,
    this.creationTimeBefore,
    this.modelArn,
    this.status,
  });
  Map<String, dynamic> toJson() {
    final creationTimeAfter = this.creationTimeAfter;
    final creationTimeBefore = this.creationTimeBefore;
    final modelArn = this.modelArn;
    final status = this.status;
    return {
      if (creationTimeAfter != null)
        'CreationTimeAfter': unixTimestampToJson(creationTimeAfter),
      if (creationTimeBefore != null)
        'CreationTimeBefore': unixTimestampToJson(creationTimeBefore),
      if (modelArn != null) 'ModelArn': modelArn,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Specifies information about the specified endpoint.
class EndpointProperties {
  /// The creation date and time of the endpoint.
  final DateTime? creationTime;

  /// The number of inference units currently used by the model using this
  /// endpoint.
  final int? currentInferenceUnits;

  /// The desired number of inference units to be used by the model using this
  /// endpoint. Each inference unit represents of a throughput of 100 characters
  /// per second.
  final int? desiredInferenceUnits;

  /// The Amazon Resource Number (ARN) of the endpoint.
  final String? endpointArn;

  /// The date and time that the endpoint was last modified.
  final DateTime? lastModifiedTime;

  /// Specifies a reason for failure in cases of <code>Failed</code> status.
  final String? message;

  /// The Amazon Resource Number (ARN) of the model to which the endpoint is
  /// attached.
  final String? modelArn;

  /// Specifies the status of the endpoint. Because the endpoint updates and
  /// creation are asynchronous, so customers will need to wait for the endpoint
  /// to be <code>Ready</code> status before making inference requests.
  final EndpointStatus? status;

  EndpointProperties({
    this.creationTime,
    this.currentInferenceUnits,
    this.desiredInferenceUnits,
    this.endpointArn,
    this.lastModifiedTime,
    this.message,
    this.modelArn,
    this.status,
  });
  factory EndpointProperties.fromJson(Map<String, dynamic> json) {
    return EndpointProperties(
      creationTime: timeStampFromJson(json['CreationTime']),
      currentInferenceUnits: json['CurrentInferenceUnits'] as int?,
      desiredInferenceUnits: json['DesiredInferenceUnits'] as int?,
      endpointArn: json['EndpointArn'] as String?,
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      message: json['Message'] as String?,
      modelArn: json['ModelArn'] as String?,
      status: (json['Status'] as String?)?.toEndpointStatus(),
    );
  }
}

enum EndpointStatus {
  creating,
  deleting,
  failed,
  inService,
  updating,
}

extension on EndpointStatus {
  String toValue() {
    switch (this) {
      case EndpointStatus.creating:
        return 'CREATING';
      case EndpointStatus.deleting:
        return 'DELETING';
      case EndpointStatus.failed:
        return 'FAILED';
      case EndpointStatus.inService:
        return 'IN_SERVICE';
      case EndpointStatus.updating:
        return 'UPDATING';
    }
  }
}

extension on String {
  EndpointStatus toEndpointStatus() {
    switch (this) {
      case 'CREATING':
        return EndpointStatus.creating;
      case 'DELETING':
        return EndpointStatus.deleting;
      case 'FAILED':
        return EndpointStatus.failed;
      case 'IN_SERVICE':
        return EndpointStatus.inService;
      case 'UPDATING':
        return EndpointStatus.updating;
    }
    throw Exception('$this is not known in enum EndpointStatus');
  }
}

/// Provides information for filtering a list of dominant language detection
/// jobs. For more information, see the operation.
class EntitiesDetectionJobFilter {
  /// Filters on the name of the job.
  final String? jobName;

  /// Filters the list of jobs based on job status. Returns only jobs with the
  /// specified status.
  final JobStatus? jobStatus;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted after the specified time. Jobs are
  /// returned in descending order, newest to oldest.
  final DateTime? submitTimeAfter;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted before the specified time. Jobs are
  /// returned in ascending order, oldest to newest.
  final DateTime? submitTimeBefore;

  EntitiesDetectionJobFilter({
    this.jobName,
    this.jobStatus,
    this.submitTimeAfter,
    this.submitTimeBefore,
  });
  Map<String, dynamic> toJson() {
    final jobName = this.jobName;
    final jobStatus = this.jobStatus;
    final submitTimeAfter = this.submitTimeAfter;
    final submitTimeBefore = this.submitTimeBefore;
    return {
      if (jobName != null) 'JobName': jobName,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (submitTimeAfter != null)
        'SubmitTimeAfter': unixTimestampToJson(submitTimeAfter),
      if (submitTimeBefore != null)
        'SubmitTimeBefore': unixTimestampToJson(submitTimeBefore),
    };
  }
}

/// Provides information about an entities detection job.
class EntitiesDetectionJobProperties {
  /// The Amazon Resource Name (ARN) that gives Amazon Comprehend read access to
  /// your input data.
  final String? dataAccessRoleArn;

  /// The time that the entities detection job completed
  final DateTime? endTime;

  /// The Amazon Resource Name (ARN) that identifies the entity recognizer.
  final String? entityRecognizerArn;

  /// The input data configuration that you supplied when you created the entities
  /// detection job.
  final InputDataConfig? inputDataConfig;

  /// The identifier assigned to the entities detection job.
  final String? jobId;

  /// The name that you assigned the entities detection job.
  final String? jobName;

  /// The current status of the entities detection job. If the status is
  /// <code>FAILED</code>, the <code>Message</code> field shows the reason for the
  /// failure.
  final JobStatus? jobStatus;

  /// The language code of the input documents.
  final LanguageCode? languageCode;

  /// A description of the status of a job.
  final String? message;

  /// The output data configuration that you supplied when you created the
  /// entities detection job.
  final OutputDataConfig? outputDataConfig;

  /// The time that the entities detection job was submitted for processing.
  final DateTime? submitTime;

  /// ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses
  /// to encrypt data on the storage volume attached to the ML compute instance(s)
  /// that process the analysis job. The VolumeKmsKeyId can be either of the
  /// following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  final String? volumeKmsKeyId;

  /// Configuration parameters for a private Virtual Private Cloud (VPC)
  /// containing the resources you are using for your entity detection job. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon
  /// VPC</a>.
  final VpcConfig? vpcConfig;

  EntitiesDetectionJobProperties({
    this.dataAccessRoleArn,
    this.endTime,
    this.entityRecognizerArn,
    this.inputDataConfig,
    this.jobId,
    this.jobName,
    this.jobStatus,
    this.languageCode,
    this.message,
    this.outputDataConfig,
    this.submitTime,
    this.volumeKmsKeyId,
    this.vpcConfig,
  });
  factory EntitiesDetectionJobProperties.fromJson(Map<String, dynamic> json) {
    return EntitiesDetectionJobProperties(
      dataAccessRoleArn: json['DataAccessRoleArn'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      entityRecognizerArn: json['EntityRecognizerArn'] as String?,
      inputDataConfig: json['InputDataConfig'] != null
          ? InputDataConfig.fromJson(
              json['InputDataConfig'] as Map<String, dynamic>)
          : null,
      jobId: json['JobId'] as String?,
      jobName: json['JobName'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
      message: json['Message'] as String?,
      outputDataConfig: json['OutputDataConfig'] != null
          ? OutputDataConfig.fromJson(
              json['OutputDataConfig'] as Map<String, dynamic>)
          : null,
      submitTime: timeStampFromJson(json['SubmitTime']),
      volumeKmsKeyId: json['VolumeKmsKeyId'] as String?,
      vpcConfig: json['VpcConfig'] != null
          ? VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Provides information about an entity.
///
///
class Entity {
  /// A character offset in the input text that shows where the entity begins (the
  /// first character is at position 0). The offset returns the position of each
  /// UTF-8 code point in the string. A <i>code point</i> is the abstract
  /// character from a particular graphical representation. For example, a
  /// multi-byte UTF-8 character maps to a single code point.
  final int? beginOffset;

  /// A character offset in the input text that shows where the entity ends. The
  /// offset returns the position of each UTF-8 code point in the string. A
  /// <i>code point</i> is the abstract character from a particular graphical
  /// representation. For example, a multi-byte UTF-8 character maps to a single
  /// code point.
  final int? endOffset;

  /// The level of confidence that Amazon Comprehend has in the accuracy of the
  /// detection.
  final double? score;

  /// The text of the entity.
  final String? text;

  /// The entity's type.
  final EntityType? type;

  Entity({
    this.beginOffset,
    this.endOffset,
    this.score,
    this.text,
    this.type,
  });
  factory Entity.fromJson(Map<String, dynamic> json) {
    return Entity(
      beginOffset: json['BeginOffset'] as int?,
      endOffset: json['EndOffset'] as int?,
      score: json['Score'] as double?,
      text: json['Text'] as String?,
      type: (json['Type'] as String?)?.toEntityType(),
    );
  }
}

/// Describes the annotations associated with a entity recognizer.
class EntityRecognizerAnnotations {
  /// Specifies the Amazon S3 location where the annotations for an entity
  /// recognizer are located. The URI must be in the same region as the API
  /// endpoint that you are calling.
  final String s3Uri;

  EntityRecognizerAnnotations({
    required this.s3Uri,
  });
  factory EntityRecognizerAnnotations.fromJson(Map<String, dynamic> json) {
    return EntityRecognizerAnnotations(
      s3Uri: json['S3Uri'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    return {
      'S3Uri': s3Uri,
    };
  }
}

enum EntityRecognizerDataFormat {
  comprehendCsv,
  augmentedManifest,
}

extension on EntityRecognizerDataFormat {
  String toValue() {
    switch (this) {
      case EntityRecognizerDataFormat.comprehendCsv:
        return 'COMPREHEND_CSV';
      case EntityRecognizerDataFormat.augmentedManifest:
        return 'AUGMENTED_MANIFEST';
    }
  }
}

extension on String {
  EntityRecognizerDataFormat toEntityRecognizerDataFormat() {
    switch (this) {
      case 'COMPREHEND_CSV':
        return EntityRecognizerDataFormat.comprehendCsv;
      case 'AUGMENTED_MANIFEST':
        return EntityRecognizerDataFormat.augmentedManifest;
    }
    throw Exception('$this is not known in enum EntityRecognizerDataFormat');
  }
}

/// Describes the training documents submitted with an entity recognizer.
class EntityRecognizerDocuments {
  /// Specifies the Amazon S3 location where the training documents for an entity
  /// recognizer are located. The URI must be in the same region as the API
  /// endpoint that you are calling.
  final String s3Uri;

  EntityRecognizerDocuments({
    required this.s3Uri,
  });
  factory EntityRecognizerDocuments.fromJson(Map<String, dynamic> json) {
    return EntityRecognizerDocuments(
      s3Uri: json['S3Uri'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    return {
      'S3Uri': s3Uri,
    };
  }
}

/// Describes the entity recognizer submitted with an entity recognizer.
class EntityRecognizerEntityList {
  /// Specifies the Amazon S3 location where the entity list is located. The URI
  /// must be in the same region as the API endpoint that you are calling.
  final String s3Uri;

  EntityRecognizerEntityList({
    required this.s3Uri,
  });
  factory EntityRecognizerEntityList.fromJson(Map<String, dynamic> json) {
    return EntityRecognizerEntityList(
      s3Uri: json['S3Uri'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    return {
      'S3Uri': s3Uri,
    };
  }
}

/// Detailed information about the accuracy of an entity recognizer.
class EntityRecognizerEvaluationMetrics {
  /// A measure of how accurate the recognizer results are for the test data. It
  /// is derived from the <code>Precision</code> and <code>Recall</code> values.
  /// The <code>F1Score</code> is the harmonic average of the two scores. The
  /// highest score is 1, and the worst score is 0.
  final double? f1Score;

  /// A measure of the usefulness of the recognizer results in the test data. High
  /// precision means that the recognizer returned substantially more relevant
  /// results than irrelevant ones.
  final double? precision;

  /// A measure of how complete the recognizer results are for the test data. High
  /// recall means that the recognizer returned most of the relevant results.
  final double? recall;

  EntityRecognizerEvaluationMetrics({
    this.f1Score,
    this.precision,
    this.recall,
  });
  factory EntityRecognizerEvaluationMetrics.fromJson(
      Map<String, dynamic> json) {
    return EntityRecognizerEvaluationMetrics(
      f1Score: json['F1Score'] as double?,
      precision: json['Precision'] as double?,
      recall: json['Recall'] as double?,
    );
  }
}

/// Provides information for filtering a list of entity recognizers. You can
/// only specify one filtering parameter in a request. For more information, see
/// the operation./&gt;
class EntityRecognizerFilter {
  /// The status of an entity recognizer.
  final ModelStatus? status;

  /// Filters the list of entities based on the time that the list was submitted
  /// for processing. Returns only jobs submitted after the specified time. Jobs
  /// are returned in ascending order, oldest to newest.
  final DateTime? submitTimeAfter;

  /// Filters the list of entities based on the time that the list was submitted
  /// for processing. Returns only jobs submitted before the specified time. Jobs
  /// are returned in descending order, newest to oldest.
  final DateTime? submitTimeBefore;

  EntityRecognizerFilter({
    this.status,
    this.submitTimeAfter,
    this.submitTimeBefore,
  });
  Map<String, dynamic> toJson() {
    final status = this.status;
    final submitTimeAfter = this.submitTimeAfter;
    final submitTimeBefore = this.submitTimeBefore;
    return {
      if (status != null) 'Status': status.toValue(),
      if (submitTimeAfter != null)
        'SubmitTimeAfter': unixTimestampToJson(submitTimeAfter),
      if (submitTimeBefore != null)
        'SubmitTimeBefore': unixTimestampToJson(submitTimeBefore),
    };
  }
}

/// Specifies the format and location of the input data.
class EntityRecognizerInputDataConfig {
  /// The entity types in the labeled training data that Amazon Comprehend uses to
  /// train the custom entity recognizer. Any entity types that you don't specify
  /// are ignored.
  ///
  /// A maximum of 25 entity types can be used at one time to train an entity
  /// recognizer. Entity types must not contain the following invalid characters:
  /// \n (line break), \\n (escaped line break), \r (carriage return), \\r
  /// (escaped carriage return), \t (tab), \\t (escaped tab), space, and ,
  /// (comma).
  final List<EntityTypesListItem> entityTypes;

  /// The S3 location of the CSV file that annotates your training documents.
  final EntityRecognizerAnnotations? annotations;

  /// A list of augmented manifest files that provide training data for your
  /// custom model. An augmented manifest file is a labeled dataset that is
  /// produced by Amazon SageMaker Ground Truth.
  ///
  /// This parameter is required if you set <code>DataFormat</code> to
  /// <code>AUGMENTED_MANIFEST</code>.
  final List<AugmentedManifestsListItem>? augmentedManifests;

  /// The format of your training data:
  ///
  /// <ul>
  /// <li>
  /// <code>COMPREHEND_CSV</code>: A CSV file that supplements your training
  /// documents. The CSV file contains information about the custom entities that
  /// your trained model will detect. The required format of the file depends on
  /// whether you are providing annotations or an entity list.
  ///
  /// If you use this value, you must provide your CSV file by using either the
  /// <code>Annotations</code> or <code>EntityList</code> parameters. You must
  /// provide your training documents by using the <code>Documents</code>
  /// parameter.
  /// </li>
  /// <li>
  /// <code>AUGMENTED_MANIFEST</code>: A labeled dataset that is produced by
  /// Amazon SageMaker Ground Truth. This file is in JSON lines format. Each line
  /// is a complete JSON object that contains a training document and its labels.
  /// Each label annotates a named entity in the training document.
  ///
  /// If you use this value, you must provide the <code>AugmentedManifests</code>
  /// parameter in your request.
  /// </li>
  /// </ul>
  /// If you don't specify a value, Amazon Comprehend uses
  /// <code>COMPREHEND_CSV</code> as the default.
  final EntityRecognizerDataFormat? dataFormat;

  /// The S3 location of the folder that contains the training documents for your
  /// custom entity recognizer.
  ///
  /// This parameter is required if you set <code>DataFormat</code> to
  /// <code>COMPREHEND_CSV</code>.
  final EntityRecognizerDocuments? documents;

  /// The S3 location of the CSV file that has the entity list for your custom
  /// entity recognizer.
  final EntityRecognizerEntityList? entityList;

  EntityRecognizerInputDataConfig({
    required this.entityTypes,
    this.annotations,
    this.augmentedManifests,
    this.dataFormat,
    this.documents,
    this.entityList,
  });
  factory EntityRecognizerInputDataConfig.fromJson(Map<String, dynamic> json) {
    return EntityRecognizerInputDataConfig(
      entityTypes: (json['EntityTypes'] as List)
          .whereNotNull()
          .map((e) => EntityTypesListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      annotations: json['Annotations'] != null
          ? EntityRecognizerAnnotations.fromJson(
              json['Annotations'] as Map<String, dynamic>)
          : null,
      augmentedManifests: (json['AugmentedManifests'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AugmentedManifestsListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      dataFormat:
          (json['DataFormat'] as String?)?.toEntityRecognizerDataFormat(),
      documents: json['Documents'] != null
          ? EntityRecognizerDocuments.fromJson(
              json['Documents'] as Map<String, dynamic>)
          : null,
      entityList: json['EntityList'] != null
          ? EntityRecognizerEntityList.fromJson(
              json['EntityList'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final entityTypes = this.entityTypes;
    final annotations = this.annotations;
    final augmentedManifests = this.augmentedManifests;
    final dataFormat = this.dataFormat;
    final documents = this.documents;
    final entityList = this.entityList;
    return {
      'EntityTypes': entityTypes,
      if (annotations != null) 'Annotations': annotations,
      if (augmentedManifests != null) 'AugmentedManifests': augmentedManifests,
      if (dataFormat != null) 'DataFormat': dataFormat.toValue(),
      if (documents != null) 'Documents': documents,
      if (entityList != null) 'EntityList': entityList,
    };
  }
}

/// Detailed information about an entity recognizer.
class EntityRecognizerMetadata {
  /// Entity types from the metadata of an entity recognizer.
  final List<EntityRecognizerMetadataEntityTypesListItem>? entityTypes;

  /// Detailed information about the accuracy of an entity recognizer.
  final EntityRecognizerEvaluationMetrics? evaluationMetrics;

  /// The number of documents in the input data that were used to test the entity
  /// recognizer. Typically this is 10 to 20 percent of the input documents.
  final int? numberOfTestDocuments;

  /// The number of documents in the input data that were used to train the entity
  /// recognizer. Typically this is 80 to 90 percent of the input documents.
  final int? numberOfTrainedDocuments;

  EntityRecognizerMetadata({
    this.entityTypes,
    this.evaluationMetrics,
    this.numberOfTestDocuments,
    this.numberOfTrainedDocuments,
  });
  factory EntityRecognizerMetadata.fromJson(Map<String, dynamic> json) {
    return EntityRecognizerMetadata(
      entityTypes: (json['EntityTypes'] as List?)
          ?.whereNotNull()
          .map((e) => EntityRecognizerMetadataEntityTypesListItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      evaluationMetrics: json['EvaluationMetrics'] != null
          ? EntityRecognizerEvaluationMetrics.fromJson(
              json['EvaluationMetrics'] as Map<String, dynamic>)
          : null,
      numberOfTestDocuments: json['NumberOfTestDocuments'] as int?,
      numberOfTrainedDocuments: json['NumberOfTrainedDocuments'] as int?,
    );
  }
}

/// Individual item from the list of entity types in the metadata of an entity
/// recognizer.
class EntityRecognizerMetadataEntityTypesListItem {
  /// Detailed information about the accuracy of the entity recognizer for a
  /// specific item on the list of entity types.
  final EntityTypesEvaluationMetrics? evaluationMetrics;

  /// Indicates the number of times the given entity type was seen in the training
  /// data.
  final int? numberOfTrainMentions;

  /// Type of entity from the list of entity types in the metadata of an entity
  /// recognizer.
  final String? type;

  EntityRecognizerMetadataEntityTypesListItem({
    this.evaluationMetrics,
    this.numberOfTrainMentions,
    this.type,
  });
  factory EntityRecognizerMetadataEntityTypesListItem.fromJson(
      Map<String, dynamic> json) {
    return EntityRecognizerMetadataEntityTypesListItem(
      evaluationMetrics: json['EvaluationMetrics'] != null
          ? EntityTypesEvaluationMetrics.fromJson(
              json['EvaluationMetrics'] as Map<String, dynamic>)
          : null,
      numberOfTrainMentions: json['NumberOfTrainMentions'] as int?,
      type: json['Type'] as String?,
    );
  }
}

/// Describes information about an entity recognizer.
class EntityRecognizerProperties {
  /// The Amazon Resource Name (ARN) of the AWS Identity and Management (IAM) role
  /// that grants Amazon Comprehend read access to your input data.
  final String? dataAccessRoleArn;

  /// The time that the recognizer creation completed.
  final DateTime? endTime;

  /// The Amazon Resource Name (ARN) that identifies the entity recognizer.
  final String? entityRecognizerArn;

  /// The input data properties of an entity recognizer.
  final EntityRecognizerInputDataConfig? inputDataConfig;

  /// The language of the input documents. All documents must be in the same
  /// language. Only English ("en") is currently supported.
  final LanguageCode? languageCode;

  /// A description of the status of the recognizer.
  final String? message;

  /// Provides information about an entity recognizer.
  final EntityRecognizerMetadata? recognizerMetadata;

  /// Provides the status of the entity recognizer.
  final ModelStatus? status;

  /// The time that the recognizer was submitted for processing.
  final DateTime? submitTime;

  /// The time that training of the entity recognizer was completed.
  final DateTime? trainingEndTime;

  /// The time that training of the entity recognizer started.
  final DateTime? trainingStartTime;

  /// ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses
  /// to encrypt data on the storage volume attached to the ML compute instance(s)
  /// that process the analysis job. The VolumeKmsKeyId can be either of the
  /// following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  final String? volumeKmsKeyId;

  /// Configuration parameters for a private Virtual Private Cloud (VPC)
  /// containing the resources you are using for your custom entity recognizer.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon
  /// VPC</a>.
  final VpcConfig? vpcConfig;

  EntityRecognizerProperties({
    this.dataAccessRoleArn,
    this.endTime,
    this.entityRecognizerArn,
    this.inputDataConfig,
    this.languageCode,
    this.message,
    this.recognizerMetadata,
    this.status,
    this.submitTime,
    this.trainingEndTime,
    this.trainingStartTime,
    this.volumeKmsKeyId,
    this.vpcConfig,
  });
  factory EntityRecognizerProperties.fromJson(Map<String, dynamic> json) {
    return EntityRecognizerProperties(
      dataAccessRoleArn: json['DataAccessRoleArn'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      entityRecognizerArn: json['EntityRecognizerArn'] as String?,
      inputDataConfig: json['InputDataConfig'] != null
          ? EntityRecognizerInputDataConfig.fromJson(
              json['InputDataConfig'] as Map<String, dynamic>)
          : null,
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
      message: json['Message'] as String?,
      recognizerMetadata: json['RecognizerMetadata'] != null
          ? EntityRecognizerMetadata.fromJson(
              json['RecognizerMetadata'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.toModelStatus(),
      submitTime: timeStampFromJson(json['SubmitTime']),
      trainingEndTime: timeStampFromJson(json['TrainingEndTime']),
      trainingStartTime: timeStampFromJson(json['TrainingStartTime']),
      volumeKmsKeyId: json['VolumeKmsKeyId'] as String?,
      vpcConfig: json['VpcConfig'] != null
          ? VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }
}

enum EntityType {
  person,
  location,
  organization,
  commercialItem,
  event,
  date,
  quantity,
  title,
  other,
}

extension on EntityType {
  String toValue() {
    switch (this) {
      case EntityType.person:
        return 'PERSON';
      case EntityType.location:
        return 'LOCATION';
      case EntityType.organization:
        return 'ORGANIZATION';
      case EntityType.commercialItem:
        return 'COMMERCIAL_ITEM';
      case EntityType.event:
        return 'EVENT';
      case EntityType.date:
        return 'DATE';
      case EntityType.quantity:
        return 'QUANTITY';
      case EntityType.title:
        return 'TITLE';
      case EntityType.other:
        return 'OTHER';
    }
  }
}

extension on String {
  EntityType toEntityType() {
    switch (this) {
      case 'PERSON':
        return EntityType.person;
      case 'LOCATION':
        return EntityType.location;
      case 'ORGANIZATION':
        return EntityType.organization;
      case 'COMMERCIAL_ITEM':
        return EntityType.commercialItem;
      case 'EVENT':
        return EntityType.event;
      case 'DATE':
        return EntityType.date;
      case 'QUANTITY':
        return EntityType.quantity;
      case 'TITLE':
        return EntityType.title;
      case 'OTHER':
        return EntityType.other;
    }
    throw Exception('$this is not known in enum EntityType');
  }
}

/// Detailed information about the accuracy of an entity recognizer for a
/// specific entity type.
class EntityTypesEvaluationMetrics {
  /// A measure of how accurate the recognizer results are for a specific entity
  /// type in the test data. It is derived from the <code>Precision</code> and
  /// <code>Recall</code> values. The <code>F1Score</code> is the harmonic average
  /// of the two scores. The highest score is 1, and the worst score is 0.
  final double? f1Score;

  /// A measure of the usefulness of the recognizer results for a specific entity
  /// type in the test data. High precision means that the recognizer returned
  /// substantially more relevant results than irrelevant ones.
  final double? precision;

  /// A measure of how complete the recognizer results are for a specific entity
  /// type in the test data. High recall means that the recognizer returned most
  /// of the relevant results.
  final double? recall;

  EntityTypesEvaluationMetrics({
    this.f1Score,
    this.precision,
    this.recall,
  });
  factory EntityTypesEvaluationMetrics.fromJson(Map<String, dynamic> json) {
    return EntityTypesEvaluationMetrics(
      f1Score: json['F1Score'] as double?,
      precision: json['Precision'] as double?,
      recall: json['Recall'] as double?,
    );
  }
}

/// An entity type within a labeled training dataset that Amazon Comprehend uses
/// to train a custom entity recognizer.
class EntityTypesListItem {
  /// An entity type within a labeled training dataset that Amazon Comprehend uses
  /// to train a custom entity recognizer.
  ///
  /// Entity types must not contain the following invalid characters: \n (line
  /// break), \\n (escaped line break, \r (carriage return), \\r (escaped carriage
  /// return), \t (tab), \\t (escaped tab), space, and , (comma).
  final String type;

  EntityTypesListItem({
    required this.type,
  });
  factory EntityTypesListItem.fromJson(Map<String, dynamic> json) {
    return EntityTypesListItem(
      type: json['Type'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      'Type': type,
    };
  }
}

/// Provides information for filtering a list of event detection jobs.
class EventsDetectionJobFilter {
  /// Filters on the name of the events detection job.
  final String? jobName;

  /// Filters the list of jobs based on job status. Returns only jobs with the
  /// specified status.
  final JobStatus? jobStatus;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted after the specified time. Jobs are
  /// returned in descending order, newest to oldest.
  final DateTime? submitTimeAfter;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted before the specified time. Jobs are
  /// returned in ascending order, oldest to newest.
  final DateTime? submitTimeBefore;

  EventsDetectionJobFilter({
    this.jobName,
    this.jobStatus,
    this.submitTimeAfter,
    this.submitTimeBefore,
  });
  Map<String, dynamic> toJson() {
    final jobName = this.jobName;
    final jobStatus = this.jobStatus;
    final submitTimeAfter = this.submitTimeAfter;
    final submitTimeBefore = this.submitTimeBefore;
    return {
      if (jobName != null) 'JobName': jobName,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (submitTimeAfter != null)
        'SubmitTimeAfter': unixTimestampToJson(submitTimeAfter),
      if (submitTimeBefore != null)
        'SubmitTimeBefore': unixTimestampToJson(submitTimeBefore),
    };
  }
}

/// Provides information about an events detection job.
class EventsDetectionJobProperties {
  /// The Amazon Resource Name (ARN) of the AWS Identify and Access Management
  /// (IAM) role that grants Amazon Comprehend read access to your input data.
  final String? dataAccessRoleArn;

  /// The time that the events detection job completed.
  final DateTime? endTime;

  /// The input data configuration that you supplied when you created the events
  /// detection job.
  final InputDataConfig? inputDataConfig;

  /// The identifier assigned to the events detection job.
  final String? jobId;

  /// The name you assigned the events detection job.
  final String? jobName;

  /// The current status of the events detection job.
  final JobStatus? jobStatus;

  /// The language code of the input documents.
  final LanguageCode? languageCode;

  /// A description of the status of the events detection job.
  final String? message;

  /// The output data configuration that you supplied when you created the events
  /// detection job.
  final OutputDataConfig? outputDataConfig;

  /// The time that the events detection job was submitted for processing.
  final DateTime? submitTime;

  /// The types of events that are detected by the job.
  final List<String>? targetEventTypes;

  EventsDetectionJobProperties({
    this.dataAccessRoleArn,
    this.endTime,
    this.inputDataConfig,
    this.jobId,
    this.jobName,
    this.jobStatus,
    this.languageCode,
    this.message,
    this.outputDataConfig,
    this.submitTime,
    this.targetEventTypes,
  });
  factory EventsDetectionJobProperties.fromJson(Map<String, dynamic> json) {
    return EventsDetectionJobProperties(
      dataAccessRoleArn: json['DataAccessRoleArn'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      inputDataConfig: json['InputDataConfig'] != null
          ? InputDataConfig.fromJson(
              json['InputDataConfig'] as Map<String, dynamic>)
          : null,
      jobId: json['JobId'] as String?,
      jobName: json['JobName'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
      message: json['Message'] as String?,
      outputDataConfig: json['OutputDataConfig'] != null
          ? OutputDataConfig.fromJson(
              json['OutputDataConfig'] as Map<String, dynamic>)
          : null,
      submitTime: timeStampFromJson(json['SubmitTime']),
      targetEventTypes: (json['TargetEventTypes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }
}

/// The input properties for a topic detection job.
class InputDataConfig {
  /// The Amazon S3 URI for the input data. The URI must be in same region as the
  /// API endpoint that you are calling. The URI can point to a single input file
  /// or it can provide the prefix for a collection of data files.
  ///
  /// For example, if you use the URI <code>S3://bucketName/prefix</code>, if the
  /// prefix is a single file, Amazon Comprehend uses that file as input. If more
  /// than one file begins with the prefix, Amazon Comprehend uses all of them as
  /// input.
  final String s3Uri;

  /// Specifies how the text in an input file should be processed:
  ///
  /// <ul>
  /// <li>
  /// <code>ONE_DOC_PER_FILE</code> - Each file is considered a separate document.
  /// Use this option when you are processing large documents, such as newspaper
  /// articles or scientific papers.
  /// </li>
  /// <li>
  /// <code>ONE_DOC_PER_LINE</code> - Each line in a file is considered a separate
  /// document. Use this option when you are processing many short documents, such
  /// as text messages.
  /// </li>
  /// </ul>
  final InputFormat? inputFormat;

  InputDataConfig({
    required this.s3Uri,
    this.inputFormat,
  });
  factory InputDataConfig.fromJson(Map<String, dynamic> json) {
    return InputDataConfig(
      s3Uri: json['S3Uri'] as String,
      inputFormat: (json['InputFormat'] as String?)?.toInputFormat(),
    );
  }

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    final inputFormat = this.inputFormat;
    return {
      'S3Uri': s3Uri,
      if (inputFormat != null) 'InputFormat': inputFormat.toValue(),
    };
  }
}

enum InputFormat {
  oneDocPerFile,
  oneDocPerLine,
}

extension on InputFormat {
  String toValue() {
    switch (this) {
      case InputFormat.oneDocPerFile:
        return 'ONE_DOC_PER_FILE';
      case InputFormat.oneDocPerLine:
        return 'ONE_DOC_PER_LINE';
    }
  }
}

extension on String {
  InputFormat toInputFormat() {
    switch (this) {
      case 'ONE_DOC_PER_FILE':
        return InputFormat.oneDocPerFile;
      case 'ONE_DOC_PER_LINE':
        return InputFormat.oneDocPerLine;
    }
    throw Exception('$this is not known in enum InputFormat');
  }
}

enum JobStatus {
  submitted,
  inProgress,
  completed,
  failed,
  stopRequested,
  stopped,
}

extension on JobStatus {
  String toValue() {
    switch (this) {
      case JobStatus.submitted:
        return 'SUBMITTED';
      case JobStatus.inProgress:
        return 'IN_PROGRESS';
      case JobStatus.completed:
        return 'COMPLETED';
      case JobStatus.failed:
        return 'FAILED';
      case JobStatus.stopRequested:
        return 'STOP_REQUESTED';
      case JobStatus.stopped:
        return 'STOPPED';
    }
  }
}

extension on String {
  JobStatus toJobStatus() {
    switch (this) {
      case 'SUBMITTED':
        return JobStatus.submitted;
      case 'IN_PROGRESS':
        return JobStatus.inProgress;
      case 'COMPLETED':
        return JobStatus.completed;
      case 'FAILED':
        return JobStatus.failed;
      case 'STOP_REQUESTED':
        return JobStatus.stopRequested;
      case 'STOPPED':
        return JobStatus.stopped;
    }
    throw Exception('$this is not known in enum JobStatus');
  }
}

/// Describes a key noun phrase.
class KeyPhrase {
  /// A character offset in the input text that shows where the key phrase begins
  /// (the first character is at position 0). The offset returns the position of
  /// each UTF-8 code point in the string. A <i>code point</i> is the abstract
  /// character from a particular graphical representation. For example, a
  /// multi-byte UTF-8 character maps to a single code point.
  final int? beginOffset;

  /// A character offset in the input text where the key phrase ends. The offset
  /// returns the position of each UTF-8 code point in the string. A <code>code
  /// point</code> is the abstract character from a particular graphical
  /// representation. For example, a multi-byte UTF-8 character maps to a single
  /// code point.
  final int? endOffset;

  /// The level of confidence that Amazon Comprehend has in the accuracy of the
  /// detection.
  final double? score;

  /// The text of a key noun phrase.
  final String? text;

  KeyPhrase({
    this.beginOffset,
    this.endOffset,
    this.score,
    this.text,
  });
  factory KeyPhrase.fromJson(Map<String, dynamic> json) {
    return KeyPhrase(
      beginOffset: json['BeginOffset'] as int?,
      endOffset: json['EndOffset'] as int?,
      score: json['Score'] as double?,
      text: json['Text'] as String?,
    );
  }
}

/// Provides information for filtering a list of dominant language detection
/// jobs. For more information, see the operation.
class KeyPhrasesDetectionJobFilter {
  /// Filters on the name of the job.
  final String? jobName;

  /// Filters the list of jobs based on job status. Returns only jobs with the
  /// specified status.
  final JobStatus? jobStatus;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted after the specified time. Jobs are
  /// returned in descending order, newest to oldest.
  final DateTime? submitTimeAfter;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted before the specified time. Jobs are
  /// returned in ascending order, oldest to newest.
  final DateTime? submitTimeBefore;

  KeyPhrasesDetectionJobFilter({
    this.jobName,
    this.jobStatus,
    this.submitTimeAfter,
    this.submitTimeBefore,
  });
  Map<String, dynamic> toJson() {
    final jobName = this.jobName;
    final jobStatus = this.jobStatus;
    final submitTimeAfter = this.submitTimeAfter;
    final submitTimeBefore = this.submitTimeBefore;
    return {
      if (jobName != null) 'JobName': jobName,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (submitTimeAfter != null)
        'SubmitTimeAfter': unixTimestampToJson(submitTimeAfter),
      if (submitTimeBefore != null)
        'SubmitTimeBefore': unixTimestampToJson(submitTimeBefore),
    };
  }
}

/// Provides information about a key phrases detection job.
class KeyPhrasesDetectionJobProperties {
  /// The Amazon Resource Name (ARN) that gives Amazon Comprehend read access to
  /// your input data.
  final String? dataAccessRoleArn;

  /// The time that the key phrases detection job completed.
  final DateTime? endTime;

  /// The input data configuration that you supplied when you created the key
  /// phrases detection job.
  final InputDataConfig? inputDataConfig;

  /// The identifier assigned to the key phrases detection job.
  final String? jobId;

  /// The name that you assigned the key phrases detection job.
  final String? jobName;

  /// The current status of the key phrases detection job. If the status is
  /// <code>FAILED</code>, the <code>Message</code> field shows the reason for the
  /// failure.
  final JobStatus? jobStatus;

  /// The language code of the input documents.
  final LanguageCode? languageCode;

  /// A description of the status of a job.
  final String? message;

  /// The output data configuration that you supplied when you created the key
  /// phrases detection job.
  final OutputDataConfig? outputDataConfig;

  /// The time that the key phrases detection job was submitted for processing.
  final DateTime? submitTime;

  /// ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses
  /// to encrypt data on the storage volume attached to the ML compute instance(s)
  /// that process the analysis job. The VolumeKmsKeyId can be either of the
  /// following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  final String? volumeKmsKeyId;

  /// Configuration parameters for a private Virtual Private Cloud (VPC)
  /// containing the resources you are using for your key phrases detection job.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon
  /// VPC</a>.
  final VpcConfig? vpcConfig;

  KeyPhrasesDetectionJobProperties({
    this.dataAccessRoleArn,
    this.endTime,
    this.inputDataConfig,
    this.jobId,
    this.jobName,
    this.jobStatus,
    this.languageCode,
    this.message,
    this.outputDataConfig,
    this.submitTime,
    this.volumeKmsKeyId,
    this.vpcConfig,
  });
  factory KeyPhrasesDetectionJobProperties.fromJson(Map<String, dynamic> json) {
    return KeyPhrasesDetectionJobProperties(
      dataAccessRoleArn: json['DataAccessRoleArn'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      inputDataConfig: json['InputDataConfig'] != null
          ? InputDataConfig.fromJson(
              json['InputDataConfig'] as Map<String, dynamic>)
          : null,
      jobId: json['JobId'] as String?,
      jobName: json['JobName'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
      message: json['Message'] as String?,
      outputDataConfig: json['OutputDataConfig'] != null
          ? OutputDataConfig.fromJson(
              json['OutputDataConfig'] as Map<String, dynamic>)
          : null,
      submitTime: timeStampFromJson(json['SubmitTime']),
      volumeKmsKeyId: json['VolumeKmsKeyId'] as String?,
      vpcConfig: json['VpcConfig'] != null
          ? VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }
}

enum LanguageCode {
  en,
  es,
  fr,
  de,
  it,
  pt,
  ar,
  hi,
  ja,
  ko,
  zh,
  zhTw,
}

extension on LanguageCode {
  String toValue() {
    switch (this) {
      case LanguageCode.en:
        return 'en';
      case LanguageCode.es:
        return 'es';
      case LanguageCode.fr:
        return 'fr';
      case LanguageCode.de:
        return 'de';
      case LanguageCode.it:
        return 'it';
      case LanguageCode.pt:
        return 'pt';
      case LanguageCode.ar:
        return 'ar';
      case LanguageCode.hi:
        return 'hi';
      case LanguageCode.ja:
        return 'ja';
      case LanguageCode.ko:
        return 'ko';
      case LanguageCode.zh:
        return 'zh';
      case LanguageCode.zhTw:
        return 'zh-TW';
    }
  }
}

extension on String {
  LanguageCode toLanguageCode() {
    switch (this) {
      case 'en':
        return LanguageCode.en;
      case 'es':
        return LanguageCode.es;
      case 'fr':
        return LanguageCode.fr;
      case 'de':
        return LanguageCode.de;
      case 'it':
        return LanguageCode.it;
      case 'pt':
        return LanguageCode.pt;
      case 'ar':
        return LanguageCode.ar;
      case 'hi':
        return LanguageCode.hi;
      case 'ja':
        return LanguageCode.ja;
      case 'ko':
        return LanguageCode.ko;
      case 'zh':
        return LanguageCode.zh;
      case 'zh-TW':
        return LanguageCode.zhTw;
    }
    throw Exception('$this is not known in enum LanguageCode');
  }
}

class ListDocumentClassificationJobsResponse {
  /// A list containing the properties of each job returned.
  final List<DocumentClassificationJobProperties>?
      documentClassificationJobPropertiesList;

  /// Identifies the next page of results to return.
  final String? nextToken;

  ListDocumentClassificationJobsResponse({
    this.documentClassificationJobPropertiesList,
    this.nextToken,
  });
  factory ListDocumentClassificationJobsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListDocumentClassificationJobsResponse(
      documentClassificationJobPropertiesList:
          (json['DocumentClassificationJobPropertiesList'] as List?)
              ?.whereNotNull()
              .map((e) => DocumentClassificationJobProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class ListDocumentClassifiersResponse {
  /// A list containing the properties of each job returned.
  final List<DocumentClassifierProperties>? documentClassifierPropertiesList;

  /// Identifies the next page of results to return.
  final String? nextToken;

  ListDocumentClassifiersResponse({
    this.documentClassifierPropertiesList,
    this.nextToken,
  });
  factory ListDocumentClassifiersResponse.fromJson(Map<String, dynamic> json) {
    return ListDocumentClassifiersResponse(
      documentClassifierPropertiesList:
          (json['DocumentClassifierPropertiesList'] as List?)
              ?.whereNotNull()
              .map((e) => DocumentClassifierProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class ListDominantLanguageDetectionJobsResponse {
  /// A list containing the properties of each job that is returned.
  final List<DominantLanguageDetectionJobProperties>?
      dominantLanguageDetectionJobPropertiesList;

  /// Identifies the next page of results to return.
  final String? nextToken;

  ListDominantLanguageDetectionJobsResponse({
    this.dominantLanguageDetectionJobPropertiesList,
    this.nextToken,
  });
  factory ListDominantLanguageDetectionJobsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListDominantLanguageDetectionJobsResponse(
      dominantLanguageDetectionJobPropertiesList:
          (json['DominantLanguageDetectionJobPropertiesList'] as List?)
              ?.whereNotNull()
              .map((e) => DominantLanguageDetectionJobProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class ListEndpointsResponse {
  /// Displays a list of endpoint properties being retrieved by the service in
  /// response to the request.
  final List<EndpointProperties>? endpointPropertiesList;

  /// Identifies the next page of results to return.
  final String? nextToken;

  ListEndpointsResponse({
    this.endpointPropertiesList,
    this.nextToken,
  });
  factory ListEndpointsResponse.fromJson(Map<String, dynamic> json) {
    return ListEndpointsResponse(
      endpointPropertiesList: (json['EndpointPropertiesList'] as List?)
          ?.whereNotNull()
          .map((e) => EndpointProperties.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class ListEntitiesDetectionJobsResponse {
  /// A list containing the properties of each job that is returned.
  final List<EntitiesDetectionJobProperties>?
      entitiesDetectionJobPropertiesList;

  /// Identifies the next page of results to return.
  final String? nextToken;

  ListEntitiesDetectionJobsResponse({
    this.entitiesDetectionJobPropertiesList,
    this.nextToken,
  });
  factory ListEntitiesDetectionJobsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListEntitiesDetectionJobsResponse(
      entitiesDetectionJobPropertiesList:
          (json['EntitiesDetectionJobPropertiesList'] as List?)
              ?.whereNotNull()
              .map((e) => EntitiesDetectionJobProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class ListEntityRecognizersResponse {
  /// The list of properties of an entity recognizer.
  final List<EntityRecognizerProperties>? entityRecognizerPropertiesList;

  /// Identifies the next page of results to return.
  final String? nextToken;

  ListEntityRecognizersResponse({
    this.entityRecognizerPropertiesList,
    this.nextToken,
  });
  factory ListEntityRecognizersResponse.fromJson(Map<String, dynamic> json) {
    return ListEntityRecognizersResponse(
      entityRecognizerPropertiesList: (json['EntityRecognizerPropertiesList']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              EntityRecognizerProperties.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class ListEventsDetectionJobsResponse {
  /// A list containing the properties of each job that is returned.
  final List<EventsDetectionJobProperties>? eventsDetectionJobPropertiesList;

  /// Identifies the next page of results to return.
  final String? nextToken;

  ListEventsDetectionJobsResponse({
    this.eventsDetectionJobPropertiesList,
    this.nextToken,
  });
  factory ListEventsDetectionJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListEventsDetectionJobsResponse(
      eventsDetectionJobPropertiesList:
          (json['EventsDetectionJobPropertiesList'] as List?)
              ?.whereNotNull()
              .map((e) => EventsDetectionJobProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class ListKeyPhrasesDetectionJobsResponse {
  /// A list containing the properties of each job that is returned.
  final List<KeyPhrasesDetectionJobProperties>?
      keyPhrasesDetectionJobPropertiesList;

  /// Identifies the next page of results to return.
  final String? nextToken;

  ListKeyPhrasesDetectionJobsResponse({
    this.keyPhrasesDetectionJobPropertiesList,
    this.nextToken,
  });
  factory ListKeyPhrasesDetectionJobsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListKeyPhrasesDetectionJobsResponse(
      keyPhrasesDetectionJobPropertiesList:
          (json['KeyPhrasesDetectionJobPropertiesList'] as List?)
              ?.whereNotNull()
              .map((e) => KeyPhrasesDetectionJobProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class ListPiiEntitiesDetectionJobsResponse {
  /// Identifies the next page of results to return.
  final String? nextToken;

  /// A list containing the properties of each job that is returned.
  final List<PiiEntitiesDetectionJobProperties>?
      piiEntitiesDetectionJobPropertiesList;

  ListPiiEntitiesDetectionJobsResponse({
    this.nextToken,
    this.piiEntitiesDetectionJobPropertiesList,
  });
  factory ListPiiEntitiesDetectionJobsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListPiiEntitiesDetectionJobsResponse(
      nextToken: json['NextToken'] as String?,
      piiEntitiesDetectionJobPropertiesList:
          (json['PiiEntitiesDetectionJobPropertiesList'] as List?)
              ?.whereNotNull()
              .map((e) => PiiEntitiesDetectionJobProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }
}

class ListSentimentDetectionJobsResponse {
  /// Identifies the next page of results to return.
  final String? nextToken;

  /// A list containing the properties of each job that is returned.
  final List<SentimentDetectionJobProperties>?
      sentimentDetectionJobPropertiesList;

  ListSentimentDetectionJobsResponse({
    this.nextToken,
    this.sentimentDetectionJobPropertiesList,
  });
  factory ListSentimentDetectionJobsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListSentimentDetectionJobsResponse(
      nextToken: json['NextToken'] as String?,
      sentimentDetectionJobPropertiesList:
          (json['SentimentDetectionJobPropertiesList'] as List?)
              ?.whereNotNull()
              .map((e) => SentimentDetectionJobProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }
}

class ListTagsForResourceResponse {
  /// The Amazon Resource Name (ARN) of the given Amazon Comprehend resource you
  /// are querying.
  final String? resourceArn;

  /// Tags associated with the Amazon Comprehend resource being queried. A tag is
  /// a key-value pair that adds as a metadata to a resource used by Amazon
  /// Comprehend. For example, a tag with "Sales" as the key might be added to a
  /// resource to indicate its use by the sales department.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.resourceArn,
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      resourceArn: json['ResourceArn'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListTopicsDetectionJobsResponse {
  /// Identifies the next page of results to return.
  final String? nextToken;

  /// A list containing the properties of each job that is returned.
  final List<TopicsDetectionJobProperties>? topicsDetectionJobPropertiesList;

  ListTopicsDetectionJobsResponse({
    this.nextToken,
    this.topicsDetectionJobPropertiesList,
  });
  factory ListTopicsDetectionJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListTopicsDetectionJobsResponse(
      nextToken: json['NextToken'] as String?,
      topicsDetectionJobPropertiesList:
          (json['TopicsDetectionJobPropertiesList'] as List?)
              ?.whereNotNull()
              .map((e) => TopicsDetectionJobProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }
}

enum ModelStatus {
  submitted,
  training,
  deleting,
  stopRequested,
  stopped,
  inError,
  trained,
}

extension on ModelStatus {
  String toValue() {
    switch (this) {
      case ModelStatus.submitted:
        return 'SUBMITTED';
      case ModelStatus.training:
        return 'TRAINING';
      case ModelStatus.deleting:
        return 'DELETING';
      case ModelStatus.stopRequested:
        return 'STOP_REQUESTED';
      case ModelStatus.stopped:
        return 'STOPPED';
      case ModelStatus.inError:
        return 'IN_ERROR';
      case ModelStatus.trained:
        return 'TRAINED';
    }
  }
}

extension on String {
  ModelStatus toModelStatus() {
    switch (this) {
      case 'SUBMITTED':
        return ModelStatus.submitted;
      case 'TRAINING':
        return ModelStatus.training;
      case 'DELETING':
        return ModelStatus.deleting;
      case 'STOP_REQUESTED':
        return ModelStatus.stopRequested;
      case 'STOPPED':
        return ModelStatus.stopped;
      case 'IN_ERROR':
        return ModelStatus.inError;
      case 'TRAINED':
        return ModelStatus.trained;
    }
    throw Exception('$this is not known in enum ModelStatus');
  }
}

/// Provides configuration parameters for the output of topic detection jobs.
/// <p/>
class OutputDataConfig {
  /// When you use the <code>OutputDataConfig</code> object with asynchronous
  /// operations, you specify the Amazon S3 location where you want to write the
  /// output data. The URI must be in the same region as the API endpoint that you
  /// are calling. The location is used as the prefix for the actual location of
  /// the output file.
  ///
  /// When the topic detection job is finished, the service creates an output file
  /// in a directory specific to the job. The <code>S3Uri</code> field contains
  /// the location of the output file, called <code>output.tar.gz</code>. It is a
  /// compressed archive that contains the ouput of the operation.
  final String s3Uri;

  /// ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses
  /// to encrypt the output results from an analysis job. The KmsKeyId can be one
  /// of the following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// KMS Key Alias: <code>"alias/ExampleAlias"</code>
  /// </li>
  /// <li>
  /// ARN of a KMS Key Alias:
  /// <code>"arn:aws:kms:us-west-2:111122223333:alias/ExampleAlias"</code>
  /// </li>
  /// </ul>
  final String? kmsKeyId;

  OutputDataConfig({
    required this.s3Uri,
    this.kmsKeyId,
  });
  factory OutputDataConfig.fromJson(Map<String, dynamic> json) {
    return OutputDataConfig(
      s3Uri: json['S3Uri'] as String,
      kmsKeyId: json['KmsKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    final kmsKeyId = this.kmsKeyId;
    return {
      'S3Uri': s3Uri,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
    };
  }
}

/// Identifies the part of speech represented by the token and gives the
/// confidence that Amazon Comprehend has that the part of speech was correctly
/// identified. For more information about the parts of speech that Amazon
/// Comprehend can identify, see <a>how-syntax</a>.
class PartOfSpeechTag {
  /// The confidence that Amazon Comprehend has that the part of speech was
  /// correctly identified.
  final double? score;

  /// Identifies the part of speech that the token represents.
  final PartOfSpeechTagType? tag;

  PartOfSpeechTag({
    this.score,
    this.tag,
  });
  factory PartOfSpeechTag.fromJson(Map<String, dynamic> json) {
    return PartOfSpeechTag(
      score: json['Score'] as double?,
      tag: (json['Tag'] as String?)?.toPartOfSpeechTagType(),
    );
  }
}

enum PartOfSpeechTagType {
  adj,
  adp,
  adv,
  aux,
  conj,
  cconj,
  det,
  intj,
  noun,
  num,
  o,
  part,
  pron,
  propn,
  punct,
  sconj,
  sym,
  verb,
}

extension on PartOfSpeechTagType {
  String toValue() {
    switch (this) {
      case PartOfSpeechTagType.adj:
        return 'ADJ';
      case PartOfSpeechTagType.adp:
        return 'ADP';
      case PartOfSpeechTagType.adv:
        return 'ADV';
      case PartOfSpeechTagType.aux:
        return 'AUX';
      case PartOfSpeechTagType.conj:
        return 'CONJ';
      case PartOfSpeechTagType.cconj:
        return 'CCONJ';
      case PartOfSpeechTagType.det:
        return 'DET';
      case PartOfSpeechTagType.intj:
        return 'INTJ';
      case PartOfSpeechTagType.noun:
        return 'NOUN';
      case PartOfSpeechTagType.num:
        return 'NUM';
      case PartOfSpeechTagType.o:
        return 'O';
      case PartOfSpeechTagType.part:
        return 'PART';
      case PartOfSpeechTagType.pron:
        return 'PRON';
      case PartOfSpeechTagType.propn:
        return 'PROPN';
      case PartOfSpeechTagType.punct:
        return 'PUNCT';
      case PartOfSpeechTagType.sconj:
        return 'SCONJ';
      case PartOfSpeechTagType.sym:
        return 'SYM';
      case PartOfSpeechTagType.verb:
        return 'VERB';
    }
  }
}

extension on String {
  PartOfSpeechTagType toPartOfSpeechTagType() {
    switch (this) {
      case 'ADJ':
        return PartOfSpeechTagType.adj;
      case 'ADP':
        return PartOfSpeechTagType.adp;
      case 'ADV':
        return PartOfSpeechTagType.adv;
      case 'AUX':
        return PartOfSpeechTagType.aux;
      case 'CONJ':
        return PartOfSpeechTagType.conj;
      case 'CCONJ':
        return PartOfSpeechTagType.cconj;
      case 'DET':
        return PartOfSpeechTagType.det;
      case 'INTJ':
        return PartOfSpeechTagType.intj;
      case 'NOUN':
        return PartOfSpeechTagType.noun;
      case 'NUM':
        return PartOfSpeechTagType.num;
      case 'O':
        return PartOfSpeechTagType.o;
      case 'PART':
        return PartOfSpeechTagType.part;
      case 'PRON':
        return PartOfSpeechTagType.pron;
      case 'PROPN':
        return PartOfSpeechTagType.propn;
      case 'PUNCT':
        return PartOfSpeechTagType.punct;
      case 'SCONJ':
        return PartOfSpeechTagType.sconj;
      case 'SYM':
        return PartOfSpeechTagType.sym;
      case 'VERB':
        return PartOfSpeechTagType.verb;
    }
    throw Exception('$this is not known in enum PartOfSpeechTagType');
  }
}

/// Provides information for filtering a list of PII entity detection jobs.
class PiiEntitiesDetectionJobFilter {
  /// Filters on the name of the job.
  final String? jobName;

  /// Filters the list of jobs based on job status. Returns only jobs with the
  /// specified status.
  final JobStatus? jobStatus;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted after the specified time. Jobs are
  /// returned in descending order, newest to oldest.
  final DateTime? submitTimeAfter;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted before the specified time. Jobs are
  /// returned in ascending order, oldest to newest.
  final DateTime? submitTimeBefore;

  PiiEntitiesDetectionJobFilter({
    this.jobName,
    this.jobStatus,
    this.submitTimeAfter,
    this.submitTimeBefore,
  });
  Map<String, dynamic> toJson() {
    final jobName = this.jobName;
    final jobStatus = this.jobStatus;
    final submitTimeAfter = this.submitTimeAfter;
    final submitTimeBefore = this.submitTimeBefore;
    return {
      if (jobName != null) 'JobName': jobName,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (submitTimeAfter != null)
        'SubmitTimeAfter': unixTimestampToJson(submitTimeAfter),
      if (submitTimeBefore != null)
        'SubmitTimeBefore': unixTimestampToJson(submitTimeBefore),
    };
  }
}

/// Provides information about a PII entities detection job.
class PiiEntitiesDetectionJobProperties {
  /// The Amazon Resource Name (ARN) that gives Amazon Comprehend read access to
  /// your input data.
  final String? dataAccessRoleArn;

  /// The time that the PII entities detection job completed.
  final DateTime? endTime;

  /// The input properties for a PII entities detection job.
  final InputDataConfig? inputDataConfig;

  /// The identifier assigned to the PII entities detection job.
  final String? jobId;

  /// The name that you assigned the PII entities detection job.
  final String? jobName;

  /// The current status of the PII entities detection job. If the status is
  /// <code>FAILED</code>, the <code>Message</code> field shows the reason for the
  /// failure.
  final JobStatus? jobStatus;

  /// The language code of the input documents
  final LanguageCode? languageCode;

  /// A description of the status of a job.
  final String? message;

  /// Specifies whether the output provides the locations (offsets) of PII
  /// entities or a file in which PII entities are redacted.
  final PiiEntitiesDetectionMode? mode;

  /// The output data configuration that you supplied when you created the PII
  /// entities detection job.
  final PiiOutputDataConfig? outputDataConfig;

  /// Provides configuration parameters for PII entity redaction.
  ///
  /// This parameter is required if you set the <code>Mode</code> parameter to
  /// <code>ONLY_REDACTION</code>. In that case, you must provide a
  /// <code>RedactionConfig</code> definition that includes the
  /// <code>PiiEntityTypes</code> parameter.
  final RedactionConfig? redactionConfig;

  /// The time that the PII entities detection job was submitted for processing.
  final DateTime? submitTime;

  PiiEntitiesDetectionJobProperties({
    this.dataAccessRoleArn,
    this.endTime,
    this.inputDataConfig,
    this.jobId,
    this.jobName,
    this.jobStatus,
    this.languageCode,
    this.message,
    this.mode,
    this.outputDataConfig,
    this.redactionConfig,
    this.submitTime,
  });
  factory PiiEntitiesDetectionJobProperties.fromJson(
      Map<String, dynamic> json) {
    return PiiEntitiesDetectionJobProperties(
      dataAccessRoleArn: json['DataAccessRoleArn'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      inputDataConfig: json['InputDataConfig'] != null
          ? InputDataConfig.fromJson(
              json['InputDataConfig'] as Map<String, dynamic>)
          : null,
      jobId: json['JobId'] as String?,
      jobName: json['JobName'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
      message: json['Message'] as String?,
      mode: (json['Mode'] as String?)?.toPiiEntitiesDetectionMode(),
      outputDataConfig: json['OutputDataConfig'] != null
          ? PiiOutputDataConfig.fromJson(
              json['OutputDataConfig'] as Map<String, dynamic>)
          : null,
      redactionConfig: json['RedactionConfig'] != null
          ? RedactionConfig.fromJson(
              json['RedactionConfig'] as Map<String, dynamic>)
          : null,
      submitTime: timeStampFromJson(json['SubmitTime']),
    );
  }
}

enum PiiEntitiesDetectionMaskMode {
  mask,
  replaceWithPiiEntityType,
}

extension on PiiEntitiesDetectionMaskMode {
  String toValue() {
    switch (this) {
      case PiiEntitiesDetectionMaskMode.mask:
        return 'MASK';
      case PiiEntitiesDetectionMaskMode.replaceWithPiiEntityType:
        return 'REPLACE_WITH_PII_ENTITY_TYPE';
    }
  }
}

extension on String {
  PiiEntitiesDetectionMaskMode toPiiEntitiesDetectionMaskMode() {
    switch (this) {
      case 'MASK':
        return PiiEntitiesDetectionMaskMode.mask;
      case 'REPLACE_WITH_PII_ENTITY_TYPE':
        return PiiEntitiesDetectionMaskMode.replaceWithPiiEntityType;
    }
    throw Exception('$this is not known in enum PiiEntitiesDetectionMaskMode');
  }
}

enum PiiEntitiesDetectionMode {
  onlyRedaction,
  onlyOffsets,
}

extension on PiiEntitiesDetectionMode {
  String toValue() {
    switch (this) {
      case PiiEntitiesDetectionMode.onlyRedaction:
        return 'ONLY_REDACTION';
      case PiiEntitiesDetectionMode.onlyOffsets:
        return 'ONLY_OFFSETS';
    }
  }
}

extension on String {
  PiiEntitiesDetectionMode toPiiEntitiesDetectionMode() {
    switch (this) {
      case 'ONLY_REDACTION':
        return PiiEntitiesDetectionMode.onlyRedaction;
      case 'ONLY_OFFSETS':
        return PiiEntitiesDetectionMode.onlyOffsets;
    }
    throw Exception('$this is not known in enum PiiEntitiesDetectionMode');
  }
}

/// Provides information about a PII entity.
class PiiEntity {
  /// A character offset in the input text that shows where the PII entity begins
  /// (the first character is at position 0). The offset returns the position of
  /// each UTF-8 code point in the string. A <i>code point</i> is the abstract
  /// character from a particular graphical representation. For example, a
  /// multi-byte UTF-8 character maps to a single code point.
  final int? beginOffset;

  /// A character offset in the input text that shows where the PII entity ends.
  /// The offset returns the position of each UTF-8 code point in the string. A
  /// <i>code point</i> is the abstract character from a particular graphical
  /// representation. For example, a multi-byte UTF-8 character maps to a single
  /// code point.
  final int? endOffset;

  /// The level of confidence that Amazon Comprehend has in the accuracy of the
  /// detection.
  final double? score;

  /// The entity's type.
  final PiiEntityType? type;

  PiiEntity({
    this.beginOffset,
    this.endOffset,
    this.score,
    this.type,
  });
  factory PiiEntity.fromJson(Map<String, dynamic> json) {
    return PiiEntity(
      beginOffset: json['BeginOffset'] as int?,
      endOffset: json['EndOffset'] as int?,
      score: json['Score'] as double?,
      type: (json['Type'] as String?)?.toPiiEntityType(),
    );
  }
}

enum PiiEntityType {
  bankAccountNumber,
  bankRouting,
  creditDebitNumber,
  creditDebitCvv,
  creditDebitExpiry,
  pin,
  email,
  address,
  name,
  phone,
  ssn,
  dateTime,
  passportNumber,
  driverId,
  url,
  age,
  username,
  password,
  awsAccessKey,
  awsSecretKey,
  ipAddress,
  macAddress,
  all,
}

extension on PiiEntityType {
  String toValue() {
    switch (this) {
      case PiiEntityType.bankAccountNumber:
        return 'BANK_ACCOUNT_NUMBER';
      case PiiEntityType.bankRouting:
        return 'BANK_ROUTING';
      case PiiEntityType.creditDebitNumber:
        return 'CREDIT_DEBIT_NUMBER';
      case PiiEntityType.creditDebitCvv:
        return 'CREDIT_DEBIT_CVV';
      case PiiEntityType.creditDebitExpiry:
        return 'CREDIT_DEBIT_EXPIRY';
      case PiiEntityType.pin:
        return 'PIN';
      case PiiEntityType.email:
        return 'EMAIL';
      case PiiEntityType.address:
        return 'ADDRESS';
      case PiiEntityType.name:
        return 'NAME';
      case PiiEntityType.phone:
        return 'PHONE';
      case PiiEntityType.ssn:
        return 'SSN';
      case PiiEntityType.dateTime:
        return 'DATE_TIME';
      case PiiEntityType.passportNumber:
        return 'PASSPORT_NUMBER';
      case PiiEntityType.driverId:
        return 'DRIVER_ID';
      case PiiEntityType.url:
        return 'URL';
      case PiiEntityType.age:
        return 'AGE';
      case PiiEntityType.username:
        return 'USERNAME';
      case PiiEntityType.password:
        return 'PASSWORD';
      case PiiEntityType.awsAccessKey:
        return 'AWS_ACCESS_KEY';
      case PiiEntityType.awsSecretKey:
        return 'AWS_SECRET_KEY';
      case PiiEntityType.ipAddress:
        return 'IP_ADDRESS';
      case PiiEntityType.macAddress:
        return 'MAC_ADDRESS';
      case PiiEntityType.all:
        return 'ALL';
    }
  }
}

extension on String {
  PiiEntityType toPiiEntityType() {
    switch (this) {
      case 'BANK_ACCOUNT_NUMBER':
        return PiiEntityType.bankAccountNumber;
      case 'BANK_ROUTING':
        return PiiEntityType.bankRouting;
      case 'CREDIT_DEBIT_NUMBER':
        return PiiEntityType.creditDebitNumber;
      case 'CREDIT_DEBIT_CVV':
        return PiiEntityType.creditDebitCvv;
      case 'CREDIT_DEBIT_EXPIRY':
        return PiiEntityType.creditDebitExpiry;
      case 'PIN':
        return PiiEntityType.pin;
      case 'EMAIL':
        return PiiEntityType.email;
      case 'ADDRESS':
        return PiiEntityType.address;
      case 'NAME':
        return PiiEntityType.name;
      case 'PHONE':
        return PiiEntityType.phone;
      case 'SSN':
        return PiiEntityType.ssn;
      case 'DATE_TIME':
        return PiiEntityType.dateTime;
      case 'PASSPORT_NUMBER':
        return PiiEntityType.passportNumber;
      case 'DRIVER_ID':
        return PiiEntityType.driverId;
      case 'URL':
        return PiiEntityType.url;
      case 'AGE':
        return PiiEntityType.age;
      case 'USERNAME':
        return PiiEntityType.username;
      case 'PASSWORD':
        return PiiEntityType.password;
      case 'AWS_ACCESS_KEY':
        return PiiEntityType.awsAccessKey;
      case 'AWS_SECRET_KEY':
        return PiiEntityType.awsSecretKey;
      case 'IP_ADDRESS':
        return PiiEntityType.ipAddress;
      case 'MAC_ADDRESS':
        return PiiEntityType.macAddress;
      case 'ALL':
        return PiiEntityType.all;
    }
    throw Exception('$this is not known in enum PiiEntityType');
  }
}

/// Provides configuration parameters for the output of PII entity detection
/// jobs.
class PiiOutputDataConfig {
  /// When you use the <code>PiiOutputDataConfig</code> object with asynchronous
  /// operations, you specify the Amazon S3 location where you want to write the
  /// output data.
  final String s3Uri;

  /// ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses
  /// to encrypt the output results from an analysis job.
  final String? kmsKeyId;

  PiiOutputDataConfig({
    required this.s3Uri,
    this.kmsKeyId,
  });
  factory PiiOutputDataConfig.fromJson(Map<String, dynamic> json) {
    return PiiOutputDataConfig(
      s3Uri: json['S3Uri'] as String,
      kmsKeyId: json['KmsKeyId'] as String?,
    );
  }
}

/// Provides configuration parameters for PII entity redaction.
class RedactionConfig {
  /// A character that replaces each character in the redacted PII entity.
  final String? maskCharacter;

  /// Specifies whether the PII entity is redacted with the mask character or the
  /// entity type.
  final PiiEntitiesDetectionMaskMode? maskMode;

  /// An array of the types of PII entities that Amazon Comprehend detects in the
  /// input text for your request.
  final List<PiiEntityType>? piiEntityTypes;

  RedactionConfig({
    this.maskCharacter,
    this.maskMode,
    this.piiEntityTypes,
  });
  factory RedactionConfig.fromJson(Map<String, dynamic> json) {
    return RedactionConfig(
      maskCharacter: json['MaskCharacter'] as String?,
      maskMode: (json['MaskMode'] as String?)?.toPiiEntitiesDetectionMaskMode(),
      piiEntityTypes: (json['PiiEntityTypes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toPiiEntityType())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final maskCharacter = this.maskCharacter;
    final maskMode = this.maskMode;
    final piiEntityTypes = this.piiEntityTypes;
    return {
      if (maskCharacter != null) 'MaskCharacter': maskCharacter,
      if (maskMode != null) 'MaskMode': maskMode.toValue(),
      if (piiEntityTypes != null)
        'PiiEntityTypes': piiEntityTypes.map((e) => e.toValue()).toList(),
    };
  }
}

/// Provides information for filtering a list of dominant language detection
/// jobs. For more information, see the operation.
class SentimentDetectionJobFilter {
  /// Filters on the name of the job.
  final String? jobName;

  /// Filters the list of jobs based on job status. Returns only jobs with the
  /// specified status.
  final JobStatus? jobStatus;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted after the specified time. Jobs are
  /// returned in descending order, newest to oldest.
  final DateTime? submitTimeAfter;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted before the specified time. Jobs are
  /// returned in ascending order, oldest to newest.
  final DateTime? submitTimeBefore;

  SentimentDetectionJobFilter({
    this.jobName,
    this.jobStatus,
    this.submitTimeAfter,
    this.submitTimeBefore,
  });
  Map<String, dynamic> toJson() {
    final jobName = this.jobName;
    final jobStatus = this.jobStatus;
    final submitTimeAfter = this.submitTimeAfter;
    final submitTimeBefore = this.submitTimeBefore;
    return {
      if (jobName != null) 'JobName': jobName,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (submitTimeAfter != null)
        'SubmitTimeAfter': unixTimestampToJson(submitTimeAfter),
      if (submitTimeBefore != null)
        'SubmitTimeBefore': unixTimestampToJson(submitTimeBefore),
    };
  }
}

/// Provides information about a sentiment detection job.
class SentimentDetectionJobProperties {
  /// The Amazon Resource Name (ARN) that gives Amazon Comprehend read access to
  /// your input data.
  final String? dataAccessRoleArn;

  /// The time that the sentiment detection job ended.
  final DateTime? endTime;

  /// The input data configuration that you supplied when you created the
  /// sentiment detection job.
  final InputDataConfig? inputDataConfig;

  /// The identifier assigned to the sentiment detection job.
  final String? jobId;

  /// The name that you assigned to the sentiment detection job
  final String? jobName;

  /// The current status of the sentiment detection job. If the status is
  /// <code>FAILED</code>, the <code>Messages</code> field shows the reason for
  /// the failure.
  final JobStatus? jobStatus;

  /// The language code of the input documents.
  final LanguageCode? languageCode;

  /// A description of the status of a job.
  final String? message;

  /// The output data configuration that you supplied when you created the
  /// sentiment detection job.
  final OutputDataConfig? outputDataConfig;

  /// The time that the sentiment detection job was submitted for processing.
  final DateTime? submitTime;

  /// ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses
  /// to encrypt data on the storage volume attached to the ML compute instance(s)
  /// that process the analysis job. The VolumeKmsKeyId can be either of the
  /// following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  final String? volumeKmsKeyId;

  /// Configuration parameters for a private Virtual Private Cloud (VPC)
  /// containing the resources you are using for your sentiment detection job. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon
  /// VPC</a>.
  final VpcConfig? vpcConfig;

  SentimentDetectionJobProperties({
    this.dataAccessRoleArn,
    this.endTime,
    this.inputDataConfig,
    this.jobId,
    this.jobName,
    this.jobStatus,
    this.languageCode,
    this.message,
    this.outputDataConfig,
    this.submitTime,
    this.volumeKmsKeyId,
    this.vpcConfig,
  });
  factory SentimentDetectionJobProperties.fromJson(Map<String, dynamic> json) {
    return SentimentDetectionJobProperties(
      dataAccessRoleArn: json['DataAccessRoleArn'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      inputDataConfig: json['InputDataConfig'] != null
          ? InputDataConfig.fromJson(
              json['InputDataConfig'] as Map<String, dynamic>)
          : null,
      jobId: json['JobId'] as String?,
      jobName: json['JobName'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
      message: json['Message'] as String?,
      outputDataConfig: json['OutputDataConfig'] != null
          ? OutputDataConfig.fromJson(
              json['OutputDataConfig'] as Map<String, dynamic>)
          : null,
      submitTime: timeStampFromJson(json['SubmitTime']),
      volumeKmsKeyId: json['VolumeKmsKeyId'] as String?,
      vpcConfig: json['VpcConfig'] != null
          ? VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Describes the level of confidence that Amazon Comprehend has in the accuracy
/// of its detection of sentiments.
class SentimentScore {
  /// The level of confidence that Amazon Comprehend has in the accuracy of its
  /// detection of the <code>MIXED</code> sentiment.
  final double? mixed;

  /// The level of confidence that Amazon Comprehend has in the accuracy of its
  /// detection of the <code>NEGATIVE</code> sentiment.
  final double? negative;

  /// The level of confidence that Amazon Comprehend has in the accuracy of its
  /// detection of the <code>NEUTRAL</code> sentiment.
  final double? neutral;

  /// The level of confidence that Amazon Comprehend has in the accuracy of its
  /// detection of the <code>POSITIVE</code> sentiment.
  final double? positive;

  SentimentScore({
    this.mixed,
    this.negative,
    this.neutral,
    this.positive,
  });
  factory SentimentScore.fromJson(Map<String, dynamic> json) {
    return SentimentScore(
      mixed: json['Mixed'] as double?,
      negative: json['Negative'] as double?,
      neutral: json['Neutral'] as double?,
      positive: json['Positive'] as double?,
    );
  }
}

enum SentimentType {
  positive,
  negative,
  neutral,
  mixed,
}

extension on SentimentType {
  String toValue() {
    switch (this) {
      case SentimentType.positive:
        return 'POSITIVE';
      case SentimentType.negative:
        return 'NEGATIVE';
      case SentimentType.neutral:
        return 'NEUTRAL';
      case SentimentType.mixed:
        return 'MIXED';
    }
  }
}

extension on String {
  SentimentType toSentimentType() {
    switch (this) {
      case 'POSITIVE':
        return SentimentType.positive;
      case 'NEGATIVE':
        return SentimentType.negative;
      case 'NEUTRAL':
        return SentimentType.neutral;
      case 'MIXED':
        return SentimentType.mixed;
    }
    throw Exception('$this is not known in enum SentimentType');
  }
}

class StartDocumentClassificationJobResponse {
  /// The identifier generated for the job. To get the status of the job, use this
  /// identifier with the operation.
  final String? jobId;

  /// The status of the job:
  ///
  /// <ul>
  /// <li>
  /// SUBMITTED - The job has been received and queued for processing.
  /// </li>
  /// <li>
  /// IN_PROGRESS - Amazon Comprehend is processing the job.
  /// </li>
  /// <li>
  /// COMPLETED - The job was successfully completed and the output is available.
  /// </li>
  /// <li>
  /// FAILED - The job did not complete. For details, use the operation.
  /// </li>
  /// <li>
  /// STOP_REQUESTED - Amazon Comprehend has received a stop request for the job
  /// and is processing the request.
  /// </li>
  /// <li>
  /// STOPPED - The job was successfully stopped without completing.
  /// </li>
  /// </ul>
  final JobStatus? jobStatus;

  StartDocumentClassificationJobResponse({
    this.jobId,
    this.jobStatus,
  });
  factory StartDocumentClassificationJobResponse.fromJson(
      Map<String, dynamic> json) {
    return StartDocumentClassificationJobResponse(
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
    );
  }
}

class StartDominantLanguageDetectionJobResponse {
  /// The identifier generated for the job. To get the status of a job, use this
  /// identifier with the operation.
  final String? jobId;

  /// The status of the job.
  ///
  /// <ul>
  /// <li>
  /// SUBMITTED - The job has been received and is queued for processing.
  /// </li>
  /// <li>
  /// IN_PROGRESS - Amazon Comprehend is processing the job.
  /// </li>
  /// <li>
  /// COMPLETED - The job was successfully completed and the output is available.
  /// </li>
  /// <li>
  /// FAILED - The job did not complete. To get details, use the operation.
  /// </li>
  /// </ul>
  final JobStatus? jobStatus;

  StartDominantLanguageDetectionJobResponse({
    this.jobId,
    this.jobStatus,
  });
  factory StartDominantLanguageDetectionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return StartDominantLanguageDetectionJobResponse(
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
    );
  }
}

class StartEntitiesDetectionJobResponse {
  /// The identifier generated for the job. To get the status of job, use this
  /// identifier with the operation.
  final String? jobId;

  /// The status of the job.
  ///
  /// <ul>
  /// <li>
  /// SUBMITTED - The job has been received and is queued for processing.
  /// </li>
  /// <li>
  /// IN_PROGRESS - Amazon Comprehend is processing the job.
  /// </li>
  /// <li>
  /// COMPLETED - The job was successfully completed and the output is available.
  /// </li>
  /// <li>
  /// FAILED - The job did not complete. To get details, use the operation.
  /// </li>
  /// <li>
  /// STOP_REQUESTED - Amazon Comprehend has received a stop request for the job
  /// and is processing the request.
  /// </li>
  /// <li>
  /// STOPPED - The job was successfully stopped without completing.
  /// </li>
  /// </ul>
  final JobStatus? jobStatus;

  StartEntitiesDetectionJobResponse({
    this.jobId,
    this.jobStatus,
  });
  factory StartEntitiesDetectionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return StartEntitiesDetectionJobResponse(
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
    );
  }
}

class StartEventsDetectionJobResponse {
  /// An unique identifier for the request. If you don't set the client request
  /// token, Amazon Comprehend generates one.
  final String? jobId;

  /// The status of the events detection job.
  final JobStatus? jobStatus;

  StartEventsDetectionJobResponse({
    this.jobId,
    this.jobStatus,
  });
  factory StartEventsDetectionJobResponse.fromJson(Map<String, dynamic> json) {
    return StartEventsDetectionJobResponse(
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
    );
  }
}

class StartKeyPhrasesDetectionJobResponse {
  /// The identifier generated for the job. To get the status of a job, use this
  /// identifier with the operation.
  final String? jobId;

  /// The status of the job.
  ///
  /// <ul>
  /// <li>
  /// SUBMITTED - The job has been received and is queued for processing.
  /// </li>
  /// <li>
  /// IN_PROGRESS - Amazon Comprehend is processing the job.
  /// </li>
  /// <li>
  /// COMPLETED - The job was successfully completed and the output is available.
  /// </li>
  /// <li>
  /// FAILED - The job did not complete. To get details, use the operation.
  /// </li>
  /// </ul>
  final JobStatus? jobStatus;

  StartKeyPhrasesDetectionJobResponse({
    this.jobId,
    this.jobStatus,
  });
  factory StartKeyPhrasesDetectionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return StartKeyPhrasesDetectionJobResponse(
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
    );
  }
}

class StartPiiEntitiesDetectionJobResponse {
  /// The identifier generated for the job.
  final String? jobId;

  /// The status of the job.
  final JobStatus? jobStatus;

  StartPiiEntitiesDetectionJobResponse({
    this.jobId,
    this.jobStatus,
  });
  factory StartPiiEntitiesDetectionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return StartPiiEntitiesDetectionJobResponse(
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
    );
  }
}

class StartSentimentDetectionJobResponse {
  /// The identifier generated for the job. To get the status of a job, use this
  /// identifier with the operation.
  final String? jobId;

  /// The status of the job.
  ///
  /// <ul>
  /// <li>
  /// SUBMITTED - The job has been received and is queued for processing.
  /// </li>
  /// <li>
  /// IN_PROGRESS - Amazon Comprehend is processing the job.
  /// </li>
  /// <li>
  /// COMPLETED - The job was successfully completed and the output is available.
  /// </li>
  /// <li>
  /// FAILED - The job did not complete. To get details, use the operation.
  /// </li>
  /// </ul>
  final JobStatus? jobStatus;

  StartSentimentDetectionJobResponse({
    this.jobId,
    this.jobStatus,
  });
  factory StartSentimentDetectionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return StartSentimentDetectionJobResponse(
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
    );
  }
}

class StartTopicsDetectionJobResponse {
  /// The identifier generated for the job. To get the status of the job, use this
  /// identifier with the <code>DescribeTopicDetectionJob</code> operation.
  final String? jobId;

  /// The status of the job:
  ///
  /// <ul>
  /// <li>
  /// SUBMITTED - The job has been received and is queued for processing.
  /// </li>
  /// <li>
  /// IN_PROGRESS - Amazon Comprehend is processing the job.
  /// </li>
  /// <li>
  /// COMPLETED - The job was successfully completed and the output is available.
  /// </li>
  /// <li>
  /// FAILED - The job did not complete. To get details, use the
  /// <code>DescribeTopicDetectionJob</code> operation.
  /// </li>
  /// </ul>
  final JobStatus? jobStatus;

  StartTopicsDetectionJobResponse({
    this.jobId,
    this.jobStatus,
  });
  factory StartTopicsDetectionJobResponse.fromJson(Map<String, dynamic> json) {
    return StartTopicsDetectionJobResponse(
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
    );
  }
}

class StopDominantLanguageDetectionJobResponse {
  /// The identifier of the dominant language detection job to stop.
  final String? jobId;

  /// Either <code>STOP_REQUESTED</code> if the job is currently running, or
  /// <code>STOPPED</code> if the job was previously stopped with the
  /// <code>StopDominantLanguageDetectionJob</code> operation.
  final JobStatus? jobStatus;

  StopDominantLanguageDetectionJobResponse({
    this.jobId,
    this.jobStatus,
  });
  factory StopDominantLanguageDetectionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return StopDominantLanguageDetectionJobResponse(
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
    );
  }
}

class StopEntitiesDetectionJobResponse {
  /// The identifier of the entities detection job to stop.
  final String? jobId;

  /// Either <code>STOP_REQUESTED</code> if the job is currently running, or
  /// <code>STOPPED</code> if the job was previously stopped with the
  /// <code>StopEntitiesDetectionJob</code> operation.
  final JobStatus? jobStatus;

  StopEntitiesDetectionJobResponse({
    this.jobId,
    this.jobStatus,
  });
  factory StopEntitiesDetectionJobResponse.fromJson(Map<String, dynamic> json) {
    return StopEntitiesDetectionJobResponse(
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
    );
  }
}

class StopEventsDetectionJobResponse {
  /// The identifier of the events detection job to stop.
  final String? jobId;

  /// The status of the events detection job.
  final JobStatus? jobStatus;

  StopEventsDetectionJobResponse({
    this.jobId,
    this.jobStatus,
  });
  factory StopEventsDetectionJobResponse.fromJson(Map<String, dynamic> json) {
    return StopEventsDetectionJobResponse(
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
    );
  }
}

class StopKeyPhrasesDetectionJobResponse {
  /// The identifier of the key phrases detection job to stop.
  final String? jobId;

  /// Either <code>STOP_REQUESTED</code> if the job is currently running, or
  /// <code>STOPPED</code> if the job was previously stopped with the
  /// <code>StopKeyPhrasesDetectionJob</code> operation.
  final JobStatus? jobStatus;

  StopKeyPhrasesDetectionJobResponse({
    this.jobId,
    this.jobStatus,
  });
  factory StopKeyPhrasesDetectionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return StopKeyPhrasesDetectionJobResponse(
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
    );
  }
}

class StopPiiEntitiesDetectionJobResponse {
  /// The identifier of the PII entities detection job to stop.
  final String? jobId;

  /// The status of the PII entities detection job.
  final JobStatus? jobStatus;

  StopPiiEntitiesDetectionJobResponse({
    this.jobId,
    this.jobStatus,
  });
  factory StopPiiEntitiesDetectionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return StopPiiEntitiesDetectionJobResponse(
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
    );
  }
}

class StopSentimentDetectionJobResponse {
  /// The identifier of the sentiment detection job to stop.
  final String? jobId;

  /// Either <code>STOP_REQUESTED</code> if the job is currently running, or
  /// <code>STOPPED</code> if the job was previously stopped with the
  /// <code>StopSentimentDetectionJob</code> operation.
  final JobStatus? jobStatus;

  StopSentimentDetectionJobResponse({
    this.jobId,
    this.jobStatus,
  });
  factory StopSentimentDetectionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return StopSentimentDetectionJobResponse(
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
    );
  }
}

class StopTrainingDocumentClassifierResponse {
  StopTrainingDocumentClassifierResponse();
  factory StopTrainingDocumentClassifierResponse.fromJson(
      Map<String, dynamic> _) {
    return StopTrainingDocumentClassifierResponse();
  }
}

class StopTrainingEntityRecognizerResponse {
  StopTrainingEntityRecognizerResponse();
  factory StopTrainingEntityRecognizerResponse.fromJson(
      Map<String, dynamic> _) {
    return StopTrainingEntityRecognizerResponse();
  }
}

enum SyntaxLanguageCode {
  en,
  es,
  fr,
  de,
  it,
  pt,
}

extension on SyntaxLanguageCode {
  String toValue() {
    switch (this) {
      case SyntaxLanguageCode.en:
        return 'en';
      case SyntaxLanguageCode.es:
        return 'es';
      case SyntaxLanguageCode.fr:
        return 'fr';
      case SyntaxLanguageCode.de:
        return 'de';
      case SyntaxLanguageCode.it:
        return 'it';
      case SyntaxLanguageCode.pt:
        return 'pt';
    }
  }
}

extension on String {
  SyntaxLanguageCode toSyntaxLanguageCode() {
    switch (this) {
      case 'en':
        return SyntaxLanguageCode.en;
      case 'es':
        return SyntaxLanguageCode.es;
      case 'fr':
        return SyntaxLanguageCode.fr;
      case 'de':
        return SyntaxLanguageCode.de;
      case 'it':
        return SyntaxLanguageCode.it;
      case 'pt':
        return SyntaxLanguageCode.pt;
    }
    throw Exception('$this is not known in enum SyntaxLanguageCode');
  }
}

/// Represents a work in the input text that was recognized and assigned a part
/// of speech. There is one syntax token record for each word in the source
/// text.
class SyntaxToken {
  /// The zero-based offset from the beginning of the source text to the first
  /// character in the word.
  final int? beginOffset;

  /// The zero-based offset from the beginning of the source text to the last
  /// character in the word.
  final int? endOffset;

  /// Provides the part of speech label and the confidence level that Amazon
  /// Comprehend has that the part of speech was correctly identified. For more
  /// information, see <a>how-syntax</a>.
  final PartOfSpeechTag? partOfSpeech;

  /// The word that was recognized in the source text.
  final String? text;

  /// A unique identifier for a token.
  final int? tokenId;

  SyntaxToken({
    this.beginOffset,
    this.endOffset,
    this.partOfSpeech,
    this.text,
    this.tokenId,
  });
  factory SyntaxToken.fromJson(Map<String, dynamic> json) {
    return SyntaxToken(
      beginOffset: json['BeginOffset'] as int?,
      endOffset: json['EndOffset'] as int?,
      partOfSpeech: json['PartOfSpeech'] != null
          ? PartOfSpeechTag.fromJson(
              json['PartOfSpeech'] as Map<String, dynamic>)
          : null,
      text: json['Text'] as String?,
      tokenId: json['TokenId'] as int?,
    );
  }
}

/// A key-value pair that adds as a metadata to a resource used by Amazon
/// Comprehend. For example, a tag with the key-value pair ‘Department’:’Sales’
/// might be added to a resource to indicate its use by a particular department.
class Tag {
  /// The initial part of a key-value pair that forms a tag associated with a
  /// given resource. For instance, if you want to show which resources are used
  /// by which departments, you might use “Department” as the key portion of the
  /// pair, with multiple possible values such as “sales,” “legal,” and
  /// “administration.”
  final String key;

  /// The second part of a key-value pair that forms a tag associated with a given
  /// resource. For instance, if you want to show which resources are used by
  /// which departments, you might use “Department” as the initial (key) portion
  /// of the pair, with a value of “sales” to indicate the sales department.
  final String? value;

  Tag({
    required this.key,
    this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      if (value != null) 'Value': value,
    };
  }
}

class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }
}

/// Provides information for filtering topic detection jobs. For more
/// information, see .
class TopicsDetectionJobFilter {
  /// <p/>
  final String? jobName;

  /// Filters the list of topic detection jobs based on job status. Returns only
  /// jobs with the specified status.
  final JobStatus? jobStatus;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Only returns jobs submitted after the specified time. Jobs are
  /// returned in ascending order, oldest to newest.
  final DateTime? submitTimeAfter;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Only returns jobs submitted before the specified time. Jobs are
  /// returned in descending order, newest to oldest.
  final DateTime? submitTimeBefore;

  TopicsDetectionJobFilter({
    this.jobName,
    this.jobStatus,
    this.submitTimeAfter,
    this.submitTimeBefore,
  });
  Map<String, dynamic> toJson() {
    final jobName = this.jobName;
    final jobStatus = this.jobStatus;
    final submitTimeAfter = this.submitTimeAfter;
    final submitTimeBefore = this.submitTimeBefore;
    return {
      if (jobName != null) 'JobName': jobName,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (submitTimeAfter != null)
        'SubmitTimeAfter': unixTimestampToJson(submitTimeAfter),
      if (submitTimeBefore != null)
        'SubmitTimeBefore': unixTimestampToJson(submitTimeBefore),
    };
  }
}

/// Provides information about a topic detection job.
class TopicsDetectionJobProperties {
  /// The Amazon Resource Name (ARN) of the AWS Identity and Management (IAM) role
  /// that grants Amazon Comprehend read access to your job data.
  final String? dataAccessRoleArn;

  /// The time that the topic detection job was completed.
  final DateTime? endTime;

  /// The input data configuration supplied when you created the topic detection
  /// job.
  final InputDataConfig? inputDataConfig;

  /// The identifier assigned to the topic detection job.
  final String? jobId;

  /// The name of the topic detection job.
  final String? jobName;

  /// The current status of the topic detection job. If the status is
  /// <code>Failed</code>, the reason for the failure is shown in the
  /// <code>Message</code> field.
  final JobStatus? jobStatus;

  /// A description for the status of a job.
  final String? message;

  /// The number of topics to detect supplied when you created the topic detection
  /// job. The default is 10.
  final int? numberOfTopics;

  /// The output data configuration supplied when you created the topic detection
  /// job.
  final OutputDataConfig? outputDataConfig;

  /// The time that the topic detection job was submitted for processing.
  final DateTime? submitTime;

  /// ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses
  /// to encrypt data on the storage volume attached to the ML compute instance(s)
  /// that process the analysis job. The VolumeKmsKeyId can be either of the
  /// following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  final String? volumeKmsKeyId;

  /// Configuration parameters for a private Virtual Private Cloud (VPC)
  /// containing the resources you are using for your topic detection job. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon
  /// VPC</a>.
  final VpcConfig? vpcConfig;

  TopicsDetectionJobProperties({
    this.dataAccessRoleArn,
    this.endTime,
    this.inputDataConfig,
    this.jobId,
    this.jobName,
    this.jobStatus,
    this.message,
    this.numberOfTopics,
    this.outputDataConfig,
    this.submitTime,
    this.volumeKmsKeyId,
    this.vpcConfig,
  });
  factory TopicsDetectionJobProperties.fromJson(Map<String, dynamic> json) {
    return TopicsDetectionJobProperties(
      dataAccessRoleArn: json['DataAccessRoleArn'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      inputDataConfig: json['InputDataConfig'] != null
          ? InputDataConfig.fromJson(
              json['InputDataConfig'] as Map<String, dynamic>)
          : null,
      jobId: json['JobId'] as String?,
      jobName: json['JobName'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
      message: json['Message'] as String?,
      numberOfTopics: json['NumberOfTopics'] as int?,
      outputDataConfig: json['OutputDataConfig'] != null
          ? OutputDataConfig.fromJson(
              json['OutputDataConfig'] as Map<String, dynamic>)
          : null,
      submitTime: timeStampFromJson(json['SubmitTime']),
      volumeKmsKeyId: json['VolumeKmsKeyId'] as String?,
      vpcConfig: json['VpcConfig'] != null
          ? VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }
}

class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }
}

class UpdateEndpointResponse {
  UpdateEndpointResponse();
  factory UpdateEndpointResponse.fromJson(Map<String, dynamic> _) {
    return UpdateEndpointResponse();
  }
}

/// Configuration parameters for an optional private Virtual Private Cloud (VPC)
/// containing the resources you are using for the job. For more information,
/// see <a
/// href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon
/// VPC</a>.
class VpcConfig {
  /// The ID number for a security group on an instance of your private VPC.
  /// Security groups on your VPC function serve as a virtual firewall to control
  /// inbound and outbound traffic and provides security for the resources that
  /// you’ll be accessing on the VPC. This ID number is preceded by "sg-", for
  /// instance: "sg-03b388029b0a285ea". For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html">Security
  /// Groups for your VPC</a>.
  final List<String> securityGroupIds;

  /// The ID for each subnet being used in your private VPC. This subnet is a
  /// subset of the a range of IPv4 addresses used by the VPC and is specific to a
  /// given availability zone in the VPC’s region. This ID number is preceded by
  /// "subnet-", for instance: "subnet-04ccf456919e69055". For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html">VPCs
  /// and Subnets</a>.
  final List<String> subnets;

  VpcConfig({
    required this.securityGroupIds,
    required this.subnets,
  });
  factory VpcConfig.fromJson(Map<String, dynamic> json) {
    return VpcConfig(
      securityGroupIds: (json['SecurityGroupIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnets: (json['Subnets'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroupIds = this.securityGroupIds;
    final subnets = this.subnets;
    return {
      'SecurityGroupIds': securityGroupIds,
      'Subnets': subnets,
    };
  }
}

class BatchSizeLimitExceededException extends _s.GenericAwsException {
  BatchSizeLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'BatchSizeLimitExceededException',
            message: message);
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String? type, String? message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class InvalidFilterException extends _s.GenericAwsException {
  InvalidFilterException({String? type, String? message})
      : super(type: type, code: 'InvalidFilterException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class JobNotFoundException extends _s.GenericAwsException {
  JobNotFoundException({String? type, String? message})
      : super(type: type, code: 'JobNotFoundException', message: message);
}

class KmsKeyValidationException extends _s.GenericAwsException {
  KmsKeyValidationException({String? type, String? message})
      : super(type: type, code: 'KmsKeyValidationException', message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String? type, String? message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceLimitExceededException extends _s.GenericAwsException {
  ResourceLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceLimitExceededException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ResourceUnavailableException extends _s.GenericAwsException {
  ResourceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ResourceUnavailableException', message: message);
}

class TextSizeLimitExceededException extends _s.GenericAwsException {
  TextSizeLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'TextSizeLimitExceededException',
            message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

class TooManyTagKeysException extends _s.GenericAwsException {
  TooManyTagKeysException({String? type, String? message})
      : super(type: type, code: 'TooManyTagKeysException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

class UnsupportedLanguageException extends _s.GenericAwsException {
  UnsupportedLanguageException({String? type, String? message})
      : super(
            type: type, code: 'UnsupportedLanguageException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BatchSizeLimitExceededException': (type, message) =>
      BatchSizeLimitExceededException(type: type, message: message),
  'ConcurrentModificationException': (type, message) =>
      ConcurrentModificationException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'InvalidFilterException': (type, message) =>
      InvalidFilterException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'JobNotFoundException': (type, message) =>
      JobNotFoundException(type: type, message: message),
  'KmsKeyValidationException': (type, message) =>
      KmsKeyValidationException(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'ResourceLimitExceededException': (type, message) =>
      ResourceLimitExceededException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ResourceUnavailableException': (type, message) =>
      ResourceUnavailableException(type: type, message: message),
  'TextSizeLimitExceededException': (type, message) =>
      TextSizeLimitExceededException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
  'TooManyTagKeysException': (type, message) =>
      TooManyTagKeysException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
  'UnsupportedLanguageException': (type, message) =>
      UnsupportedLanguageException(type: type, message: message),
};
