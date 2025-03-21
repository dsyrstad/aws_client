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

import 'rds-2014-10-31.meta.dart';
export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Amazon Relational Database Service (Amazon RDS) is a web service that makes
/// it easier to set up, operate, and scale a relational database in the cloud.
/// It provides cost-efficient, resizeable capacity for an industry-standard
/// relational database and manages common database administration tasks,
/// freeing up developers to focus on what makes their applications and
/// businesses unique.
class RDS {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  RDS({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'rds',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
        ),
        shapes = shapesJson
            .map((key, value) => MapEntry(key, _s.Shape.fromJson(value)));

  /// Associates an Identity and Access Management (IAM) role from an Amazon
  /// Aurora DB cluster. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Integrating.Authorizing.html">Authorizing
  /// Amazon Aurora MySQL to Access Other AWS Services on Your Behalf</a> in the
  /// <i>Amazon Aurora User Guide</i>.
  /// <note>
  /// This action only applies to Aurora DB clusters.
  /// </note>
  ///
  /// May throw [DBClusterNotFoundFault].
  /// May throw [DBClusterRoleAlreadyExistsFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [DBClusterRoleQuotaExceededFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The name of the DB cluster to associate the IAM role with.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role to associate with the
  /// Aurora DB cluster, for example,
  /// <code>arn:aws:iam::123456789012:role/AuroraAccessRole</code>.
  ///
  /// Parameter [featureName] :
  /// The name of the feature for the DB cluster that the IAM role is to be
  /// associated with. For the list of supported feature names, see
  /// <a>DBEngineVersion</a>.
  Future<void> addRoleToDBCluster({
    required String dBClusterIdentifier,
    required String roleArn,
    String? featureName,
  }) async {
    ArgumentError.checkNotNull(dBClusterIdentifier, 'dBClusterIdentifier');
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    final $request = <String, dynamic>{};
    $request['DBClusterIdentifier'] = dBClusterIdentifier;
    $request['RoleArn'] = roleArn;
    featureName?.also((arg) => $request['FeatureName'] = arg);
    await _protocol.send(
      $request,
      action: 'AddRoleToDBCluster',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AddRoleToDBClusterMessage'],
      shapes: shapes,
    );
  }

  /// Associates an AWS Identity and Access Management (IAM) role with a DB
  /// instance.
  /// <note>
  /// To add a role to a DB instance, the status of the DB instance must be
  /// <code>available</code>.
  /// </note>
  ///
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [DBInstanceRoleAlreadyExistsFault].
  /// May throw [InvalidDBInstanceStateFault].
  /// May throw [DBInstanceRoleQuotaExceededFault].
  ///
  /// Parameter [dBInstanceIdentifier] :
  /// The name of the DB instance to associate the IAM role with.
  ///
  /// Parameter [featureName] :
  /// The name of the feature for the DB instance that the IAM role is to be
  /// associated with. For the list of supported feature names, see
  /// <a>DBEngineVersion</a>.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role to associate with the DB
  /// instance, for example
  /// <code>arn:aws:iam::123456789012:role/AccessRole</code>.
  Future<void> addRoleToDBInstance({
    required String dBInstanceIdentifier,
    required String featureName,
    required String roleArn,
  }) async {
    ArgumentError.checkNotNull(dBInstanceIdentifier, 'dBInstanceIdentifier');
    ArgumentError.checkNotNull(featureName, 'featureName');
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    final $request = <String, dynamic>{};
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    $request['FeatureName'] = featureName;
    $request['RoleArn'] = roleArn;
    await _protocol.send(
      $request,
      action: 'AddRoleToDBInstance',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AddRoleToDBInstanceMessage'],
      shapes: shapes,
    );
  }

  /// Adds a source identifier to an existing RDS event notification
  /// subscription.
  ///
  /// May throw [SubscriptionNotFoundFault].
  /// May throw [SourceNotFoundFault].
  ///
  /// Parameter [sourceIdentifier] :
  /// The identifier of the event source to be added.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If the source type is a DB instance, a <code>DBInstanceIdentifier</code>
  /// value must be supplied.
  /// </li>
  /// <li>
  /// If the source type is a DB cluster, a <code>DBClusterIdentifier</code>
  /// value must be supplied.
  /// </li>
  /// <li>
  /// If the source type is a DB parameter group, a
  /// <code>DBParameterGroupName</code> value must be supplied.
  /// </li>
  /// <li>
  /// If the source type is a DB security group, a
  /// <code>DBSecurityGroupName</code> value must be supplied.
  /// </li>
  /// <li>
  /// If the source type is a DB snapshot, a <code>DBSnapshotIdentifier</code>
  /// value must be supplied.
  /// </li>
  /// <li>
  /// If the source type is a DB cluster snapshot, a
  /// <code>DBClusterSnapshotIdentifier</code> value must be supplied.
  /// </li>
  /// </ul>
  ///
  /// Parameter [subscriptionName] :
  /// The name of the RDS event notification subscription you want to add a
  /// source identifier to.
  Future<AddSourceIdentifierToSubscriptionResult>
      addSourceIdentifierToSubscription({
    required String sourceIdentifier,
    required String subscriptionName,
  }) async {
    ArgumentError.checkNotNull(sourceIdentifier, 'sourceIdentifier');
    ArgumentError.checkNotNull(subscriptionName, 'subscriptionName');
    final $request = <String, dynamic>{};
    $request['SourceIdentifier'] = sourceIdentifier;
    $request['SubscriptionName'] = subscriptionName;
    final $result = await _protocol.send(
      $request,
      action: 'AddSourceIdentifierToSubscription',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AddSourceIdentifierToSubscriptionMessage'],
      shapes: shapes,
      resultWrapper: 'AddSourceIdentifierToSubscriptionResult',
    );
    return AddSourceIdentifierToSubscriptionResult.fromXml($result);
  }

  /// Adds metadata tags to an Amazon RDS resource. These tags can also be used
  /// with cost allocation reporting to track cost associated with Amazon RDS
  /// resources, or used in a Condition statement in an IAM policy for Amazon
  /// RDS.
  ///
  /// For an overview on tagging Amazon RDS resources, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.Tagging.html">Tagging
  /// Amazon RDS Resources</a>.
  ///
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [DBClusterNotFoundFault].
  /// May throw [DBSnapshotNotFoundFault].
  /// May throw [DBProxyNotFoundFault].
  /// May throw [DBProxyTargetGroupNotFoundFault].
  ///
  /// Parameter [resourceName] :
  /// The Amazon RDS resource that the tags are added to. This value is an
  /// Amazon Resource Name (ARN). For information about creating an ARN, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.ARN.html#USER_Tagging.ARN.Constructing">
  /// Constructing an RDS Amazon Resource Name (ARN)</a>.
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the Amazon RDS resource.
  Future<void> addTagsToResource({
    required String resourceName,
    required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceName, 'resourceName');
    ArgumentError.checkNotNull(tags, 'tags');
    final $request = <String, dynamic>{};
    $request['ResourceName'] = resourceName;
    $request['Tags'] = tags;
    await _protocol.send(
      $request,
      action: 'AddTagsToResource',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AddTagsToResourceMessage'],
      shapes: shapes,
    );
  }

  /// Applies a pending maintenance action to a resource (for example, to a DB
  /// instance).
  ///
  /// May throw [ResourceNotFoundFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [InvalidDBInstanceStateFault].
  ///
  /// Parameter [applyAction] :
  /// The pending maintenance action to apply to this resource.
  ///
  /// Valid values: <code>system-update</code>, <code>db-upgrade</code>,
  /// <code>hardware-maintenance</code>, <code>ca-certificate-rotation</code>
  ///
  /// Parameter [optInType] :
  /// A value that specifies the type of opt-in request, or undoes an opt-in
  /// request. An opt-in request of type <code>immediate</code> can't be undone.
  ///
  /// Valid values:
  ///
  /// <ul>
  /// <li>
  /// <code>immediate</code> - Apply the maintenance action immediately.
  /// </li>
  /// <li>
  /// <code>next-maintenance</code> - Apply the maintenance action during the
  /// next maintenance window for the resource.
  /// </li>
  /// <li>
  /// <code>undo-opt-in</code> - Cancel any existing
  /// <code>next-maintenance</code> opt-in requests.
  /// </li>
  /// </ul>
  ///
  /// Parameter [resourceIdentifier] :
  /// The RDS Amazon Resource Name (ARN) of the resource that the pending
  /// maintenance action applies to. For information about creating an ARN, see
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.ARN.html#USER_Tagging.ARN.Constructing">
  /// Constructing an RDS Amazon Resource Name (ARN)</a>.
  Future<ApplyPendingMaintenanceActionResult> applyPendingMaintenanceAction({
    required String applyAction,
    required String optInType,
    required String resourceIdentifier,
  }) async {
    ArgumentError.checkNotNull(applyAction, 'applyAction');
    ArgumentError.checkNotNull(optInType, 'optInType');
    ArgumentError.checkNotNull(resourceIdentifier, 'resourceIdentifier');
    final $request = <String, dynamic>{};
    $request['ApplyAction'] = applyAction;
    $request['OptInType'] = optInType;
    $request['ResourceIdentifier'] = resourceIdentifier;
    final $result = await _protocol.send(
      $request,
      action: 'ApplyPendingMaintenanceAction',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ApplyPendingMaintenanceActionMessage'],
      shapes: shapes,
      resultWrapper: 'ApplyPendingMaintenanceActionResult',
    );
    return ApplyPendingMaintenanceActionResult.fromXml($result);
  }

  /// Enables ingress to a DBSecurityGroup using one of two forms of
  /// authorization. First, EC2 or VPC security groups can be added to the
  /// DBSecurityGroup if the application using the database is running on EC2 or
  /// VPC instances. Second, IP ranges are available if the application
  /// accessing your database is running on the Internet. Required parameters
  /// for this API are one of CIDR range, EC2SecurityGroupId for VPC, or
  /// (EC2SecurityGroupOwnerId and either EC2SecurityGroupName or
  /// EC2SecurityGroupId for non-VPC).
  /// <note>
  /// You can't authorize ingress from an EC2 security group in one AWS Region
  /// to an Amazon RDS DB instance in another. You can't authorize ingress from
  /// a VPC security group in one VPC to an Amazon RDS DB instance in another.
  /// </note>
  /// For an overview of CIDR ranges, go to the <a
  /// href="http://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Wikipedia
  /// Tutorial</a>.
  ///
  /// May throw [DBSecurityGroupNotFoundFault].
  /// May throw [InvalidDBSecurityGroupStateFault].
  /// May throw [AuthorizationAlreadyExistsFault].
  /// May throw [AuthorizationQuotaExceededFault].
  ///
  /// Parameter [dBSecurityGroupName] :
  /// The name of the DB security group to add authorization to.
  ///
  /// Parameter [cidrip] :
  /// The IP range to authorize.
  ///
  /// Parameter [eC2SecurityGroupId] :
  /// Id of the EC2 security group to authorize. For VPC DB security groups,
  /// <code>EC2SecurityGroupId</code> must be provided. Otherwise,
  /// <code>EC2SecurityGroupOwnerId</code> and either
  /// <code>EC2SecurityGroupName</code> or <code>EC2SecurityGroupId</code> must
  /// be provided.
  ///
  /// Parameter [eC2SecurityGroupName] :
  /// Name of the EC2 security group to authorize. For VPC DB security groups,
  /// <code>EC2SecurityGroupId</code> must be provided. Otherwise,
  /// <code>EC2SecurityGroupOwnerId</code> and either
  /// <code>EC2SecurityGroupName</code> or <code>EC2SecurityGroupId</code> must
  /// be provided.
  ///
  /// Parameter [eC2SecurityGroupOwnerId] :
  /// AWS account number of the owner of the EC2 security group specified in the
  /// <code>EC2SecurityGroupName</code> parameter. The AWS access key ID isn't
  /// an acceptable value. For VPC DB security groups,
  /// <code>EC2SecurityGroupId</code> must be provided. Otherwise,
  /// <code>EC2SecurityGroupOwnerId</code> and either
  /// <code>EC2SecurityGroupName</code> or <code>EC2SecurityGroupId</code> must
  /// be provided.
  Future<AuthorizeDBSecurityGroupIngressResult>
      authorizeDBSecurityGroupIngress({
    required String dBSecurityGroupName,
    String? cidrip,
    String? eC2SecurityGroupId,
    String? eC2SecurityGroupName,
    String? eC2SecurityGroupOwnerId,
  }) async {
    ArgumentError.checkNotNull(dBSecurityGroupName, 'dBSecurityGroupName');
    final $request = <String, dynamic>{};
    $request['DBSecurityGroupName'] = dBSecurityGroupName;
    cidrip?.also((arg) => $request['CIDRIP'] = arg);
    eC2SecurityGroupId?.also((arg) => $request['EC2SecurityGroupId'] = arg);
    eC2SecurityGroupName?.also((arg) => $request['EC2SecurityGroupName'] = arg);
    eC2SecurityGroupOwnerId
        ?.also((arg) => $request['EC2SecurityGroupOwnerId'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'AuthorizeDBSecurityGroupIngress',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AuthorizeDBSecurityGroupIngressMessage'],
      shapes: shapes,
      resultWrapper: 'AuthorizeDBSecurityGroupIngressResult',
    );
    return AuthorizeDBSecurityGroupIngressResult.fromXml($result);
  }

  /// Backtracks a DB cluster to a specific time, without creating a new DB
  /// cluster.
  ///
  /// For more information on backtracking, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Managing.Backtrack.html">
  /// Backtracking an Aurora DB Cluster</a> in the <i>Amazon Aurora User
  /// Guide.</i>
  /// <note>
  /// This action only applies to Aurora MySQL DB clusters.
  /// </note>
  ///
  /// May throw [DBClusterNotFoundFault].
  /// May throw [InvalidDBClusterStateFault].
  ///
  /// Parameter [backtrackTo] :
  /// The timestamp of the time to backtrack the DB cluster to, specified in ISO
  /// 8601 format. For more information about ISO 8601, see the <a
  /// href="http://en.wikipedia.org/wiki/ISO_8601">ISO8601 Wikipedia page.</a>
  /// <note>
  /// If the specified time isn't a consistent time for the DB cluster, Aurora
  /// automatically chooses the nearest possible consistent time for the DB
  /// cluster.
  /// </note>
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain a valid ISO 8601 timestamp.
  /// </li>
  /// <li>
  /// Can't contain a timestamp set in the future.
  /// </li>
  /// </ul>
  /// Example: <code>2017-07-08T18:00Z</code>
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The DB cluster identifier of the DB cluster to be backtracked. This
  /// parameter is stored as a lowercase string.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 1 to 63 alphanumeric characters or hyphens.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Can't end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul>
  /// Example: <code>my-cluster1</code>
  ///
  /// Parameter [force] :
  /// A value that indicates whether to force the DB cluster to backtrack when
  /// binary logging is enabled. Otherwise, an error occurs when binary logging
  /// is enabled.
  ///
  /// Parameter [useEarliestTimeOnPointInTimeUnavailable] :
  /// A value that indicates whether to backtrack the DB cluster to the earliest
  /// possible backtrack time when <i>BacktrackTo</i> is set to a timestamp
  /// earlier than the earliest backtrack time. When this parameter is disabled
  /// and <i>BacktrackTo</i> is set to a timestamp earlier than the earliest
  /// backtrack time, an error occurs.
  Future<DBClusterBacktrack> backtrackDBCluster({
    required DateTime backtrackTo,
    required String dBClusterIdentifier,
    bool? force,
    bool? useEarliestTimeOnPointInTimeUnavailable,
  }) async {
    ArgumentError.checkNotNull(backtrackTo, 'backtrackTo');
    ArgumentError.checkNotNull(dBClusterIdentifier, 'dBClusterIdentifier');
    final $request = <String, dynamic>{};
    $request['BacktrackTo'] = _s.iso8601ToJson(backtrackTo);
    $request['DBClusterIdentifier'] = dBClusterIdentifier;
    force?.also((arg) => $request['Force'] = arg);
    useEarliestTimeOnPointInTimeUnavailable?.also(
        (arg) => $request['UseEarliestTimeOnPointInTimeUnavailable'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'BacktrackDBCluster',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['BacktrackDBClusterMessage'],
      shapes: shapes,
      resultWrapper: 'BacktrackDBClusterResult',
    );
    return DBClusterBacktrack.fromXml($result);
  }

  /// Cancels an export task in progress that is exporting a snapshot to Amazon
  /// S3. Any data that has already been written to the S3 bucket isn't removed.
  ///
  /// May throw [ExportTaskNotFoundFault].
  /// May throw [InvalidExportTaskStateFault].
  ///
  /// Parameter [exportTaskIdentifier] :
  /// The identifier of the snapshot export task to cancel.
  Future<ExportTask> cancelExportTask({
    required String exportTaskIdentifier,
  }) async {
    ArgumentError.checkNotNull(exportTaskIdentifier, 'exportTaskIdentifier');
    final $request = <String, dynamic>{};
    $request['ExportTaskIdentifier'] = exportTaskIdentifier;
    final $result = await _protocol.send(
      $request,
      action: 'CancelExportTask',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CancelExportTaskMessage'],
      shapes: shapes,
      resultWrapper: 'CancelExportTaskResult',
    );
    return ExportTask.fromXml($result);
  }

  /// Copies the specified DB cluster parameter group.
  /// <note>
  /// This action only applies to Aurora DB clusters.
  /// </note>
  ///
  /// May throw [DBParameterGroupNotFoundFault].
  /// May throw [DBParameterGroupQuotaExceededFault].
  /// May throw [DBParameterGroupAlreadyExistsFault].
  ///
  /// Parameter [sourceDBClusterParameterGroupIdentifier] :
  /// The identifier or Amazon Resource Name (ARN) for the source DB cluster
  /// parameter group. For information about creating an ARN, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_Tagging.ARN.html#USER_Tagging.ARN.Constructing">
  /// Constructing an ARN for Amazon RDS</a> in the <i>Amazon Aurora User
  /// Guide</i>.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must specify a valid DB cluster parameter group.
  /// </li>
  /// <li>
  /// If the source DB cluster parameter group is in the same AWS Region as the
  /// copy, specify a valid DB parameter group identifier, for example
  /// <code>my-db-cluster-param-group</code>, or a valid ARN.
  /// </li>
  /// <li>
  /// If the source DB parameter group is in a different AWS Region than the
  /// copy, specify a valid DB cluster parameter group ARN, for example
  /// <code>arn:aws:rds:us-east-1:123456789012:cluster-pg:custom-cluster-group1</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [targetDBClusterParameterGroupDescription] :
  /// A description for the copied DB cluster parameter group.
  ///
  /// Parameter [targetDBClusterParameterGroupIdentifier] :
  /// The identifier for the copied DB cluster parameter group.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Can't be null, empty, or blank
  /// </li>
  /// <li>
  /// Must contain from 1 to 255 letters, numbers, or hyphens
  /// </li>
  /// <li>
  /// First character must be a letter
  /// </li>
  /// <li>
  /// Can't end with a hyphen or contain two consecutive hyphens
  /// </li>
  /// </ul>
  /// Example: <code>my-cluster-param-group1</code>
  Future<CopyDBClusterParameterGroupResult> copyDBClusterParameterGroup({
    required String sourceDBClusterParameterGroupIdentifier,
    required String targetDBClusterParameterGroupDescription,
    required String targetDBClusterParameterGroupIdentifier,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(sourceDBClusterParameterGroupIdentifier,
        'sourceDBClusterParameterGroupIdentifier');
    ArgumentError.checkNotNull(targetDBClusterParameterGroupDescription,
        'targetDBClusterParameterGroupDescription');
    ArgumentError.checkNotNull(targetDBClusterParameterGroupIdentifier,
        'targetDBClusterParameterGroupIdentifier');
    final $request = <String, dynamic>{};
    $request['SourceDBClusterParameterGroupIdentifier'] =
        sourceDBClusterParameterGroupIdentifier;
    $request['TargetDBClusterParameterGroupDescription'] =
        targetDBClusterParameterGroupDescription;
    $request['TargetDBClusterParameterGroupIdentifier'] =
        targetDBClusterParameterGroupIdentifier;
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CopyDBClusterParameterGroup',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CopyDBClusterParameterGroupMessage'],
      shapes: shapes,
      resultWrapper: 'CopyDBClusterParameterGroupResult',
    );
    return CopyDBClusterParameterGroupResult.fromXml($result);
  }

  /// Copies a snapshot of a DB cluster.
  ///
  /// To copy a DB cluster snapshot from a shared manual DB cluster snapshot,
  /// <code>SourceDBClusterSnapshotIdentifier</code> must be the Amazon Resource
  /// Name (ARN) of the shared DB cluster snapshot.
  ///
  /// You can copy an encrypted DB cluster snapshot from another AWS Region. In
  /// that case, the AWS Region where you call the
  /// <code>CopyDBClusterSnapshot</code> action is the destination AWS Region
  /// for the encrypted DB cluster snapshot to be copied to. To copy an
  /// encrypted DB cluster snapshot from another AWS Region, you must provide
  /// the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>KmsKeyId</code> - The AWS Key Management System (AWS KMS) key
  /// identifier for the key to use to encrypt the copy of the DB cluster
  /// snapshot in the destination AWS Region.
  /// </li>
  /// <li>
  /// <code>PreSignedUrl</code> - A URL that contains a Signature Version 4
  /// signed request for the <code>CopyDBClusterSnapshot</code> action to be
  /// called in the source AWS Region where the DB cluster snapshot is copied
  /// from. The pre-signed URL must be a valid request for the
  /// <code>CopyDBClusterSnapshot</code> API action that can be executed in the
  /// source AWS Region that contains the encrypted DB cluster snapshot to be
  /// copied.
  ///
  /// The pre-signed URL request must contain the following parameter values:
  ///
  /// <ul>
  /// <li>
  /// <code>KmsKeyId</code> - The AWS KMS key identifier for the customer master
  /// key (CMK) to use to encrypt the copy of the DB cluster snapshot in the
  /// destination AWS Region. This is the same identifier for both the
  /// <code>CopyDBClusterSnapshot</code> action that is called in the
  /// destination AWS Region, and the action contained in the pre-signed URL.
  /// </li>
  /// <li>
  /// <code>DestinationRegion</code> - The name of the AWS Region that the DB
  /// cluster snapshot is to be created in.
  /// </li>
  /// <li>
  /// <code>SourceDBClusterSnapshotIdentifier</code> - The DB cluster snapshot
  /// identifier for the encrypted DB cluster snapshot to be copied. This
  /// identifier must be in the Amazon Resource Name (ARN) format for the source
  /// AWS Region. For example, if you are copying an encrypted DB cluster
  /// snapshot from the us-west-2 AWS Region, then your
  /// <code>SourceDBClusterSnapshotIdentifier</code> looks like the following
  /// example:
  /// <code>arn:aws:rds:us-west-2:123456789012:cluster-snapshot:aurora-cluster1-snapshot-20161115</code>.
  /// </li>
  /// </ul>
  /// To learn how to generate a Signature Version 4 signed request, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-query-string-auth.html">
  /// Authenticating Requests: Using Query Parameters (AWS Signature Version
  /// 4)</a> and <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">
  /// Signature Version 4 Signing Process</a>.
  /// <note>
  /// If you are using an AWS SDK tool or the AWS CLI, you can specify
  /// <code>SourceRegion</code> (or <code>--source-region</code> for the AWS
  /// CLI) instead of specifying <code>PreSignedUrl</code> manually. Specifying
  /// <code>SourceRegion</code> autogenerates a pre-signed URL that is a valid
  /// request for the operation that can be executed in the source AWS Region.
  /// </note> </li>
  /// <li>
  /// <code>TargetDBClusterSnapshotIdentifier</code> - The identifier for the
  /// new copy of the DB cluster snapshot in the destination AWS Region.
  /// </li>
  /// <li>
  /// <code>SourceDBClusterSnapshotIdentifier</code> - The DB cluster snapshot
  /// identifier for the encrypted DB cluster snapshot to be copied. This
  /// identifier must be in the ARN format for the source AWS Region and is the
  /// same value as the <code>SourceDBClusterSnapshotIdentifier</code> in the
  /// pre-signed URL.
  /// </li>
  /// </ul>
  /// To cancel the copy operation once it is in progress, delete the target DB
  /// cluster snapshot identified by
  /// <code>TargetDBClusterSnapshotIdentifier</code> while that DB cluster
  /// snapshot is in "copying" status.
  ///
  /// For more information on copying encrypted DB cluster snapshots from one
  /// AWS Region to another, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_CopySnapshot.html">
  /// Copying a Snapshot</a> in the <i>Amazon Aurora User Guide.</i>
  ///
  /// For more information on Amazon Aurora, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
  /// What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i>
  /// <note>
  /// This action only applies to Aurora DB clusters.
  /// </note>
  ///
  /// May throw [DBClusterSnapshotAlreadyExistsFault].
  /// May throw [DBClusterSnapshotNotFoundFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [InvalidDBClusterSnapshotStateFault].
  /// May throw [SnapshotQuotaExceededFault].
  /// May throw [KMSKeyNotAccessibleFault].
  ///
  /// Parameter [sourceDBClusterSnapshotIdentifier] :
  /// The identifier of the DB cluster snapshot to copy. This parameter isn't
  /// case-sensitive.
  ///
  /// You can't copy an encrypted, shared DB cluster snapshot from one AWS
  /// Region to another.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must specify a valid system snapshot in the "available" state.
  /// </li>
  /// <li>
  /// If the source snapshot is in the same AWS Region as the copy, specify a
  /// valid DB snapshot identifier.
  /// </li>
  /// <li>
  /// If the source snapshot is in a different AWS Region than the copy, specify
  /// a valid DB cluster snapshot ARN. For more information, go to <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_CopySnapshot.html#USER_CopySnapshot.AcrossRegions">
  /// Copying Snapshots Across AWS Regions</a> in the <i>Amazon Aurora User
  /// Guide.</i>
  /// </li>
  /// </ul>
  /// Example: <code>my-cluster-snapshot1</code>
  ///
  /// Parameter [targetDBClusterSnapshotIdentifier] :
  /// The identifier of the new DB cluster snapshot to create from the source DB
  /// cluster snapshot. This parameter isn't case-sensitive.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 1 to 63 letters, numbers, or hyphens.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Can't end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul>
  /// Example: <code>my-cluster-snapshot2</code>
  ///
  /// Parameter [copyTags] :
  /// A value that indicates whether to copy all tags from the source DB cluster
  /// snapshot to the target DB cluster snapshot. By default, tags are not
  /// copied.
  ///
  /// Parameter [kmsKeyId] :
  /// The AWS KMS key identifier for an encrypted DB cluster snapshot. The AWS
  /// KMS key identifier is the key ARN, key ID, alias ARN, or alias name for
  /// the AWS KMS customer master key (CMK).
  ///
  /// If you copy an encrypted DB cluster snapshot from your AWS account, you
  /// can specify a value for <code>KmsKeyId</code> to encrypt the copy with a
  /// new AWS KMS CMK. If you don't specify a value for <code>KmsKeyId</code>,
  /// then the copy of the DB cluster snapshot is encrypted with the same AWS
  /// KMS key as the source DB cluster snapshot.
  ///
  /// If you copy an encrypted DB cluster snapshot that is shared from another
  /// AWS account, then you must specify a value for <code>KmsKeyId</code>.
  ///
  /// To copy an encrypted DB cluster snapshot to another AWS Region, you must
  /// set <code>KmsKeyId</code> to the AWS KMS key identifier you want to use to
  /// encrypt the copy of the DB cluster snapshot in the destination AWS Region.
  /// AWS KMS CMKs are specific to the AWS Region that they are created in, and
  /// you can't use CMKs from one AWS Region in another AWS Region.
  ///
  /// If you copy an unencrypted DB cluster snapshot and specify a value for the
  /// <code>KmsKeyId</code> parameter, an error is returned.
  ///
  /// Parameter [preSignedUrl] :
  /// The URL that contains a Signature Version 4 signed request for the
  /// <code>CopyDBClusterSnapshot</code> API action in the AWS Region that
  /// contains the source DB cluster snapshot to copy. The
  /// <code>PreSignedUrl</code> parameter must be used when copying an encrypted
  /// DB cluster snapshot from another AWS Region. Don't specify
  /// <code>PreSignedUrl</code> when you are copying an encrypted DB cluster
  /// snapshot in the same AWS Region.
  ///
  /// The pre-signed URL must be a valid request for the
  /// <code>CopyDBClusterSnapshot</code> API action that can be executed in the
  /// source AWS Region that contains the encrypted DB cluster snapshot to be
  /// copied. The pre-signed URL request must contain the following parameter
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <code>KmsKeyId</code> - The AWS KMS key identifier for the customer master
  /// key (CMK) to use to encrypt the copy of the DB cluster snapshot in the
  /// destination AWS Region. This is the same identifier for both the
  /// <code>CopyDBClusterSnapshot</code> action that is called in the
  /// destination AWS Region, and the action contained in the pre-signed URL.
  /// </li>
  /// <li>
  /// <code>DestinationRegion</code> - The name of the AWS Region that the DB
  /// cluster snapshot is to be created in.
  /// </li>
  /// <li>
  /// <code>SourceDBClusterSnapshotIdentifier</code> - The DB cluster snapshot
  /// identifier for the encrypted DB cluster snapshot to be copied. This
  /// identifier must be in the Amazon Resource Name (ARN) format for the source
  /// AWS Region. For example, if you are copying an encrypted DB cluster
  /// snapshot from the us-west-2 AWS Region, then your
  /// <code>SourceDBClusterSnapshotIdentifier</code> looks like the following
  /// example:
  /// <code>arn:aws:rds:us-west-2:123456789012:cluster-snapshot:aurora-cluster1-snapshot-20161115</code>.
  /// </li>
  /// </ul>
  /// To learn how to generate a Signature Version 4 signed request, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-query-string-auth.html">
  /// Authenticating Requests: Using Query Parameters (AWS Signature Version
  /// 4)</a> and <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">
  /// Signature Version 4 Signing Process</a>.
  /// <note>
  /// If you are using an AWS SDK tool or the AWS CLI, you can specify
  /// <code>SourceRegion</code> (or <code>--source-region</code> for the AWS
  /// CLI) instead of specifying <code>PreSignedUrl</code> manually. Specifying
  /// <code>SourceRegion</code> autogenerates a pre-signed URL that is a valid
  /// request for the operation that can be executed in the source AWS Region.
  /// </note><note>
  /// If you supply a value for this operation's <code>SourceRegion</code>
  /// parameter, a pre-signed URL will be calculated on your behalf.
  /// </note>
  ///
  /// Parameter [sourceRegion] :
  /// The ID of the region that contains the snapshot to be copied.
  Future<CopyDBClusterSnapshotResult> copyDBClusterSnapshot({
    required String sourceDBClusterSnapshotIdentifier,
    required String targetDBClusterSnapshotIdentifier,
    bool? copyTags,
    String? kmsKeyId,
    String? preSignedUrl,
    String? sourceRegion,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(
        sourceDBClusterSnapshotIdentifier, 'sourceDBClusterSnapshotIdentifier');
    ArgumentError.checkNotNull(
        targetDBClusterSnapshotIdentifier, 'targetDBClusterSnapshotIdentifier');
    final $request = <String, dynamic>{};
    $request['SourceDBClusterSnapshotIdentifier'] =
        sourceDBClusterSnapshotIdentifier;
    $request['TargetDBClusterSnapshotIdentifier'] =
        targetDBClusterSnapshotIdentifier;
    copyTags?.also((arg) => $request['CopyTags'] = arg);
    kmsKeyId?.also((arg) => $request['KmsKeyId'] = arg);
    preSignedUrl?.also((arg) => $request['PreSignedUrl'] = arg);
    sourceRegion?.also((arg) => $request['SourceRegion'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CopyDBClusterSnapshot',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CopyDBClusterSnapshotMessage'],
      shapes: shapes,
      resultWrapper: 'CopyDBClusterSnapshotResult',
    );
    return CopyDBClusterSnapshotResult.fromXml($result);
  }

  /// Copies the specified DB parameter group.
  ///
  /// May throw [DBParameterGroupNotFoundFault].
  /// May throw [DBParameterGroupAlreadyExistsFault].
  /// May throw [DBParameterGroupQuotaExceededFault].
  ///
  /// Parameter [sourceDBParameterGroupIdentifier] :
  /// The identifier or ARN for the source DB parameter group. For information
  /// about creating an ARN, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.ARN.html#USER_Tagging.ARN.Constructing">
  /// Constructing an ARN for Amazon RDS</a> in the <i>Amazon RDS User
  /// Guide</i>.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must specify a valid DB parameter group.
  /// </li>
  /// <li>
  /// Must specify a valid DB parameter group identifier, for example
  /// <code>my-db-param-group</code>, or a valid ARN.
  /// </li>
  /// </ul>
  ///
  /// Parameter [targetDBParameterGroupDescription] :
  /// A description for the copied DB parameter group.
  ///
  /// Parameter [targetDBParameterGroupIdentifier] :
  /// The identifier for the copied DB parameter group.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Can't be null, empty, or blank
  /// </li>
  /// <li>
  /// Must contain from 1 to 255 letters, numbers, or hyphens
  /// </li>
  /// <li>
  /// First character must be a letter
  /// </li>
  /// <li>
  /// Can't end with a hyphen or contain two consecutive hyphens
  /// </li>
  /// </ul>
  /// Example: <code>my-db-parameter-group</code>
  Future<CopyDBParameterGroupResult> copyDBParameterGroup({
    required String sourceDBParameterGroupIdentifier,
    required String targetDBParameterGroupDescription,
    required String targetDBParameterGroupIdentifier,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(
        sourceDBParameterGroupIdentifier, 'sourceDBParameterGroupIdentifier');
    ArgumentError.checkNotNull(
        targetDBParameterGroupDescription, 'targetDBParameterGroupDescription');
    ArgumentError.checkNotNull(
        targetDBParameterGroupIdentifier, 'targetDBParameterGroupIdentifier');
    final $request = <String, dynamic>{};
    $request['SourceDBParameterGroupIdentifier'] =
        sourceDBParameterGroupIdentifier;
    $request['TargetDBParameterGroupDescription'] =
        targetDBParameterGroupDescription;
    $request['TargetDBParameterGroupIdentifier'] =
        targetDBParameterGroupIdentifier;
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CopyDBParameterGroup',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CopyDBParameterGroupMessage'],
      shapes: shapes,
      resultWrapper: 'CopyDBParameterGroupResult',
    );
    return CopyDBParameterGroupResult.fromXml($result);
  }

  /// Copies the specified DB snapshot. The source DB snapshot must be in the
  /// <code>available</code> state.
  ///
  /// You can copy a snapshot from one AWS Region to another. In that case, the
  /// AWS Region where you call the <code>CopyDBSnapshot</code> action is the
  /// destination AWS Region for the DB snapshot copy.
  ///
  /// For more information about copying snapshots, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_CopySnapshot.html#USER_CopyDBSnapshot">Copying
  /// a DB Snapshot</a> in the <i>Amazon RDS User Guide.</i>
  ///
  /// May throw [DBSnapshotAlreadyExistsFault].
  /// May throw [DBSnapshotNotFoundFault].
  /// May throw [InvalidDBSnapshotStateFault].
  /// May throw [SnapshotQuotaExceededFault].
  /// May throw [KMSKeyNotAccessibleFault].
  /// May throw [CustomAvailabilityZoneNotFoundFault].
  ///
  /// Parameter [sourceDBSnapshotIdentifier] :
  /// The identifier for the source DB snapshot.
  ///
  /// If the source snapshot is in the same AWS Region as the copy, specify a
  /// valid DB snapshot identifier. For example, you might specify
  /// <code>rds:mysql-instance1-snapshot-20130805</code>.
  ///
  /// If the source snapshot is in a different AWS Region than the copy, specify
  /// a valid DB snapshot ARN. For example, you might specify
  /// <code>arn:aws:rds:us-west-2:123456789012:snapshot:mysql-instance1-snapshot-20130805</code>.
  ///
  /// If you are copying from a shared manual DB snapshot, this parameter must
  /// be the Amazon Resource Name (ARN) of the shared DB snapshot.
  ///
  /// If you are copying an encrypted snapshot this parameter must be in the ARN
  /// format for the source AWS Region, and must match the
  /// <code>SourceDBSnapshotIdentifier</code> in the <code>PreSignedUrl</code>
  /// parameter.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must specify a valid system snapshot in the "available" state.
  /// </li>
  /// </ul>
  /// Example: <code>rds:mydb-2012-04-02-00-01</code>
  ///
  /// Example:
  /// <code>arn:aws:rds:us-west-2:123456789012:snapshot:mysql-instance1-snapshot-20130805</code>
  ///
  /// Parameter [targetDBSnapshotIdentifier] :
  /// The identifier for the copy of the snapshot.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Can't be null, empty, or blank
  /// </li>
  /// <li>
  /// Must contain from 1 to 255 letters, numbers, or hyphens
  /// </li>
  /// <li>
  /// First character must be a letter
  /// </li>
  /// <li>
  /// Can't end with a hyphen or contain two consecutive hyphens
  /// </li>
  /// </ul>
  /// Example: <code>my-db-snapshot</code>
  ///
  /// Parameter [copyTags] :
  /// A value that indicates whether to copy all tags from the source DB
  /// snapshot to the target DB snapshot. By default, tags are not copied.
  ///
  /// Parameter [kmsKeyId] :
  /// The AWS KMS key identifier for an encrypted DB snapshot. The AWS KMS key
  /// identifier is the key ARN, key ID, alias ARN, or alias name for the AWS
  /// KMS customer master key (CMK).
  ///
  /// If you copy an encrypted DB snapshot from your AWS account, you can
  /// specify a value for this parameter to encrypt the copy with a new AWS KMS
  /// CMK. If you don't specify a value for this parameter, then the copy of the
  /// DB snapshot is encrypted with the same AWS KMS key as the source DB
  /// snapshot.
  ///
  /// If you copy an encrypted DB snapshot that is shared from another AWS
  /// account, then you must specify a value for this parameter.
  ///
  /// If you specify this parameter when you copy an unencrypted snapshot, the
  /// copy is encrypted.
  ///
  /// If you copy an encrypted snapshot to a different AWS Region, then you must
  /// specify a AWS KMS key identifier for the destination AWS Region. AWS KMS
  /// CMKs are specific to the AWS Region that they are created in, and you
  /// can't use CMKs from one AWS Region in another AWS Region.
  ///
  /// Parameter [optionGroupName] :
  /// The name of an option group to associate with the copy of the snapshot.
  ///
  /// Specify this option if you are copying a snapshot from one AWS Region to
  /// another, and your DB instance uses a nondefault option group. If your
  /// source DB instance uses Transparent Data Encryption for Oracle or
  /// Microsoft SQL Server, you must specify this option when copying across AWS
  /// Regions. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_CopySnapshot.html#USER_CopySnapshot.Options">Option
  /// group considerations</a> in the <i>Amazon RDS User Guide.</i>
  ///
  /// Parameter [preSignedUrl] :
  /// The URL that contains a Signature Version 4 signed request for the
  /// <code>CopyDBSnapshot</code> API action in the source AWS Region that
  /// contains the source DB snapshot to copy.
  ///
  /// You must specify this parameter when you copy an encrypted DB snapshot
  /// from another AWS Region by using the Amazon RDS API. Don't specify
  /// <code>PreSignedUrl</code> when you are copying an encrypted DB snapshot in
  /// the same AWS Region.
  ///
  /// The presigned URL must be a valid request for the
  /// <code>CopyDBSnapshot</code> API action that can be executed in the source
  /// AWS Region that contains the encrypted DB snapshot to be copied. The
  /// presigned URL request must contain the following parameter values:
  ///
  /// <ul>
  /// <li>
  /// <code>DestinationRegion</code> - The AWS Region that the encrypted DB
  /// snapshot is copied to. This AWS Region is the same one where the
  /// <code>CopyDBSnapshot</code> action is called that contains this presigned
  /// URL.
  ///
  /// For example, if you copy an encrypted DB snapshot from the us-west-2 AWS
  /// Region to the us-east-1 AWS Region, then you call the
  /// <code>CopyDBSnapshot</code> action in the us-east-1 AWS Region and provide
  /// a presigned URL that contains a call to the <code>CopyDBSnapshot</code>
  /// action in the us-west-2 AWS Region. For this example, the
  /// <code>DestinationRegion</code> in the presigned URL must be set to the
  /// us-east-1 AWS Region.
  /// </li>
  /// <li>
  /// <code>KmsKeyId</code> - The AWS KMS key identifier for the customer master
  /// key (CMK) to use to encrypt the copy of the DB snapshot in the destination
  /// AWS Region. This is the same identifier for both the
  /// <code>CopyDBSnapshot</code> action that is called in the destination AWS
  /// Region, and the action contained in the presigned URL.
  /// </li>
  /// <li>
  /// <code>SourceDBSnapshotIdentifier</code> - The DB snapshot identifier for
  /// the encrypted snapshot to be copied. This identifier must be in the Amazon
  /// Resource Name (ARN) format for the source AWS Region. For example, if you
  /// are copying an encrypted DB snapshot from the us-west-2 AWS Region, then
  /// your <code>SourceDBSnapshotIdentifier</code> looks like the following
  /// example:
  /// <code>arn:aws:rds:us-west-2:123456789012:snapshot:mysql-instance1-snapshot-20161115</code>.
  /// </li>
  /// </ul>
  /// To learn how to generate a Signature Version 4 signed request, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-query-string-auth.html">Authenticating
  /// Requests: Using Query Parameters (AWS Signature Version 4)</a> and <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature
  /// Version 4 Signing Process</a>.
  /// <note>
  /// If you are using an AWS SDK tool or the AWS CLI, you can specify
  /// <code>SourceRegion</code> (or <code>--source-region</code> for the AWS
  /// CLI) instead of specifying <code>PreSignedUrl</code> manually. Specifying
  /// <code>SourceRegion</code> autogenerates a pre-signed URL that is a valid
  /// request for the operation that can be executed in the source AWS Region.
  /// </note><note>
  /// If you supply a value for this operation's <code>SourceRegion</code>
  /// parameter, a pre-signed URL will be calculated on your behalf.
  /// </note>
  ///
  /// Parameter [sourceRegion] :
  /// The ID of the region that contains the snapshot to be copied.
  ///
  /// Parameter [targetCustomAvailabilityZone] :
  /// The external custom Availability Zone (CAZ) identifier for the target CAZ.
  ///
  /// Example: <code>rds-caz-aiqhTgQv</code>.
  Future<CopyDBSnapshotResult> copyDBSnapshot({
    required String sourceDBSnapshotIdentifier,
    required String targetDBSnapshotIdentifier,
    bool? copyTags,
    String? kmsKeyId,
    String? optionGroupName,
    String? preSignedUrl,
    String? sourceRegion,
    List<Tag>? tags,
    String? targetCustomAvailabilityZone,
  }) async {
    ArgumentError.checkNotNull(
        sourceDBSnapshotIdentifier, 'sourceDBSnapshotIdentifier');
    ArgumentError.checkNotNull(
        targetDBSnapshotIdentifier, 'targetDBSnapshotIdentifier');
    final $request = <String, dynamic>{};
    $request['SourceDBSnapshotIdentifier'] = sourceDBSnapshotIdentifier;
    $request['TargetDBSnapshotIdentifier'] = targetDBSnapshotIdentifier;
    copyTags?.also((arg) => $request['CopyTags'] = arg);
    kmsKeyId?.also((arg) => $request['KmsKeyId'] = arg);
    optionGroupName?.also((arg) => $request['OptionGroupName'] = arg);
    preSignedUrl?.also((arg) => $request['PreSignedUrl'] = arg);
    sourceRegion?.also((arg) => $request['SourceRegion'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    targetCustomAvailabilityZone
        ?.also((arg) => $request['TargetCustomAvailabilityZone'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CopyDBSnapshot',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CopyDBSnapshotMessage'],
      shapes: shapes,
      resultWrapper: 'CopyDBSnapshotResult',
    );
    return CopyDBSnapshotResult.fromXml($result);
  }

  /// Copies the specified option group.
  ///
  /// May throw [OptionGroupAlreadyExistsFault].
  /// May throw [OptionGroupNotFoundFault].
  /// May throw [OptionGroupQuotaExceededFault].
  ///
  /// Parameter [sourceOptionGroupIdentifier] :
  /// The identifier for the source option group.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must specify a valid option group.
  /// </li>
  /// </ul>
  ///
  /// Parameter [targetOptionGroupDescription] :
  /// The description for the copied option group.
  ///
  /// Parameter [targetOptionGroupIdentifier] :
  /// The identifier for the copied option group.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Can't be null, empty, or blank
  /// </li>
  /// <li>
  /// Must contain from 1 to 255 letters, numbers, or hyphens
  /// </li>
  /// <li>
  /// First character must be a letter
  /// </li>
  /// <li>
  /// Can't end with a hyphen or contain two consecutive hyphens
  /// </li>
  /// </ul>
  /// Example: <code>my-option-group</code>
  Future<CopyOptionGroupResult> copyOptionGroup({
    required String sourceOptionGroupIdentifier,
    required String targetOptionGroupDescription,
    required String targetOptionGroupIdentifier,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(
        sourceOptionGroupIdentifier, 'sourceOptionGroupIdentifier');
    ArgumentError.checkNotNull(
        targetOptionGroupDescription, 'targetOptionGroupDescription');
    ArgumentError.checkNotNull(
        targetOptionGroupIdentifier, 'targetOptionGroupIdentifier');
    final $request = <String, dynamic>{};
    $request['SourceOptionGroupIdentifier'] = sourceOptionGroupIdentifier;
    $request['TargetOptionGroupDescription'] = targetOptionGroupDescription;
    $request['TargetOptionGroupIdentifier'] = targetOptionGroupIdentifier;
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CopyOptionGroup',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CopyOptionGroupMessage'],
      shapes: shapes,
      resultWrapper: 'CopyOptionGroupResult',
    );
    return CopyOptionGroupResult.fromXml($result);
  }

  /// Creates a custom Availability Zone (AZ).
  ///
  /// A custom AZ is an on-premises AZ that is integrated with a VMware vSphere
  /// cluster.
  ///
  /// For more information about RDS on VMware, see the <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/RDSonVMwareUserGuide/rds-on-vmware.html">
  /// RDS on VMware User Guide.</a>
  ///
  /// May throw [CustomAvailabilityZoneAlreadyExistsFault].
  /// May throw [CustomAvailabilityZoneQuotaExceededFault].
  /// May throw [KMSKeyNotAccessibleFault].
  ///
  /// Parameter [customAvailabilityZoneName] :
  /// The name of the custom Availability Zone (AZ).
  ///
  /// Parameter [existingVpnId] :
  /// The ID of an existing virtual private network (VPN) between the Amazon RDS
  /// website and the VMware vSphere cluster.
  ///
  /// Parameter [newVpnTunnelName] :
  /// The name of a new VPN tunnel between the Amazon RDS website and the VMware
  /// vSphere cluster.
  ///
  /// Specify this parameter only if <code>ExistingVpnId</code> isn't specified.
  ///
  /// Parameter [vpnTunnelOriginatorIP] :
  /// The IP address of network traffic from your on-premises data center. A
  /// custom AZ receives the network traffic.
  ///
  /// Specify this parameter only if <code>ExistingVpnId</code> isn't specified.
  Future<CreateCustomAvailabilityZoneResult> createCustomAvailabilityZone({
    required String customAvailabilityZoneName,
    String? existingVpnId,
    String? newVpnTunnelName,
    String? vpnTunnelOriginatorIP,
  }) async {
    ArgumentError.checkNotNull(
        customAvailabilityZoneName, 'customAvailabilityZoneName');
    final $request = <String, dynamic>{};
    $request['CustomAvailabilityZoneName'] = customAvailabilityZoneName;
    existingVpnId?.also((arg) => $request['ExistingVpnId'] = arg);
    newVpnTunnelName?.also((arg) => $request['NewVpnTunnelName'] = arg);
    vpnTunnelOriginatorIP
        ?.also((arg) => $request['VpnTunnelOriginatorIP'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateCustomAvailabilityZone',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateCustomAvailabilityZoneMessage'],
      shapes: shapes,
      resultWrapper: 'CreateCustomAvailabilityZoneResult',
    );
    return CreateCustomAvailabilityZoneResult.fromXml($result);
  }

  /// Creates a new Amazon Aurora DB cluster.
  ///
  /// You can use the <code>ReplicationSourceIdentifier</code> parameter to
  /// create the DB cluster as a read replica of another DB cluster or Amazon
  /// RDS MySQL DB instance. For cross-region replication where the DB cluster
  /// identified by <code>ReplicationSourceIdentifier</code> is encrypted, you
  /// must also specify the <code>PreSignedUrl</code> parameter.
  ///
  /// For more information on Amazon Aurora, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
  /// What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i>
  /// <note>
  /// This action only applies to Aurora DB clusters.
  /// </note>
  ///
  /// May throw [DBClusterAlreadyExistsFault].
  /// May throw [InsufficientStorageClusterCapacityFault].
  /// May throw [DBClusterQuotaExceededFault].
  /// May throw [StorageQuotaExceededFault].
  /// May throw [DBSubnetGroupNotFoundFault].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [InvalidDBSubnetGroupStateFault].
  /// May throw [InvalidSubnet].
  /// May throw [InvalidDBInstanceStateFault].
  /// May throw [DBClusterParameterGroupNotFoundFault].
  /// May throw [KMSKeyNotAccessibleFault].
  /// May throw [DBClusterNotFoundFault].
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [DBSubnetGroupDoesNotCoverEnoughAZs].
  /// May throw [GlobalClusterNotFoundFault].
  /// May throw [InvalidGlobalClusterStateFault].
  /// May throw [DomainNotFoundFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The DB cluster identifier. This parameter is stored as a lowercase string.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 1 to 63 letters, numbers, or hyphens.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Can't end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul>
  /// Example: <code>my-cluster1</code>
  ///
  /// Parameter [engine] :
  /// The name of the database engine to be used for this DB cluster.
  ///
  /// Valid Values: <code>aurora</code> (for MySQL 5.6-compatible Aurora),
  /// <code>aurora-mysql</code> (for MySQL 5.7-compatible Aurora), and
  /// <code>aurora-postgresql</code>
  ///
  /// Parameter [availabilityZones] :
  /// A list of Availability Zones (AZs) where instances in the DB cluster can
  /// be created. For information on AWS Regions and Availability Zones, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Concepts.RegionsAndAvailabilityZones.html">Choosing
  /// the Regions and Availability Zones</a> in the <i>Amazon Aurora User
  /// Guide</i>.
  ///
  /// Parameter [backtrackWindow] :
  /// The target backtrack window, in seconds. To disable backtracking, set this
  /// value to 0.
  /// <note>
  /// Currently, Backtrack is only supported for Aurora MySQL DB clusters.
  /// </note>
  /// Default: 0
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If specified, this value must be set to a number from 0 to 259,200 (72
  /// hours).
  /// </li>
  /// </ul>
  ///
  /// Parameter [backupRetentionPeriod] :
  /// The number of days for which automated backups are retained.
  ///
  /// Default: 1
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be a value from 1 to 35
  /// </li>
  /// </ul>
  ///
  /// Parameter [characterSetName] :
  /// A value that indicates that the DB cluster should be associated with the
  /// specified CharacterSet.
  ///
  /// Parameter [copyTagsToSnapshot] :
  /// A value that indicates whether to copy all tags from the DB cluster to
  /// snapshots of the DB cluster. The default is not to copy them.
  ///
  /// Parameter [dBClusterParameterGroupName] :
  /// The name of the DB cluster parameter group to associate with this DB
  /// cluster. If you do not specify a value, then the default DB cluster
  /// parameter group for the specified DB engine and version is used.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If supplied, must match the name of an existing DB cluster parameter
  /// group.
  /// </li>
  /// </ul>
  ///
  /// Parameter [dBSubnetGroupName] :
  /// A DB subnet group to associate with this DB cluster.
  ///
  /// Constraints: Must match the name of an existing DBSubnetGroup. Must not be
  /// default.
  ///
  /// Example: <code>mySubnetgroup</code>
  ///
  /// Parameter [databaseName] :
  /// The name for your database of up to 64 alphanumeric characters. If you do
  /// not provide a name, Amazon RDS doesn't create a database in the DB cluster
  /// you are creating.
  ///
  /// Parameter [deletionProtection] :
  /// A value that indicates whether the DB cluster has deletion protection
  /// enabled. The database can't be deleted when deletion protection is
  /// enabled. By default, deletion protection is disabled.
  ///
  /// Parameter [domain] :
  /// The Active Directory directory ID to create the DB cluster in.
  ///
  /// For Amazon Aurora DB clusters, Amazon RDS can use Kerberos Authentication
  /// to authenticate users that connect to the DB cluster. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/kerberos-authentication.html">Kerberos
  /// Authentication</a> in the <i>Amazon Aurora User Guide</i>.
  ///
  /// Parameter [domainIAMRoleName] :
  /// Specify the name of the IAM role to be used when making API calls to the
  /// Directory Service.
  ///
  /// Parameter [enableCloudwatchLogsExports] :
  /// The list of log types that need to be enabled for exporting to CloudWatch
  /// Logs. The values in the list depend on the DB engine being used. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_LogAccess.html#USER_LogAccess.Procedural.UploadtoCloudWatch">Publishing
  /// Database Logs to Amazon CloudWatch Logs</a> in the <i>Amazon Aurora User
  /// Guide</i>.
  ///
  /// <b>Aurora MySQL</b>
  ///
  /// Possible values are <code>audit</code>, <code>error</code>,
  /// <code>general</code>, and <code>slowquery</code>.
  ///
  /// <b>Aurora PostgreSQL</b>
  ///
  /// Possible values are <code>postgresql</code> and <code>upgrade</code>.
  ///
  /// Parameter [enableGlobalWriteForwarding] :
  /// A value that indicates whether to enable write operations to be forwarded
  /// from this cluster to the primary cluster in an Aurora global database. The
  /// resulting changes are replicated back to this cluster. This parameter only
  /// applies to DB clusters that are secondary clusters in an Aurora global
  /// database. By default, Aurora disallows write operations for secondary
  /// clusters.
  ///
  /// Parameter [enableHttpEndpoint] :
  /// A value that indicates whether to enable the HTTP endpoint for an Aurora
  /// Serverless DB cluster. By default, the HTTP endpoint is disabled.
  ///
  /// When enabled, the HTTP endpoint provides a connectionless web service API
  /// for running SQL queries on the Aurora Serverless DB cluster. You can also
  /// query your database from inside the RDS console with the query editor.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/data-api.html">Using
  /// the Data API for Aurora Serverless</a> in the <i>Amazon Aurora User
  /// Guide</i>.
  ///
  /// Parameter [enableIAMDatabaseAuthentication] :
  /// A value that indicates whether to enable mapping of AWS Identity and
  /// Access Management (IAM) accounts to database accounts. By default, mapping
  /// is disabled.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/UsingWithRDS.IAMDBAuth.html">
  /// IAM Database Authentication</a> in the <i>Amazon Aurora User Guide.</i>
  ///
  /// Parameter [engineMode] :
  /// The DB engine mode of the DB cluster, either <code>provisioned</code>
  /// <code>serverless</code>, <code>parallelquery</code>, <code>global</code>,
  /// or <code>multimaster</code>.
  ///
  /// The <code>parallelquery</code> engine mode isn't required for Aurora MySQL
  /// version 1.23 and higher 1.x versions, and version 2.09 and higher 2.x
  /// versions.
  ///
  /// The <code>global</code> engine mode isn't required for Aurora MySQL
  /// version 1.22 and higher 1.x versions, and <code>global</code> engine mode
  /// isn't required for any 2.x versions.
  ///
  /// The <code>multimaster</code> engine mode only applies for DB clusters
  /// created with Aurora MySQL version 5.6.10a.
  ///
  /// For Aurora PostgreSQL, the <code>global</code> engine mode isn't required,
  /// and both the <code>parallelquery</code> and the <code>multimaster</code>
  /// engine modes currently aren't supported.
  ///
  /// Limitations and requirements apply to some DB engine modes. For more
  /// information, see the following sections in the <i>Amazon Aurora User
  /// Guide</i>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.html#aurora-serverless.limitations">
  /// Limitations of Aurora Serverless</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-mysql-parallel-query.html#aurora-mysql-parallel-query-limitations">
  /// Limitations of Parallel Query</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-global-database.html#aurora-global-database.limitations">
  /// Limitations of Aurora Global Databases</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-multi-master.html#aurora-multi-master-limitations">
  /// Limitations of Multi-Master Clusters</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [engineVersion] :
  /// The version number of the database engine to use.
  ///
  /// To list all of the available engine versions for <code>aurora</code> (for
  /// MySQL 5.6-compatible Aurora), use the following command:
  ///
  /// <code>aws rds describe-db-engine-versions --engine aurora --query
  /// "DBEngineVersions[].EngineVersion"</code>
  ///
  /// To list all of the available engine versions for <code>aurora-mysql</code>
  /// (for MySQL 5.7-compatible Aurora), use the following command:
  ///
  /// <code>aws rds describe-db-engine-versions --engine aurora-mysql --query
  /// "DBEngineVersions[].EngineVersion"</code>
  ///
  /// To list all of the available engine versions for
  /// <code>aurora-postgresql</code>, use the following command:
  ///
  /// <code>aws rds describe-db-engine-versions --engine aurora-postgresql
  /// --query "DBEngineVersions[].EngineVersion"</code>
  ///
  /// <b>Aurora MySQL</b>
  ///
  /// Example: <code>5.6.10a</code>, <code>5.6.mysql_aurora.1.19.2</code>,
  /// <code>5.7.12</code>, <code>5.7.mysql_aurora.2.04.5</code>
  ///
  /// <b>Aurora PostgreSQL</b>
  ///
  /// Example: <code>9.6.3</code>, <code>10.7</code>
  ///
  /// Parameter [globalClusterIdentifier] :
  /// The global cluster ID of an Aurora cluster that becomes the primary
  /// cluster in the new global database cluster.
  ///
  /// Parameter [kmsKeyId] :
  /// The AWS KMS key identifier for an encrypted DB cluster.
  ///
  /// The AWS KMS key identifier is the key ARN, key ID, alias ARN, or alias
  /// name for the AWS KMS customer master key (CMK). To use a CMK in a
  /// different AWS account, specify the key ARN or alias ARN.
  ///
  /// When a CMK isn't specified in <code>KmsKeyId</code>:
  ///
  /// <ul>
  /// <li>
  /// If <code>ReplicationSourceIdentifier</code> identifies an encrypted
  /// source, then Amazon RDS will use the CMK used to encrypt the source.
  /// Otherwise, Amazon RDS will use your default CMK.
  /// </li>
  /// <li>
  /// If the <code>StorageEncrypted</code> parameter is enabled and
  /// <code>ReplicationSourceIdentifier</code> isn't specified, then Amazon RDS
  /// will use your default CMK.
  /// </li>
  /// </ul>
  /// There is a default CMK for your AWS account. Your AWS account has a
  /// different default CMK for each AWS Region.
  ///
  /// If you create a read replica of an encrypted DB cluster in another AWS
  /// Region, you must set <code>KmsKeyId</code> to a AWS KMS key identifier
  /// that is valid in the destination AWS Region. This CMK is used to encrypt
  /// the read replica in that AWS Region.
  ///
  /// Parameter [masterUserPassword] :
  /// The password for the master database user. This password can contain any
  /// printable ASCII character except "/", """, or "@".
  ///
  /// Constraints: Must contain from 8 to 41 characters.
  ///
  /// Parameter [masterUsername] :
  /// The name of the master user for the DB cluster.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be 1 to 16 letters or numbers.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Can't be a reserved word for the chosen database engine.
  /// </li>
  /// </ul>
  ///
  /// Parameter [optionGroupName] :
  /// A value that indicates that the DB cluster should be associated with the
  /// specified option group.
  ///
  /// Permanent options can't be removed from an option group. The option group
  /// can't be removed from a DB cluster once it is associated with a DB
  /// cluster.
  ///
  /// Parameter [port] :
  /// The port number on which the instances in the DB cluster accept
  /// connections.
  ///
  /// Default: <code>3306</code> if engine is set as aurora or <code>5432</code>
  /// if set to aurora-postgresql.
  ///
  /// Parameter [preSignedUrl] :
  /// A URL that contains a Signature Version 4 signed request for the
  /// <code>CreateDBCluster</code> action to be called in the source AWS Region
  /// where the DB cluster is replicated from. You only need to specify
  /// <code>PreSignedUrl</code> when you are performing cross-region replication
  /// from an encrypted DB cluster.
  ///
  /// The pre-signed URL must be a valid request for the
  /// <code>CreateDBCluster</code> API action that can be executed in the source
  /// AWS Region that contains the encrypted DB cluster to be copied.
  ///
  /// The pre-signed URL request must contain the following parameter values:
  ///
  /// <ul>
  /// <li>
  /// <code>KmsKeyId</code> - The AWS KMS key identifier for the key to use to
  /// encrypt the copy of the DB cluster in the destination AWS Region. This
  /// should refer to the same AWS KMS CMK for both the
  /// <code>CreateDBCluster</code> action that is called in the destination AWS
  /// Region, and the action contained in the pre-signed URL.
  /// </li>
  /// <li>
  /// <code>DestinationRegion</code> - The name of the AWS Region that Aurora
  /// read replica will be created in.
  /// </li>
  /// <li>
  /// <code>ReplicationSourceIdentifier</code> - The DB cluster identifier for
  /// the encrypted DB cluster to be copied. This identifier must be in the
  /// Amazon Resource Name (ARN) format for the source AWS Region. For example,
  /// if you are copying an encrypted DB cluster from the us-west-2 AWS Region,
  /// then your <code>ReplicationSourceIdentifier</code> would look like
  /// Example:
  /// <code>arn:aws:rds:us-west-2:123456789012:cluster:aurora-cluster1</code>.
  /// </li>
  /// </ul>
  /// To learn how to generate a Signature Version 4 signed request, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-query-string-auth.html">
  /// Authenticating Requests: Using Query Parameters (AWS Signature Version
  /// 4)</a> and <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">
  /// Signature Version 4 Signing Process</a>.
  /// <note>
  /// If you are using an AWS SDK tool or the AWS CLI, you can specify
  /// <code>SourceRegion</code> (or <code>--source-region</code> for the AWS
  /// CLI) instead of specifying <code>PreSignedUrl</code> manually. Specifying
  /// <code>SourceRegion</code> autogenerates a pre-signed URL that is a valid
  /// request for the operation that can be executed in the source AWS Region.
  /// </note><note>
  /// If you supply a value for this operation's <code>SourceRegion</code>
  /// parameter, a pre-signed URL will be calculated on your behalf.
  /// </note>
  ///
  /// Parameter [preferredBackupWindow] :
  /// The daily time range during which automated backups are created if
  /// automated backups are enabled using the <code>BackupRetentionPeriod</code>
  /// parameter.
  ///
  /// The default is a 30-minute window selected at random from an 8-hour block
  /// of time for each AWS Region. To see the time blocks available, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_UpgradeDBInstance.Maintenance.html#AdjustingTheMaintenanceWindow.Aurora">
  /// Adjusting the Preferred DB Cluster Maintenance Window</a> in the <i>Amazon
  /// Aurora User Guide.</i>
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be in the format <code>hh24:mi-hh24:mi</code>.
  /// </li>
  /// <li>
  /// Must be in Universal Coordinated Time (UTC).
  /// </li>
  /// <li>
  /// Must not conflict with the preferred maintenance window.
  /// </li>
  /// <li>
  /// Must be at least 30 minutes.
  /// </li>
  /// </ul>
  ///
  /// Parameter [preferredMaintenanceWindow] :
  /// The weekly time range during which system maintenance can occur, in
  /// Universal Coordinated Time (UTC).
  ///
  /// Format: <code>ddd:hh24:mi-ddd:hh24:mi</code>
  ///
  /// The default is a 30-minute window selected at random from an 8-hour block
  /// of time for each AWS Region, occurring on a random day of the week. To see
  /// the time blocks available, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_UpgradeDBInstance.Maintenance.html#AdjustingTheMaintenanceWindow.Aurora">
  /// Adjusting the Preferred DB Cluster Maintenance Window</a> in the <i>Amazon
  /// Aurora User Guide.</i>
  ///
  /// Valid Days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.
  ///
  /// Constraints: Minimum 30-minute window.
  ///
  /// Parameter [replicationSourceIdentifier] :
  /// The Amazon Resource Name (ARN) of the source DB instance or DB cluster if
  /// this DB cluster is created as a read replica.
  ///
  /// Parameter [scalingConfiguration] :
  /// For DB clusters in <code>serverless</code> DB engine mode, the scaling
  /// properties of the DB cluster.
  ///
  /// Parameter [sourceRegion] :
  /// The ID of the region that contains the source for the read replica.
  ///
  /// Parameter [storageEncrypted] :
  /// A value that indicates whether the DB cluster is encrypted.
  ///
  /// Parameter [tags] :
  /// Tags to assign to the DB cluster.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// A list of EC2 VPC security groups to associate with this DB cluster.
  Future<CreateDBClusterResult> createDBCluster({
    required String dBClusterIdentifier,
    required String engine,
    List<String>? availabilityZones,
    int? backtrackWindow,
    int? backupRetentionPeriod,
    String? characterSetName,
    bool? copyTagsToSnapshot,
    String? dBClusterParameterGroupName,
    String? dBSubnetGroupName,
    String? databaseName,
    bool? deletionProtection,
    String? domain,
    String? domainIAMRoleName,
    List<String>? enableCloudwatchLogsExports,
    bool? enableGlobalWriteForwarding,
    bool? enableHttpEndpoint,
    bool? enableIAMDatabaseAuthentication,
    String? engineMode,
    String? engineVersion,
    String? globalClusterIdentifier,
    String? kmsKeyId,
    String? masterUserPassword,
    String? masterUsername,
    String? optionGroupName,
    int? port,
    String? preSignedUrl,
    String? preferredBackupWindow,
    String? preferredMaintenanceWindow,
    String? replicationSourceIdentifier,
    ScalingConfiguration? scalingConfiguration,
    String? sourceRegion,
    bool? storageEncrypted,
    List<Tag>? tags,
    List<String>? vpcSecurityGroupIds,
  }) async {
    ArgumentError.checkNotNull(dBClusterIdentifier, 'dBClusterIdentifier');
    ArgumentError.checkNotNull(engine, 'engine');
    final $request = <String, dynamic>{};
    $request['DBClusterIdentifier'] = dBClusterIdentifier;
    $request['Engine'] = engine;
    availabilityZones?.also((arg) => $request['AvailabilityZones'] = arg);
    backtrackWindow?.also((arg) => $request['BacktrackWindow'] = arg);
    backupRetentionPeriod
        ?.also((arg) => $request['BackupRetentionPeriod'] = arg);
    characterSetName?.also((arg) => $request['CharacterSetName'] = arg);
    copyTagsToSnapshot?.also((arg) => $request['CopyTagsToSnapshot'] = arg);
    dBClusterParameterGroupName
        ?.also((arg) => $request['DBClusterParameterGroupName'] = arg);
    dBSubnetGroupName?.also((arg) => $request['DBSubnetGroupName'] = arg);
    databaseName?.also((arg) => $request['DatabaseName'] = arg);
    deletionProtection?.also((arg) => $request['DeletionProtection'] = arg);
    domain?.also((arg) => $request['Domain'] = arg);
    domainIAMRoleName?.also((arg) => $request['DomainIAMRoleName'] = arg);
    enableCloudwatchLogsExports
        ?.also((arg) => $request['EnableCloudwatchLogsExports'] = arg);
    enableGlobalWriteForwarding
        ?.also((arg) => $request['EnableGlobalWriteForwarding'] = arg);
    enableHttpEndpoint?.also((arg) => $request['EnableHttpEndpoint'] = arg);
    enableIAMDatabaseAuthentication
        ?.also((arg) => $request['EnableIAMDatabaseAuthentication'] = arg);
    engineMode?.also((arg) => $request['EngineMode'] = arg);
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
    globalClusterIdentifier
        ?.also((arg) => $request['GlobalClusterIdentifier'] = arg);
    kmsKeyId?.also((arg) => $request['KmsKeyId'] = arg);
    masterUserPassword?.also((arg) => $request['MasterUserPassword'] = arg);
    masterUsername?.also((arg) => $request['MasterUsername'] = arg);
    optionGroupName?.also((arg) => $request['OptionGroupName'] = arg);
    port?.also((arg) => $request['Port'] = arg);
    preSignedUrl?.also((arg) => $request['PreSignedUrl'] = arg);
    preferredBackupWindow
        ?.also((arg) => $request['PreferredBackupWindow'] = arg);
    preferredMaintenanceWindow
        ?.also((arg) => $request['PreferredMaintenanceWindow'] = arg);
    replicationSourceIdentifier
        ?.also((arg) => $request['ReplicationSourceIdentifier'] = arg);
    scalingConfiguration?.also((arg) => $request['ScalingConfiguration'] = arg);
    sourceRegion?.also((arg) => $request['SourceRegion'] = arg);
    storageEncrypted?.also((arg) => $request['StorageEncrypted'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    vpcSecurityGroupIds?.also((arg) => $request['VpcSecurityGroupIds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateDBCluster',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateDBClusterMessage'],
      shapes: shapes,
      resultWrapper: 'CreateDBClusterResult',
    );
    return CreateDBClusterResult.fromXml($result);
  }

  /// Creates a new custom endpoint and associates it with an Amazon Aurora DB
  /// cluster.
  /// <note>
  /// This action only applies to Aurora DB clusters.
  /// </note>
  ///
  /// May throw [DBClusterEndpointQuotaExceededFault].
  /// May throw [DBClusterEndpointAlreadyExistsFault].
  /// May throw [DBClusterNotFoundFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [InvalidDBInstanceStateFault].
  ///
  /// Parameter [dBClusterEndpointIdentifier] :
  /// The identifier to use for the new endpoint. This parameter is stored as a
  /// lowercase string.
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The DB cluster identifier of the DB cluster associated with the endpoint.
  /// This parameter is stored as a lowercase string.
  ///
  /// Parameter [endpointType] :
  /// The type of the endpoint. One of: <code>READER</code>,
  /// <code>WRITER</code>, <code>ANY</code>.
  ///
  /// Parameter [excludedMembers] :
  /// List of DB instance identifiers that aren't part of the custom endpoint
  /// group. All other eligible instances are reachable through the custom
  /// endpoint. Only relevant if the list of static members is empty.
  ///
  /// Parameter [staticMembers] :
  /// List of DB instance identifiers that are part of the custom endpoint
  /// group.
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the Amazon RDS resource.
  Future<DBClusterEndpoint> createDBClusterEndpoint({
    required String dBClusterEndpointIdentifier,
    required String dBClusterIdentifier,
    required String endpointType,
    List<String>? excludedMembers,
    List<String>? staticMembers,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(
        dBClusterEndpointIdentifier, 'dBClusterEndpointIdentifier');
    ArgumentError.checkNotNull(dBClusterIdentifier, 'dBClusterIdentifier');
    ArgumentError.checkNotNull(endpointType, 'endpointType');
    final $request = <String, dynamic>{};
    $request['DBClusterEndpointIdentifier'] = dBClusterEndpointIdentifier;
    $request['DBClusterIdentifier'] = dBClusterIdentifier;
    $request['EndpointType'] = endpointType;
    excludedMembers?.also((arg) => $request['ExcludedMembers'] = arg);
    staticMembers?.also((arg) => $request['StaticMembers'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateDBClusterEndpoint',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateDBClusterEndpointMessage'],
      shapes: shapes,
      resultWrapper: 'CreateDBClusterEndpointResult',
    );
    return DBClusterEndpoint.fromXml($result);
  }

  /// Creates a new DB cluster parameter group.
  ///
  /// Parameters in a DB cluster parameter group apply to all of the instances
  /// in a DB cluster.
  ///
  /// A DB cluster parameter group is initially created with the default
  /// parameters for the database engine used by instances in the DB cluster. To
  /// provide custom values for any of the parameters, you must modify the group
  /// after creating it using <code>ModifyDBClusterParameterGroup</code>. Once
  /// you've created a DB cluster parameter group, you need to associate it with
  /// your DB cluster using <code>ModifyDBCluster</code>. When you associate a
  /// new DB cluster parameter group with a running DB cluster, you need to
  /// reboot the DB instances in the DB cluster without failover for the new DB
  /// cluster parameter group and associated settings to take effect.
  /// <important>
  /// After you create a DB cluster parameter group, you should wait at least 5
  /// minutes before creating your first DB cluster that uses that DB cluster
  /// parameter group as the default parameter group. This allows Amazon RDS to
  /// fully complete the create action before the DB cluster parameter group is
  /// used as the default for a new DB cluster. This is especially important for
  /// parameters that are critical when creating the default database for a DB
  /// cluster, such as the character set for the default database defined by the
  /// <code>character_set_database</code> parameter. You can use the
  /// <i>Parameter Groups</i> option of the <a
  /// href="https://console.aws.amazon.com/rds/">Amazon RDS console</a> or the
  /// <code>DescribeDBClusterParameters</code> action to verify that your DB
  /// cluster parameter group has been created or modified.
  /// </important>
  /// For more information on Amazon Aurora, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
  /// What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i>
  /// <note>
  /// This action only applies to Aurora DB clusters.
  /// </note>
  ///
  /// May throw [DBParameterGroupQuotaExceededFault].
  /// May throw [DBParameterGroupAlreadyExistsFault].
  ///
  /// Parameter [dBClusterParameterGroupName] :
  /// The name of the DB cluster parameter group.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match the name of an existing DB cluster parameter group.
  /// </li>
  /// </ul> <note>
  /// This value is stored as a lowercase string.
  /// </note>
  ///
  /// Parameter [dBParameterGroupFamily] :
  /// The DB cluster parameter group family name. A DB cluster parameter group
  /// can be associated with one and only one DB cluster parameter group family,
  /// and can be applied only to a DB cluster running a database engine and
  /// engine version compatible with that DB cluster parameter group family.
  ///
  /// <b>Aurora MySQL</b>
  ///
  /// Example: <code>aurora5.6</code>, <code>aurora-mysql5.7</code>
  ///
  /// <b>Aurora PostgreSQL</b>
  ///
  /// Example: <code>aurora-postgresql9.6</code>
  ///
  /// Parameter [description] :
  /// The description for the DB cluster parameter group.
  ///
  /// Parameter [tags] :
  /// Tags to assign to the DB cluster parameter group.
  Future<CreateDBClusterParameterGroupResult> createDBClusterParameterGroup({
    required String dBClusterParameterGroupName,
    required String dBParameterGroupFamily,
    required String description,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(
        dBClusterParameterGroupName, 'dBClusterParameterGroupName');
    ArgumentError.checkNotNull(
        dBParameterGroupFamily, 'dBParameterGroupFamily');
    ArgumentError.checkNotNull(description, 'description');
    final $request = <String, dynamic>{};
    $request['DBClusterParameterGroupName'] = dBClusterParameterGroupName;
    $request['DBParameterGroupFamily'] = dBParameterGroupFamily;
    $request['Description'] = description;
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateDBClusterParameterGroup',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateDBClusterParameterGroupMessage'],
      shapes: shapes,
      resultWrapper: 'CreateDBClusterParameterGroupResult',
    );
    return CreateDBClusterParameterGroupResult.fromXml($result);
  }

  /// Creates a snapshot of a DB cluster. For more information on Amazon Aurora,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
  /// What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i>
  /// <note>
  /// This action only applies to Aurora DB clusters.
  /// </note>
  ///
  /// May throw [DBClusterSnapshotAlreadyExistsFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [DBClusterNotFoundFault].
  /// May throw [SnapshotQuotaExceededFault].
  /// May throw [InvalidDBClusterSnapshotStateFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The identifier of the DB cluster to create a snapshot for. This parameter
  /// isn't case-sensitive.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match the identifier of an existing DBCluster.
  /// </li>
  /// </ul>
  /// Example: <code>my-cluster1</code>
  ///
  /// Parameter [dBClusterSnapshotIdentifier] :
  /// The identifier of the DB cluster snapshot. This parameter is stored as a
  /// lowercase string.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 1 to 63 letters, numbers, or hyphens.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Can't end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul>
  /// Example: <code>my-cluster1-snapshot1</code>
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the DB cluster snapshot.
  Future<CreateDBClusterSnapshotResult> createDBClusterSnapshot({
    required String dBClusterIdentifier,
    required String dBClusterSnapshotIdentifier,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(dBClusterIdentifier, 'dBClusterIdentifier');
    ArgumentError.checkNotNull(
        dBClusterSnapshotIdentifier, 'dBClusterSnapshotIdentifier');
    final $request = <String, dynamic>{};
    $request['DBClusterIdentifier'] = dBClusterIdentifier;
    $request['DBClusterSnapshotIdentifier'] = dBClusterSnapshotIdentifier;
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateDBClusterSnapshot',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateDBClusterSnapshotMessage'],
      shapes: shapes,
      resultWrapper: 'CreateDBClusterSnapshotResult',
    );
    return CreateDBClusterSnapshotResult.fromXml($result);
  }

  /// Creates a new DB instance.
  ///
  /// May throw [DBInstanceAlreadyExistsFault].
  /// May throw [InsufficientDBInstanceCapacityFault].
  /// May throw [DBParameterGroupNotFoundFault].
  /// May throw [DBSecurityGroupNotFoundFault].
  /// May throw [InstanceQuotaExceededFault].
  /// May throw [StorageQuotaExceededFault].
  /// May throw [DBSubnetGroupNotFoundFault].
  /// May throw [DBSubnetGroupDoesNotCoverEnoughAZs].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [InvalidSubnet].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [ProvisionedIopsNotAvailableInAZFault].
  /// May throw [OptionGroupNotFoundFault].
  /// May throw [DBClusterNotFoundFault].
  /// May throw [StorageTypeNotSupportedFault].
  /// May throw [AuthorizationNotFoundFault].
  /// May throw [KMSKeyNotAccessibleFault].
  /// May throw [DomainNotFoundFault].
  /// May throw [BackupPolicyNotFoundFault].
  ///
  /// Parameter [dBInstanceClass] :
  /// The compute and memory capacity of the DB instance, for example,
  /// <code>db.m4.large</code>. Not all DB instance classes are available in all
  /// AWS Regions, or for all database engines. For the full list of DB instance
  /// classes, and availability for your engine, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.DBInstanceClass.html">DB
  /// Instance Class</a> in the <i>Amazon RDS User Guide.</i>
  ///
  /// Parameter [dBInstanceIdentifier] :
  /// The DB instance identifier. This parameter is stored as a lowercase
  /// string.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 1 to 63 letters, numbers, or hyphens.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Can't end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul>
  /// Example: <code>mydbinstance</code>
  ///
  /// Parameter [engine] :
  /// The name of the database engine to be used for this instance.
  ///
  /// Not every database engine is available for every AWS Region.
  ///
  /// Valid Values:
  ///
  /// <ul>
  /// <li>
  /// <code>aurora</code> (for MySQL 5.6-compatible Aurora)
  /// </li>
  /// <li>
  /// <code>aurora-mysql</code> (for MySQL 5.7-compatible Aurora)
  /// </li>
  /// <li>
  /// <code>aurora-postgresql</code>
  /// </li>
  /// <li>
  /// <code>mariadb</code>
  /// </li>
  /// <li>
  /// <code>mysql</code>
  /// </li>
  /// <li>
  /// <code>oracle-ee</code>
  /// </li>
  /// <li>
  /// <code>oracle-se2</code>
  /// </li>
  /// <li>
  /// <code>oracle-se1</code>
  /// </li>
  /// <li>
  /// <code>oracle-se</code>
  /// </li>
  /// <li>
  /// <code>postgres</code>
  /// </li>
  /// <li>
  /// <code>sqlserver-ee</code>
  /// </li>
  /// <li>
  /// <code>sqlserver-se</code>
  /// </li>
  /// <li>
  /// <code>sqlserver-ex</code>
  /// </li>
  /// <li>
  /// <code>sqlserver-web</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [allocatedStorage] :
  /// The amount of storage (in gibibytes) to allocate for the DB instance.
  ///
  /// Type: Integer
  ///
  /// <b>Amazon Aurora</b>
  ///
  /// Not applicable. Aurora cluster volumes automatically grow as the amount of
  /// data in your database increases, though you are only charged for the space
  /// that you use in an Aurora cluster volume.
  ///
  /// <b>MySQL</b>
  ///
  /// Constraints to the amount of storage for each storage type are the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// General Purpose (SSD) storage (gp2): Must be an integer from 20 to 65536.
  /// </li>
  /// <li>
  /// Provisioned IOPS storage (io1): Must be an integer from 100 to 65536.
  /// </li>
  /// <li>
  /// Magnetic storage (standard): Must be an integer from 5 to 3072.
  /// </li>
  /// </ul>
  /// <b>MariaDB</b>
  ///
  /// Constraints to the amount of storage for each storage type are the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// General Purpose (SSD) storage (gp2): Must be an integer from 20 to 65536.
  /// </li>
  /// <li>
  /// Provisioned IOPS storage (io1): Must be an integer from 100 to 65536.
  /// </li>
  /// <li>
  /// Magnetic storage (standard): Must be an integer from 5 to 3072.
  /// </li>
  /// </ul>
  /// <b>PostgreSQL</b>
  ///
  /// Constraints to the amount of storage for each storage type are the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// General Purpose (SSD) storage (gp2): Must be an integer from 20 to 65536.
  /// </li>
  /// <li>
  /// Provisioned IOPS storage (io1): Must be an integer from 100 to 65536.
  /// </li>
  /// <li>
  /// Magnetic storage (standard): Must be an integer from 5 to 3072.
  /// </li>
  /// </ul>
  /// <b>Oracle</b>
  ///
  /// Constraints to the amount of storage for each storage type are the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// General Purpose (SSD) storage (gp2): Must be an integer from 20 to 65536.
  /// </li>
  /// <li>
  /// Provisioned IOPS storage (io1): Must be an integer from 100 to 65536.
  /// </li>
  /// <li>
  /// Magnetic storage (standard): Must be an integer from 10 to 3072.
  /// </li>
  /// </ul>
  /// <b>SQL Server</b>
  ///
  /// Constraints to the amount of storage for each storage type are the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// General Purpose (SSD) storage (gp2):
  ///
  /// <ul>
  /// <li>
  /// Enterprise and Standard editions: Must be an integer from 200 to 16384.
  /// </li>
  /// <li>
  /// Web and Express editions: Must be an integer from 20 to 16384.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Provisioned IOPS storage (io1):
  ///
  /// <ul>
  /// <li>
  /// Enterprise and Standard editions: Must be an integer from 200 to 16384.
  /// </li>
  /// <li>
  /// Web and Express editions: Must be an integer from 100 to 16384.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Magnetic storage (standard):
  ///
  /// <ul>
  /// <li>
  /// Enterprise and Standard editions: Must be an integer from 200 to 1024.
  /// </li>
  /// <li>
  /// Web and Express editions: Must be an integer from 20 to 1024.
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// Parameter [autoMinorVersionUpgrade] :
  /// A value that indicates whether minor engine upgrades are applied
  /// automatically to the DB instance during the maintenance window. By
  /// default, minor engine upgrades are applied automatically.
  ///
  /// Parameter [availabilityZone] :
  /// The Availability Zone (AZ) where the database will be created. For
  /// information on AWS Regions and Availability Zones, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html">Regions
  /// and Availability Zones</a>.
  ///
  /// Default: A random, system-chosen Availability Zone in the endpoint's AWS
  /// Region.
  ///
  /// Example: <code>us-east-1d</code>
  ///
  /// Constraint: The <code>AvailabilityZone</code> parameter can't be specified
  /// if the DB instance is a Multi-AZ deployment. The specified Availability
  /// Zone must be in the same AWS Region as the current endpoint.
  /// <note>
  /// If you're creating a DB instance in an RDS on VMware environment, specify
  /// the identifier of the custom Availability Zone to create the DB instance
  /// in.
  ///
  /// For more information about RDS on VMware, see the <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/RDSonVMwareUserGuide/rds-on-vmware.html">
  /// RDS on VMware User Guide.</a>
  /// </note>
  ///
  /// Parameter [backupRetentionPeriod] :
  /// The number of days for which automated backups are retained. Setting this
  /// parameter to a positive number enables backups. Setting this parameter to
  /// 0 disables automated backups.
  ///
  /// <b>Amazon Aurora</b>
  ///
  /// Not applicable. The retention period for automated backups is managed by
  /// the DB cluster.
  ///
  /// Default: 1
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be a value from 0 to 35
  /// </li>
  /// <li>
  /// Can't be set to 0 if the DB instance is a source to read replicas
  /// </li>
  /// </ul>
  ///
  /// Parameter [characterSetName] :
  /// For supported engines, indicates that the DB instance should be associated
  /// with the specified CharacterSet.
  ///
  /// <b>Amazon Aurora</b>
  ///
  /// Not applicable. The character set is managed by the DB cluster. For more
  /// information, see <code>CreateDBCluster</code>.
  ///
  /// Parameter [copyTagsToSnapshot] :
  /// A value that indicates whether to copy tags from the DB instance to
  /// snapshots of the DB instance. By default, tags are not copied.
  ///
  /// <b>Amazon Aurora</b>
  ///
  /// Not applicable. Copying tags to snapshots is managed by the DB cluster.
  /// Setting this value for an Aurora DB instance has no effect on the DB
  /// cluster setting.
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The identifier of the DB cluster that the instance will belong to.
  ///
  /// Parameter [dBName] :
  /// The meaning of this parameter differs according to the database engine you
  /// use.
  ///
  /// <b>MySQL</b>
  ///
  /// The name of the database to create when the DB instance is created. If
  /// this parameter isn't specified, no database is created in the DB instance.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain 1 to 64 letters or numbers.
  /// </li>
  /// <li>
  /// Must begin with a letter. Subsequent characters can be letters,
  /// underscores, or digits (0-9).
  /// </li>
  /// <li>
  /// Can't be a word reserved by the specified database engine
  /// </li>
  /// </ul>
  /// <b>MariaDB</b>
  ///
  /// The name of the database to create when the DB instance is created. If
  /// this parameter isn't specified, no database is created in the DB instance.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain 1 to 64 letters or numbers.
  /// </li>
  /// <li>
  /// Must begin with a letter. Subsequent characters can be letters,
  /// underscores, or digits (0-9).
  /// </li>
  /// <li>
  /// Can't be a word reserved by the specified database engine
  /// </li>
  /// </ul>
  /// <b>PostgreSQL</b>
  ///
  /// The name of the database to create when the DB instance is created. If
  /// this parameter isn't specified, no database is created in the DB instance.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain 1 to 63 letters, numbers, or underscores.
  /// </li>
  /// <li>
  /// Must begin with a letter. Subsequent characters can be letters,
  /// underscores, or digits (0-9).
  /// </li>
  /// <li>
  /// Can't be a word reserved by the specified database engine
  /// </li>
  /// </ul>
  /// <b>Oracle</b>
  ///
  /// The Oracle System ID (SID) of the created DB instance. If you specify
  /// <code>null</code>, the default value <code>ORCL</code> is used. You can't
  /// specify the string NULL, or any other reserved word, for
  /// <code>DBName</code>.
  ///
  /// Default: <code>ORCL</code>
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Can't be longer than 8 characters
  /// </li>
  /// </ul>
  /// <b>SQL Server</b>
  ///
  /// Not applicable. Must be null.
  ///
  /// <b>Amazon Aurora</b>
  ///
  /// The name of the database to create when the primary instance of the DB
  /// cluster is created. If this parameter isn't specified, no database is
  /// created in the DB instance.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain 1 to 64 letters or numbers.
  /// </li>
  /// <li>
  /// Can't be a word reserved by the specified database engine
  /// </li>
  /// </ul>
  ///
  /// Parameter [dBParameterGroupName] :
  /// The name of the DB parameter group to associate with this DB instance. If
  /// you do not specify a value, then the default DB parameter group for the
  /// specified DB engine and version is used.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be 1 to 255 letters, numbers, or hyphens.
  /// </li>
  /// <li>
  /// First character must be a letter
  /// </li>
  /// <li>
  /// Can't end with a hyphen or contain two consecutive hyphens
  /// </li>
  /// </ul>
  ///
  /// Parameter [dBSecurityGroups] :
  /// A list of DB security groups to associate with this DB instance.
  ///
  /// Default: The default DB security group for the database engine.
  ///
  /// Parameter [dBSubnetGroupName] :
  /// A DB subnet group to associate with this DB instance.
  ///
  /// If there is no DB subnet group, then it is a non-VPC DB instance.
  ///
  /// Parameter [deletionProtection] :
  /// A value that indicates whether the DB instance has deletion protection
  /// enabled. The database can't be deleted when deletion protection is
  /// enabled. By default, deletion protection is disabled. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_DeleteInstance.html">
  /// Deleting a DB Instance</a>.
  ///
  /// <b>Amazon Aurora</b>
  ///
  /// Not applicable. You can enable or disable deletion protection for the DB
  /// cluster. For more information, see <code>CreateDBCluster</code>. DB
  /// instances in a DB cluster can be deleted even when deletion protection is
  /// enabled for the DB cluster.
  ///
  /// Parameter [domain] :
  /// The Active Directory directory ID to create the DB instance in. Currently,
  /// only MySQL, Microsoft SQL Server, Oracle, and PostgreSQL DB instances can
  /// be created in an Active Directory Domain.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/kerberos-authentication.html">
  /// Kerberos Authentication</a> in the <i>Amazon RDS User Guide</i>.
  ///
  /// Parameter [domainIAMRoleName] :
  /// Specify the name of the IAM role to be used when making API calls to the
  /// Directory Service.
  ///
  /// Parameter [enableCloudwatchLogsExports] :
  /// The list of log types that need to be enabled for exporting to CloudWatch
  /// Logs. The values in the list depend on the DB engine being used. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_LogAccess.html#USER_LogAccess.Procedural.UploadtoCloudWatch">Publishing
  /// Database Logs to Amazon CloudWatch Logs </a> in the <i>Amazon Relational
  /// Database Service User Guide</i>.
  ///
  /// <b>Amazon Aurora</b>
  ///
  /// Not applicable. CloudWatch Logs exports are managed by the DB cluster.
  ///
  /// <b>MariaDB</b>
  ///
  /// Possible values are <code>audit</code>, <code>error</code>,
  /// <code>general</code>, and <code>slowquery</code>.
  ///
  /// <b>Microsoft SQL Server</b>
  ///
  /// Possible values are <code>agent</code> and <code>error</code>.
  ///
  /// <b>MySQL</b>
  ///
  /// Possible values are <code>audit</code>, <code>error</code>,
  /// <code>general</code>, and <code>slowquery</code>.
  ///
  /// <b>Oracle</b>
  ///
  /// Possible values are <code>alert</code>, <code>audit</code>,
  /// <code>listener</code>, and <code>trace</code>.
  ///
  /// <b>PostgreSQL</b>
  ///
  /// Possible values are <code>postgresql</code> and <code>upgrade</code>.
  ///
  /// Parameter [enableCustomerOwnedIp] :
  /// A value that indicates whether to enable a customer-owned IP address
  /// (CoIP) for an RDS on Outposts DB instance.
  ///
  /// A <i>CoIP</i> provides local or external connectivity to resources in your
  /// Outpost subnets through your on-premises network. For some use cases, a
  /// CoIP can provide lower latency for connections to the DB instance from
  /// outside of its virtual private cloud (VPC) on your local network.
  ///
  /// For more information about RDS on Outposts, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/rds-on-outposts.html">Working
  /// with Amazon RDS on AWS Outposts</a> in the <i>Amazon RDS User Guide</i>.
  ///
  /// For more information about CoIPs, see <a
  /// href="https://docs.aws.amazon.com/outposts/latest/userguide/outposts-networking-components.html#ip-addressing">Customer-owned
  /// IP addresses</a> in the <i>AWS Outposts User Guide</i>.
  ///
  /// Parameter [enableIAMDatabaseAuthentication] :
  /// A value that indicates whether to enable mapping of AWS Identity and
  /// Access Management (IAM) accounts to database accounts. By default, mapping
  /// is disabled.
  ///
  /// This setting doesn't apply to Amazon Aurora. Mapping AWS IAM accounts to
  /// database accounts is managed by the DB cluster.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.IAMDBAuth.html">
  /// IAM Database Authentication for MySQL and PostgreSQL</a> in the <i>Amazon
  /// RDS User Guide.</i>
  ///
  /// Parameter [enablePerformanceInsights] :
  /// A value that indicates whether to enable Performance Insights for the DB
  /// instance.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PerfInsights.html">Using
  /// Amazon Performance Insights</a> in the <i>Amazon Relational Database
  /// Service User Guide</i>.
  ///
  /// Parameter [engineVersion] :
  /// The version number of the database engine to use.
  ///
  /// For a list of valid engine versions, use the
  /// <code>DescribeDBEngineVersions</code> action.
  ///
  /// The following are the database engines and links to information about the
  /// major and minor versions that are available with Amazon RDS. Not every
  /// database engine is available for every AWS Region.
  ///
  /// <b>Amazon Aurora</b>
  ///
  /// Not applicable. The version number of the database engine to be used by
  /// the DB instance is managed by the DB cluster.
  ///
  /// <b>MariaDB</b>
  ///
  /// See <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_MariaDB.html#MariaDB.Concepts.VersionMgmt">MariaDB
  /// on Amazon RDS Versions</a> in the <i>Amazon RDS User Guide.</i>
  ///
  /// <b>Microsoft SQL Server</b>
  ///
  /// See <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_SQLServer.html#SQLServer.Concepts.General.VersionSupport">Microsoft
  /// SQL Server Versions on Amazon RDS</a> in the <i>Amazon RDS User Guide.</i>
  ///
  /// <b>MySQL</b>
  ///
  /// See <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_MySQL.html#MySQL.Concepts.VersionMgmt">MySQL
  /// on Amazon RDS Versions</a> in the <i>Amazon RDS User Guide.</i>
  ///
  /// <b>Oracle</b>
  ///
  /// See <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Appendix.Oracle.PatchComposition.html">Oracle
  /// Database Engine Release Notes</a> in the <i>Amazon RDS User Guide.</i>
  ///
  /// <b>PostgreSQL</b>
  ///
  /// See <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_PostgreSQL.html#PostgreSQL.Concepts.General.DBVersions">Supported
  /// PostgreSQL Database Versions</a> in the <i>Amazon RDS User Guide.</i>
  ///
  /// Parameter [iops] :
  /// The amount of Provisioned IOPS (input/output operations per second) to be
  /// initially allocated for the DB instance. For information about valid Iops
  /// values, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_Storage.html#USER_PIOPS">Amazon
  /// RDS Provisioned IOPS Storage to Improve Performance</a> in the <i>Amazon
  /// RDS User Guide</i>.
  ///
  /// Constraints: For MariaDB, MySQL, Oracle, and PostgreSQL DB instances, must
  /// be a multiple between .5 and 50 of the storage amount for the DB instance.
  /// For SQL Server DB instances, must be a multiple between 1 and 50 of the
  /// storage amount for the DB instance.
  ///
  /// Parameter [kmsKeyId] :
  /// The AWS KMS key identifier for an encrypted DB instance.
  ///
  /// The AWS KMS key identifier is the key ARN, key ID, alias ARN, or alias
  /// name for the AWS KMS customer master key (CMK). To use a CMK in a
  /// different AWS account, specify the key ARN or alias ARN.
  ///
  /// <b>Amazon Aurora</b>
  ///
  /// Not applicable. The AWS KMS key identifier is managed by the DB cluster.
  /// For more information, see <code>CreateDBCluster</code>.
  ///
  /// If <code>StorageEncrypted</code> is enabled, and you do not specify a
  /// value for the <code>KmsKeyId</code> parameter, then Amazon RDS uses your
  /// default CMK. There is a default CMK for your AWS account. Your AWS account
  /// has a different default CMK for each AWS Region.
  ///
  /// Parameter [licenseModel] :
  /// License model information for this DB instance.
  ///
  /// Valid values: <code>license-included</code> |
  /// <code>bring-your-own-license</code> | <code>general-public-license</code>
  ///
  /// Parameter [masterUserPassword] :
  /// The password for the master user. The password can include any printable
  /// ASCII character except "/", """, or "@".
  ///
  /// <b>Amazon Aurora</b>
  ///
  /// Not applicable. The password for the master user is managed by the DB
  /// cluster.
  ///
  /// <b>MariaDB</b>
  ///
  /// Constraints: Must contain from 8 to 41 characters.
  ///
  /// <b>Microsoft SQL Server</b>
  ///
  /// Constraints: Must contain from 8 to 128 characters.
  ///
  /// <b>MySQL</b>
  ///
  /// Constraints: Must contain from 8 to 41 characters.
  ///
  /// <b>Oracle</b>
  ///
  /// Constraints: Must contain from 8 to 30 characters.
  ///
  /// <b>PostgreSQL</b>
  ///
  /// Constraints: Must contain from 8 to 128 characters.
  ///
  /// Parameter [masterUsername] :
  /// The name for the master user.
  ///
  /// <b>Amazon Aurora</b>
  ///
  /// Not applicable. The name for the master user is managed by the DB cluster.
  ///
  /// <b>MariaDB</b>
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Required for MariaDB.
  /// </li>
  /// <li>
  /// Must be 1 to 16 letters or numbers.
  /// </li>
  /// <li>
  /// Can't be a reserved word for the chosen database engine.
  /// </li>
  /// </ul>
  /// <b>Microsoft SQL Server</b>
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Required for SQL Server.
  /// </li>
  /// <li>
  /// Must be 1 to 128 letters or numbers.
  /// </li>
  /// <li>
  /// The first character must be a letter.
  /// </li>
  /// <li>
  /// Can't be a reserved word for the chosen database engine.
  /// </li>
  /// </ul>
  /// <b>MySQL</b>
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Required for MySQL.
  /// </li>
  /// <li>
  /// Must be 1 to 16 letters or numbers.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Can't be a reserved word for the chosen database engine.
  /// </li>
  /// </ul>
  /// <b>Oracle</b>
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Required for Oracle.
  /// </li>
  /// <li>
  /// Must be 1 to 30 letters or numbers.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Can't be a reserved word for the chosen database engine.
  /// </li>
  /// </ul>
  /// <b>PostgreSQL</b>
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Required for PostgreSQL.
  /// </li>
  /// <li>
  /// Must be 1 to 63 letters or numbers.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Can't be a reserved word for the chosen database engine.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxAllocatedStorage] :
  /// The upper limit to which Amazon RDS can automatically scale the storage of
  /// the DB instance.
  ///
  /// Parameter [monitoringInterval] :
  /// The interval, in seconds, between points when Enhanced Monitoring metrics
  /// are collected for the DB instance. To disable collecting Enhanced
  /// Monitoring metrics, specify 0. The default is 0.
  ///
  /// If <code>MonitoringRoleArn</code> is specified, then you must also set
  /// <code>MonitoringInterval</code> to a value other than 0.
  ///
  /// Valid Values: <code>0, 1, 5, 10, 15, 30, 60</code>
  ///
  /// Parameter [monitoringRoleArn] :
  /// The ARN for the IAM role that permits RDS to send enhanced monitoring
  /// metrics to Amazon CloudWatch Logs. For example,
  /// <code>arn:aws:iam:123456789012:role/emaccess</code>. For information on
  /// creating a monitoring role, go to <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Monitoring.OS.html#USER_Monitoring.OS.Enabling">Setting
  /// Up and Enabling Enhanced Monitoring</a> in the <i>Amazon RDS User
  /// Guide</i>.
  ///
  /// If <code>MonitoringInterval</code> is set to a value other than 0, then
  /// you must supply a <code>MonitoringRoleArn</code> value.
  ///
  /// Parameter [multiAZ] :
  /// A value that indicates whether the DB instance is a Multi-AZ deployment.
  /// You can't set the <code>AvailabilityZone</code> parameter if the DB
  /// instance is a Multi-AZ deployment.
  ///
  /// Parameter [ncharCharacterSetName] :
  /// The name of the NCHAR character set for the Oracle DB instance.
  ///
  /// Parameter [optionGroupName] :
  /// Indicates that the DB instance should be associated with the specified
  /// option group.
  ///
  /// Permanent options, such as the TDE option for Oracle Advanced Security
  /// TDE, can't be removed from an option group. Also, that option group can't
  /// be removed from a DB instance once it is associated with a DB instance
  ///
  /// Parameter [performanceInsightsKMSKeyId] :
  /// The AWS KMS key identifier for encryption of Performance Insights data.
  ///
  /// The AWS KMS key identifier is the key ARN, key ID, alias ARN, or alias
  /// name for the AWS KMS customer master key (CMK).
  ///
  /// If you do not specify a value for
  /// <code>PerformanceInsightsKMSKeyId</code>, then Amazon RDS uses your
  /// default CMK. There is a default CMK for your AWS account. Your AWS account
  /// has a different default CMK for each AWS Region.
  ///
  /// Parameter [performanceInsightsRetentionPeriod] :
  /// The amount of time, in days, to retain Performance Insights data. Valid
  /// values are 7 or 731 (2 years).
  ///
  /// Parameter [port] :
  /// The port number on which the database accepts connections.
  ///
  /// <b>MySQL</b>
  ///
  /// Default: <code>3306</code>
  ///
  /// Valid values: <code>1150-65535</code>
  ///
  /// Type: Integer
  ///
  /// <b>MariaDB</b>
  ///
  /// Default: <code>3306</code>
  ///
  /// Valid values: <code>1150-65535</code>
  ///
  /// Type: Integer
  ///
  /// <b>PostgreSQL</b>
  ///
  /// Default: <code>5432</code>
  ///
  /// Valid values: <code>1150-65535</code>
  ///
  /// Type: Integer
  ///
  /// <b>Oracle</b>
  ///
  /// Default: <code>1521</code>
  ///
  /// Valid values: <code>1150-65535</code>
  ///
  /// <b>SQL Server</b>
  ///
  /// Default: <code>1433</code>
  ///
  /// Valid values: <code>1150-65535</code> except <code>1234</code>,
  /// <code>1434</code>, <code>3260</code>, <code>3343</code>,
  /// <code>3389</code>, <code>47001</code>, and <code>49152-49156</code>.
  ///
  /// <b>Amazon Aurora</b>
  ///
  /// Default: <code>3306</code>
  ///
  /// Valid values: <code>1150-65535</code>
  ///
  /// Type: Integer
  ///
  /// Parameter [preferredBackupWindow] :
  /// The daily time range during which automated backups are created if
  /// automated backups are enabled, using the
  /// <code>BackupRetentionPeriod</code> parameter. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_WorkingWithAutomatedBackups.html#USER_WorkingWithAutomatedBackups.BackupWindow">The
  /// Backup Window</a> in the <i>Amazon RDS User Guide</i>.
  ///
  /// <b>Amazon Aurora</b>
  ///
  /// Not applicable. The daily time range for creating automated backups is
  /// managed by the DB cluster.
  ///
  /// The default is a 30-minute window selected at random from an 8-hour block
  /// of time for each AWS Region. To see the time blocks available, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_UpgradeDBInstance.Maintenance.html#AdjustingTheMaintenanceWindow">
  /// Adjusting the Preferred DB Instance Maintenance Window</a> in the
  /// <i>Amazon RDS User Guide</i>.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be in the format <code>hh24:mi-hh24:mi</code>.
  /// </li>
  /// <li>
  /// Must be in Universal Coordinated Time (UTC).
  /// </li>
  /// <li>
  /// Must not conflict with the preferred maintenance window.
  /// </li>
  /// <li>
  /// Must be at least 30 minutes.
  /// </li>
  /// </ul>
  ///
  /// Parameter [preferredMaintenanceWindow] :
  /// The time range each week during which system maintenance can occur, in
  /// Universal Coordinated Time (UTC). For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_UpgradeDBInstance.Maintenance.html#Concepts.DBMaintenance">Amazon
  /// RDS Maintenance Window</a>.
  ///
  /// Format: <code>ddd:hh24:mi-ddd:hh24:mi</code>
  ///
  /// The default is a 30-minute window selected at random from an 8-hour block
  /// of time for each AWS Region, occurring on a random day of the week.
  ///
  /// Valid Days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.
  ///
  /// Constraints: Minimum 30-minute window.
  ///
  /// Parameter [processorFeatures] :
  /// The number of CPU cores and the number of threads per core for the DB
  /// instance class of the DB instance.
  ///
  /// Parameter [promotionTier] :
  /// A value that specifies the order in which an Aurora Replica is promoted to
  /// the primary instance after a failure of the existing primary instance. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Aurora.Managing.Backups.html#Aurora.Managing.FaultTolerance">
  /// Fault Tolerance for an Aurora DB Cluster</a> in the <i>Amazon Aurora User
  /// Guide</i>.
  ///
  /// Default: 1
  ///
  /// Valid Values: 0 - 15
  ///
  /// Parameter [publiclyAccessible] :
  /// A value that indicates whether the DB instance is publicly accessible.
  ///
  /// When the DB instance is publicly accessible, its DNS endpoint resolves to
  /// the private IP address from within the DB instance's VPC, and to the
  /// public IP address from outside of the DB instance's VPC. Access to the DB
  /// instance is ultimately controlled by the security group it uses, and that
  /// public access is not permitted if the security group assigned to the DB
  /// instance doesn't permit it.
  ///
  /// When the DB instance isn't publicly accessible, it is an internal DB
  /// instance with a DNS name that resolves to a private IP address.
  ///
  /// Default: The default behavior varies depending on whether
  /// <code>DBSubnetGroupName</code> is specified.
  ///
  /// If <code>DBSubnetGroupName</code> isn't specified, and
  /// <code>PubliclyAccessible</code> isn't specified, the following applies:
  ///
  /// <ul>
  /// <li>
  /// If the default VPC in the target region doesn’t have an Internet gateway
  /// attached to it, the DB instance is private.
  /// </li>
  /// <li>
  /// If the default VPC in the target region has an Internet gateway attached
  /// to it, the DB instance is public.
  /// </li>
  /// </ul>
  /// If <code>DBSubnetGroupName</code> is specified, and
  /// <code>PubliclyAccessible</code> isn't specified, the following applies:
  ///
  /// <ul>
  /// <li>
  /// If the subnets are part of a VPC that doesn’t have an Internet gateway
  /// attached to it, the DB instance is private.
  /// </li>
  /// <li>
  /// If the subnets are part of a VPC that has an Internet gateway attached to
  /// it, the DB instance is public.
  /// </li>
  /// </ul>
  ///
  /// Parameter [storageEncrypted] :
  /// A value that indicates whether the DB instance is encrypted. By default,
  /// it isn't encrypted.
  ///
  /// <b>Amazon Aurora</b>
  ///
  /// Not applicable. The encryption for DB instances is managed by the DB
  /// cluster.
  ///
  /// Parameter [storageType] :
  /// Specifies the storage type to be associated with the DB instance.
  ///
  /// Valid values: <code>standard | gp2 | io1</code>
  ///
  /// If you specify <code>io1</code>, you must also include a value for the
  /// <code>Iops</code> parameter.
  ///
  /// Default: <code>io1</code> if the <code>Iops</code> parameter is specified,
  /// otherwise <code>gp2</code>
  ///
  /// Parameter [tags] :
  /// Tags to assign to the DB instance.
  ///
  /// Parameter [tdeCredentialArn] :
  /// The ARN from the key store with which to associate the instance for TDE
  /// encryption.
  ///
  /// Parameter [tdeCredentialPassword] :
  /// The password for the given ARN from the key store in order to access the
  /// device.
  ///
  /// Parameter [timezone] :
  /// The time zone of the DB instance. The time zone parameter is currently
  /// supported only by <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_SQLServer.html#SQLServer.Concepts.General.TimeZone">Microsoft
  /// SQL Server</a>.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// A list of Amazon EC2 VPC security groups to associate with this DB
  /// instance.
  ///
  /// <b>Amazon Aurora</b>
  ///
  /// Not applicable. The associated list of EC2 VPC security groups is managed
  /// by the DB cluster.
  ///
  /// Default: The default EC2 VPC security group for the DB subnet group's VPC.
  Future<CreateDBInstanceResult> createDBInstance({
    required String dBInstanceClass,
    required String dBInstanceIdentifier,
    required String engine,
    int? allocatedStorage,
    bool? autoMinorVersionUpgrade,
    String? availabilityZone,
    int? backupRetentionPeriod,
    String? characterSetName,
    bool? copyTagsToSnapshot,
    String? dBClusterIdentifier,
    String? dBName,
    String? dBParameterGroupName,
    List<String>? dBSecurityGroups,
    String? dBSubnetGroupName,
    bool? deletionProtection,
    String? domain,
    String? domainIAMRoleName,
    List<String>? enableCloudwatchLogsExports,
    bool? enableCustomerOwnedIp,
    bool? enableIAMDatabaseAuthentication,
    bool? enablePerformanceInsights,
    String? engineVersion,
    int? iops,
    String? kmsKeyId,
    String? licenseModel,
    String? masterUserPassword,
    String? masterUsername,
    int? maxAllocatedStorage,
    int? monitoringInterval,
    String? monitoringRoleArn,
    bool? multiAZ,
    String? ncharCharacterSetName,
    String? optionGroupName,
    String? performanceInsightsKMSKeyId,
    int? performanceInsightsRetentionPeriod,
    int? port,
    String? preferredBackupWindow,
    String? preferredMaintenanceWindow,
    List<ProcessorFeature>? processorFeatures,
    int? promotionTier,
    bool? publiclyAccessible,
    bool? storageEncrypted,
    String? storageType,
    List<Tag>? tags,
    String? tdeCredentialArn,
    String? tdeCredentialPassword,
    String? timezone,
    List<String>? vpcSecurityGroupIds,
  }) async {
    ArgumentError.checkNotNull(dBInstanceClass, 'dBInstanceClass');
    ArgumentError.checkNotNull(dBInstanceIdentifier, 'dBInstanceIdentifier');
    ArgumentError.checkNotNull(engine, 'engine');
    final $request = <String, dynamic>{};
    $request['DBInstanceClass'] = dBInstanceClass;
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    $request['Engine'] = engine;
    allocatedStorage?.also((arg) => $request['AllocatedStorage'] = arg);
    autoMinorVersionUpgrade
        ?.also((arg) => $request['AutoMinorVersionUpgrade'] = arg);
    availabilityZone?.also((arg) => $request['AvailabilityZone'] = arg);
    backupRetentionPeriod
        ?.also((arg) => $request['BackupRetentionPeriod'] = arg);
    characterSetName?.also((arg) => $request['CharacterSetName'] = arg);
    copyTagsToSnapshot?.also((arg) => $request['CopyTagsToSnapshot'] = arg);
    dBClusterIdentifier?.also((arg) => $request['DBClusterIdentifier'] = arg);
    dBName?.also((arg) => $request['DBName'] = arg);
    dBParameterGroupName?.also((arg) => $request['DBParameterGroupName'] = arg);
    dBSecurityGroups?.also((arg) => $request['DBSecurityGroups'] = arg);
    dBSubnetGroupName?.also((arg) => $request['DBSubnetGroupName'] = arg);
    deletionProtection?.also((arg) => $request['DeletionProtection'] = arg);
    domain?.also((arg) => $request['Domain'] = arg);
    domainIAMRoleName?.also((arg) => $request['DomainIAMRoleName'] = arg);
    enableCloudwatchLogsExports
        ?.also((arg) => $request['EnableCloudwatchLogsExports'] = arg);
    enableCustomerOwnedIp
        ?.also((arg) => $request['EnableCustomerOwnedIp'] = arg);
    enableIAMDatabaseAuthentication
        ?.also((arg) => $request['EnableIAMDatabaseAuthentication'] = arg);
    enablePerformanceInsights
        ?.also((arg) => $request['EnablePerformanceInsights'] = arg);
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
    iops?.also((arg) => $request['Iops'] = arg);
    kmsKeyId?.also((arg) => $request['KmsKeyId'] = arg);
    licenseModel?.also((arg) => $request['LicenseModel'] = arg);
    masterUserPassword?.also((arg) => $request['MasterUserPassword'] = arg);
    masterUsername?.also((arg) => $request['MasterUsername'] = arg);
    maxAllocatedStorage?.also((arg) => $request['MaxAllocatedStorage'] = arg);
    monitoringInterval?.also((arg) => $request['MonitoringInterval'] = arg);
    monitoringRoleArn?.also((arg) => $request['MonitoringRoleArn'] = arg);
    multiAZ?.also((arg) => $request['MultiAZ'] = arg);
    ncharCharacterSetName
        ?.also((arg) => $request['NcharCharacterSetName'] = arg);
    optionGroupName?.also((arg) => $request['OptionGroupName'] = arg);
    performanceInsightsKMSKeyId
        ?.also((arg) => $request['PerformanceInsightsKMSKeyId'] = arg);
    performanceInsightsRetentionPeriod
        ?.also((arg) => $request['PerformanceInsightsRetentionPeriod'] = arg);
    port?.also((arg) => $request['Port'] = arg);
    preferredBackupWindow
        ?.also((arg) => $request['PreferredBackupWindow'] = arg);
    preferredMaintenanceWindow
        ?.also((arg) => $request['PreferredMaintenanceWindow'] = arg);
    processorFeatures?.also((arg) => $request['ProcessorFeatures'] = arg);
    promotionTier?.also((arg) => $request['PromotionTier'] = arg);
    publiclyAccessible?.also((arg) => $request['PubliclyAccessible'] = arg);
    storageEncrypted?.also((arg) => $request['StorageEncrypted'] = arg);
    storageType?.also((arg) => $request['StorageType'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    tdeCredentialArn?.also((arg) => $request['TdeCredentialArn'] = arg);
    tdeCredentialPassword
        ?.also((arg) => $request['TdeCredentialPassword'] = arg);
    timezone?.also((arg) => $request['Timezone'] = arg);
    vpcSecurityGroupIds?.also((arg) => $request['VpcSecurityGroupIds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateDBInstance',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateDBInstanceMessage'],
      shapes: shapes,
      resultWrapper: 'CreateDBInstanceResult',
    );
    return CreateDBInstanceResult.fromXml($result);
  }

  /// Creates a new DB instance that acts as a read replica for an existing
  /// source DB instance. You can create a read replica for a DB instance
  /// running MySQL, MariaDB, Oracle, PostgreSQL, or SQL Server. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ReadRepl.html">Working
  /// with Read Replicas</a> in the <i>Amazon RDS User Guide</i>.
  ///
  /// Amazon Aurora doesn't support this action. Call the
  /// <code>CreateDBInstance</code> action to create a DB instance for an Aurora
  /// DB cluster.
  ///
  /// All read replica DB instances are created with backups disabled. All other
  /// DB instance attributes (including DB security groups and DB parameter
  /// groups) are inherited from the source DB instance, except as specified.
  /// <important>
  /// Your source DB instance must have backup retention enabled.
  /// </important>
  ///
  /// May throw [DBInstanceAlreadyExistsFault].
  /// May throw [InsufficientDBInstanceCapacityFault].
  /// May throw [DBParameterGroupNotFoundFault].
  /// May throw [DBSecurityGroupNotFoundFault].
  /// May throw [InstanceQuotaExceededFault].
  /// May throw [StorageQuotaExceededFault].
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [InvalidDBInstanceStateFault].
  /// May throw [DBSubnetGroupNotFoundFault].
  /// May throw [DBSubnetGroupDoesNotCoverEnoughAZs].
  /// May throw [InvalidSubnet].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [ProvisionedIopsNotAvailableInAZFault].
  /// May throw [OptionGroupNotFoundFault].
  /// May throw [DBSubnetGroupNotAllowedFault].
  /// May throw [InvalidDBSubnetGroupFault].
  /// May throw [StorageTypeNotSupportedFault].
  /// May throw [KMSKeyNotAccessibleFault].
  /// May throw [DomainNotFoundFault].
  ///
  /// Parameter [dBInstanceIdentifier] :
  /// The DB instance identifier of the read replica. This identifier is the
  /// unique key that identifies a DB instance. This parameter is stored as a
  /// lowercase string.
  ///
  /// Parameter [sourceDBInstanceIdentifier] :
  /// The identifier of the DB instance that will act as the source for the read
  /// replica. Each DB instance can have up to five read replicas.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be the identifier of an existing MySQL, MariaDB, Oracle, PostgreSQL,
  /// or SQL Server DB instance.
  /// </li>
  /// <li>
  /// Can specify a DB instance that is a MySQL read replica only if the source
  /// is running MySQL 5.6 or later.
  /// </li>
  /// <li>
  /// For the limitations of Oracle read replicas, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/oracle-read-replicas.html">Read
  /// Replica Limitations with Oracle</a> in the <i>Amazon RDS User Guide</i>.
  /// </li>
  /// <li>
  /// For the limitations of SQL Server read replicas, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/SQLServer.ReadReplicas.Limitations.html">Read
  /// Replica Limitations with Microsoft SQL Server</a> in the <i>Amazon RDS
  /// User Guide</i>.
  /// </li>
  /// <li>
  /// Can specify a PostgreSQL DB instance only if the source is running
  /// PostgreSQL 9.3.5 or later (9.4.7 and higher for cross-region replication).
  /// </li>
  /// <li>
  /// The specified DB instance must have automatic backups enabled, that is,
  /// its backup retention period must be greater than 0.
  /// </li>
  /// <li>
  /// If the source DB instance is in the same AWS Region as the read replica,
  /// specify a valid DB instance identifier.
  /// </li>
  /// <li>
  /// If the source DB instance is in a different AWS Region from the read
  /// replica, specify a valid DB instance ARN. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.ARN.html#USER_Tagging.ARN.Constructing">Constructing
  /// an ARN for Amazon RDS</a> in the <i>Amazon RDS User Guide</i>. This
  /// doesn't apply to SQL Server, which doesn't support cross-region replicas.
  /// </li>
  /// </ul>
  ///
  /// Parameter [autoMinorVersionUpgrade] :
  /// A value that indicates whether minor engine upgrades are applied
  /// automatically to the read replica during the maintenance window.
  ///
  /// Default: Inherits from the source DB instance
  ///
  /// Parameter [availabilityZone] :
  /// The Availability Zone (AZ) where the read replica will be created.
  ///
  /// Default: A random, system-chosen Availability Zone in the endpoint's AWS
  /// Region.
  ///
  /// Example: <code>us-east-1d</code>
  ///
  /// Parameter [copyTagsToSnapshot] :
  /// A value that indicates whether to copy all tags from the read replica to
  /// snapshots of the read replica. By default, tags are not copied.
  ///
  /// Parameter [dBInstanceClass] :
  /// The compute and memory capacity of the read replica, for example,
  /// <code>db.m4.large</code>. Not all DB instance classes are available in all
  /// AWS Regions, or for all database engines. For the full list of DB instance
  /// classes, and availability for your engine, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.DBInstanceClass.html">DB
  /// Instance Class</a> in the <i>Amazon RDS User Guide.</i>
  ///
  /// Default: Inherits from the source DB instance.
  ///
  /// Parameter [dBParameterGroupName] :
  /// The name of the DB parameter group to associate with this DB instance.
  ///
  /// If you do not specify a value for <code>DBParameterGroupName</code>, then
  /// Amazon RDS uses the <code>DBParameterGroup</code> of source DB instance
  /// for a same region read replica, or the default
  /// <code>DBParameterGroup</code> for the specified DB engine for a cross
  /// region read replica.
  /// <note>
  /// Currently, specifying a parameter group for this operation is only
  /// supported for Oracle DB instances.
  /// </note>
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be 1 to 255 letters, numbers, or hyphens.
  /// </li>
  /// <li>
  /// First character must be a letter
  /// </li>
  /// <li>
  /// Can't end with a hyphen or contain two consecutive hyphens
  /// </li>
  /// </ul>
  ///
  /// Parameter [dBSubnetGroupName] :
  /// Specifies a DB subnet group for the DB instance. The new DB instance is
  /// created in the VPC associated with the DB subnet group. If no DB subnet
  /// group is specified, then the new DB instance isn't created in a VPC.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Can only be specified if the source DB instance identifier specifies a DB
  /// instance in another AWS Region.
  /// </li>
  /// <li>
  /// If supplied, must match the name of an existing DBSubnetGroup.
  /// </li>
  /// <li>
  /// The specified DB subnet group must be in the same AWS Region in which the
  /// operation is running.
  /// </li>
  /// <li>
  /// All read replicas in one AWS Region that are created from the same source
  /// DB instance must either:&gt;
  ///
  /// <ul>
  /// <li>
  /// Specify DB subnet groups from the same VPC. All these read replicas are
  /// created in the same VPC.
  /// </li>
  /// <li>
  /// Not specify a DB subnet group. All these read replicas are created outside
  /// of any VPC.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// Example: <code>mySubnetgroup</code>
  ///
  /// Parameter [deletionProtection] :
  /// A value that indicates whether the DB instance has deletion protection
  /// enabled. The database can't be deleted when deletion protection is
  /// enabled. By default, deletion protection is disabled. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_DeleteInstance.html">
  /// Deleting a DB Instance</a>.
  ///
  /// Parameter [domain] :
  /// The Active Directory directory ID to create the DB instance in. Currently,
  /// only MySQL, Microsoft SQL Server, Oracle, and PostgreSQL DB instances can
  /// be created in an Active Directory Domain.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/kerberos-authentication.html">
  /// Kerberos Authentication</a> in the <i>Amazon RDS User Guide</i>.
  ///
  /// Parameter [domainIAMRoleName] :
  /// Specify the name of the IAM role to be used when making API calls to the
  /// Directory Service.
  ///
  /// Parameter [enableCloudwatchLogsExports] :
  /// The list of logs that the new DB instance is to export to CloudWatch Logs.
  /// The values in the list depend on the DB engine being used. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_LogAccess.html#USER_LogAccess.Procedural.UploadtoCloudWatch">Publishing
  /// Database Logs to Amazon CloudWatch Logs </a> in the <i>Amazon RDS User
  /// Guide</i>.
  ///
  /// Parameter [enableIAMDatabaseAuthentication] :
  /// A value that indicates whether to enable mapping of AWS Identity and
  /// Access Management (IAM) accounts to database accounts. By default, mapping
  /// is disabled.
  ///
  /// For more information about IAM database authentication, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.IAMDBAuth.html">
  /// IAM Database Authentication for MySQL and PostgreSQL</a> in the <i>Amazon
  /// RDS User Guide.</i>
  ///
  /// Parameter [enablePerformanceInsights] :
  /// A value that indicates whether to enable Performance Insights for the read
  /// replica.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PerfInsights.html">Using
  /// Amazon Performance Insights</a> in the <i>Amazon RDS User Guide</i>.
  ///
  /// Parameter [iops] :
  /// The amount of Provisioned IOPS (input/output operations per second) to be
  /// initially allocated for the DB instance.
  ///
  /// Parameter [kmsKeyId] :
  /// The AWS KMS key identifier for an encrypted read replica.
  ///
  /// The AWS KMS key identifier is the key ARN, key ID, alias ARN, or alias
  /// name for the AWS KMS CMK.
  ///
  /// If you create an encrypted read replica in the same AWS Region as the
  /// source DB instance, then do not specify a value for this parameter. A read
  /// replica in the same Region is always encrypted with the same AWS KMS CMK
  /// as the source DB instance.
  ///
  /// If you create an encrypted read replica in a different AWS Region, then
  /// you must specify a AWS KMS key identifier for the destination AWS Region.
  /// AWS KMS CMKs are specific to the AWS Region that they are created in, and
  /// you can't use CMKs from one AWS Region in another AWS Region.
  ///
  /// You can't create an encrypted read replica from an unencrypted DB
  /// instance.
  ///
  /// Parameter [maxAllocatedStorage] :
  /// The upper limit to which Amazon RDS can automatically scale the storage of
  /// the DB instance.
  ///
  /// Parameter [monitoringInterval] :
  /// The interval, in seconds, between points when Enhanced Monitoring metrics
  /// are collected for the read replica. To disable collecting Enhanced
  /// Monitoring metrics, specify 0. The default is 0.
  ///
  /// If <code>MonitoringRoleArn</code> is specified, then you must also set
  /// <code>MonitoringInterval</code> to a value other than 0.
  ///
  /// Valid Values: <code>0, 1, 5, 10, 15, 30, 60</code>
  ///
  /// Parameter [monitoringRoleArn] :
  /// The ARN for the IAM role that permits RDS to send enhanced monitoring
  /// metrics to Amazon CloudWatch Logs. For example,
  /// <code>arn:aws:iam:123456789012:role/emaccess</code>. For information on
  /// creating a monitoring role, go to <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Monitoring.html#USER_Monitoring.OS.IAMRole">To
  /// create an IAM role for Amazon RDS Enhanced Monitoring</a> in the <i>Amazon
  /// RDS User Guide</i>.
  ///
  /// If <code>MonitoringInterval</code> is set to a value other than 0, then
  /// you must supply a <code>MonitoringRoleArn</code> value.
  ///
  /// Parameter [multiAZ] :
  /// A value that indicates whether the read replica is in a Multi-AZ
  /// deployment.
  ///
  /// You can create a read replica as a Multi-AZ DB instance. RDS creates a
  /// standby of your replica in another Availability Zone for failover support
  /// for the replica. Creating your read replica as a Multi-AZ DB instance is
  /// independent of whether the source database is a Multi-AZ DB instance.
  ///
  /// Parameter [optionGroupName] :
  /// The option group the DB instance is associated with. If omitted, the
  /// option group associated with the source instance is used.
  /// <note>
  /// For SQL Server, you must use the option group associated with the source
  /// instance.
  /// </note>
  ///
  /// Parameter [performanceInsightsKMSKeyId] :
  /// The AWS KMS key identifier for encryption of Performance Insights data.
  ///
  /// The AWS KMS key identifier is the key ARN, key ID, alias ARN, or alias
  /// name for the AWS KMS customer master key (CMK).
  ///
  /// If you do not specify a value for
  /// <code>PerformanceInsightsKMSKeyId</code>, then Amazon RDS uses your
  /// default CMK. There is a default CMK for your AWS account. Your AWS account
  /// has a different default CMK for each AWS Region.
  ///
  /// Parameter [performanceInsightsRetentionPeriod] :
  /// The amount of time, in days, to retain Performance Insights data. Valid
  /// values are 7 or 731 (2 years).
  ///
  /// Parameter [port] :
  /// The port number that the DB instance uses for connections.
  ///
  /// Default: Inherits from the source DB instance
  ///
  /// Valid Values: <code>1150-65535</code>
  ///
  /// Parameter [preSignedUrl] :
  /// The URL that contains a Signature Version 4 signed request for the
  /// <code>CreateDBInstanceReadReplica</code> API action in the source AWS
  /// Region that contains the source DB instance.
  ///
  /// You must specify this parameter when you create an encrypted read replica
  /// from another AWS Region by using the Amazon RDS API. Don't specify
  /// <code>PreSignedUrl</code> when you are creating an encrypted read replica
  /// in the same AWS Region.
  ///
  /// The presigned URL must be a valid request for the
  /// <code>CreateDBInstanceReadReplica</code> API action that can be executed
  /// in the source AWS Region that contains the encrypted source DB instance.
  /// The presigned URL request must contain the following parameter values:
  ///
  /// <ul>
  /// <li>
  /// <code>DestinationRegion</code> - The AWS Region that the encrypted read
  /// replica is created in. This AWS Region is the same one where the
  /// <code>CreateDBInstanceReadReplica</code> action is called that contains
  /// this presigned URL.
  ///
  /// For example, if you create an encrypted DB instance in the us-west-1 AWS
  /// Region, from a source DB instance in the us-east-2 AWS Region, then you
  /// call the <code>CreateDBInstanceReadReplica</code> action in the us-east-1
  /// AWS Region and provide a presigned URL that contains a call to the
  /// <code>CreateDBInstanceReadReplica</code> action in the us-west-2 AWS
  /// Region. For this example, the <code>DestinationRegion</code> in the
  /// presigned URL must be set to the us-east-1 AWS Region.
  /// </li>
  /// <li>
  /// <code>KmsKeyId</code> - The AWS KMS key identifier for the key to use to
  /// encrypt the read replica in the destination AWS Region. This is the same
  /// identifier for both the <code>CreateDBInstanceReadReplica</code> action
  /// that is called in the destination AWS Region, and the action contained in
  /// the presigned URL.
  /// </li>
  /// <li>
  /// <code>SourceDBInstanceIdentifier</code> - The DB instance identifier for
  /// the encrypted DB instance to be replicated. This identifier must be in the
  /// Amazon Resource Name (ARN) format for the source AWS Region. For example,
  /// if you are creating an encrypted read replica from a DB instance in the
  /// us-west-2 AWS Region, then your <code>SourceDBInstanceIdentifier</code>
  /// looks like the following example:
  /// <code>arn:aws:rds:us-west-2:123456789012:instance:mysql-instance1-20161115</code>.
  /// </li>
  /// </ul>
  /// To learn how to generate a Signature Version 4 signed request, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-query-string-auth.html">Authenticating
  /// Requests: Using Query Parameters (AWS Signature Version 4)</a> and <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature
  /// Version 4 Signing Process</a>.
  /// <note>
  /// If you are using an AWS SDK tool or the AWS CLI, you can specify
  /// <code>SourceRegion</code> (or <code>--source-region</code> for the AWS
  /// CLI) instead of specifying <code>PreSignedUrl</code> manually. Specifying
  /// <code>SourceRegion</code> autogenerates a presigned URL that is a valid
  /// request for the operation that can be executed in the source AWS Region.
  ///
  /// <code>SourceRegion</code> isn't supported for SQL Server, because SQL
  /// Server on Amazon RDS doesn't support cross-region read replicas.
  /// </note><note>
  /// If you supply a value for this operation's <code>SourceRegion</code>
  /// parameter, a pre-signed URL will be calculated on your behalf.
  /// </note>
  ///
  /// Parameter [processorFeatures] :
  /// The number of CPU cores and the number of threads per core for the DB
  /// instance class of the DB instance.
  ///
  /// Parameter [publiclyAccessible] :
  /// A value that indicates whether the DB instance is publicly accessible.
  ///
  /// When the DB instance is publicly accessible, its DNS endpoint resolves to
  /// the private IP address from within the DB instance's VPC, and to the
  /// public IP address from outside of the DB instance's VPC. Access to the DB
  /// instance is ultimately controlled by the security group it uses, and that
  /// public access is not permitted if the security group assigned to the DB
  /// instance doesn't permit it.
  ///
  /// When the DB instance isn't publicly accessible, it is an internal DB
  /// instance with a DNS name that resolves to a private IP address.
  ///
  /// For more information, see <a>CreateDBInstance</a>.
  ///
  /// Parameter [replicaMode] :
  /// The open mode of the replica database: mounted or read-only.
  /// <note>
  /// This parameter is only supported for Oracle DB instances.
  /// </note>
  /// Mounted DB replicas are included in Oracle Enterprise Edition. The main
  /// use case for mounted replicas is cross-Region disaster recovery. The
  /// primary database doesn't use Active Data Guard to transmit information to
  /// the mounted replica. Because it doesn't accept user connections, a mounted
  /// replica can't serve a read-only workload.
  ///
  /// You can create a combination of mounted and read-only DB replicas for the
  /// same primary DB instance. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/oracle-read-replicas.html">Working
  /// with Oracle Read Replicas for Amazon RDS</a> in the <i>Amazon RDS User
  /// Guide</i>.
  ///
  /// Parameter [sourceRegion] :
  /// The ID of the region that contains the source for the read replica.
  ///
  /// Parameter [storageType] :
  /// Specifies the storage type to be associated with the read replica.
  ///
  /// Valid values: <code>standard | gp2 | io1</code>
  ///
  /// If you specify <code>io1</code>, you must also include a value for the
  /// <code>Iops</code> parameter.
  ///
  /// Default: <code>io1</code> if the <code>Iops</code> parameter is specified,
  /// otherwise <code>gp2</code>
  ///
  /// Parameter [useDefaultProcessorFeatures] :
  /// A value that indicates whether the DB instance class of the DB instance
  /// uses its default processor features.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// A list of EC2 VPC security groups to associate with the read replica.
  ///
  /// Default: The default EC2 VPC security group for the DB subnet group's VPC.
  Future<CreateDBInstanceReadReplicaResult> createDBInstanceReadReplica({
    required String dBInstanceIdentifier,
    required String sourceDBInstanceIdentifier,
    bool? autoMinorVersionUpgrade,
    String? availabilityZone,
    bool? copyTagsToSnapshot,
    String? dBInstanceClass,
    String? dBParameterGroupName,
    String? dBSubnetGroupName,
    bool? deletionProtection,
    String? domain,
    String? domainIAMRoleName,
    List<String>? enableCloudwatchLogsExports,
    bool? enableIAMDatabaseAuthentication,
    bool? enablePerformanceInsights,
    int? iops,
    String? kmsKeyId,
    int? maxAllocatedStorage,
    int? monitoringInterval,
    String? monitoringRoleArn,
    bool? multiAZ,
    String? optionGroupName,
    String? performanceInsightsKMSKeyId,
    int? performanceInsightsRetentionPeriod,
    int? port,
    String? preSignedUrl,
    List<ProcessorFeature>? processorFeatures,
    bool? publiclyAccessible,
    ReplicaMode? replicaMode,
    String? sourceRegion,
    String? storageType,
    List<Tag>? tags,
    bool? useDefaultProcessorFeatures,
    List<String>? vpcSecurityGroupIds,
  }) async {
    ArgumentError.checkNotNull(dBInstanceIdentifier, 'dBInstanceIdentifier');
    ArgumentError.checkNotNull(
        sourceDBInstanceIdentifier, 'sourceDBInstanceIdentifier');
    final $request = <String, dynamic>{};
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    $request['SourceDBInstanceIdentifier'] = sourceDBInstanceIdentifier;
    autoMinorVersionUpgrade
        ?.also((arg) => $request['AutoMinorVersionUpgrade'] = arg);
    availabilityZone?.also((arg) => $request['AvailabilityZone'] = arg);
    copyTagsToSnapshot?.also((arg) => $request['CopyTagsToSnapshot'] = arg);
    dBInstanceClass?.also((arg) => $request['DBInstanceClass'] = arg);
    dBParameterGroupName?.also((arg) => $request['DBParameterGroupName'] = arg);
    dBSubnetGroupName?.also((arg) => $request['DBSubnetGroupName'] = arg);
    deletionProtection?.also((arg) => $request['DeletionProtection'] = arg);
    domain?.also((arg) => $request['Domain'] = arg);
    domainIAMRoleName?.also((arg) => $request['DomainIAMRoleName'] = arg);
    enableCloudwatchLogsExports
        ?.also((arg) => $request['EnableCloudwatchLogsExports'] = arg);
    enableIAMDatabaseAuthentication
        ?.also((arg) => $request['EnableIAMDatabaseAuthentication'] = arg);
    enablePerformanceInsights
        ?.also((arg) => $request['EnablePerformanceInsights'] = arg);
    iops?.also((arg) => $request['Iops'] = arg);
    kmsKeyId?.also((arg) => $request['KmsKeyId'] = arg);
    maxAllocatedStorage?.also((arg) => $request['MaxAllocatedStorage'] = arg);
    monitoringInterval?.also((arg) => $request['MonitoringInterval'] = arg);
    monitoringRoleArn?.also((arg) => $request['MonitoringRoleArn'] = arg);
    multiAZ?.also((arg) => $request['MultiAZ'] = arg);
    optionGroupName?.also((arg) => $request['OptionGroupName'] = arg);
    performanceInsightsKMSKeyId
        ?.also((arg) => $request['PerformanceInsightsKMSKeyId'] = arg);
    performanceInsightsRetentionPeriod
        ?.also((arg) => $request['PerformanceInsightsRetentionPeriod'] = arg);
    port?.also((arg) => $request['Port'] = arg);
    preSignedUrl?.also((arg) => $request['PreSignedUrl'] = arg);
    processorFeatures?.also((arg) => $request['ProcessorFeatures'] = arg);
    publiclyAccessible?.also((arg) => $request['PubliclyAccessible'] = arg);
    replicaMode?.also((arg) => $request['ReplicaMode'] = arg.toValue());
    sourceRegion?.also((arg) => $request['SourceRegion'] = arg);
    storageType?.also((arg) => $request['StorageType'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    useDefaultProcessorFeatures
        ?.also((arg) => $request['UseDefaultProcessorFeatures'] = arg);
    vpcSecurityGroupIds?.also((arg) => $request['VpcSecurityGroupIds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateDBInstanceReadReplica',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateDBInstanceReadReplicaMessage'],
      shapes: shapes,
      resultWrapper: 'CreateDBInstanceReadReplicaResult',
    );
    return CreateDBInstanceReadReplicaResult.fromXml($result);
  }

  /// Creates a new DB parameter group.
  ///
  /// A DB parameter group is initially created with the default parameters for
  /// the database engine used by the DB instance. To provide custom values for
  /// any of the parameters, you must modify the group after creating it using
  /// <i>ModifyDBParameterGroup</i>. Once you've created a DB parameter group,
  /// you need to associate it with your DB instance using
  /// <i>ModifyDBInstance</i>. When you associate a new DB parameter group with
  /// a running DB instance, you need to reboot the DB instance without failover
  /// for the new DB parameter group and associated settings to take effect.
  /// <important>
  /// After you create a DB parameter group, you should wait at least 5 minutes
  /// before creating your first DB instance that uses that DB parameter group
  /// as the default parameter group. This allows Amazon RDS to fully complete
  /// the create action before the parameter group is used as the default for a
  /// new DB instance. This is especially important for parameters that are
  /// critical when creating the default database for a DB instance, such as the
  /// character set for the default database defined by the
  /// <code>character_set_database</code> parameter. You can use the
  /// <i>Parameter Groups</i> option of the <a
  /// href="https://console.aws.amazon.com/rds/">Amazon RDS console</a> or the
  /// <i>DescribeDBParameters</i> command to verify that your DB parameter group
  /// has been created or modified.
  /// </important>
  ///
  /// May throw [DBParameterGroupQuotaExceededFault].
  /// May throw [DBParameterGroupAlreadyExistsFault].
  ///
  /// Parameter [dBParameterGroupFamily] :
  /// The DB parameter group family name. A DB parameter group can be associated
  /// with one and only one DB parameter group family, and can be applied only
  /// to a DB instance running a database engine and engine version compatible
  /// with that DB parameter group family.
  ///
  /// To list all of the available parameter group families, use the following
  /// command:
  ///
  /// <code>aws rds describe-db-engine-versions --query
  /// "DBEngineVersions[].DBParameterGroupFamily"</code>
  /// <note>
  /// The output contains duplicates.
  /// </note>
  ///
  /// Parameter [dBParameterGroupName] :
  /// The name of the DB parameter group.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be 1 to 255 letters, numbers, or hyphens.
  /// </li>
  /// <li>
  /// First character must be a letter
  /// </li>
  /// <li>
  /// Can't end with a hyphen or contain two consecutive hyphens
  /// </li>
  /// </ul> <note>
  /// This value is stored as a lowercase string.
  /// </note>
  ///
  /// Parameter [description] :
  /// The description for the DB parameter group.
  ///
  /// Parameter [tags] :
  /// Tags to assign to the DB parameter group.
  Future<CreateDBParameterGroupResult> createDBParameterGroup({
    required String dBParameterGroupFamily,
    required String dBParameterGroupName,
    required String description,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(
        dBParameterGroupFamily, 'dBParameterGroupFamily');
    ArgumentError.checkNotNull(dBParameterGroupName, 'dBParameterGroupName');
    ArgumentError.checkNotNull(description, 'description');
    final $request = <String, dynamic>{};
    $request['DBParameterGroupFamily'] = dBParameterGroupFamily;
    $request['DBParameterGroupName'] = dBParameterGroupName;
    $request['Description'] = description;
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateDBParameterGroup',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateDBParameterGroupMessage'],
      shapes: shapes,
      resultWrapper: 'CreateDBParameterGroupResult',
    );
    return CreateDBParameterGroupResult.fromXml($result);
  }

  /// Creates a new DB proxy.
  ///
  /// May throw [InvalidSubnet].
  /// May throw [DBProxyAlreadyExistsFault].
  /// May throw [DBProxyQuotaExceededFault].
  ///
  /// Parameter [auth] :
  /// The authorization mechanism that the proxy uses.
  ///
  /// Parameter [dBProxyName] :
  /// The identifier for the proxy. This name must be unique for all proxies
  /// owned by your AWS account in the specified AWS Region. An identifier must
  /// begin with a letter and must contain only ASCII letters, digits, and
  /// hyphens; it can't end with a hyphen or contain two consecutive hyphens.
  ///
  /// Parameter [engineFamily] :
  /// The kinds of databases that the proxy can connect to. This value
  /// determines which database network protocol the proxy recognizes when it
  /// interprets network traffic to and from the database. The engine family
  /// applies to MySQL and PostgreSQL for both RDS and Aurora.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that the proxy uses to
  /// access secrets in AWS Secrets Manager.
  ///
  /// Parameter [vpcSubnetIds] :
  /// One or more VPC subnet IDs to associate with the new proxy.
  ///
  /// Parameter [debugLogging] :
  /// Whether the proxy includes detailed information about SQL statements in
  /// its logs. This information helps you to debug issues involving SQL
  /// behavior or the performance and scalability of the proxy connections. The
  /// debug information includes the text of SQL statements that you submit
  /// through the proxy. Thus, only enable this setting when needed for
  /// debugging, and only when you have security measures in place to safeguard
  /// any sensitive information that appears in the logs.
  ///
  /// Parameter [idleClientTimeout] :
  /// The number of seconds that a connection to the proxy can be inactive
  /// before the proxy disconnects it. You can set this value higher or lower
  /// than the connection timeout limit for the associated database.
  ///
  /// Parameter [requireTLS] :
  /// A Boolean parameter that specifies whether Transport Layer Security (TLS)
  /// encryption is required for connections to the proxy. By enabling this
  /// setting, you can enforce encrypted TLS connections to the proxy.
  ///
  /// Parameter [tags] :
  /// An optional set of key-value pairs to associate arbitrary data of your
  /// choosing with the proxy.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// One or more VPC security group IDs to associate with the new proxy.
  Future<CreateDBProxyResponse> createDBProxy({
    required List<UserAuthConfig> auth,
    required String dBProxyName,
    required EngineFamily engineFamily,
    required String roleArn,
    required List<String> vpcSubnetIds,
    bool? debugLogging,
    int? idleClientTimeout,
    bool? requireTLS,
    List<Tag>? tags,
    List<String>? vpcSecurityGroupIds,
  }) async {
    ArgumentError.checkNotNull(auth, 'auth');
    ArgumentError.checkNotNull(dBProxyName, 'dBProxyName');
    ArgumentError.checkNotNull(engineFamily, 'engineFamily');
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    ArgumentError.checkNotNull(vpcSubnetIds, 'vpcSubnetIds');
    final $request = <String, dynamic>{};
    $request['Auth'] = auth;
    $request['DBProxyName'] = dBProxyName;
    $request['EngineFamily'] = engineFamily.toValue();
    $request['RoleArn'] = roleArn;
    $request['VpcSubnetIds'] = vpcSubnetIds;
    debugLogging?.also((arg) => $request['DebugLogging'] = arg);
    idleClientTimeout?.also((arg) => $request['IdleClientTimeout'] = arg);
    requireTLS?.also((arg) => $request['RequireTLS'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    vpcSecurityGroupIds?.also((arg) => $request['VpcSecurityGroupIds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateDBProxy',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateDBProxyRequest'],
      shapes: shapes,
      resultWrapper: 'CreateDBProxyResult',
    );
    return CreateDBProxyResponse.fromXml($result);
  }

  /// Creates a new DB security group. DB security groups control access to a DB
  /// instance.
  /// <note>
  /// A DB security group controls access to EC2-Classic DB instances that are
  /// not in a VPC.
  /// </note>
  ///
  /// May throw [DBSecurityGroupAlreadyExistsFault].
  /// May throw [DBSecurityGroupQuotaExceededFault].
  /// May throw [DBSecurityGroupNotSupportedFault].
  ///
  /// Parameter [dBSecurityGroupDescription] :
  /// The description for the DB security group.
  ///
  /// Parameter [dBSecurityGroupName] :
  /// The name for the DB security group. This value is stored as a lowercase
  /// string.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be 1 to 255 letters, numbers, or hyphens.
  /// </li>
  /// <li>
  /// First character must be a letter
  /// </li>
  /// <li>
  /// Can't end with a hyphen or contain two consecutive hyphens
  /// </li>
  /// <li>
  /// Must not be "Default"
  /// </li>
  /// </ul>
  /// Example: <code>mysecuritygroup</code>
  ///
  /// Parameter [tags] :
  /// Tags to assign to the DB security group.
  Future<CreateDBSecurityGroupResult> createDBSecurityGroup({
    required String dBSecurityGroupDescription,
    required String dBSecurityGroupName,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(
        dBSecurityGroupDescription, 'dBSecurityGroupDescription');
    ArgumentError.checkNotNull(dBSecurityGroupName, 'dBSecurityGroupName');
    final $request = <String, dynamic>{};
    $request['DBSecurityGroupDescription'] = dBSecurityGroupDescription;
    $request['DBSecurityGroupName'] = dBSecurityGroupName;
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateDBSecurityGroup',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateDBSecurityGroupMessage'],
      shapes: shapes,
      resultWrapper: 'CreateDBSecurityGroupResult',
    );
    return CreateDBSecurityGroupResult.fromXml($result);
  }

  /// Creates a snapshot of a DB instance. The source DB instance must be in the
  /// <code>available</code> or <code>storage-optimization</code> state.
  ///
  /// May throw [DBSnapshotAlreadyExistsFault].
  /// May throw [InvalidDBInstanceStateFault].
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [SnapshotQuotaExceededFault].
  ///
  /// Parameter [dBInstanceIdentifier] :
  /// The identifier of the DB instance that you want to create the snapshot of.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match the identifier of an existing DBInstance.
  /// </li>
  /// </ul>
  ///
  /// Parameter [dBSnapshotIdentifier] :
  /// The identifier for the DB snapshot.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Can't be null, empty, or blank
  /// </li>
  /// <li>
  /// Must contain from 1 to 255 letters, numbers, or hyphens
  /// </li>
  /// <li>
  /// First character must be a letter
  /// </li>
  /// <li>
  /// Can't end with a hyphen or contain two consecutive hyphens
  /// </li>
  /// </ul>
  /// Example: <code>my-snapshot-id</code>
  Future<CreateDBSnapshotResult> createDBSnapshot({
    required String dBInstanceIdentifier,
    required String dBSnapshotIdentifier,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(dBInstanceIdentifier, 'dBInstanceIdentifier');
    ArgumentError.checkNotNull(dBSnapshotIdentifier, 'dBSnapshotIdentifier');
    final $request = <String, dynamic>{};
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    $request['DBSnapshotIdentifier'] = dBSnapshotIdentifier;
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateDBSnapshot',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateDBSnapshotMessage'],
      shapes: shapes,
      resultWrapper: 'CreateDBSnapshotResult',
    );
    return CreateDBSnapshotResult.fromXml($result);
  }

  /// Creates a new DB subnet group. DB subnet groups must contain at least one
  /// subnet in at least two AZs in the AWS Region.
  ///
  /// May throw [DBSubnetGroupAlreadyExistsFault].
  /// May throw [DBSubnetGroupQuotaExceededFault].
  /// May throw [DBSubnetQuotaExceededFault].
  /// May throw [DBSubnetGroupDoesNotCoverEnoughAZs].
  /// May throw [InvalidSubnet].
  ///
  /// Parameter [dBSubnetGroupDescription] :
  /// The description for the DB subnet group.
  ///
  /// Parameter [dBSubnetGroupName] :
  /// The name for the DB subnet group. This value is stored as a lowercase
  /// string.
  ///
  /// Constraints: Must contain no more than 255 letters, numbers, periods,
  /// underscores, spaces, or hyphens. Must not be default.
  ///
  /// Example: <code>mySubnetgroup</code>
  ///
  /// Parameter [subnetIds] :
  /// The EC2 Subnet IDs for the DB subnet group.
  ///
  /// Parameter [tags] :
  /// Tags to assign to the DB subnet group.
  Future<CreateDBSubnetGroupResult> createDBSubnetGroup({
    required String dBSubnetGroupDescription,
    required String dBSubnetGroupName,
    required List<String> subnetIds,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(
        dBSubnetGroupDescription, 'dBSubnetGroupDescription');
    ArgumentError.checkNotNull(dBSubnetGroupName, 'dBSubnetGroupName');
    ArgumentError.checkNotNull(subnetIds, 'subnetIds');
    final $request = <String, dynamic>{};
    $request['DBSubnetGroupDescription'] = dBSubnetGroupDescription;
    $request['DBSubnetGroupName'] = dBSubnetGroupName;
    $request['SubnetIds'] = subnetIds;
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateDBSubnetGroup',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateDBSubnetGroupMessage'],
      shapes: shapes,
      resultWrapper: 'CreateDBSubnetGroupResult',
    );
    return CreateDBSubnetGroupResult.fromXml($result);
  }

  /// Creates an RDS event notification subscription. This action requires a
  /// topic Amazon Resource Name (ARN) created by either the RDS console, the
  /// SNS console, or the SNS API. To obtain an ARN with SNS, you must create a
  /// topic in Amazon SNS and subscribe to the topic. The ARN is displayed in
  /// the SNS console.
  ///
  /// You can specify the type of source (<code>SourceType</code>) that you want
  /// to be notified of and provide a list of RDS sources
  /// (<code>SourceIds</code>) that triggers the events. You can also provide a
  /// list of event categories (<code>EventCategories</code>) for events that
  /// you want to be notified of. For example, you can specify
  /// <code>SourceType</code> = <code>db-instance</code>, <code>SourceIds</code>
  /// = <code>mydbinstance1</code>, <code>mydbinstance2</code> and
  /// <code>EventCategories</code> = <code>Availability</code>,
  /// <code>Backup</code>.
  ///
  /// If you specify both the <code>SourceType</code> and
  /// <code>SourceIds</code>, such as <code>SourceType</code> =
  /// <code>db-instance</code> and <code>SourceIdentifier</code> =
  /// <code>myDBInstance1</code>, you are notified of all the
  /// <code>db-instance</code> events for the specified source. If you specify a
  /// <code>SourceType</code> but do not specify a
  /// <code>SourceIdentifier</code>, you receive notice of the events for that
  /// source type for all your RDS sources. If you don't specify either the
  /// SourceType or the <code>SourceIdentifier</code>, you are notified of
  /// events generated from all RDS sources belonging to your customer account.
  /// <note>
  /// RDS event notification is only available for unencrypted SNS topics. If
  /// you specify an encrypted SNS topic, event notifications aren't sent for
  /// the topic.
  /// </note>
  ///
  /// May throw [EventSubscriptionQuotaExceededFault].
  /// May throw [SubscriptionAlreadyExistFault].
  /// May throw [SNSInvalidTopicFault].
  /// May throw [SNSNoAuthorizationFault].
  /// May throw [SNSTopicArnNotFoundFault].
  /// May throw [SubscriptionCategoryNotFoundFault].
  /// May throw [SourceNotFoundFault].
  ///
  /// Parameter [snsTopicArn] :
  /// The Amazon Resource Name (ARN) of the SNS topic created for event
  /// notification. The ARN is created by Amazon SNS when you create a topic and
  /// subscribe to it.
  ///
  /// Parameter [subscriptionName] :
  /// The name of the subscription.
  ///
  /// Constraints: The name must be less than 255 characters.
  ///
  /// Parameter [enabled] :
  /// A value that indicates whether to activate the subscription. If the event
  /// notification subscription isn't activated, the subscription is created but
  /// not active.
  ///
  /// Parameter [eventCategories] :
  /// A list of event categories for a particular source type
  /// (<code>SourceType</code>) that you want to subscribe to. You can see a
  /// list of the categories for a given source type in <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Events.html">Events</a>
  /// in the <i>Amazon RDS User Guide</i> or by using the
  /// <code>DescribeEventCategories</code> operation.
  ///
  /// Parameter [sourceIds] :
  /// The list of identifiers of the event sources for which events are
  /// returned. If not specified, then all sources are included in the response.
  /// An identifier must begin with a letter and must contain only ASCII
  /// letters, digits, and hyphens. It can't end with a hyphen or contain two
  /// consecutive hyphens.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If a <code>SourceIds</code> value is supplied, <code>SourceType</code>
  /// must also be provided.
  /// </li>
  /// <li>
  /// If the source type is a DB instance, a <code>DBInstanceIdentifier</code>
  /// value must be supplied.
  /// </li>
  /// <li>
  /// If the source type is a DB cluster, a <code>DBClusterIdentifier</code>
  /// value must be supplied.
  /// </li>
  /// <li>
  /// If the source type is a DB parameter group, a
  /// <code>DBParameterGroupName</code> value must be supplied.
  /// </li>
  /// <li>
  /// If the source type is a DB security group, a
  /// <code>DBSecurityGroupName</code> value must be supplied.
  /// </li>
  /// <li>
  /// If the source type is a DB snapshot, a <code>DBSnapshotIdentifier</code>
  /// value must be supplied.
  /// </li>
  /// <li>
  /// If the source type is a DB cluster snapshot, a
  /// <code>DBClusterSnapshotIdentifier</code> value must be supplied.
  /// </li>
  /// </ul>
  ///
  /// Parameter [sourceType] :
  /// The type of source that is generating the events. For example, if you want
  /// to be notified of events generated by a DB instance, you set this
  /// parameter to <code>db-instance</code>. If this value isn't specified, all
  /// events are returned.
  ///
  /// Valid values: <code>db-instance</code> | <code>db-cluster</code> |
  /// <code>db-parameter-group</code> | <code>db-security-group</code> |
  /// <code>db-snapshot</code> | <code>db-cluster-snapshot</code>
  Future<CreateEventSubscriptionResult> createEventSubscription({
    required String snsTopicArn,
    required String subscriptionName,
    bool? enabled,
    List<String>? eventCategories,
    List<String>? sourceIds,
    String? sourceType,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(snsTopicArn, 'snsTopicArn');
    ArgumentError.checkNotNull(subscriptionName, 'subscriptionName');
    final $request = <String, dynamic>{};
    $request['SnsTopicArn'] = snsTopicArn;
    $request['SubscriptionName'] = subscriptionName;
    enabled?.also((arg) => $request['Enabled'] = arg);
    eventCategories?.also((arg) => $request['EventCategories'] = arg);
    sourceIds?.also((arg) => $request['SourceIds'] = arg);
    sourceType?.also((arg) => $request['SourceType'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateEventSubscription',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateEventSubscriptionMessage'],
      shapes: shapes,
      resultWrapper: 'CreateEventSubscriptionResult',
    );
    return CreateEventSubscriptionResult.fromXml($result);
  }

  /// Creates an Aurora global database spread across multiple AWS Regions. The
  /// global database contains a single primary cluster with read-write
  /// capability, and a read-only secondary cluster that receives data from the
  /// primary cluster through high-speed replication performed by the Aurora
  /// storage subsystem.
  ///
  /// You can create a global database that is initially empty, and then add a
  /// primary cluster and a secondary cluster to it. Or you can specify an
  /// existing Aurora cluster during the create operation, and this cluster
  /// becomes the primary cluster of the global database.
  /// <note>
  /// This action only applies to Aurora DB clusters.
  /// </note>
  ///
  /// May throw [GlobalClusterAlreadyExistsFault].
  /// May throw [GlobalClusterQuotaExceededFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [DBClusterNotFoundFault].
  ///
  /// Parameter [databaseName] :
  /// The name for your database of up to 64 alpha-numeric characters. If you do
  /// not provide a name, Amazon Aurora will not create a database in the global
  /// database cluster you are creating.
  ///
  /// Parameter [deletionProtection] :
  /// The deletion protection setting for the new global database. The global
  /// database can't be deleted when deletion protection is enabled.
  ///
  /// Parameter [engine] :
  /// The name of the database engine to be used for this DB cluster.
  ///
  /// Parameter [engineVersion] :
  /// The engine version of the Aurora global database.
  ///
  /// Parameter [globalClusterIdentifier] :
  /// The cluster identifier of the new global database cluster.
  ///
  /// Parameter [sourceDBClusterIdentifier] :
  /// The Amazon Resource Name (ARN) to use as the primary cluster of the global
  /// database. This parameter is optional.
  ///
  /// Parameter [storageEncrypted] :
  /// The storage encryption setting for the new global database cluster.
  Future<CreateGlobalClusterResult> createGlobalCluster({
    String? databaseName,
    bool? deletionProtection,
    String? engine,
    String? engineVersion,
    String? globalClusterIdentifier,
    String? sourceDBClusterIdentifier,
    bool? storageEncrypted,
  }) async {
    final $request = <String, dynamic>{};
    databaseName?.also((arg) => $request['DatabaseName'] = arg);
    deletionProtection?.also((arg) => $request['DeletionProtection'] = arg);
    engine?.also((arg) => $request['Engine'] = arg);
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
    globalClusterIdentifier
        ?.also((arg) => $request['GlobalClusterIdentifier'] = arg);
    sourceDBClusterIdentifier
        ?.also((arg) => $request['SourceDBClusterIdentifier'] = arg);
    storageEncrypted?.also((arg) => $request['StorageEncrypted'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateGlobalCluster',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateGlobalClusterMessage'],
      shapes: shapes,
      resultWrapper: 'CreateGlobalClusterResult',
    );
    return CreateGlobalClusterResult.fromXml($result);
  }

  /// Creates a new option group. You can create up to 20 option groups.
  ///
  /// May throw [OptionGroupAlreadyExistsFault].
  /// May throw [OptionGroupQuotaExceededFault].
  ///
  /// Parameter [engineName] :
  /// Specifies the name of the engine that this option group should be
  /// associated with.
  ///
  /// Parameter [majorEngineVersion] :
  /// Specifies the major version of the engine that this option group should be
  /// associated with.
  ///
  /// Parameter [optionGroupDescription] :
  /// The description of the option group.
  ///
  /// Parameter [optionGroupName] :
  /// Specifies the name of the option group to be created.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be 1 to 255 letters, numbers, or hyphens
  /// </li>
  /// <li>
  /// First character must be a letter
  /// </li>
  /// <li>
  /// Can't end with a hyphen or contain two consecutive hyphens
  /// </li>
  /// </ul>
  /// Example: <code>myoptiongroup</code>
  ///
  /// Parameter [tags] :
  /// Tags to assign to the option group.
  Future<CreateOptionGroupResult> createOptionGroup({
    required String engineName,
    required String majorEngineVersion,
    required String optionGroupDescription,
    required String optionGroupName,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(engineName, 'engineName');
    ArgumentError.checkNotNull(majorEngineVersion, 'majorEngineVersion');
    ArgumentError.checkNotNull(
        optionGroupDescription, 'optionGroupDescription');
    ArgumentError.checkNotNull(optionGroupName, 'optionGroupName');
    final $request = <String, dynamic>{};
    $request['EngineName'] = engineName;
    $request['MajorEngineVersion'] = majorEngineVersion;
    $request['OptionGroupDescription'] = optionGroupDescription;
    $request['OptionGroupName'] = optionGroupName;
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateOptionGroup',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateOptionGroupMessage'],
      shapes: shapes,
      resultWrapper: 'CreateOptionGroupResult',
    );
    return CreateOptionGroupResult.fromXml($result);
  }

  /// Deletes a custom Availability Zone (AZ).
  ///
  /// A custom AZ is an on-premises AZ that is integrated with a VMware vSphere
  /// cluster.
  ///
  /// For more information about RDS on VMware, see the <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/RDSonVMwareUserGuide/rds-on-vmware.html">
  /// RDS on VMware User Guide.</a>
  ///
  /// May throw [CustomAvailabilityZoneNotFoundFault].
  /// May throw [KMSKeyNotAccessibleFault].
  ///
  /// Parameter [customAvailabilityZoneId] :
  /// The custom AZ identifier.
  Future<DeleteCustomAvailabilityZoneResult> deleteCustomAvailabilityZone({
    required String customAvailabilityZoneId,
  }) async {
    ArgumentError.checkNotNull(
        customAvailabilityZoneId, 'customAvailabilityZoneId');
    final $request = <String, dynamic>{};
    $request['CustomAvailabilityZoneId'] = customAvailabilityZoneId;
    final $result = await _protocol.send(
      $request,
      action: 'DeleteCustomAvailabilityZone',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteCustomAvailabilityZoneMessage'],
      shapes: shapes,
      resultWrapper: 'DeleteCustomAvailabilityZoneResult',
    );
    return DeleteCustomAvailabilityZoneResult.fromXml($result);
  }

  /// The DeleteDBCluster action deletes a previously provisioned DB cluster.
  /// When you delete a DB cluster, all automated backups for that DB cluster
  /// are deleted and can't be recovered. Manual DB cluster snapshots of the
  /// specified DB cluster are not deleted.
  /// <p/>
  /// For more information on Amazon Aurora, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
  /// What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i>
  /// <note>
  /// This action only applies to Aurora DB clusters.
  /// </note>
  ///
  /// May throw [DBClusterNotFoundFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [DBClusterSnapshotAlreadyExistsFault].
  /// May throw [SnapshotQuotaExceededFault].
  /// May throw [InvalidDBClusterSnapshotStateFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The DB cluster identifier for the DB cluster to be deleted. This parameter
  /// isn't case-sensitive.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match an existing DBClusterIdentifier.
  /// </li>
  /// </ul>
  ///
  /// Parameter [finalDBSnapshotIdentifier] :
  /// The DB cluster snapshot identifier of the new DB cluster snapshot created
  /// when <code>SkipFinalSnapshot</code> is disabled.
  /// <note>
  /// Specifying this parameter and also skipping the creation of a final DB
  /// cluster snapshot with the <code>SkipFinalShapshot</code> parameter results
  /// in an error.
  /// </note>
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be 1 to 255 letters, numbers, or hyphens.
  /// </li>
  /// <li>
  /// First character must be a letter
  /// </li>
  /// <li>
  /// Can't end with a hyphen or contain two consecutive hyphens
  /// </li>
  /// </ul>
  ///
  /// Parameter [skipFinalSnapshot] :
  /// A value that indicates whether to skip the creation of a final DB cluster
  /// snapshot before the DB cluster is deleted. If skip is specified, no DB
  /// cluster snapshot is created. If skip isn't specified, a DB cluster
  /// snapshot is created before the DB cluster is deleted. By default, skip
  /// isn't specified, and the DB cluster snapshot is created. By default, this
  /// parameter is disabled.
  /// <note>
  /// You must specify a <code>FinalDBSnapshotIdentifier</code> parameter if
  /// <code>SkipFinalSnapshot</code> is disabled.
  /// </note>
  Future<DeleteDBClusterResult> deleteDBCluster({
    required String dBClusterIdentifier,
    String? finalDBSnapshotIdentifier,
    bool? skipFinalSnapshot,
  }) async {
    ArgumentError.checkNotNull(dBClusterIdentifier, 'dBClusterIdentifier');
    final $request = <String, dynamic>{};
    $request['DBClusterIdentifier'] = dBClusterIdentifier;
    finalDBSnapshotIdentifier
        ?.also((arg) => $request['FinalDBSnapshotIdentifier'] = arg);
    skipFinalSnapshot?.also((arg) => $request['SkipFinalSnapshot'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DeleteDBCluster',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteDBClusterMessage'],
      shapes: shapes,
      resultWrapper: 'DeleteDBClusterResult',
    );
    return DeleteDBClusterResult.fromXml($result);
  }

  /// Deletes a custom endpoint and removes it from an Amazon Aurora DB cluster.
  /// <note>
  /// This action only applies to Aurora DB clusters.
  /// </note>
  ///
  /// May throw [InvalidDBClusterEndpointStateFault].
  /// May throw [DBClusterEndpointNotFoundFault].
  /// May throw [InvalidDBClusterStateFault].
  ///
  /// Parameter [dBClusterEndpointIdentifier] :
  /// The identifier associated with the custom endpoint. This parameter is
  /// stored as a lowercase string.
  Future<DBClusterEndpoint> deleteDBClusterEndpoint({
    required String dBClusterEndpointIdentifier,
  }) async {
    ArgumentError.checkNotNull(
        dBClusterEndpointIdentifier, 'dBClusterEndpointIdentifier');
    final $request = <String, dynamic>{};
    $request['DBClusterEndpointIdentifier'] = dBClusterEndpointIdentifier;
    final $result = await _protocol.send(
      $request,
      action: 'DeleteDBClusterEndpoint',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteDBClusterEndpointMessage'],
      shapes: shapes,
      resultWrapper: 'DeleteDBClusterEndpointResult',
    );
    return DBClusterEndpoint.fromXml($result);
  }

  /// Deletes a specified DB cluster parameter group. The DB cluster parameter
  /// group to be deleted can't be associated with any DB clusters.
  ///
  /// For more information on Amazon Aurora, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
  /// What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i>
  /// <note>
  /// This action only applies to Aurora DB clusters.
  /// </note>
  ///
  /// May throw [InvalidDBParameterGroupStateFault].
  /// May throw [DBParameterGroupNotFoundFault].
  ///
  /// Parameter [dBClusterParameterGroupName] :
  /// The name of the DB cluster parameter group.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be the name of an existing DB cluster parameter group.
  /// </li>
  /// <li>
  /// You can't delete a default DB cluster parameter group.
  /// </li>
  /// <li>
  /// Can't be associated with any DB clusters.
  /// </li>
  /// </ul>
  Future<void> deleteDBClusterParameterGroup({
    required String dBClusterParameterGroupName,
  }) async {
    ArgumentError.checkNotNull(
        dBClusterParameterGroupName, 'dBClusterParameterGroupName');
    final $request = <String, dynamic>{};
    $request['DBClusterParameterGroupName'] = dBClusterParameterGroupName;
    await _protocol.send(
      $request,
      action: 'DeleteDBClusterParameterGroup',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteDBClusterParameterGroupMessage'],
      shapes: shapes,
    );
  }

  /// Deletes a DB cluster snapshot. If the snapshot is being copied, the copy
  /// operation is terminated.
  /// <note>
  /// The DB cluster snapshot must be in the <code>available</code> state to be
  /// deleted.
  /// </note>
  /// For more information on Amazon Aurora, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
  /// What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i>
  /// <note>
  /// This action only applies to Aurora DB clusters.
  /// </note>
  ///
  /// May throw [InvalidDBClusterSnapshotStateFault].
  /// May throw [DBClusterSnapshotNotFoundFault].
  ///
  /// Parameter [dBClusterSnapshotIdentifier] :
  /// The identifier of the DB cluster snapshot to delete.
  ///
  /// Constraints: Must be the name of an existing DB cluster snapshot in the
  /// <code>available</code> state.
  Future<DeleteDBClusterSnapshotResult> deleteDBClusterSnapshot({
    required String dBClusterSnapshotIdentifier,
  }) async {
    ArgumentError.checkNotNull(
        dBClusterSnapshotIdentifier, 'dBClusterSnapshotIdentifier');
    final $request = <String, dynamic>{};
    $request['DBClusterSnapshotIdentifier'] = dBClusterSnapshotIdentifier;
    final $result = await _protocol.send(
      $request,
      action: 'DeleteDBClusterSnapshot',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteDBClusterSnapshotMessage'],
      shapes: shapes,
      resultWrapper: 'DeleteDBClusterSnapshotResult',
    );
    return DeleteDBClusterSnapshotResult.fromXml($result);
  }

  /// The DeleteDBInstance action deletes a previously provisioned DB instance.
  /// When you delete a DB instance, all automated backups for that instance are
  /// deleted and can't be recovered. Manual DB snapshots of the DB instance to
  /// be deleted by <code>DeleteDBInstance</code> are not deleted.
  ///
  /// If you request a final DB snapshot the status of the Amazon RDS DB
  /// instance is <code>deleting</code> until the DB snapshot is created. The
  /// API action <code>DescribeDBInstance</code> is used to monitor the status
  /// of this operation. The action can't be canceled or reverted once
  /// submitted.
  ///
  /// When a DB instance is in a failure state and has a status of
  /// <code>failed</code>, <code>incompatible-restore</code>, or
  /// <code>incompatible-network</code>, you can only delete it when you skip
  /// creation of the final snapshot with the <code>SkipFinalSnapshot</code>
  /// parameter.
  ///
  /// If the specified DB instance is part of an Amazon Aurora DB cluster, you
  /// can't delete the DB instance if both of the following conditions are true:
  ///
  /// <ul>
  /// <li>
  /// The DB cluster is a read replica of another Amazon Aurora DB cluster.
  /// </li>
  /// <li>
  /// The DB instance is the only instance in the DB cluster.
  /// </li>
  /// </ul>
  /// To delete a DB instance in this case, first call the
  /// <code>PromoteReadReplicaDBCluster</code> API action to promote the DB
  /// cluster so it's no longer a read replica. After the promotion completes,
  /// then call the <code>DeleteDBInstance</code> API action to delete the final
  /// instance in the DB cluster.
  ///
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [InvalidDBInstanceStateFault].
  /// May throw [DBSnapshotAlreadyExistsFault].
  /// May throw [SnapshotQuotaExceededFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [DBInstanceAutomatedBackupQuotaExceededFault].
  ///
  /// Parameter [dBInstanceIdentifier] :
  /// The DB instance identifier for the DB instance to be deleted. This
  /// parameter isn't case-sensitive.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match the name of an existing DB instance.
  /// </li>
  /// </ul>
  ///
  /// Parameter [deleteAutomatedBackups] :
  /// A value that indicates whether to remove automated backups immediately
  /// after the DB instance is deleted. This parameter isn't case-sensitive. The
  /// default is to remove automated backups immediately after the DB instance
  /// is deleted.
  ///
  /// Parameter [finalDBSnapshotIdentifier] :
  /// The <code>DBSnapshotIdentifier</code> of the new <code>DBSnapshot</code>
  /// created when the <code>SkipFinalSnapshot</code> parameter is disabled.
  /// <note>
  /// Specifying this parameter and also specifying to skip final DB snapshot
  /// creation in SkipFinalShapshot results in an error.
  /// </note>
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be 1 to 255 letters or numbers.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Can't end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// <li>
  /// Can't be specified when deleting a read replica.
  /// </li>
  /// </ul>
  ///
  /// Parameter [skipFinalSnapshot] :
  /// A value that indicates whether to skip the creation of a final DB snapshot
  /// before the DB instance is deleted. If skip is specified, no DB snapshot is
  /// created. If skip isn't specified, a DB snapshot is created before the DB
  /// instance is deleted. By default, skip isn't specified, and the DB snapshot
  /// is created.
  ///
  /// When a DB instance is in a failure state and has a status of 'failed',
  /// 'incompatible-restore', or 'incompatible-network', it can only be deleted
  /// when skip is specified.
  ///
  /// Specify skip when deleting a read replica.
  /// <note>
  /// The FinalDBSnapshotIdentifier parameter must be specified if skip isn't
  /// specified.
  /// </note>
  Future<DeleteDBInstanceResult> deleteDBInstance({
    required String dBInstanceIdentifier,
    bool? deleteAutomatedBackups,
    String? finalDBSnapshotIdentifier,
    bool? skipFinalSnapshot,
  }) async {
    ArgumentError.checkNotNull(dBInstanceIdentifier, 'dBInstanceIdentifier');
    final $request = <String, dynamic>{};
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    deleteAutomatedBackups
        ?.also((arg) => $request['DeleteAutomatedBackups'] = arg);
    finalDBSnapshotIdentifier
        ?.also((arg) => $request['FinalDBSnapshotIdentifier'] = arg);
    skipFinalSnapshot?.also((arg) => $request['SkipFinalSnapshot'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DeleteDBInstance',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteDBInstanceMessage'],
      shapes: shapes,
      resultWrapper: 'DeleteDBInstanceResult',
    );
    return DeleteDBInstanceResult.fromXml($result);
  }

  /// Deletes automated backups using the <code>DbiResourceId</code> value of
  /// the source DB instance or the Amazon Resource Name (ARN) of the automated
  /// backups.
  ///
  /// May throw [InvalidDBInstanceAutomatedBackupStateFault].
  /// May throw [DBInstanceAutomatedBackupNotFoundFault].
  ///
  /// Parameter [dBInstanceAutomatedBackupsArn] :
  /// The Amazon Resource Name (ARN) of the automated backups to delete, for
  /// example,
  /// <code>arn:aws:rds:us-east-1:123456789012:auto-backup:ab-L2IJCEXJP7XQ7HOJ4SIEXAMPLE</code>.
  ///
  /// Parameter [dbiResourceId] :
  /// The identifier for the source DB instance, which can't be changed and
  /// which is unique to an AWS Region.
  Future<DeleteDBInstanceAutomatedBackupResult>
      deleteDBInstanceAutomatedBackup({
    String? dBInstanceAutomatedBackupsArn,
    String? dbiResourceId,
  }) async {
    final $request = <String, dynamic>{};
    dBInstanceAutomatedBackupsArn
        ?.also((arg) => $request['DBInstanceAutomatedBackupsArn'] = arg);
    dbiResourceId?.also((arg) => $request['DbiResourceId'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DeleteDBInstanceAutomatedBackup',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteDBInstanceAutomatedBackupMessage'],
      shapes: shapes,
      resultWrapper: 'DeleteDBInstanceAutomatedBackupResult',
    );
    return DeleteDBInstanceAutomatedBackupResult.fromXml($result);
  }

  /// Deletes a specified DB parameter group. The DB parameter group to be
  /// deleted can't be associated with any DB instances.
  ///
  /// May throw [InvalidDBParameterGroupStateFault].
  /// May throw [DBParameterGroupNotFoundFault].
  ///
  /// Parameter [dBParameterGroupName] :
  /// The name of the DB parameter group.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be the name of an existing DB parameter group
  /// </li>
  /// <li>
  /// You can't delete a default DB parameter group
  /// </li>
  /// <li>
  /// Can't be associated with any DB instances
  /// </li>
  /// </ul>
  Future<void> deleteDBParameterGroup({
    required String dBParameterGroupName,
  }) async {
    ArgumentError.checkNotNull(dBParameterGroupName, 'dBParameterGroupName');
    final $request = <String, dynamic>{};
    $request['DBParameterGroupName'] = dBParameterGroupName;
    await _protocol.send(
      $request,
      action: 'DeleteDBParameterGroup',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteDBParameterGroupMessage'],
      shapes: shapes,
    );
  }

  /// Deletes an existing proxy.
  ///
  /// May throw [DBProxyNotFoundFault].
  /// May throw [InvalidDBProxyStateFault].
  ///
  /// Parameter [dBProxyName] :
  /// The name of the DB proxy to delete.
  Future<DeleteDBProxyResponse> deleteDBProxy({
    required String dBProxyName,
  }) async {
    ArgumentError.checkNotNull(dBProxyName, 'dBProxyName');
    final $request = <String, dynamic>{};
    $request['DBProxyName'] = dBProxyName;
    final $result = await _protocol.send(
      $request,
      action: 'DeleteDBProxy',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteDBProxyRequest'],
      shapes: shapes,
      resultWrapper: 'DeleteDBProxyResult',
    );
    return DeleteDBProxyResponse.fromXml($result);
  }

  /// Deletes a DB security group.
  /// <note>
  /// The specified DB security group must not be associated with any DB
  /// instances.
  /// </note>
  ///
  /// May throw [InvalidDBSecurityGroupStateFault].
  /// May throw [DBSecurityGroupNotFoundFault].
  ///
  /// Parameter [dBSecurityGroupName] :
  /// The name of the DB security group to delete.
  /// <note>
  /// You can't delete the default DB security group.
  /// </note>
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be 1 to 255 letters, numbers, or hyphens.
  /// </li>
  /// <li>
  /// First character must be a letter
  /// </li>
  /// <li>
  /// Can't end with a hyphen or contain two consecutive hyphens
  /// </li>
  /// <li>
  /// Must not be "Default"
  /// </li>
  /// </ul>
  Future<void> deleteDBSecurityGroup({
    required String dBSecurityGroupName,
  }) async {
    ArgumentError.checkNotNull(dBSecurityGroupName, 'dBSecurityGroupName');
    final $request = <String, dynamic>{};
    $request['DBSecurityGroupName'] = dBSecurityGroupName;
    await _protocol.send(
      $request,
      action: 'DeleteDBSecurityGroup',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteDBSecurityGroupMessage'],
      shapes: shapes,
    );
  }

  /// Deletes a DB snapshot. If the snapshot is being copied, the copy operation
  /// is terminated.
  /// <note>
  /// The DB snapshot must be in the <code>available</code> state to be deleted.
  /// </note>
  ///
  /// May throw [InvalidDBSnapshotStateFault].
  /// May throw [DBSnapshotNotFoundFault].
  ///
  /// Parameter [dBSnapshotIdentifier] :
  /// The DB snapshot identifier.
  ///
  /// Constraints: Must be the name of an existing DB snapshot in the
  /// <code>available</code> state.
  Future<DeleteDBSnapshotResult> deleteDBSnapshot({
    required String dBSnapshotIdentifier,
  }) async {
    ArgumentError.checkNotNull(dBSnapshotIdentifier, 'dBSnapshotIdentifier');
    final $request = <String, dynamic>{};
    $request['DBSnapshotIdentifier'] = dBSnapshotIdentifier;
    final $result = await _protocol.send(
      $request,
      action: 'DeleteDBSnapshot',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteDBSnapshotMessage'],
      shapes: shapes,
      resultWrapper: 'DeleteDBSnapshotResult',
    );
    return DeleteDBSnapshotResult.fromXml($result);
  }

  /// Deletes a DB subnet group.
  /// <note>
  /// The specified database subnet group must not be associated with any DB
  /// instances.
  /// </note>
  ///
  /// May throw [InvalidDBSubnetGroupStateFault].
  /// May throw [InvalidDBSubnetStateFault].
  /// May throw [DBSubnetGroupNotFoundFault].
  ///
  /// Parameter [dBSubnetGroupName] :
  /// The name of the database subnet group to delete.
  /// <note>
  /// You can't delete the default subnet group.
  /// </note>
  /// Constraints:
  ///
  /// Constraints: Must match the name of an existing DBSubnetGroup. Must not be
  /// default.
  ///
  /// Example: <code>mySubnetgroup</code>
  Future<void> deleteDBSubnetGroup({
    required String dBSubnetGroupName,
  }) async {
    ArgumentError.checkNotNull(dBSubnetGroupName, 'dBSubnetGroupName');
    final $request = <String, dynamic>{};
    $request['DBSubnetGroupName'] = dBSubnetGroupName;
    await _protocol.send(
      $request,
      action: 'DeleteDBSubnetGroup',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteDBSubnetGroupMessage'],
      shapes: shapes,
    );
  }

  /// Deletes an RDS event notification subscription.
  ///
  /// May throw [SubscriptionNotFoundFault].
  /// May throw [InvalidEventSubscriptionStateFault].
  ///
  /// Parameter [subscriptionName] :
  /// The name of the RDS event notification subscription you want to delete.
  Future<DeleteEventSubscriptionResult> deleteEventSubscription({
    required String subscriptionName,
  }) async {
    ArgumentError.checkNotNull(subscriptionName, 'subscriptionName');
    final $request = <String, dynamic>{};
    $request['SubscriptionName'] = subscriptionName;
    final $result = await _protocol.send(
      $request,
      action: 'DeleteEventSubscription',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteEventSubscriptionMessage'],
      shapes: shapes,
      resultWrapper: 'DeleteEventSubscriptionResult',
    );
    return DeleteEventSubscriptionResult.fromXml($result);
  }

  /// Deletes a global database cluster. The primary and secondary clusters must
  /// already be detached or destroyed first.
  /// <note>
  /// This action only applies to Aurora DB clusters.
  /// </note>
  ///
  /// May throw [GlobalClusterNotFoundFault].
  /// May throw [InvalidGlobalClusterStateFault].
  ///
  /// Parameter [globalClusterIdentifier] :
  /// The cluster identifier of the global database cluster being deleted.
  Future<DeleteGlobalClusterResult> deleteGlobalCluster({
    required String globalClusterIdentifier,
  }) async {
    ArgumentError.checkNotNull(
        globalClusterIdentifier, 'globalClusterIdentifier');
    final $request = <String, dynamic>{};
    $request['GlobalClusterIdentifier'] = globalClusterIdentifier;
    final $result = await _protocol.send(
      $request,
      action: 'DeleteGlobalCluster',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteGlobalClusterMessage'],
      shapes: shapes,
      resultWrapper: 'DeleteGlobalClusterResult',
    );
    return DeleteGlobalClusterResult.fromXml($result);
  }

  /// Deletes the installation medium for a DB engine that requires an
  /// on-premises customer provided license, such as Microsoft SQL Server.
  ///
  /// May throw [InstallationMediaNotFoundFault].
  ///
  /// Parameter [installationMediaId] :
  /// The installation medium ID.
  Future<InstallationMedia> deleteInstallationMedia({
    required String installationMediaId,
  }) async {
    ArgumentError.checkNotNull(installationMediaId, 'installationMediaId');
    final $request = <String, dynamic>{};
    $request['InstallationMediaId'] = installationMediaId;
    final $result = await _protocol.send(
      $request,
      action: 'DeleteInstallationMedia',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteInstallationMediaMessage'],
      shapes: shapes,
      resultWrapper: 'DeleteInstallationMediaResult',
    );
    return InstallationMedia.fromXml($result);
  }

  /// Deletes an existing option group.
  ///
  /// May throw [OptionGroupNotFoundFault].
  /// May throw [InvalidOptionGroupStateFault].
  ///
  /// Parameter [optionGroupName] :
  /// The name of the option group to be deleted.
  /// <note>
  /// You can't delete default option groups.
  /// </note>
  Future<void> deleteOptionGroup({
    required String optionGroupName,
  }) async {
    ArgumentError.checkNotNull(optionGroupName, 'optionGroupName');
    final $request = <String, dynamic>{};
    $request['OptionGroupName'] = optionGroupName;
    await _protocol.send(
      $request,
      action: 'DeleteOptionGroup',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteOptionGroupMessage'],
      shapes: shapes,
    );
  }

  /// Remove the association between one or more <code>DBProxyTarget</code> data
  /// structures and a <code>DBProxyTargetGroup</code>.
  ///
  /// May throw [DBProxyTargetNotFoundFault].
  /// May throw [DBProxyTargetGroupNotFoundFault].
  /// May throw [DBProxyNotFoundFault].
  /// May throw [InvalidDBProxyStateFault].
  ///
  /// Parameter [dBProxyName] :
  /// The identifier of the <code>DBProxy</code> that is associated with the
  /// <code>DBProxyTargetGroup</code>.
  ///
  /// Parameter [dBClusterIdentifiers] :
  /// One or more DB cluster identifiers.
  ///
  /// Parameter [dBInstanceIdentifiers] :
  /// One or more DB instance identifiers.
  ///
  /// Parameter [targetGroupName] :
  /// The identifier of the <code>DBProxyTargetGroup</code>.
  Future<void> deregisterDBProxyTargets({
    required String dBProxyName,
    List<String>? dBClusterIdentifiers,
    List<String>? dBInstanceIdentifiers,
    String? targetGroupName,
  }) async {
    ArgumentError.checkNotNull(dBProxyName, 'dBProxyName');
    final $request = <String, dynamic>{};
    $request['DBProxyName'] = dBProxyName;
    dBClusterIdentifiers?.also((arg) => $request['DBClusterIdentifiers'] = arg);
    dBInstanceIdentifiers
        ?.also((arg) => $request['DBInstanceIdentifiers'] = arg);
    targetGroupName?.also((arg) => $request['TargetGroupName'] = arg);
    await _protocol.send(
      $request,
      action: 'DeregisterDBProxyTargets',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeregisterDBProxyTargetsRequest'],
      shapes: shapes,
      resultWrapper: 'DeregisterDBProxyTargetsResult',
    );
  }

  /// Lists all of the attributes for a customer account. The attributes include
  /// Amazon RDS quotas for the account, such as the number of DB instances
  /// allowed. The description for a quota includes the quota name, current
  /// usage toward that quota, and the quota's maximum value.
  ///
  /// This command doesn't take any parameters.
  Future<AccountAttributesMessage> describeAccountAttributes() async {
    final $request = <String, dynamic>{};
    final $result = await _protocol.send(
      $request,
      action: 'DescribeAccountAttributes',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeAccountAttributesMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeAccountAttributesResult',
    );
    return AccountAttributesMessage.fromXml($result);
  }

  /// Lists the set of CA certificates provided by Amazon RDS for this AWS
  /// account.
  ///
  /// May throw [CertificateNotFoundFault].
  ///
  /// Parameter [certificateIdentifier] :
  /// The user-supplied certificate identifier. If this parameter is specified,
  /// information for only the identified certificate is returned. This
  /// parameter isn't case-sensitive.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match an existing CertificateIdentifier.
  /// </li>
  /// </ul>
  ///
  /// Parameter [filters] :
  /// This parameter isn't currently supported.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// <code>DescribeCertificates</code> request. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so you can retrieve the
  /// remaining results.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<CertificateMessage> describeCertificates({
    String? certificateIdentifier,
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    certificateIdentifier
        ?.also((arg) => $request['CertificateIdentifier'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeCertificates',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeCertificatesMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeCertificatesResult',
    );
    return CertificateMessage.fromXml($result);
  }

  /// Returns information about custom Availability Zones (AZs).
  ///
  /// A custom AZ is an on-premises AZ that is integrated with a VMware vSphere
  /// cluster.
  ///
  /// For more information about RDS on VMware, see the <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/RDSonVMwareUserGuide/rds-on-vmware.html">
  /// RDS on VMware User Guide.</a>
  ///
  /// May throw [CustomAvailabilityZoneNotFoundFault].
  ///
  /// Parameter [customAvailabilityZoneId] :
  /// The custom AZ identifier. If this parameter is specified, information from
  /// only the specific custom AZ is returned.
  ///
  /// Parameter [filters] :
  /// A filter that specifies one or more custom AZs to describe.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// <code>DescribeCustomAvailabilityZones</code> request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so you can retrieve the
  /// remaining results.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<CustomAvailabilityZoneMessage> describeCustomAvailabilityZones({
    String? customAvailabilityZoneId,
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    customAvailabilityZoneId
        ?.also((arg) => $request['CustomAvailabilityZoneId'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeCustomAvailabilityZones',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeCustomAvailabilityZonesMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeCustomAvailabilityZonesResult',
    );
    return CustomAvailabilityZoneMessage.fromXml($result);
  }

  /// Returns information about backtracks for a DB cluster.
  ///
  /// For more information on Amazon Aurora, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
  /// What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i>
  /// <note>
  /// This action only applies to Aurora MySQL DB clusters.
  /// </note>
  ///
  /// May throw [DBClusterNotFoundFault].
  /// May throw [DBClusterBacktrackNotFoundFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The DB cluster identifier of the DB cluster to be described. This
  /// parameter is stored as a lowercase string.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 1 to 63 alphanumeric characters or hyphens.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Can't end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul>
  /// Example: <code>my-cluster1</code>
  ///
  /// Parameter [backtrackIdentifier] :
  /// If specified, this value is the backtrack identifier of the backtrack to
  /// be described.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain a valid universally unique identifier (UUID). For more
  /// information about UUIDs, see <a
  /// href="http://www.ietf.org/rfc/rfc4122.txt">A Universally Unique Identifier
  /// (UUID) URN Namespace</a>.
  /// </li>
  /// </ul>
  /// Example: <code>123e4567-e89b-12d3-a456-426655440000</code>
  ///
  /// Parameter [filters] :
  /// A filter that specifies one or more DB clusters to describe. Supported
  /// filters include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>db-cluster-backtrack-id</code> - Accepts backtrack identifiers. The
  /// results list includes information about only the backtracks identified by
  /// these identifiers.
  /// </li>
  /// <li>
  /// <code>db-cluster-backtrack-status</code> - Accepts any of the following
  /// backtrack status values:
  ///
  /// <ul>
  /// <li>
  /// <code>applying</code>
  /// </li>
  /// <li>
  /// <code>completed</code>
  /// </li>
  /// <li>
  /// <code>failed</code>
  /// </li>
  /// <li>
  /// <code>pending</code>
  /// </li>
  /// </ul>
  /// The results list includes information about only the backtracks identified
  /// by these values.
  /// </li>
  /// </ul>
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// <code>DescribeDBClusterBacktracks</code> request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so you can retrieve the
  /// remaining results.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<DBClusterBacktrackMessage> describeDBClusterBacktracks({
    required String dBClusterIdentifier,
    String? backtrackIdentifier,
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
  }) async {
    ArgumentError.checkNotNull(dBClusterIdentifier, 'dBClusterIdentifier');
    final $request = <String, dynamic>{};
    $request['DBClusterIdentifier'] = dBClusterIdentifier;
    backtrackIdentifier?.also((arg) => $request['BacktrackIdentifier'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBClusterBacktracks',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDBClusterBacktracksMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDBClusterBacktracksResult',
    );
    return DBClusterBacktrackMessage.fromXml($result);
  }

  /// Returns information about endpoints for an Amazon Aurora DB cluster.
  /// <note>
  /// This action only applies to Aurora DB clusters.
  /// </note>
  ///
  /// May throw [DBClusterNotFoundFault].
  ///
  /// Parameter [dBClusterEndpointIdentifier] :
  /// The identifier of the endpoint to describe. This parameter is stored as a
  /// lowercase string.
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The DB cluster identifier of the DB cluster associated with the endpoint.
  /// This parameter is stored as a lowercase string.
  ///
  /// Parameter [filters] :
  /// A set of name-value pairs that define which endpoints to include in the
  /// output. The filters are specified as name-value pairs, in the format
  /// <code>Name=<i>endpoint_type</i>,Values=<i>endpoint_type1</i>,<i>endpoint_type2</i>,...</code>.
  /// <code>Name</code> can be one of: <code>db-cluster-endpoint-type</code>,
  /// <code>db-cluster-endpoint-custom-type</code>,
  /// <code>db-cluster-endpoint-id</code>,
  /// <code>db-cluster-endpoint-status</code>. <code>Values</code> for the
  /// <code> db-cluster-endpoint-type</code> filter can be one or more of:
  /// <code>reader</code>, <code>writer</code>, <code>custom</code>.
  /// <code>Values</code> for the <code>db-cluster-endpoint-custom-type</code>
  /// filter can be one or more of: <code>reader</code>, <code>any</code>.
  /// <code>Values</code> for the <code>db-cluster-endpoint-status</code> filter
  /// can be one or more of: <code>available</code>, <code>creating</code>,
  /// <code>deleting</code>, <code>inactive</code>, <code>modifying</code>.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// <code>DescribeDBClusterEndpoints</code> request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so you can retrieve the
  /// remaining results.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<DBClusterEndpointMessage> describeDBClusterEndpoints({
    String? dBClusterEndpointIdentifier,
    String? dBClusterIdentifier,
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    dBClusterEndpointIdentifier
        ?.also((arg) => $request['DBClusterEndpointIdentifier'] = arg);
    dBClusterIdentifier?.also((arg) => $request['DBClusterIdentifier'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBClusterEndpoints',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDBClusterEndpointsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDBClusterEndpointsResult',
    );
    return DBClusterEndpointMessage.fromXml($result);
  }

  /// Returns a list of <code>DBClusterParameterGroup</code> descriptions. If a
  /// <code>DBClusterParameterGroupName</code> parameter is specified, the list
  /// will contain only the description of the specified DB cluster parameter
  /// group.
  ///
  /// For more information on Amazon Aurora, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
  /// What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i>
  /// <note>
  /// This action only applies to Aurora DB clusters.
  /// </note>
  ///
  /// May throw [DBParameterGroupNotFoundFault].
  ///
  /// Parameter [dBClusterParameterGroupName] :
  /// The name of a specific DB cluster parameter group to return details for.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If supplied, must match the name of an existing DBClusterParameterGroup.
  /// </li>
  /// </ul>
  ///
  /// Parameter [filters] :
  /// This parameter isn't currently supported.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// <code>DescribeDBClusterParameterGroups</code> request. If this parameter
  /// is specified, the response includes only records beyond the marker, up to
  /// the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so you can retrieve the
  /// remaining results.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<DBClusterParameterGroupsMessage> describeDBClusterParameterGroups({
    String? dBClusterParameterGroupName,
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    dBClusterParameterGroupName
        ?.also((arg) => $request['DBClusterParameterGroupName'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBClusterParameterGroups',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDBClusterParameterGroupsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDBClusterParameterGroupsResult',
    );
    return DBClusterParameterGroupsMessage.fromXml($result);
  }

  /// Returns the detailed parameter list for a particular DB cluster parameter
  /// group.
  ///
  /// For more information on Amazon Aurora, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
  /// What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i>
  /// <note>
  /// This action only applies to Aurora DB clusters.
  /// </note>
  ///
  /// May throw [DBParameterGroupNotFoundFault].
  ///
  /// Parameter [dBClusterParameterGroupName] :
  /// The name of a specific DB cluster parameter group to return parameter
  /// details for.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If supplied, must match the name of an existing DBClusterParameterGroup.
  /// </li>
  /// </ul>
  ///
  /// Parameter [filters] :
  /// This parameter isn't currently supported.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// <code>DescribeDBClusterParameters</code> request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so you can retrieve the
  /// remaining results.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// Parameter [source] :
  /// A value that indicates to return only parameters for a specific source.
  /// Parameter sources can be <code>engine</code>, <code>service</code>, or
  /// <code>customer</code>.
  Future<DBClusterParameterGroupDetails> describeDBClusterParameters({
    required String dBClusterParameterGroupName,
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
    String? source,
  }) async {
    ArgumentError.checkNotNull(
        dBClusterParameterGroupName, 'dBClusterParameterGroupName');
    final $request = <String, dynamic>{};
    $request['DBClusterParameterGroupName'] = dBClusterParameterGroupName;
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    source?.also((arg) => $request['Source'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBClusterParameters',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDBClusterParametersMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDBClusterParametersResult',
    );
    return DBClusterParameterGroupDetails.fromXml($result);
  }

  /// Returns a list of DB cluster snapshot attribute names and values for a
  /// manual DB cluster snapshot.
  ///
  /// When sharing snapshots with other AWS accounts,
  /// <code>DescribeDBClusterSnapshotAttributes</code> returns the
  /// <code>restore</code> attribute and a list of IDs for the AWS accounts that
  /// are authorized to copy or restore the manual DB cluster snapshot. If
  /// <code>all</code> is included in the list of values for the
  /// <code>restore</code> attribute, then the manual DB cluster snapshot is
  /// public and can be copied or restored by all AWS accounts.
  ///
  /// To add or remove access for an AWS account to copy or restore a manual DB
  /// cluster snapshot, or to make the manual DB cluster snapshot public or
  /// private, use the <code>ModifyDBClusterSnapshotAttribute</code> API action.
  /// <note>
  /// This action only applies to Aurora DB clusters.
  /// </note>
  ///
  /// May throw [DBClusterSnapshotNotFoundFault].
  ///
  /// Parameter [dBClusterSnapshotIdentifier] :
  /// The identifier for the DB cluster snapshot to describe the attributes for.
  Future<DescribeDBClusterSnapshotAttributesResult>
      describeDBClusterSnapshotAttributes({
    required String dBClusterSnapshotIdentifier,
  }) async {
    ArgumentError.checkNotNull(
        dBClusterSnapshotIdentifier, 'dBClusterSnapshotIdentifier');
    final $request = <String, dynamic>{};
    $request['DBClusterSnapshotIdentifier'] = dBClusterSnapshotIdentifier;
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBClusterSnapshotAttributes',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDBClusterSnapshotAttributesMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDBClusterSnapshotAttributesResult',
    );
    return DescribeDBClusterSnapshotAttributesResult.fromXml($result);
  }

  /// Returns information about DB cluster snapshots. This API action supports
  /// pagination.
  ///
  /// For more information on Amazon Aurora, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
  /// What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i>
  /// <note>
  /// This action only applies to Aurora DB clusters.
  /// </note>
  ///
  /// May throw [DBClusterSnapshotNotFoundFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The ID of the DB cluster to retrieve the list of DB cluster snapshots for.
  /// This parameter can't be used in conjunction with the
  /// <code>DBClusterSnapshotIdentifier</code> parameter. This parameter isn't
  /// case-sensitive.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If supplied, must match the identifier of an existing DBCluster.
  /// </li>
  /// </ul>
  ///
  /// Parameter [dBClusterSnapshotIdentifier] :
  /// A specific DB cluster snapshot identifier to describe. This parameter
  /// can't be used in conjunction with the <code>DBClusterIdentifier</code>
  /// parameter. This value is stored as a lowercase string.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If supplied, must match the identifier of an existing DBClusterSnapshot.
  /// </li>
  /// <li>
  /// If this identifier is for an automated snapshot, the
  /// <code>SnapshotType</code> parameter must also be specified.
  /// </li>
  /// </ul>
  ///
  /// Parameter [filters] :
  /// A filter that specifies one or more DB cluster snapshots to describe.
  ///
  /// Supported filters:
  ///
  /// <ul>
  /// <li>
  /// <code>db-cluster-id</code> - Accepts DB cluster identifiers and DB cluster
  /// Amazon Resource Names (ARNs).
  /// </li>
  /// <li>
  /// <code>db-cluster-snapshot-id</code> - Accepts DB cluster snapshot
  /// identifiers.
  /// </li>
  /// <li>
  /// <code>snapshot-type</code> - Accepts types of DB cluster snapshots.
  /// </li>
  /// <li>
  /// <code>engine</code> - Accepts names of database engines.
  /// </li>
  /// </ul>
  ///
  /// Parameter [includePublic] :
  /// A value that indicates whether to include manual DB cluster snapshots that
  /// are public and can be copied or restored by any AWS account. By default,
  /// the public snapshots are not included.
  ///
  /// You can share a manual DB cluster snapshot as public by using the
  /// <a>ModifyDBClusterSnapshotAttribute</a> API action.
  ///
  /// Parameter [includeShared] :
  /// A value that indicates whether to include shared manual DB cluster
  /// snapshots from other AWS accounts that this AWS account has been given
  /// permission to copy or restore. By default, these snapshots are not
  /// included.
  ///
  /// You can give an AWS account permission to restore a manual DB cluster
  /// snapshot from another AWS account by the
  /// <code>ModifyDBClusterSnapshotAttribute</code> API action.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// <code>DescribeDBClusterSnapshots</code> request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so you can retrieve the
  /// remaining results.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// Parameter [snapshotType] :
  /// The type of DB cluster snapshots to be returned. You can specify one of
  /// the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>automated</code> - Return all DB cluster snapshots that have been
  /// automatically taken by Amazon RDS for my AWS account.
  /// </li>
  /// <li>
  /// <code>manual</code> - Return all DB cluster snapshots that have been taken
  /// by my AWS account.
  /// </li>
  /// <li>
  /// <code>shared</code> - Return all manual DB cluster snapshots that have
  /// been shared to my AWS account.
  /// </li>
  /// <li>
  /// <code>public</code> - Return all DB cluster snapshots that have been
  /// marked as public.
  /// </li>
  /// </ul>
  /// If you don't specify a <code>SnapshotType</code> value, then both
  /// automated and manual DB cluster snapshots are returned. You can include
  /// shared DB cluster snapshots with these results by enabling the
  /// <code>IncludeShared</code> parameter. You can include public DB cluster
  /// snapshots with these results by enabling the <code>IncludePublic</code>
  /// parameter.
  ///
  /// The <code>IncludeShared</code> and <code>IncludePublic</code> parameters
  /// don't apply for <code>SnapshotType</code> values of <code>manual</code> or
  /// <code>automated</code>. The <code>IncludePublic</code> parameter doesn't
  /// apply when <code>SnapshotType</code> is set to <code>shared</code>. The
  /// <code>IncludeShared</code> parameter doesn't apply when
  /// <code>SnapshotType</code> is set to <code>public</code>.
  Future<DBClusterSnapshotMessage> describeDBClusterSnapshots({
    String? dBClusterIdentifier,
    String? dBClusterSnapshotIdentifier,
    List<Filter>? filters,
    bool? includePublic,
    bool? includeShared,
    String? marker,
    int? maxRecords,
    String? snapshotType,
  }) async {
    final $request = <String, dynamic>{};
    dBClusterIdentifier?.also((arg) => $request['DBClusterIdentifier'] = arg);
    dBClusterSnapshotIdentifier
        ?.also((arg) => $request['DBClusterSnapshotIdentifier'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    includePublic?.also((arg) => $request['IncludePublic'] = arg);
    includeShared?.also((arg) => $request['IncludeShared'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    snapshotType?.also((arg) => $request['SnapshotType'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBClusterSnapshots',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDBClusterSnapshotsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDBClusterSnapshotsResult',
    );
    return DBClusterSnapshotMessage.fromXml($result);
  }

  /// Returns information about provisioned Aurora DB clusters. This API
  /// supports pagination.
  ///
  /// For more information on Amazon Aurora, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
  /// What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i>
  /// <note>
  /// This operation can also return information for Amazon Neptune DB instances
  /// and Amazon DocumentDB instances.
  /// </note>
  ///
  /// May throw [DBClusterNotFoundFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The user-supplied DB cluster identifier. If this parameter is specified,
  /// information from only the specific DB cluster is returned. This parameter
  /// isn't case-sensitive.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If supplied, must match an existing DBClusterIdentifier.
  /// </li>
  /// </ul>
  ///
  /// Parameter [filters] :
  /// A filter that specifies one or more DB clusters to describe.
  ///
  /// Supported filters:
  ///
  /// <ul>
  /// <li>
  /// <code>db-cluster-id</code> - Accepts DB cluster identifiers and DB cluster
  /// Amazon Resource Names (ARNs). The results list will only include
  /// information about the DB clusters identified by these ARNs.
  /// </li>
  /// </ul>
  ///
  /// Parameter [includeShared] :
  /// Optional Boolean parameter that specifies whether the output includes
  /// information about clusters shared from other AWS accounts.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// <code>DescribeDBClusters</code> request. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so you can retrieve the
  /// remaining results.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<DBClusterMessage> describeDBClusters({
    String? dBClusterIdentifier,
    List<Filter>? filters,
    bool? includeShared,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    dBClusterIdentifier?.also((arg) => $request['DBClusterIdentifier'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    includeShared?.also((arg) => $request['IncludeShared'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBClusters',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDBClustersMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDBClustersResult',
    );
    return DBClusterMessage.fromXml($result);
  }

  /// Returns a list of the available DB engines.
  ///
  /// Parameter [dBParameterGroupFamily] :
  /// The name of a specific DB parameter group family to return details for.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If supplied, must match an existing DBParameterGroupFamily.
  /// </li>
  /// </ul>
  ///
  /// Parameter [defaultOnly] :
  /// A value that indicates whether only the default version of the specified
  /// engine or engine and major version combination is returned.
  ///
  /// Parameter [engine] :
  /// The database engine to return.
  ///
  /// Parameter [engineVersion] :
  /// The database engine version to return.
  ///
  /// Example: <code>5.1.49</code>
  ///
  /// Parameter [filters] :
  /// This parameter isn't currently supported.
  ///
  /// Parameter [includeAll] :
  /// A value that indicates whether to include engine versions that aren't
  /// available in the list. The default is to list only available engine
  /// versions.
  ///
  /// Parameter [listSupportedCharacterSets] :
  /// A value that indicates whether to list the supported character sets for
  /// each engine version.
  ///
  /// If this parameter is enabled and the requested engine supports the
  /// <code>CharacterSetName</code> parameter for <code>CreateDBInstance</code>,
  /// the response includes a list of supported character sets for each engine
  /// version.
  ///
  /// Parameter [listSupportedTimezones] :
  /// A value that indicates whether to list the supported time zones for each
  /// engine version.
  ///
  /// If this parameter is enabled and the requested engine supports the
  /// <code>TimeZone</code> parameter for <code>CreateDBInstance</code>, the
  /// response includes a list of supported time zones for each engine version.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more than the
  /// <code>MaxRecords</code> value is available, a pagination token called a
  /// marker is included in the response so you can retrieve the remaining
  /// results.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<DBEngineVersionMessage> describeDBEngineVersions({
    String? dBParameterGroupFamily,
    bool? defaultOnly,
    String? engine,
    String? engineVersion,
    List<Filter>? filters,
    bool? includeAll,
    bool? listSupportedCharacterSets,
    bool? listSupportedTimezones,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    dBParameterGroupFamily
        ?.also((arg) => $request['DBParameterGroupFamily'] = arg);
    defaultOnly?.also((arg) => $request['DefaultOnly'] = arg);
    engine?.also((arg) => $request['Engine'] = arg);
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    includeAll?.also((arg) => $request['IncludeAll'] = arg);
    listSupportedCharacterSets
        ?.also((arg) => $request['ListSupportedCharacterSets'] = arg);
    listSupportedTimezones
        ?.also((arg) => $request['ListSupportedTimezones'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBEngineVersions',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDBEngineVersionsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDBEngineVersionsResult',
    );
    return DBEngineVersionMessage.fromXml($result);
  }

  /// Displays backups for both current and deleted instances. For example, use
  /// this operation to find details about automated backups for previously
  /// deleted instances. Current instances with retention periods greater than
  /// zero (0) are returned for both the
  /// <code>DescribeDBInstanceAutomatedBackups</code> and
  /// <code>DescribeDBInstances</code> operations.
  ///
  /// All parameters are optional.
  ///
  /// May throw [DBInstanceAutomatedBackupNotFoundFault].
  ///
  /// Parameter [dBInstanceAutomatedBackupsArn] :
  /// The Amazon Resource Name (ARN) of the replicated automated backups, for
  /// example,
  /// <code>arn:aws:rds:us-east-1:123456789012:auto-backup:ab-L2IJCEXJP7XQ7HOJ4SIEXAMPLE</code>.
  ///
  /// Parameter [dBInstanceIdentifier] :
  /// (Optional) The user-supplied instance identifier. If this parameter is
  /// specified, it must match the identifier of an existing DB instance. It
  /// returns information from the specific DB instance' automated backup. This
  /// parameter isn't case-sensitive.
  ///
  /// Parameter [dbiResourceId] :
  /// The resource ID of the DB instance that is the source of the automated
  /// backup. This parameter isn't case-sensitive.
  ///
  /// Parameter [filters] :
  /// A filter that specifies which resources to return based on status.
  ///
  /// Supported filters are the following:
  ///
  /// <ul>
  /// <li>
  /// <code>status</code>
  ///
  /// <ul>
  /// <li>
  /// <code>active</code> - automated backups for current instances
  /// </li>
  /// <li>
  /// <code>retained</code> - automated backups for deleted instances and after
  /// backup replication is stopped
  /// </li>
  /// <li>
  /// <code>creating</code> - automated backups that are waiting for the first
  /// automated snapshot to be available
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>db-instance-id</code> - Accepts DB instance identifiers and Amazon
  /// Resource Names (ARNs). The results list includes only information about
  /// the DB instance automated backups identified by these ARNs.
  /// </li>
  /// <li>
  /// <code>dbi-resource-id</code> - Accepts DB resource identifiers and Amazon
  /// Resource Names (ARNs). The results list includes only information about
  /// the DB instance resources identified by these ARNs.
  /// </li>
  /// </ul>
  /// Returns all resources by default. The status for each resource is
  /// specified in the response.
  ///
  /// Parameter [marker] :
  /// The pagination token provided in the previous request. If this parameter
  /// is specified the response includes only records beyond the marker, up to
  /// <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that you can retrieve the
  /// remaining results.
  Future<DBInstanceAutomatedBackupMessage> describeDBInstanceAutomatedBackups({
    String? dBInstanceAutomatedBackupsArn,
    String? dBInstanceIdentifier,
    String? dbiResourceId,
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    dBInstanceAutomatedBackupsArn
        ?.also((arg) => $request['DBInstanceAutomatedBackupsArn'] = arg);
    dBInstanceIdentifier?.also((arg) => $request['DBInstanceIdentifier'] = arg);
    dbiResourceId?.also((arg) => $request['DbiResourceId'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBInstanceAutomatedBackups',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDBInstanceAutomatedBackupsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDBInstanceAutomatedBackupsResult',
    );
    return DBInstanceAutomatedBackupMessage.fromXml($result);
  }

  /// Returns information about provisioned RDS instances. This API supports
  /// pagination.
  /// <note>
  /// This operation can also return information for Amazon Neptune DB instances
  /// and Amazon DocumentDB instances.
  /// </note>
  ///
  /// May throw [DBInstanceNotFoundFault].
  ///
  /// Parameter [dBInstanceIdentifier] :
  /// The user-supplied instance identifier. If this parameter is specified,
  /// information from only the specific DB instance is returned. This parameter
  /// isn't case-sensitive.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If supplied, must match the identifier of an existing DBInstance.
  /// </li>
  /// </ul>
  ///
  /// Parameter [filters] :
  /// A filter that specifies one or more DB instances to describe.
  ///
  /// Supported filters:
  ///
  /// <ul>
  /// <li>
  /// <code>db-cluster-id</code> - Accepts DB cluster identifiers and DB cluster
  /// Amazon Resource Names (ARNs). The results list will only include
  /// information about the DB instances associated with the DB clusters
  /// identified by these ARNs.
  /// </li>
  /// <li>
  /// <code>db-instance-id</code> - Accepts DB instance identifiers and DB
  /// instance Amazon Resource Names (ARNs). The results list will only include
  /// information about the DB instances identified by these ARNs.
  /// </li>
  /// <li>
  /// <code>dbi-resource-id</code> - Accepts DB instance resource identifiers.
  /// The results list will only include information about the DB instances
  /// identified by these DB instance resource identifiers.
  /// </li>
  /// <li>
  /// <code>domain</code> - Accepts Active Directory directory IDs. The results
  /// list will only include information about the DB instances associated with
  /// these domains.
  /// </li>
  /// <li>
  /// <code>engine</code> - Accepts engine names. The results list will only
  /// include information about the DB instances for these engines.
  /// </li>
  /// </ul>
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// <code>DescribeDBInstances</code> request. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that you can retrieve the
  /// remaining results.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<DBInstanceMessage> describeDBInstances({
    String? dBInstanceIdentifier,
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    dBInstanceIdentifier?.also((arg) => $request['DBInstanceIdentifier'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBInstances',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDBInstancesMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDBInstancesResult',
    );
    return DBInstanceMessage.fromXml($result);
  }

  /// Returns a list of DB log files for the DB instance.
  ///
  /// May throw [DBInstanceNotFoundFault].
  ///
  /// Parameter [dBInstanceIdentifier] :
  /// The customer-assigned name of the DB instance that contains the log files
  /// you want to list.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match the identifier of an existing DBInstance.
  /// </li>
  /// </ul>
  ///
  /// Parameter [fileLastWritten] :
  /// Filters the available log files for files written since the specified
  /// date, in POSIX timestamp format with milliseconds.
  ///
  /// Parameter [fileSize] :
  /// Filters the available log files for files larger than the specified size.
  ///
  /// Parameter [filenameContains] :
  /// Filters the available log files for log file names that contain the
  /// specified string.
  ///
  /// Parameter [filters] :
  /// This parameter isn't currently supported.
  ///
  /// Parameter [marker] :
  /// The pagination token provided in the previous request. If this parameter
  /// is specified the response includes only records beyond the marker, up to
  /// MaxRecords.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified MaxRecords value, a pagination token called a
  /// marker is included in the response so you can retrieve the remaining
  /// results.
  Future<DescribeDBLogFilesResponse> describeDBLogFiles({
    required String dBInstanceIdentifier,
    int? fileLastWritten,
    int? fileSize,
    String? filenameContains,
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
  }) async {
    ArgumentError.checkNotNull(dBInstanceIdentifier, 'dBInstanceIdentifier');
    final $request = <String, dynamic>{};
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    fileLastWritten?.also((arg) => $request['FileLastWritten'] = arg);
    fileSize?.also((arg) => $request['FileSize'] = arg);
    filenameContains?.also((arg) => $request['FilenameContains'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBLogFiles',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDBLogFilesMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDBLogFilesResult',
    );
    return DescribeDBLogFilesResponse.fromXml($result);
  }

  /// Returns a list of <code>DBParameterGroup</code> descriptions. If a
  /// <code>DBParameterGroupName</code> is specified, the list will contain only
  /// the description of the specified DB parameter group.
  ///
  /// May throw [DBParameterGroupNotFoundFault].
  ///
  /// Parameter [dBParameterGroupName] :
  /// The name of a specific DB parameter group to return details for.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If supplied, must match the name of an existing DBClusterParameterGroup.
  /// </li>
  /// </ul>
  ///
  /// Parameter [filters] :
  /// This parameter isn't currently supported.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// <code>DescribeDBParameterGroups</code> request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that you can retrieve the
  /// remaining results.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<DBParameterGroupsMessage> describeDBParameterGroups({
    String? dBParameterGroupName,
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    dBParameterGroupName?.also((arg) => $request['DBParameterGroupName'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBParameterGroups',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDBParameterGroupsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDBParameterGroupsResult',
    );
    return DBParameterGroupsMessage.fromXml($result);
  }

  /// Returns the detailed parameter list for a particular DB parameter group.
  ///
  /// May throw [DBParameterGroupNotFoundFault].
  ///
  /// Parameter [dBParameterGroupName] :
  /// The name of a specific DB parameter group to return details for.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If supplied, must match the name of an existing DBParameterGroup.
  /// </li>
  /// </ul>
  ///
  /// Parameter [filters] :
  /// This parameter isn't currently supported.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// <code>DescribeDBParameters</code> request. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that you can retrieve the
  /// remaining results.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// Parameter [source] :
  /// The parameter types to return.
  ///
  /// Default: All parameter types returned
  ///
  /// Valid Values: <code>user | system | engine-default</code>
  Future<DBParameterGroupDetails> describeDBParameters({
    required String dBParameterGroupName,
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
    String? source,
  }) async {
    ArgumentError.checkNotNull(dBParameterGroupName, 'dBParameterGroupName');
    final $request = <String, dynamic>{};
    $request['DBParameterGroupName'] = dBParameterGroupName;
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    source?.also((arg) => $request['Source'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBParameters',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDBParametersMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDBParametersResult',
    );
    return DBParameterGroupDetails.fromXml($result);
  }

  /// Returns information about DB proxies.
  ///
  /// May throw [DBProxyNotFoundFault].
  ///
  /// Parameter [dBProxyName] :
  /// The name of the DB proxy.
  ///
  /// Parameter [filters] :
  /// This parameter is not currently supported.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<DescribeDBProxiesResponse> describeDBProxies({
    String? dBProxyName,
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
  }) async {
    _s.validateNumRange(
      'maxRecords',
      maxRecords,
      20,
      100,
    );
    final $request = <String, dynamic>{};
    dBProxyName?.also((arg) => $request['DBProxyName'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBProxies',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDBProxiesRequest'],
      shapes: shapes,
      resultWrapper: 'DescribeDBProxiesResult',
    );
    return DescribeDBProxiesResponse.fromXml($result);
  }

  /// Returns information about DB proxy target groups, represented by
  /// <code>DBProxyTargetGroup</code> data structures.
  ///
  /// May throw [DBProxyNotFoundFault].
  /// May throw [DBProxyTargetGroupNotFoundFault].
  /// May throw [InvalidDBProxyStateFault].
  ///
  /// Parameter [dBProxyName] :
  /// The identifier of the <code>DBProxy</code> associated with the target
  /// group.
  ///
  /// Parameter [filters] :
  /// This parameter is not currently supported.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// Parameter [targetGroupName] :
  /// The identifier of the <code>DBProxyTargetGroup</code> to describe.
  Future<DescribeDBProxyTargetGroupsResponse> describeDBProxyTargetGroups({
    required String dBProxyName,
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
    String? targetGroupName,
  }) async {
    ArgumentError.checkNotNull(dBProxyName, 'dBProxyName');
    _s.validateNumRange(
      'maxRecords',
      maxRecords,
      20,
      100,
    );
    final $request = <String, dynamic>{};
    $request['DBProxyName'] = dBProxyName;
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    targetGroupName?.also((arg) => $request['TargetGroupName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBProxyTargetGroups',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDBProxyTargetGroupsRequest'],
      shapes: shapes,
      resultWrapper: 'DescribeDBProxyTargetGroupsResult',
    );
    return DescribeDBProxyTargetGroupsResponse.fromXml($result);
  }

  /// Returns information about <code>DBProxyTarget</code> objects. This API
  /// supports pagination.
  ///
  /// May throw [DBProxyNotFoundFault].
  /// May throw [DBProxyTargetNotFoundFault].
  /// May throw [DBProxyTargetGroupNotFoundFault].
  /// May throw [InvalidDBProxyStateFault].
  ///
  /// Parameter [dBProxyName] :
  /// The identifier of the <code>DBProxyTarget</code> to describe.
  ///
  /// Parameter [filters] :
  /// This parameter is not currently supported.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// Parameter [targetGroupName] :
  /// The identifier of the <code>DBProxyTargetGroup</code> to describe.
  Future<DescribeDBProxyTargetsResponse> describeDBProxyTargets({
    required String dBProxyName,
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
    String? targetGroupName,
  }) async {
    ArgumentError.checkNotNull(dBProxyName, 'dBProxyName');
    _s.validateNumRange(
      'maxRecords',
      maxRecords,
      20,
      100,
    );
    final $request = <String, dynamic>{};
    $request['DBProxyName'] = dBProxyName;
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    targetGroupName?.also((arg) => $request['TargetGroupName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBProxyTargets',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDBProxyTargetsRequest'],
      shapes: shapes,
      resultWrapper: 'DescribeDBProxyTargetsResult',
    );
    return DescribeDBProxyTargetsResponse.fromXml($result);
  }

  /// Returns a list of <code>DBSecurityGroup</code> descriptions. If a
  /// <code>DBSecurityGroupName</code> is specified, the list will contain only
  /// the descriptions of the specified DB security group.
  ///
  /// May throw [DBSecurityGroupNotFoundFault].
  ///
  /// Parameter [dBSecurityGroupName] :
  /// The name of the DB security group to return details for.
  ///
  /// Parameter [filters] :
  /// This parameter isn't currently supported.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// <code>DescribeDBSecurityGroups</code> request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that you can retrieve the
  /// remaining results.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<DBSecurityGroupMessage> describeDBSecurityGroups({
    String? dBSecurityGroupName,
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    dBSecurityGroupName?.also((arg) => $request['DBSecurityGroupName'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBSecurityGroups',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDBSecurityGroupsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDBSecurityGroupsResult',
    );
    return DBSecurityGroupMessage.fromXml($result);
  }

  /// Returns a list of DB snapshot attribute names and values for a manual DB
  /// snapshot.
  ///
  /// When sharing snapshots with other AWS accounts,
  /// <code>DescribeDBSnapshotAttributes</code> returns the <code>restore</code>
  /// attribute and a list of IDs for the AWS accounts that are authorized to
  /// copy or restore the manual DB snapshot. If <code>all</code> is included in
  /// the list of values for the <code>restore</code> attribute, then the manual
  /// DB snapshot is public and can be copied or restored by all AWS accounts.
  ///
  /// To add or remove access for an AWS account to copy or restore a manual DB
  /// snapshot, or to make the manual DB snapshot public or private, use the
  /// <code>ModifyDBSnapshotAttribute</code> API action.
  ///
  /// May throw [DBSnapshotNotFoundFault].
  ///
  /// Parameter [dBSnapshotIdentifier] :
  /// The identifier for the DB snapshot to describe the attributes for.
  Future<DescribeDBSnapshotAttributesResult> describeDBSnapshotAttributes({
    required String dBSnapshotIdentifier,
  }) async {
    ArgumentError.checkNotNull(dBSnapshotIdentifier, 'dBSnapshotIdentifier');
    final $request = <String, dynamic>{};
    $request['DBSnapshotIdentifier'] = dBSnapshotIdentifier;
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBSnapshotAttributes',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDBSnapshotAttributesMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDBSnapshotAttributesResult',
    );
    return DescribeDBSnapshotAttributesResult.fromXml($result);
  }

  /// Returns information about DB snapshots. This API action supports
  /// pagination.
  ///
  /// May throw [DBSnapshotNotFoundFault].
  ///
  /// Parameter [dBInstanceIdentifier] :
  /// The ID of the DB instance to retrieve the list of DB snapshots for. This
  /// parameter can't be used in conjunction with
  /// <code>DBSnapshotIdentifier</code>. This parameter isn't case-sensitive.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If supplied, must match the identifier of an existing DBInstance.
  /// </li>
  /// </ul>
  ///
  /// Parameter [dBSnapshotIdentifier] :
  /// A specific DB snapshot identifier to describe. This parameter can't be
  /// used in conjunction with <code>DBInstanceIdentifier</code>. This value is
  /// stored as a lowercase string.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If supplied, must match the identifier of an existing DBSnapshot.
  /// </li>
  /// <li>
  /// If this identifier is for an automated snapshot, the
  /// <code>SnapshotType</code> parameter must also be specified.
  /// </li>
  /// </ul>
  ///
  /// Parameter [dbiResourceId] :
  /// A specific DB resource ID to describe.
  ///
  /// Parameter [filters] :
  /// A filter that specifies one or more DB snapshots to describe.
  ///
  /// Supported filters:
  ///
  /// <ul>
  /// <li>
  /// <code>db-instance-id</code> - Accepts DB instance identifiers and DB
  /// instance Amazon Resource Names (ARNs).
  /// </li>
  /// <li>
  /// <code>db-snapshot-id</code> - Accepts DB snapshot identifiers.
  /// </li>
  /// <li>
  /// <code>dbi-resource-id</code> - Accepts identifiers of source DB instances.
  /// </li>
  /// <li>
  /// <code>snapshot-type</code> - Accepts types of DB snapshots.
  /// </li>
  /// <li>
  /// <code>engine</code> - Accepts names of database engines.
  /// </li>
  /// </ul>
  ///
  /// Parameter [includePublic] :
  /// A value that indicates whether to include manual DB cluster snapshots that
  /// are public and can be copied or restored by any AWS account. By default,
  /// the public snapshots are not included.
  ///
  /// You can share a manual DB snapshot as public by using the
  /// <a>ModifyDBSnapshotAttribute</a> API.
  ///
  /// Parameter [includeShared] :
  /// A value that indicates whether to include shared manual DB cluster
  /// snapshots from other AWS accounts that this AWS account has been given
  /// permission to copy or restore. By default, these snapshots are not
  /// included.
  ///
  /// You can give an AWS account permission to restore a manual DB snapshot
  /// from another AWS account by using the
  /// <code>ModifyDBSnapshotAttribute</code> API action.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// <code>DescribeDBSnapshots</code> request. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that you can retrieve the
  /// remaining results.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// Parameter [snapshotType] :
  /// The type of snapshots to be returned. You can specify one of the following
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <code>automated</code> - Return all DB snapshots that have been
  /// automatically taken by Amazon RDS for my AWS account.
  /// </li>
  /// <li>
  /// <code>manual</code> - Return all DB snapshots that have been taken by my
  /// AWS account.
  /// </li>
  /// <li>
  /// <code>shared</code> - Return all manual DB snapshots that have been shared
  /// to my AWS account.
  /// </li>
  /// <li>
  /// <code>public</code> - Return all DB snapshots that have been marked as
  /// public.
  /// </li>
  /// <li>
  /// <code>awsbackup</code> - Return the DB snapshots managed by the AWS Backup
  /// service.
  ///
  /// For information about AWS Backup, see the <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/whatisbackup.html">
  /// <i>AWS Backup Developer Guide.</i> </a>
  ///
  /// The <code>awsbackup</code> type does not apply to Aurora.
  /// </li>
  /// </ul>
  /// If you don't specify a <code>SnapshotType</code> value, then both
  /// automated and manual snapshots are returned. Shared and public DB
  /// snapshots are not included in the returned results by default. You can
  /// include shared snapshots with these results by enabling the
  /// <code>IncludeShared</code> parameter. You can include public snapshots
  /// with these results by enabling the <code>IncludePublic</code> parameter.
  ///
  /// The <code>IncludeShared</code> and <code>IncludePublic</code> parameters
  /// don't apply for <code>SnapshotType</code> values of <code>manual</code> or
  /// <code>automated</code>. The <code>IncludePublic</code> parameter doesn't
  /// apply when <code>SnapshotType</code> is set to <code>shared</code>. The
  /// <code>IncludeShared</code> parameter doesn't apply when
  /// <code>SnapshotType</code> is set to <code>public</code>.
  Future<DBSnapshotMessage> describeDBSnapshots({
    String? dBInstanceIdentifier,
    String? dBSnapshotIdentifier,
    String? dbiResourceId,
    List<Filter>? filters,
    bool? includePublic,
    bool? includeShared,
    String? marker,
    int? maxRecords,
    String? snapshotType,
  }) async {
    final $request = <String, dynamic>{};
    dBInstanceIdentifier?.also((arg) => $request['DBInstanceIdentifier'] = arg);
    dBSnapshotIdentifier?.also((arg) => $request['DBSnapshotIdentifier'] = arg);
    dbiResourceId?.also((arg) => $request['DbiResourceId'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    includePublic?.also((arg) => $request['IncludePublic'] = arg);
    includeShared?.also((arg) => $request['IncludeShared'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    snapshotType?.also((arg) => $request['SnapshotType'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBSnapshots',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDBSnapshotsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDBSnapshotsResult',
    );
    return DBSnapshotMessage.fromXml($result);
  }

  /// Returns a list of DBSubnetGroup descriptions. If a DBSubnetGroupName is
  /// specified, the list will contain only the descriptions of the specified
  /// DBSubnetGroup.
  ///
  /// For an overview of CIDR ranges, go to the <a
  /// href="http://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Wikipedia
  /// Tutorial</a>.
  ///
  /// May throw [DBSubnetGroupNotFoundFault].
  ///
  /// Parameter [dBSubnetGroupName] :
  /// The name of the DB subnet group to return details for.
  ///
  /// Parameter [filters] :
  /// This parameter isn't currently supported.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous DescribeDBSubnetGroups
  /// request. If this parameter is specified, the response includes only
  /// records beyond the marker, up to the value specified by
  /// <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that you can retrieve the
  /// remaining results.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<DBSubnetGroupMessage> describeDBSubnetGroups({
    String? dBSubnetGroupName,
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    dBSubnetGroupName?.also((arg) => $request['DBSubnetGroupName'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBSubnetGroups',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDBSubnetGroupsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDBSubnetGroupsResult',
    );
    return DBSubnetGroupMessage.fromXml($result);
  }

  /// Returns the default engine and system parameter information for the
  /// cluster database engine.
  ///
  /// For more information on Amazon Aurora, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
  /// What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i>
  ///
  /// Parameter [dBParameterGroupFamily] :
  /// The name of the DB cluster parameter group family to return engine
  /// parameter information for.
  ///
  /// Parameter [filters] :
  /// This parameter isn't currently supported.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// <code>DescribeEngineDefaultClusterParameters</code> request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so you can retrieve the
  /// remaining results.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<DescribeEngineDefaultClusterParametersResult>
      describeEngineDefaultClusterParameters({
    required String dBParameterGroupFamily,
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
  }) async {
    ArgumentError.checkNotNull(
        dBParameterGroupFamily, 'dBParameterGroupFamily');
    final $request = <String, dynamic>{};
    $request['DBParameterGroupFamily'] = dBParameterGroupFamily;
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeEngineDefaultClusterParameters',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeEngineDefaultClusterParametersMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeEngineDefaultClusterParametersResult',
    );
    return DescribeEngineDefaultClusterParametersResult.fromXml($result);
  }

  /// Returns the default engine and system parameter information for the
  /// specified database engine.
  ///
  /// Parameter [dBParameterGroupFamily] :
  /// The name of the DB parameter group family.
  ///
  /// Parameter [filters] :
  /// This parameter isn't currently supported.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// <code>DescribeEngineDefaultParameters</code> request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so you can retrieve the
  /// remaining results.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<DescribeEngineDefaultParametersResult>
      describeEngineDefaultParameters({
    required String dBParameterGroupFamily,
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
  }) async {
    ArgumentError.checkNotNull(
        dBParameterGroupFamily, 'dBParameterGroupFamily');
    final $request = <String, dynamic>{};
    $request['DBParameterGroupFamily'] = dBParameterGroupFamily;
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeEngineDefaultParameters',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeEngineDefaultParametersMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeEngineDefaultParametersResult',
    );
    return DescribeEngineDefaultParametersResult.fromXml($result);
  }

  /// Displays a list of categories for all event source types, or, if
  /// specified, for a specified source type. You can see a list of the event
  /// categories and source types in <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Events.html">
  /// Events</a> in the <i>Amazon RDS User Guide.</i>
  ///
  /// Parameter [filters] :
  /// This parameter isn't currently supported.
  ///
  /// Parameter [sourceType] :
  /// The type of source that is generating the events.
  ///
  /// Valid values: <code>db-instance</code> | <code>db-cluster</code> |
  /// <code>db-parameter-group</code> | <code>db-security-group</code> |
  /// <code>db-snapshot</code> | <code>db-cluster-snapshot</code>
  Future<EventCategoriesMessage> describeEventCategories({
    List<Filter>? filters,
    String? sourceType,
  }) async {
    final $request = <String, dynamic>{};
    filters?.also((arg) => $request['Filters'] = arg);
    sourceType?.also((arg) => $request['SourceType'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeEventCategories',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeEventCategoriesMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeEventCategoriesResult',
    );
    return EventCategoriesMessage.fromXml($result);
  }

  /// Lists all the subscription descriptions for a customer account. The
  /// description for a subscription includes <code>SubscriptionName</code>,
  /// <code>SNSTopicARN</code>, <code>CustomerID</code>,
  /// <code>SourceType</code>, <code>SourceID</code>, <code>CreationTime</code>,
  /// and <code>Status</code>.
  ///
  /// If you specify a <code>SubscriptionName</code>, lists the description for
  /// that subscription.
  ///
  /// May throw [SubscriptionNotFoundFault].
  ///
  /// Parameter [filters] :
  /// This parameter isn't currently supported.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// DescribeOrderableDBInstanceOptions request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by <code>MaxRecords</code> .
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that you can retrieve the
  /// remaining results.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// Parameter [subscriptionName] :
  /// The name of the RDS event notification subscription you want to describe.
  Future<EventSubscriptionsMessage> describeEventSubscriptions({
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
    String? subscriptionName,
  }) async {
    final $request = <String, dynamic>{};
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    subscriptionName?.also((arg) => $request['SubscriptionName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeEventSubscriptions',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeEventSubscriptionsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeEventSubscriptionsResult',
    );
    return EventSubscriptionsMessage.fromXml($result);
  }

  /// Returns events related to DB instances, DB clusters, DB parameter groups,
  /// DB security groups, DB snapshots, and DB cluster snapshots for the past 14
  /// days. Events specific to a particular DB instances, DB clusters, DB
  /// parameter groups, DB security groups, DB snapshots, and DB cluster
  /// snapshots group can be obtained by providing the name as a parameter.
  /// <note>
  /// By default, the past hour of events are returned.
  /// </note>
  ///
  /// Parameter [duration] :
  /// The number of minutes to retrieve events for.
  ///
  /// Default: 60
  ///
  /// Parameter [endTime] :
  /// The end of the time interval for which to retrieve events, specified in
  /// ISO 8601 format. For more information about ISO 8601, go to the <a
  /// href="http://en.wikipedia.org/wiki/ISO_8601">ISO8601 Wikipedia page.</a>
  ///
  /// Example: 2009-07-08T18:00Z
  ///
  /// Parameter [eventCategories] :
  /// A list of event categories that trigger notifications for a event
  /// notification subscription.
  ///
  /// Parameter [filters] :
  /// This parameter isn't currently supported.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous DescribeEvents
  /// request. If this parameter is specified, the response includes only
  /// records beyond the marker, up to the value specified by
  /// <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that you can retrieve the
  /// remaining results.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// Parameter [sourceIdentifier] :
  /// The identifier of the event source for which events are returned. If not
  /// specified, then all sources are included in the response.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If <code>SourceIdentifier</code> is supplied, <code>SourceType</code> must
  /// also be provided.
  /// </li>
  /// <li>
  /// If the source type is a DB instance, a <code>DBInstanceIdentifier</code>
  /// value must be supplied.
  /// </li>
  /// <li>
  /// If the source type is a DB cluster, a <code>DBClusterIdentifier</code>
  /// value must be supplied.
  /// </li>
  /// <li>
  /// If the source type is a DB parameter group, a
  /// <code>DBParameterGroupName</code> value must be supplied.
  /// </li>
  /// <li>
  /// If the source type is a DB security group, a
  /// <code>DBSecurityGroupName</code> value must be supplied.
  /// </li>
  /// <li>
  /// If the source type is a DB snapshot, a <code>DBSnapshotIdentifier</code>
  /// value must be supplied.
  /// </li>
  /// <li>
  /// If the source type is a DB cluster snapshot, a
  /// <code>DBClusterSnapshotIdentifier</code> value must be supplied.
  /// </li>
  /// <li>
  /// Can't end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul>
  ///
  /// Parameter [sourceType] :
  /// The event source to retrieve events for. If no value is specified, all
  /// events are returned.
  ///
  /// Parameter [startTime] :
  /// The beginning of the time interval to retrieve events for, specified in
  /// ISO 8601 format. For more information about ISO 8601, go to the <a
  /// href="http://en.wikipedia.org/wiki/ISO_8601">ISO8601 Wikipedia page.</a>
  ///
  /// Example: 2009-07-08T18:00Z
  Future<EventsMessage> describeEvents({
    int? duration,
    DateTime? endTime,
    List<String>? eventCategories,
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
    String? sourceIdentifier,
    SourceType? sourceType,
    DateTime? startTime,
  }) async {
    final $request = <String, dynamic>{};
    duration?.also((arg) => $request['Duration'] = arg);
    endTime?.also((arg) => $request['EndTime'] = _s.iso8601ToJson(arg));
    eventCategories?.also((arg) => $request['EventCategories'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    sourceIdentifier?.also((arg) => $request['SourceIdentifier'] = arg);
    sourceType?.also((arg) => $request['SourceType'] = arg.toValue());
    startTime?.also((arg) => $request['StartTime'] = _s.iso8601ToJson(arg));
    final $result = await _protocol.send(
      $request,
      action: 'DescribeEvents',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeEventsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeEventsResult',
    );
    return EventsMessage.fromXml($result);
  }

  /// Returns information about a snapshot export to Amazon S3. This API
  /// operation supports pagination.
  ///
  /// May throw [ExportTaskNotFoundFault].
  ///
  /// Parameter [exportTaskIdentifier] :
  /// The identifier of the snapshot export task to be described.
  ///
  /// Parameter [filters] :
  /// Filters specify one or more snapshot exports to describe. The filters are
  /// specified as name-value pairs that define what to include in the output.
  /// Filter names and values are case-sensitive.
  ///
  /// Supported filters include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>export-task-identifier</code> - An identifier for the snapshot
  /// export task.
  /// </li>
  /// <li>
  /// <code>s3-bucket</code> - The Amazon S3 bucket the snapshot is exported to.
  /// </li>
  /// <li>
  /// <code>source-arn</code> - The Amazon Resource Name (ARN) of the snapshot
  /// exported to Amazon S3
  /// </li>
  /// <li>
  /// <code>status</code> - The status of the export task. Must be lowercase,
  /// for example, <code>complete</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// <code>DescribeExportTasks</code> request. If you specify this parameter,
  /// the response includes only records beyond the marker, up to the value
  /// specified by the <code>MaxRecords</code> parameter.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified value, a pagination token called a marker is
  /// included in the response. You can use the marker in a later
  /// <code>DescribeExportTasks</code> request to retrieve the remaining
  /// results.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// Parameter [sourceArn] :
  /// The Amazon Resource Name (ARN) of the snapshot exported to Amazon S3.
  Future<ExportTasksMessage> describeExportTasks({
    String? exportTaskIdentifier,
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
    String? sourceArn,
  }) async {
    _s.validateNumRange(
      'maxRecords',
      maxRecords,
      20,
      100,
    );
    final $request = <String, dynamic>{};
    exportTaskIdentifier?.also((arg) => $request['ExportTaskIdentifier'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    sourceArn?.also((arg) => $request['SourceArn'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeExportTasks',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeExportTasksMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeExportTasksResult',
    );
    return ExportTasksMessage.fromXml($result);
  }

  /// Returns information about Aurora global database clusters. This API
  /// supports pagination.
  ///
  /// For more information on Amazon Aurora, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
  /// What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i>
  /// <note>
  /// This action only applies to Aurora DB clusters.
  /// </note>
  ///
  /// May throw [GlobalClusterNotFoundFault].
  ///
  /// Parameter [filters] :
  /// A filter that specifies one or more global DB clusters to describe.
  ///
  /// Supported filters:
  ///
  /// <ul>
  /// <li>
  /// <code>db-cluster-id</code> - Accepts DB cluster identifiers and DB cluster
  /// Amazon Resource Names (ARNs). The results list will only include
  /// information about the DB clusters identified by these ARNs.
  /// </li>
  /// </ul>
  ///
  /// Parameter [globalClusterIdentifier] :
  /// The user-supplied DB cluster identifier. If this parameter is specified,
  /// information from only the specific DB cluster is returned. This parameter
  /// isn't case-sensitive.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If supplied, must match an existing DBClusterIdentifier.
  /// </li>
  /// </ul>
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// <code>DescribeGlobalClusters</code> request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that you can retrieve the
  /// remaining results.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<GlobalClustersMessage> describeGlobalClusters({
    List<Filter>? filters,
    String? globalClusterIdentifier,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    filters?.also((arg) => $request['Filters'] = arg);
    globalClusterIdentifier
        ?.also((arg) => $request['GlobalClusterIdentifier'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeGlobalClusters',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeGlobalClustersMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeGlobalClustersResult',
    );
    return GlobalClustersMessage.fromXml($result);
  }

  /// Describes the available installation media for a DB engine that requires
  /// an on-premises customer provided license, such as Microsoft SQL Server.
  ///
  /// May throw [InstallationMediaNotFoundFault].
  ///
  /// Parameter [filters] :
  /// A filter that specifies one or more installation media to describe.
  /// Supported filters include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>custom-availability-zone-id</code> - Accepts custom Availability
  /// Zone (AZ) identifiers. The results list includes information about only
  /// the custom AZs identified by these identifiers.
  /// </li>
  /// <li>
  /// <code>engine</code> - Accepts database engines. The results list includes
  /// information about only the database engines identified by these
  /// identifiers.
  ///
  /// For more information about the valid engines for installation media, see
  /// <a>ImportInstallationMedia</a>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [installationMediaId] :
  /// The installation medium ID.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// An optional pagination token provided by a previous
  /// DescribeInstallationMedia request. If this parameter is specified, the
  /// response includes only records beyond the marker, up to the value
  /// specified by <code>MaxRecords</code>.
  Future<InstallationMediaMessage> describeInstallationMedia({
    List<Filter>? filters,
    String? installationMediaId,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    filters?.also((arg) => $request['Filters'] = arg);
    installationMediaId?.also((arg) => $request['InstallationMediaId'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeInstallationMedia',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeInstallationMediaMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeInstallationMediaResult',
    );
    return InstallationMediaMessage.fromXml($result);
  }

  /// Describes all available options.
  ///
  /// Parameter [engineName] :
  /// A required parameter. Options available for the given engine name are
  /// described.
  ///
  /// Parameter [filters] :
  /// This parameter isn't currently supported.
  ///
  /// Parameter [majorEngineVersion] :
  /// If specified, filters the results to include only options for the
  /// specified major engine version.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that you can retrieve the
  /// remaining results.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<OptionGroupOptionsMessage> describeOptionGroupOptions({
    required String engineName,
    List<Filter>? filters,
    String? majorEngineVersion,
    String? marker,
    int? maxRecords,
  }) async {
    ArgumentError.checkNotNull(engineName, 'engineName');
    final $request = <String, dynamic>{};
    $request['EngineName'] = engineName;
    filters?.also((arg) => $request['Filters'] = arg);
    majorEngineVersion?.also((arg) => $request['MajorEngineVersion'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeOptionGroupOptions',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeOptionGroupOptionsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeOptionGroupOptionsResult',
    );
    return OptionGroupOptionsMessage.fromXml($result);
  }

  /// Describes the available option groups.
  ///
  /// May throw [OptionGroupNotFoundFault].
  ///
  /// Parameter [engineName] :
  /// Filters the list of option groups to only include groups associated with a
  /// specific database engine.
  ///
  /// Parameter [filters] :
  /// This parameter isn't currently supported.
  ///
  /// Parameter [majorEngineVersion] :
  /// Filters the list of option groups to only include groups associated with a
  /// specific database engine version. If specified, then EngineName must also
  /// be specified.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous DescribeOptionGroups
  /// request. If this parameter is specified, the response includes only
  /// records beyond the marker, up to the value specified by
  /// <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that you can retrieve the
  /// remaining results.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// Parameter [optionGroupName] :
  /// The name of the option group to describe. Can't be supplied together with
  /// EngineName or MajorEngineVersion.
  Future<OptionGroups> describeOptionGroups({
    String? engineName,
    List<Filter>? filters,
    String? majorEngineVersion,
    String? marker,
    int? maxRecords,
    String? optionGroupName,
  }) async {
    final $request = <String, dynamic>{};
    engineName?.also((arg) => $request['EngineName'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    majorEngineVersion?.also((arg) => $request['MajorEngineVersion'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    optionGroupName?.also((arg) => $request['OptionGroupName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeOptionGroups',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeOptionGroupsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeOptionGroupsResult',
    );
    return OptionGroups.fromXml($result);
  }

  /// Returns a list of orderable DB instance options for the specified engine.
  ///
  /// Parameter [engine] :
  /// The name of the engine to retrieve DB instance options for.
  ///
  /// Parameter [availabilityZoneGroup] :
  /// The Availability Zone group associated with a Local Zone. Specify this
  /// parameter to retrieve available offerings for the Local Zones in the
  /// group.
  ///
  /// Omit this parameter to show the available offerings in the specified AWS
  /// Region.
  ///
  /// Parameter [dBInstanceClass] :
  /// The DB instance class filter value. Specify this parameter to show only
  /// the available offerings matching the specified DB instance class.
  ///
  /// Parameter [engineVersion] :
  /// The engine version filter value. Specify this parameter to show only the
  /// available offerings matching the specified engine version.
  ///
  /// Parameter [filters] :
  /// This parameter isn't currently supported.
  ///
  /// Parameter [licenseModel] :
  /// The license model filter value. Specify this parameter to show only the
  /// available offerings matching the specified license model.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// DescribeOrderableDBInstanceOptions request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by <code>MaxRecords</code> .
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that you can retrieve the
  /// remaining results.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// Parameter [vpc] :
  /// A value that indicates whether to show only VPC or non-VPC offerings.
  Future<OrderableDBInstanceOptionsMessage> describeOrderableDBInstanceOptions({
    required String engine,
    String? availabilityZoneGroup,
    String? dBInstanceClass,
    String? engineVersion,
    List<Filter>? filters,
    String? licenseModel,
    String? marker,
    int? maxRecords,
    bool? vpc,
  }) async {
    ArgumentError.checkNotNull(engine, 'engine');
    final $request = <String, dynamic>{};
    $request['Engine'] = engine;
    availabilityZoneGroup
        ?.also((arg) => $request['AvailabilityZoneGroup'] = arg);
    dBInstanceClass?.also((arg) => $request['DBInstanceClass'] = arg);
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    licenseModel?.also((arg) => $request['LicenseModel'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    vpc?.also((arg) => $request['Vpc'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeOrderableDBInstanceOptions',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeOrderableDBInstanceOptionsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeOrderableDBInstanceOptionsResult',
    );
    return OrderableDBInstanceOptionsMessage.fromXml($result);
  }

  /// Returns a list of resources (for example, DB instances) that have at least
  /// one pending maintenance action.
  ///
  /// May throw [ResourceNotFoundFault].
  ///
  /// Parameter [filters] :
  /// A filter that specifies one or more resources to return pending
  /// maintenance actions for.
  ///
  /// Supported filters:
  ///
  /// <ul>
  /// <li>
  /// <code>db-cluster-id</code> - Accepts DB cluster identifiers and DB cluster
  /// Amazon Resource Names (ARNs). The results list will only include pending
  /// maintenance actions for the DB clusters identified by these ARNs.
  /// </li>
  /// <li>
  /// <code>db-instance-id</code> - Accepts DB instance identifiers and DB
  /// instance ARNs. The results list will only include pending maintenance
  /// actions for the DB instances identified by these ARNs.
  /// </li>
  /// </ul>
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// <code>DescribePendingMaintenanceActions</code> request. If this parameter
  /// is specified, the response includes only records beyond the marker, up to
  /// a number of records specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that you can retrieve the
  /// remaining results.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// Parameter [resourceIdentifier] :
  /// The ARN of a resource to return pending maintenance actions for.
  Future<PendingMaintenanceActionsMessage> describePendingMaintenanceActions({
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
    String? resourceIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    resourceIdentifier?.also((arg) => $request['ResourceIdentifier'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribePendingMaintenanceActions',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribePendingMaintenanceActionsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribePendingMaintenanceActionsResult',
    );
    return PendingMaintenanceActionsMessage.fromXml($result);
  }

  /// Returns information about reserved DB instances for this account, or about
  /// a specified reserved DB instance.
  ///
  /// May throw [ReservedDBInstanceNotFoundFault].
  ///
  /// Parameter [dBInstanceClass] :
  /// The DB instance class filter value. Specify this parameter to show only
  /// those reservations matching the specified DB instances class.
  ///
  /// Parameter [duration] :
  /// The duration filter value, specified in years or seconds. Specify this
  /// parameter to show only reservations for this duration.
  ///
  /// Valid Values: <code>1 | 3 | 31536000 | 94608000</code>
  ///
  /// Parameter [filters] :
  /// This parameter isn't currently supported.
  ///
  /// Parameter [leaseId] :
  /// The lease identifier filter value. Specify this parameter to show only the
  /// reservation that matches the specified lease ID.
  /// <note>
  /// AWS Support might request the lease ID for an issue related to a reserved
  /// DB instance.
  /// </note>
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more than the
  /// <code>MaxRecords</code> value is available, a pagination token called a
  /// marker is included in the response so you can retrieve the remaining
  /// results.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// Parameter [multiAZ] :
  /// A value that indicates whether to show only those reservations that
  /// support Multi-AZ.
  ///
  /// Parameter [offeringType] :
  /// The offering type filter value. Specify this parameter to show only the
  /// available offerings matching the specified offering type.
  ///
  /// Valid Values: <code>"Partial Upfront" | "All Upfront" | "No Upfront"
  /// </code>
  ///
  /// Parameter [productDescription] :
  /// The product description filter value. Specify this parameter to show only
  /// those reservations matching the specified product description.
  ///
  /// Parameter [reservedDBInstanceId] :
  /// The reserved DB instance identifier filter value. Specify this parameter
  /// to show only the reservation that matches the specified reservation ID.
  ///
  /// Parameter [reservedDBInstancesOfferingId] :
  /// The offering identifier filter value. Specify this parameter to show only
  /// purchased reservations matching the specified offering identifier.
  Future<ReservedDBInstanceMessage> describeReservedDBInstances({
    String? dBInstanceClass,
    String? duration,
    List<Filter>? filters,
    String? leaseId,
    String? marker,
    int? maxRecords,
    bool? multiAZ,
    String? offeringType,
    String? productDescription,
    String? reservedDBInstanceId,
    String? reservedDBInstancesOfferingId,
  }) async {
    final $request = <String, dynamic>{};
    dBInstanceClass?.also((arg) => $request['DBInstanceClass'] = arg);
    duration?.also((arg) => $request['Duration'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    leaseId?.also((arg) => $request['LeaseId'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    multiAZ?.also((arg) => $request['MultiAZ'] = arg);
    offeringType?.also((arg) => $request['OfferingType'] = arg);
    productDescription?.also((arg) => $request['ProductDescription'] = arg);
    reservedDBInstanceId?.also((arg) => $request['ReservedDBInstanceId'] = arg);
    reservedDBInstancesOfferingId
        ?.also((arg) => $request['ReservedDBInstancesOfferingId'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeReservedDBInstances',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeReservedDBInstancesMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeReservedDBInstancesResult',
    );
    return ReservedDBInstanceMessage.fromXml($result);
  }

  /// Lists available reserved DB instance offerings.
  ///
  /// May throw [ReservedDBInstancesOfferingNotFoundFault].
  ///
  /// Parameter [dBInstanceClass] :
  /// The DB instance class filter value. Specify this parameter to show only
  /// the available offerings matching the specified DB instance class.
  ///
  /// Parameter [duration] :
  /// Duration filter value, specified in years or seconds. Specify this
  /// parameter to show only reservations for this duration.
  ///
  /// Valid Values: <code>1 | 3 | 31536000 | 94608000</code>
  ///
  /// Parameter [filters] :
  /// This parameter isn't currently supported.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more than the
  /// <code>MaxRecords</code> value is available, a pagination token called a
  /// marker is included in the response so you can retrieve the remaining
  /// results.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// Parameter [multiAZ] :
  /// A value that indicates whether to show only those reservations that
  /// support Multi-AZ.
  ///
  /// Parameter [offeringType] :
  /// The offering type filter value. Specify this parameter to show only the
  /// available offerings matching the specified offering type.
  ///
  /// Valid Values: <code>"Partial Upfront" | "All Upfront" | "No Upfront"
  /// </code>
  ///
  /// Parameter [productDescription] :
  /// Product description filter value. Specify this parameter to show only the
  /// available offerings that contain the specified product description.
  /// <note>
  /// The results show offerings that partially match the filter value.
  /// </note>
  ///
  /// Parameter [reservedDBInstancesOfferingId] :
  /// The offering identifier filter value. Specify this parameter to show only
  /// the available offering that matches the specified reservation identifier.
  ///
  /// Example: <code>438012d3-4052-4cc7-b2e3-8d3372e0e706</code>
  Future<ReservedDBInstancesOfferingMessage>
      describeReservedDBInstancesOfferings({
    String? dBInstanceClass,
    String? duration,
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
    bool? multiAZ,
    String? offeringType,
    String? productDescription,
    String? reservedDBInstancesOfferingId,
  }) async {
    final $request = <String, dynamic>{};
    dBInstanceClass?.also((arg) => $request['DBInstanceClass'] = arg);
    duration?.also((arg) => $request['Duration'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    multiAZ?.also((arg) => $request['MultiAZ'] = arg);
    offeringType?.also((arg) => $request['OfferingType'] = arg);
    productDescription?.also((arg) => $request['ProductDescription'] = arg);
    reservedDBInstancesOfferingId
        ?.also((arg) => $request['ReservedDBInstancesOfferingId'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeReservedDBInstancesOfferings',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeReservedDBInstancesOfferingsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeReservedDBInstancesOfferingsResult',
    );
    return ReservedDBInstancesOfferingMessage.fromXml($result);
  }

  /// Returns a list of the source AWS Regions where the current AWS Region can
  /// create a read replica, copy a DB snapshot from, or replicate automated
  /// backups from. This API action supports pagination.
  ///
  /// Parameter [filters] :
  /// This parameter isn't currently supported.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// <code>DescribeSourceRegions</code> request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so you can retrieve the
  /// remaining results.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// Parameter [regionName] :
  /// The source AWS Region name. For example, <code>us-east-1</code>.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must specify a valid AWS Region name.
  /// </li>
  /// </ul>
  Future<SourceRegionMessage> describeSourceRegions({
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
    String? regionName,
  }) async {
    final $request = <String, dynamic>{};
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    regionName?.also((arg) => $request['RegionName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeSourceRegions',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeSourceRegionsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeSourceRegionsResult',
    );
    return SourceRegionMessage.fromXml($result);
  }

  /// You can call <code>DescribeValidDBInstanceModifications</code> to learn
  /// what modifications you can make to your DB instance. You can use this
  /// information when you call <code>ModifyDBInstance</code>.
  ///
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [InvalidDBInstanceStateFault].
  ///
  /// Parameter [dBInstanceIdentifier] :
  /// The customer identifier or the ARN of your DB instance.
  Future<DescribeValidDBInstanceModificationsResult>
      describeValidDBInstanceModifications({
    required String dBInstanceIdentifier,
  }) async {
    ArgumentError.checkNotNull(dBInstanceIdentifier, 'dBInstanceIdentifier');
    final $request = <String, dynamic>{};
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    final $result = await _protocol.send(
      $request,
      action: 'DescribeValidDBInstanceModifications',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeValidDBInstanceModificationsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeValidDBInstanceModificationsResult',
    );
    return DescribeValidDBInstanceModificationsResult.fromXml($result);
  }

  /// Downloads all or a portion of the specified log file, up to 1 MB in size.
  ///
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [DBLogFileNotFoundFault].
  ///
  /// Parameter [dBInstanceIdentifier] :
  /// The customer-assigned name of the DB instance that contains the log files
  /// you want to list.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match the identifier of an existing DBInstance.
  /// </li>
  /// </ul>
  ///
  /// Parameter [logFileName] :
  /// The name of the log file to be downloaded.
  ///
  /// Parameter [marker] :
  /// The pagination token provided in the previous request or "0". If the
  /// Marker parameter is specified the response includes only records beyond
  /// the marker until the end of the file or up to NumberOfLines.
  ///
  /// Parameter [numberOfLines] :
  /// The number of lines to download. If the number of lines specified results
  /// in a file over 1 MB in size, the file is truncated at 1 MB in size.
  ///
  /// If the NumberOfLines parameter is specified, then the block of lines
  /// returned can be from the beginning or the end of the log file, depending
  /// on the value of the Marker parameter.
  ///
  /// <ul>
  /// <li>
  /// If neither Marker or NumberOfLines are specified, the entire log file is
  /// returned up to a maximum of 10000 lines, starting with the most recent log
  /// entries first.
  /// </li>
  /// <li>
  /// If NumberOfLines is specified and Marker isn't specified, then the most
  /// recent lines from the end of the log file are returned.
  /// </li>
  /// <li>
  /// If Marker is specified as "0", then the specified number of lines from the
  /// beginning of the log file are returned.
  /// </li>
  /// <li>
  /// You can download the log file in blocks of lines by specifying the size of
  /// the block using the NumberOfLines parameter, and by specifying a value of
  /// "0" for the Marker parameter in your first request. Include the Marker
  /// value returned in the response as the Marker value for the next request,
  /// continuing until the AdditionalDataPending response element returns false.
  /// </li>
  /// </ul>
  Future<DownloadDBLogFilePortionDetails> downloadDBLogFilePortion({
    required String dBInstanceIdentifier,
    required String logFileName,
    String? marker,
    int? numberOfLines,
  }) async {
    ArgumentError.checkNotNull(dBInstanceIdentifier, 'dBInstanceIdentifier');
    ArgumentError.checkNotNull(logFileName, 'logFileName');
    final $request = <String, dynamic>{};
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    $request['LogFileName'] = logFileName;
    marker?.also((arg) => $request['Marker'] = arg);
    numberOfLines?.also((arg) => $request['NumberOfLines'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DownloadDBLogFilePortion',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DownloadDBLogFilePortionMessage'],
      shapes: shapes,
      resultWrapper: 'DownloadDBLogFilePortionResult',
    );
    return DownloadDBLogFilePortionDetails.fromXml($result);
  }

  /// Forces a failover for a DB cluster.
  ///
  /// A failover for a DB cluster promotes one of the Aurora Replicas (read-only
  /// instances) in the DB cluster to be the primary instance (the cluster
  /// writer).
  ///
  /// Amazon Aurora will automatically fail over to an Aurora Replica, if one
  /// exists, when the primary instance fails. You can force a failover when you
  /// want to simulate a failure of a primary instance for testing. Because each
  /// instance in a DB cluster has its own endpoint address, you will need to
  /// clean up and re-establish any existing connections that use those endpoint
  /// addresses when the failover is complete.
  ///
  /// For more information on Amazon Aurora, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
  /// What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i>
  /// <note>
  /// This action only applies to Aurora DB clusters.
  /// </note>
  ///
  /// May throw [DBClusterNotFoundFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [InvalidDBInstanceStateFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// A DB cluster identifier to force a failover for. This parameter isn't
  /// case-sensitive.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match the identifier of an existing DBCluster.
  /// </li>
  /// </ul>
  ///
  /// Parameter [targetDBInstanceIdentifier] :
  /// The name of the instance to promote to the primary instance.
  ///
  /// You must specify the instance identifier for an Aurora Replica in the DB
  /// cluster. For example, <code>mydbcluster-replica1</code>.
  Future<FailoverDBClusterResult> failoverDBCluster({
    required String dBClusterIdentifier,
    String? targetDBInstanceIdentifier,
  }) async {
    ArgumentError.checkNotNull(dBClusterIdentifier, 'dBClusterIdentifier');
    final $request = <String, dynamic>{};
    $request['DBClusterIdentifier'] = dBClusterIdentifier;
    targetDBInstanceIdentifier
        ?.also((arg) => $request['TargetDBInstanceIdentifier'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'FailoverDBCluster',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['FailoverDBClusterMessage'],
      shapes: shapes,
      resultWrapper: 'FailoverDBClusterResult',
    );
    return FailoverDBClusterResult.fromXml($result);
  }

  /// Imports the installation media for a DB engine that requires an
  /// on-premises customer provided license, such as SQL Server.
  ///
  /// May throw [CustomAvailabilityZoneNotFoundFault].
  /// May throw [InstallationMediaAlreadyExistsFault].
  ///
  /// Parameter [customAvailabilityZoneId] :
  /// The identifier of the custom Availability Zone (AZ) to import the
  /// installation media to.
  ///
  /// Parameter [engine] :
  /// The name of the database engine to be used for this instance.
  ///
  /// The list only includes supported DB engines that require an on-premises
  /// customer provided license.
  ///
  /// Valid Values:
  ///
  /// <ul>
  /// <li>
  /// <code>sqlserver-ee</code>
  /// </li>
  /// <li>
  /// <code>sqlserver-se</code>
  /// </li>
  /// <li>
  /// <code>sqlserver-ex</code>
  /// </li>
  /// <li>
  /// <code>sqlserver-web</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [engineInstallationMediaPath] :
  /// The path to the installation medium for the specified DB engine.
  ///
  /// Example:
  /// <code>SQLServerISO/en_sql_server_2016_enterprise_x64_dvd_8701793.iso</code>
  ///
  /// Parameter [engineVersion] :
  /// The version number of the database engine to use.
  ///
  /// For a list of valid engine versions, call <a>DescribeDBEngineVersions</a>.
  ///
  /// The following are the database engines and links to information about the
  /// major and minor versions. The list only includes DB engines that require
  /// an on-premises customer provided license.
  ///
  /// <b>Microsoft SQL Server</b>
  ///
  /// See <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_SQLServer.html#SQLServer.Concepts.General.VersionSupport">
  /// Microsoft SQL Server Versions on Amazon RDS</a> in the <i>Amazon RDS User
  /// Guide.</i>
  ///
  /// Parameter [oSInstallationMediaPath] :
  /// The path to the installation medium for the operating system associated
  /// with the specified DB engine.
  ///
  /// Example:
  /// <code>WindowsISO/en_windows_server_2016_x64_dvd_9327751.iso</code>
  Future<InstallationMedia> importInstallationMedia({
    required String customAvailabilityZoneId,
    required String engine,
    required String engineInstallationMediaPath,
    required String engineVersion,
    required String oSInstallationMediaPath,
  }) async {
    ArgumentError.checkNotNull(
        customAvailabilityZoneId, 'customAvailabilityZoneId');
    ArgumentError.checkNotNull(engine, 'engine');
    ArgumentError.checkNotNull(
        engineInstallationMediaPath, 'engineInstallationMediaPath');
    ArgumentError.checkNotNull(engineVersion, 'engineVersion');
    ArgumentError.checkNotNull(
        oSInstallationMediaPath, 'oSInstallationMediaPath');
    final $request = <String, dynamic>{};
    $request['CustomAvailabilityZoneId'] = customAvailabilityZoneId;
    $request['Engine'] = engine;
    $request['EngineInstallationMediaPath'] = engineInstallationMediaPath;
    $request['EngineVersion'] = engineVersion;
    $request['OSInstallationMediaPath'] = oSInstallationMediaPath;
    final $result = await _protocol.send(
      $request,
      action: 'ImportInstallationMedia',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ImportInstallationMediaMessage'],
      shapes: shapes,
      resultWrapper: 'ImportInstallationMediaResult',
    );
    return InstallationMedia.fromXml($result);
  }

  /// Lists all tags on an Amazon RDS resource.
  ///
  /// For an overview on tagging an Amazon RDS resource, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.Tagging.html">Tagging
  /// Amazon RDS Resources</a> in the <i>Amazon RDS User Guide</i>.
  ///
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [DBSnapshotNotFoundFault].
  /// May throw [DBClusterNotFoundFault].
  /// May throw [DBProxyNotFoundFault].
  /// May throw [DBProxyTargetGroupNotFoundFault].
  ///
  /// Parameter [resourceName] :
  /// The Amazon RDS resource with tags to be listed. This value is an Amazon
  /// Resource Name (ARN). For information about creating an ARN, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.ARN.html#USER_Tagging.ARN.Constructing">
  /// Constructing an ARN for Amazon RDS</a> in the <i>Amazon RDS User
  /// Guide</i>.
  ///
  /// Parameter [filters] :
  /// This parameter isn't currently supported.
  Future<TagListMessage> listTagsForResource({
    required String resourceName,
    List<Filter>? filters,
  }) async {
    ArgumentError.checkNotNull(resourceName, 'resourceName');
    final $request = <String, dynamic>{};
    $request['ResourceName'] = resourceName;
    filters?.also((arg) => $request['Filters'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListTagsForResource',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListTagsForResourceMessage'],
      shapes: shapes,
      resultWrapper: 'ListTagsForResourceResult',
    );
    return TagListMessage.fromXml($result);
  }

  /// Override the system-default Secure Sockets Layer/Transport Layer Security
  /// (SSL/TLS) certificate for Amazon RDS for new DB instances temporarily, or
  /// remove the override.
  ///
  /// By using this operation, you can specify an RDS-approved SSL/TLS
  /// certificate for new DB instances that is different from the default
  /// certificate provided by RDS. You can also use this operation to remove the
  /// override, so that new DB instances use the default certificate provided by
  /// RDS.
  ///
  /// You might need to override the default certificate in the following
  /// situations:
  ///
  /// <ul>
  /// <li>
  /// You already migrated your applications to support the latest certificate
  /// authority (CA) certificate, but the new CA certificate is not yet the RDS
  /// default CA certificate for the specified AWS Region.
  /// </li>
  /// <li>
  /// RDS has already moved to a new default CA certificate for the specified
  /// AWS Region, but you are still in the process of supporting the new CA
  /// certificate. In this case, you temporarily need additional time to finish
  /// your application changes.
  /// </li>
  /// </ul>
  /// For more information about rotating your SSL/TLS certificate for RDS DB
  /// engines, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.SSL-certificate-rotation.html">
  /// Rotating Your SSL/TLS Certificate</a> in the <i>Amazon RDS User Guide</i>.
  ///
  /// For more information about rotating your SSL/TLS certificate for Aurora DB
  /// engines, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/UsingWithRDS.SSL-certificate-rotation.html">
  /// Rotating Your SSL/TLS Certificate</a> in the <i>Amazon Aurora User
  /// Guide</i>.
  ///
  /// May throw [CertificateNotFoundFault].
  ///
  /// Parameter [certificateIdentifier] :
  /// The new default certificate identifier to override the current one with.
  ///
  /// To determine the valid values, use the <code>describe-certificates</code>
  /// AWS CLI command or the <code>DescribeCertificates</code> API operation.
  ///
  /// Parameter [removeCustomerOverride] :
  /// A value that indicates whether to remove the override for the default
  /// certificate. If the override is removed, the default certificate is the
  /// system default.
  Future<ModifyCertificatesResult> modifyCertificates({
    String? certificateIdentifier,
    bool? removeCustomerOverride,
  }) async {
    final $request = <String, dynamic>{};
    certificateIdentifier
        ?.also((arg) => $request['CertificateIdentifier'] = arg);
    removeCustomerOverride
        ?.also((arg) => $request['RemoveCustomerOverride'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyCertificates',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyCertificatesMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyCertificatesResult',
    );
    return ModifyCertificatesResult.fromXml($result);
  }

  /// Set the capacity of an Aurora Serverless DB cluster to a specific value.
  ///
  /// Aurora Serverless scales seamlessly based on the workload on the DB
  /// cluster. In some cases, the capacity might not scale fast enough to meet a
  /// sudden change in workload, such as a large number of new transactions.
  /// Call <code>ModifyCurrentDBClusterCapacity</code> to set the capacity
  /// explicitly.
  ///
  /// After this call sets the DB cluster capacity, Aurora Serverless can
  /// automatically scale the DB cluster based on the cooldown period for
  /// scaling up and the cooldown period for scaling down.
  ///
  /// For more information about Aurora Serverless, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.html">Using
  /// Amazon Aurora Serverless</a> in the <i>Amazon Aurora User Guide</i>.
  /// <important>
  /// If you call <code>ModifyCurrentDBClusterCapacity</code> with the default
  /// <code>TimeoutAction</code>, connections that prevent Aurora Serverless
  /// from finding a scaling point might be dropped. For more information about
  /// scaling points, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.how-it-works.html#aurora-serverless.how-it-works.auto-scaling">
  /// Autoscaling for Aurora Serverless</a> in the <i>Amazon Aurora User
  /// Guide</i>.
  /// </important> <note>
  /// This action only applies to Aurora DB clusters.
  /// </note>
  ///
  /// May throw [DBClusterNotFoundFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [InvalidDBClusterCapacityFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The DB cluster identifier for the cluster being modified. This parameter
  /// isn't case-sensitive.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match the identifier of an existing DB cluster.
  /// </li>
  /// </ul>
  ///
  /// Parameter [capacity] :
  /// The DB cluster capacity.
  ///
  /// When you change the capacity of a paused Aurora Serverless DB cluster, it
  /// automatically resumes.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// For Aurora MySQL, valid capacity values are <code>1</code>,
  /// <code>2</code>, <code>4</code>, <code>8</code>, <code>16</code>,
  /// <code>32</code>, <code>64</code>, <code>128</code>, and <code>256</code>.
  /// </li>
  /// <li>
  /// For Aurora PostgreSQL, valid capacity values are <code>2</code>,
  /// <code>4</code>, <code>8</code>, <code>16</code>, <code>32</code>,
  /// <code>64</code>, <code>192</code>, and <code>384</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [secondsBeforeTimeout] :
  /// The amount of time, in seconds, that Aurora Serverless tries to find a
  /// scaling point to perform seamless scaling before enforcing the timeout
  /// action. The default is 300.
  ///
  /// <ul>
  /// <li>
  /// Value must be from 10 through 600.
  /// </li>
  /// </ul>
  ///
  /// Parameter [timeoutAction] :
  /// The action to take when the timeout is reached, either
  /// <code>ForceApplyCapacityChange</code> or
  /// <code>RollbackCapacityChange</code>.
  ///
  /// <code>ForceApplyCapacityChange</code>, the default, sets the capacity to
  /// the specified value as soon as possible.
  ///
  /// <code>RollbackCapacityChange</code> ignores the capacity change if a
  /// scaling point isn't found in the timeout period.
  Future<DBClusterCapacityInfo> modifyCurrentDBClusterCapacity({
    required String dBClusterIdentifier,
    int? capacity,
    int? secondsBeforeTimeout,
    String? timeoutAction,
  }) async {
    ArgumentError.checkNotNull(dBClusterIdentifier, 'dBClusterIdentifier');
    final $request = <String, dynamic>{};
    $request['DBClusterIdentifier'] = dBClusterIdentifier;
    capacity?.also((arg) => $request['Capacity'] = arg);
    secondsBeforeTimeout?.also((arg) => $request['SecondsBeforeTimeout'] = arg);
    timeoutAction?.also((arg) => $request['TimeoutAction'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyCurrentDBClusterCapacity',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyCurrentDBClusterCapacityMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyCurrentDBClusterCapacityResult',
    );
    return DBClusterCapacityInfo.fromXml($result);
  }

  /// Modify a setting for an Amazon Aurora DB cluster. You can change one or
  /// more database configuration parameters by specifying these parameters and
  /// the new values in the request. For more information on Amazon Aurora, see
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
  /// What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i>
  /// <note>
  /// This action only applies to Aurora DB clusters.
  /// </note>
  ///
  /// May throw [DBClusterNotFoundFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [StorageQuotaExceededFault].
  /// May throw [DBSubnetGroupNotFoundFault].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [InvalidDBSubnetGroupStateFault].
  /// May throw [InvalidSubnet].
  /// May throw [DBClusterParameterGroupNotFoundFault].
  /// May throw [InvalidDBSecurityGroupStateFault].
  /// May throw [InvalidDBInstanceStateFault].
  /// May throw [DBClusterAlreadyExistsFault].
  /// May throw [DomainNotFoundFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The DB cluster identifier for the cluster being modified. This parameter
  /// isn't case-sensitive.
  ///
  /// Constraints: This identifier must match the identifier of an existing DB
  /// cluster.
  ///
  /// Parameter [allowMajorVersionUpgrade] :
  /// A value that indicates whether major version upgrades are allowed.
  ///
  /// Constraints: You must allow major version upgrades when specifying a value
  /// for the <code>EngineVersion</code> parameter that is a different major
  /// version than the DB cluster's current version.
  ///
  /// Parameter [applyImmediately] :
  /// A value that indicates whether the modifications in this request and any
  /// pending modifications are asynchronously applied as soon as possible,
  /// regardless of the <code>PreferredMaintenanceWindow</code> setting for the
  /// DB cluster. If this parameter is disabled, changes to the DB cluster are
  /// applied during the next maintenance window.
  ///
  /// The <code>ApplyImmediately</code> parameter only affects the
  /// <code>EnableIAMDatabaseAuthentication</code>,
  /// <code>MasterUserPassword</code>, and <code>NewDBClusterIdentifier</code>
  /// values. If the <code>ApplyImmediately</code> parameter is disabled, then
  /// changes to the <code>EnableIAMDatabaseAuthentication</code>,
  /// <code>MasterUserPassword</code>, and <code>NewDBClusterIdentifier</code>
  /// values are applied during the next maintenance window. All other changes
  /// are applied immediately, regardless of the value of the
  /// <code>ApplyImmediately</code> parameter.
  ///
  /// By default, this parameter is disabled.
  ///
  /// Parameter [backtrackWindow] :
  /// The target backtrack window, in seconds. To disable backtracking, set this
  /// value to 0.
  /// <note>
  /// Currently, Backtrack is only supported for Aurora MySQL DB clusters.
  /// </note>
  /// Default: 0
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If specified, this value must be set to a number from 0 to 259,200 (72
  /// hours).
  /// </li>
  /// </ul>
  ///
  /// Parameter [backupRetentionPeriod] :
  /// The number of days for which automated backups are retained. You must
  /// specify a minimum value of 1.
  ///
  /// Default: 1
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be a value from 1 to 35
  /// </li>
  /// </ul>
  ///
  /// Parameter [cloudwatchLogsExportConfiguration] :
  /// The configuration setting for the log types to be enabled for export to
  /// CloudWatch Logs for a specific DB cluster.
  ///
  /// Parameter [copyTagsToSnapshot] :
  /// A value that indicates whether to copy all tags from the DB cluster to
  /// snapshots of the DB cluster. The default is not to copy them.
  ///
  /// Parameter [dBClusterParameterGroupName] :
  /// The name of the DB cluster parameter group to use for the DB cluster.
  ///
  /// Parameter [dBInstanceParameterGroupName] :
  /// The name of the DB parameter group to apply to all instances of the DB
  /// cluster.
  /// <note>
  /// When you apply a parameter group using the
  /// <code>DBInstanceParameterGroupName</code> parameter, the DB cluster isn't
  /// rebooted automatically. Also, parameter changes aren't applied during the
  /// next maintenance window but instead are applied immediately.
  /// </note>
  /// Default: The existing name setting
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// The DB parameter group must be in the same DB parameter group family as
  /// this DB cluster.
  /// </li>
  /// <li>
  /// The <code>DBInstanceParameterGroupName</code> parameter is only valid in
  /// combination with the <code>AllowMajorVersionUpgrade</code> parameter.
  /// </li>
  /// </ul>
  ///
  /// Parameter [deletionProtection] :
  /// A value that indicates whether the DB cluster has deletion protection
  /// enabled. The database can't be deleted when deletion protection is
  /// enabled. By default, deletion protection is disabled.
  ///
  /// Parameter [domain] :
  /// The Active Directory directory ID to move the DB cluster to. Specify
  /// <code>none</code> to remove the cluster from its current domain. The
  /// domain must be created prior to this operation.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/kerberos-authentication.html">Kerberos
  /// Authentication</a> in the <i>Amazon Aurora User Guide</i>.
  ///
  /// Parameter [domainIAMRoleName] :
  /// Specify the name of the IAM role to be used when making API calls to the
  /// Directory Service.
  ///
  /// Parameter [enableGlobalWriteForwarding] :
  /// A value that indicates whether to enable write operations to be forwarded
  /// from this cluster to the primary cluster in an Aurora global database. The
  /// resulting changes are replicated back to this cluster. This parameter only
  /// applies to DB clusters that are secondary clusters in an Aurora global
  /// database. By default, Aurora disallows write operations for secondary
  /// clusters.
  ///
  /// Parameter [enableHttpEndpoint] :
  /// A value that indicates whether to enable the HTTP endpoint for an Aurora
  /// Serverless DB cluster. By default, the HTTP endpoint is disabled.
  ///
  /// When enabled, the HTTP endpoint provides a connectionless web service API
  /// for running SQL queries on the Aurora Serverless DB cluster. You can also
  /// query your database from inside the RDS console with the query editor.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/data-api.html">Using
  /// the Data API for Aurora Serverless</a> in the <i>Amazon Aurora User
  /// Guide</i>.
  ///
  /// Parameter [enableIAMDatabaseAuthentication] :
  /// A value that indicates whether to enable mapping of AWS Identity and
  /// Access Management (IAM) accounts to database accounts. By default, mapping
  /// is disabled.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/UsingWithRDS.IAMDBAuth.html">
  /// IAM Database Authentication</a> in the <i>Amazon Aurora User Guide.</i>
  ///
  /// Parameter [engineVersion] :
  /// The version number of the database engine to which you want to upgrade.
  /// Changing this parameter results in an outage. The change is applied during
  /// the next maintenance window unless <code>ApplyImmediately</code> is
  /// enabled.
  ///
  /// To list all of the available engine versions for <code>aurora</code> (for
  /// MySQL 5.6-compatible Aurora), use the following command:
  ///
  /// <code>aws rds describe-db-engine-versions --engine aurora --query
  /// "DBEngineVersions[].EngineVersion"</code>
  ///
  /// To list all of the available engine versions for <code>aurora-mysql</code>
  /// (for MySQL 5.7-compatible Aurora), use the following command:
  ///
  /// <code>aws rds describe-db-engine-versions --engine aurora-mysql --query
  /// "DBEngineVersions[].EngineVersion"</code>
  ///
  /// To list all of the available engine versions for
  /// <code>aurora-postgresql</code>, use the following command:
  ///
  /// <code>aws rds describe-db-engine-versions --engine aurora-postgresql
  /// --query "DBEngineVersions[].EngineVersion"</code>
  ///
  /// Parameter [masterUserPassword] :
  /// The new password for the master database user. This password can contain
  /// any printable ASCII character except "/", """, or "@".
  ///
  /// Constraints: Must contain from 8 to 41 characters.
  ///
  /// Parameter [newDBClusterIdentifier] :
  /// The new DB cluster identifier for the DB cluster when renaming a DB
  /// cluster. This value is stored as a lowercase string.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 1 to 63 letters, numbers, or hyphens
  /// </li>
  /// <li>
  /// The first character must be a letter
  /// </li>
  /// <li>
  /// Can't end with a hyphen or contain two consecutive hyphens
  /// </li>
  /// </ul>
  /// Example: <code>my-cluster2</code>
  ///
  /// Parameter [optionGroupName] :
  /// A value that indicates that the DB cluster should be associated with the
  /// specified option group. Changing this parameter doesn't result in an
  /// outage except in the following case, and the change is applied during the
  /// next maintenance window unless the <code>ApplyImmediately</code> is
  /// enabled for this request. If the parameter change results in an option
  /// group that enables OEM, this change can cause a brief (sub-second) period
  /// during which new connections are rejected but existing connections are not
  /// interrupted.
  ///
  /// Permanent options can't be removed from an option group. The option group
  /// can't be removed from a DB cluster once it is associated with a DB
  /// cluster.
  ///
  /// Parameter [port] :
  /// The port number on which the DB cluster accepts connections.
  ///
  /// Constraints: Value must be <code>1150-65535</code>
  ///
  /// Default: The same port as the original DB cluster.
  ///
  /// Parameter [preferredBackupWindow] :
  /// The daily time range during which automated backups are created if
  /// automated backups are enabled, using the
  /// <code>BackupRetentionPeriod</code> parameter.
  ///
  /// The default is a 30-minute window selected at random from an 8-hour block
  /// of time for each AWS Region. To see the time blocks available, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_UpgradeDBInstance.Maintenance.html#AdjustingTheMaintenanceWindow.Aurora">
  /// Adjusting the Preferred DB Cluster Maintenance Window</a> in the <i>Amazon
  /// Aurora User Guide.</i>
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be in the format <code>hh24:mi-hh24:mi</code>.
  /// </li>
  /// <li>
  /// Must be in Universal Coordinated Time (UTC).
  /// </li>
  /// <li>
  /// Must not conflict with the preferred maintenance window.
  /// </li>
  /// <li>
  /// Must be at least 30 minutes.
  /// </li>
  /// </ul>
  ///
  /// Parameter [preferredMaintenanceWindow] :
  /// The weekly time range during which system maintenance can occur, in
  /// Universal Coordinated Time (UTC).
  ///
  /// Format: <code>ddd:hh24:mi-ddd:hh24:mi</code>
  ///
  /// The default is a 30-minute window selected at random from an 8-hour block
  /// of time for each AWS Region, occurring on a random day of the week. To see
  /// the time blocks available, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_UpgradeDBInstance.Maintenance.html#AdjustingTheMaintenanceWindow.Aurora">
  /// Adjusting the Preferred DB Cluster Maintenance Window</a> in the <i>Amazon
  /// Aurora User Guide.</i>
  ///
  /// Valid Days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.
  ///
  /// Constraints: Minimum 30-minute window.
  ///
  /// Parameter [scalingConfiguration] :
  /// The scaling properties of the DB cluster. You can only modify scaling
  /// properties for DB clusters in <code>serverless</code> DB engine mode.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// A list of VPC security groups that the DB cluster will belong to.
  Future<ModifyDBClusterResult> modifyDBCluster({
    required String dBClusterIdentifier,
    bool? allowMajorVersionUpgrade,
    bool? applyImmediately,
    int? backtrackWindow,
    int? backupRetentionPeriod,
    CloudwatchLogsExportConfiguration? cloudwatchLogsExportConfiguration,
    bool? copyTagsToSnapshot,
    String? dBClusterParameterGroupName,
    String? dBInstanceParameterGroupName,
    bool? deletionProtection,
    String? domain,
    String? domainIAMRoleName,
    bool? enableGlobalWriteForwarding,
    bool? enableHttpEndpoint,
    bool? enableIAMDatabaseAuthentication,
    String? engineVersion,
    String? masterUserPassword,
    String? newDBClusterIdentifier,
    String? optionGroupName,
    int? port,
    String? preferredBackupWindow,
    String? preferredMaintenanceWindow,
    ScalingConfiguration? scalingConfiguration,
    List<String>? vpcSecurityGroupIds,
  }) async {
    ArgumentError.checkNotNull(dBClusterIdentifier, 'dBClusterIdentifier');
    final $request = <String, dynamic>{};
    $request['DBClusterIdentifier'] = dBClusterIdentifier;
    allowMajorVersionUpgrade
        ?.also((arg) => $request['AllowMajorVersionUpgrade'] = arg);
    applyImmediately?.also((arg) => $request['ApplyImmediately'] = arg);
    backtrackWindow?.also((arg) => $request['BacktrackWindow'] = arg);
    backupRetentionPeriod
        ?.also((arg) => $request['BackupRetentionPeriod'] = arg);
    cloudwatchLogsExportConfiguration
        ?.also((arg) => $request['CloudwatchLogsExportConfiguration'] = arg);
    copyTagsToSnapshot?.also((arg) => $request['CopyTagsToSnapshot'] = arg);
    dBClusterParameterGroupName
        ?.also((arg) => $request['DBClusterParameterGroupName'] = arg);
    dBInstanceParameterGroupName
        ?.also((arg) => $request['DBInstanceParameterGroupName'] = arg);
    deletionProtection?.also((arg) => $request['DeletionProtection'] = arg);
    domain?.also((arg) => $request['Domain'] = arg);
    domainIAMRoleName?.also((arg) => $request['DomainIAMRoleName'] = arg);
    enableGlobalWriteForwarding
        ?.also((arg) => $request['EnableGlobalWriteForwarding'] = arg);
    enableHttpEndpoint?.also((arg) => $request['EnableHttpEndpoint'] = arg);
    enableIAMDatabaseAuthentication
        ?.also((arg) => $request['EnableIAMDatabaseAuthentication'] = arg);
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
    masterUserPassword?.also((arg) => $request['MasterUserPassword'] = arg);
    newDBClusterIdentifier
        ?.also((arg) => $request['NewDBClusterIdentifier'] = arg);
    optionGroupName?.also((arg) => $request['OptionGroupName'] = arg);
    port?.also((arg) => $request['Port'] = arg);
    preferredBackupWindow
        ?.also((arg) => $request['PreferredBackupWindow'] = arg);
    preferredMaintenanceWindow
        ?.also((arg) => $request['PreferredMaintenanceWindow'] = arg);
    scalingConfiguration?.also((arg) => $request['ScalingConfiguration'] = arg);
    vpcSecurityGroupIds?.also((arg) => $request['VpcSecurityGroupIds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyDBCluster',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyDBClusterMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyDBClusterResult',
    );
    return ModifyDBClusterResult.fromXml($result);
  }

  /// Modifies the properties of an endpoint in an Amazon Aurora DB cluster.
  /// <note>
  /// This action only applies to Aurora DB clusters.
  /// </note>
  ///
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [InvalidDBClusterEndpointStateFault].
  /// May throw [DBClusterEndpointNotFoundFault].
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [InvalidDBInstanceStateFault].
  ///
  /// Parameter [dBClusterEndpointIdentifier] :
  /// The identifier of the endpoint to modify. This parameter is stored as a
  /// lowercase string.
  ///
  /// Parameter [endpointType] :
  /// The type of the endpoint. One of: <code>READER</code>,
  /// <code>WRITER</code>, <code>ANY</code>.
  ///
  /// Parameter [excludedMembers] :
  /// List of DB instance identifiers that aren't part of the custom endpoint
  /// group. All other eligible instances are reachable through the custom
  /// endpoint. Only relevant if the list of static members is empty.
  ///
  /// Parameter [staticMembers] :
  /// List of DB instance identifiers that are part of the custom endpoint
  /// group.
  Future<DBClusterEndpoint> modifyDBClusterEndpoint({
    required String dBClusterEndpointIdentifier,
    String? endpointType,
    List<String>? excludedMembers,
    List<String>? staticMembers,
  }) async {
    ArgumentError.checkNotNull(
        dBClusterEndpointIdentifier, 'dBClusterEndpointIdentifier');
    final $request = <String, dynamic>{};
    $request['DBClusterEndpointIdentifier'] = dBClusterEndpointIdentifier;
    endpointType?.also((arg) => $request['EndpointType'] = arg);
    excludedMembers?.also((arg) => $request['ExcludedMembers'] = arg);
    staticMembers?.also((arg) => $request['StaticMembers'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyDBClusterEndpoint',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyDBClusterEndpointMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyDBClusterEndpointResult',
    );
    return DBClusterEndpoint.fromXml($result);
  }

  /// Modifies the parameters of a DB cluster parameter group. To modify more
  /// than one parameter, submit a list of the following:
  /// <code>ParameterName</code>, <code>ParameterValue</code>, and
  /// <code>ApplyMethod</code>. A maximum of 20 parameters can be modified in a
  /// single request.
  ///
  /// For more information on Amazon Aurora, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
  /// What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i>
  /// <note>
  /// Changes to dynamic parameters are applied immediately. Changes to static
  /// parameters require a reboot without failover to the DB cluster associated
  /// with the parameter group before the change can take effect.
  /// </note> <important>
  /// After you create a DB cluster parameter group, you should wait at least 5
  /// minutes before creating your first DB cluster that uses that DB cluster
  /// parameter group as the default parameter group. This allows Amazon RDS to
  /// fully complete the create action before the parameter group is used as the
  /// default for a new DB cluster. This is especially important for parameters
  /// that are critical when creating the default database for a DB cluster,
  /// such as the character set for the default database defined by the
  /// <code>character_set_database</code> parameter. You can use the
  /// <i>Parameter Groups</i> option of the <a
  /// href="https://console.aws.amazon.com/rds/">Amazon RDS console</a> or the
  /// <code>DescribeDBClusterParameters</code> action to verify that your DB
  /// cluster parameter group has been created or modified.
  ///
  /// If the modified DB cluster parameter group is used by an Aurora Serverless
  /// cluster, Aurora applies the update immediately. The cluster restart might
  /// interrupt your workload. In that case, your application must reopen any
  /// connections and retry any transactions that were active when the parameter
  /// changes took effect.
  /// </important> <note>
  /// This action only applies to Aurora DB clusters.
  /// </note>
  ///
  /// May throw [DBParameterGroupNotFoundFault].
  /// May throw [InvalidDBParameterGroupStateFault].
  ///
  /// Parameter [dBClusterParameterGroupName] :
  /// The name of the DB cluster parameter group to modify.
  ///
  /// Parameter [parameters] :
  /// A list of parameters in the DB cluster parameter group to modify.
  Future<DBClusterParameterGroupNameMessage> modifyDBClusterParameterGroup({
    required String dBClusterParameterGroupName,
    required List<Parameter> parameters,
  }) async {
    ArgumentError.checkNotNull(
        dBClusterParameterGroupName, 'dBClusterParameterGroupName');
    ArgumentError.checkNotNull(parameters, 'parameters');
    final $request = <String, dynamic>{};
    $request['DBClusterParameterGroupName'] = dBClusterParameterGroupName;
    $request['Parameters'] = parameters;
    final $result = await _protocol.send(
      $request,
      action: 'ModifyDBClusterParameterGroup',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyDBClusterParameterGroupMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyDBClusterParameterGroupResult',
    );
    return DBClusterParameterGroupNameMessage.fromXml($result);
  }

  /// Adds an attribute and values to, or removes an attribute and values from,
  /// a manual DB cluster snapshot.
  ///
  /// To share a manual DB cluster snapshot with other AWS accounts, specify
  /// <code>restore</code> as the <code>AttributeName</code> and use the
  /// <code>ValuesToAdd</code> parameter to add a list of IDs of the AWS
  /// accounts that are authorized to restore the manual DB cluster snapshot.
  /// Use the value <code>all</code> to make the manual DB cluster snapshot
  /// public, which means that it can be copied or restored by all AWS accounts.
  /// <note>
  /// Don't add the <code>all</code> value for any manual DB cluster snapshots
  /// that contain private information that you don't want available to all AWS
  /// accounts.
  /// </note>
  /// If a manual DB cluster snapshot is encrypted, it can be shared, but only
  /// by specifying a list of authorized AWS account IDs for the
  /// <code>ValuesToAdd</code> parameter. You can't use <code>all</code> as a
  /// value for that parameter in this case.
  ///
  /// To view which AWS accounts have access to copy or restore a manual DB
  /// cluster snapshot, or whether a manual DB cluster snapshot is public or
  /// private, use the <a>DescribeDBClusterSnapshotAttributes</a> API action.
  /// The accounts are returned as values for the <code>restore</code>
  /// attribute.
  /// <note>
  /// This action only applies to Aurora DB clusters.
  /// </note>
  ///
  /// May throw [DBClusterSnapshotNotFoundFault].
  /// May throw [InvalidDBClusterSnapshotStateFault].
  /// May throw [SharedSnapshotQuotaExceededFault].
  ///
  /// Parameter [attributeName] :
  /// The name of the DB cluster snapshot attribute to modify.
  ///
  /// To manage authorization for other AWS accounts to copy or restore a manual
  /// DB cluster snapshot, set this value to <code>restore</code>.
  /// <note>
  /// To view the list of attributes available to modify, use the
  /// <a>DescribeDBClusterSnapshotAttributes</a> API action.
  /// </note>
  ///
  /// Parameter [dBClusterSnapshotIdentifier] :
  /// The identifier for the DB cluster snapshot to modify the attributes for.
  ///
  /// Parameter [valuesToAdd] :
  /// A list of DB cluster snapshot attributes to add to the attribute specified
  /// by <code>AttributeName</code>.
  ///
  /// To authorize other AWS accounts to copy or restore a manual DB cluster
  /// snapshot, set this list to include one or more AWS account IDs, or
  /// <code>all</code> to make the manual DB cluster snapshot restorable by any
  /// AWS account. Do not add the <code>all</code> value for any manual DB
  /// cluster snapshots that contain private information that you don't want
  /// available to all AWS accounts.
  ///
  /// Parameter [valuesToRemove] :
  /// A list of DB cluster snapshot attributes to remove from the attribute
  /// specified by <code>AttributeName</code>.
  ///
  /// To remove authorization for other AWS accounts to copy or restore a manual
  /// DB cluster snapshot, set this list to include one or more AWS account
  /// identifiers, or <code>all</code> to remove authorization for any AWS
  /// account to copy or restore the DB cluster snapshot. If you specify
  /// <code>all</code>, an AWS account whose account ID is explicitly added to
  /// the <code>restore</code> attribute can still copy or restore a manual DB
  /// cluster snapshot.
  Future<ModifyDBClusterSnapshotAttributeResult>
      modifyDBClusterSnapshotAttribute({
    required String attributeName,
    required String dBClusterSnapshotIdentifier,
    List<String>? valuesToAdd,
    List<String>? valuesToRemove,
  }) async {
    ArgumentError.checkNotNull(attributeName, 'attributeName');
    ArgumentError.checkNotNull(
        dBClusterSnapshotIdentifier, 'dBClusterSnapshotIdentifier');
    final $request = <String, dynamic>{};
    $request['AttributeName'] = attributeName;
    $request['DBClusterSnapshotIdentifier'] = dBClusterSnapshotIdentifier;
    valuesToAdd?.also((arg) => $request['ValuesToAdd'] = arg);
    valuesToRemove?.also((arg) => $request['ValuesToRemove'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyDBClusterSnapshotAttribute',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyDBClusterSnapshotAttributeMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyDBClusterSnapshotAttributeResult',
    );
    return ModifyDBClusterSnapshotAttributeResult.fromXml($result);
  }

  /// Modifies settings for a DB instance. You can change one or more database
  /// configuration parameters by specifying these parameters and the new values
  /// in the request. To learn what modifications you can make to your DB
  /// instance, call <code>DescribeValidDBInstanceModifications</code> before
  /// you call <code>ModifyDBInstance</code>.
  ///
  /// May throw [InvalidDBInstanceStateFault].
  /// May throw [InvalidDBSecurityGroupStateFault].
  /// May throw [DBInstanceAlreadyExistsFault].
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [DBSecurityGroupNotFoundFault].
  /// May throw [DBParameterGroupNotFoundFault].
  /// May throw [InsufficientDBInstanceCapacityFault].
  /// May throw [StorageQuotaExceededFault].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [ProvisionedIopsNotAvailableInAZFault].
  /// May throw [OptionGroupNotFoundFault].
  /// May throw [DBUpgradeDependencyFailureFault].
  /// May throw [StorageTypeNotSupportedFault].
  /// May throw [AuthorizationNotFoundFault].
  /// May throw [CertificateNotFoundFault].
  /// May throw [DomainNotFoundFault].
  /// May throw [BackupPolicyNotFoundFault].
  /// May throw [KMSKeyNotAccessibleFault].
  /// May throw [InvalidDBClusterStateFault].
  ///
  /// Parameter [dBInstanceIdentifier] :
  /// The DB instance identifier. This value is stored as a lowercase string.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match the identifier of an existing DBInstance.
  /// </li>
  /// </ul>
  ///
  /// Parameter [allocatedStorage] :
  /// The new amount of storage (in gibibytes) to allocate for the DB instance.
  ///
  /// For MariaDB, MySQL, Oracle, and PostgreSQL, the value supplied must be at
  /// least 10% greater than the current value. Values that are not at least 10%
  /// greater than the existing value are rounded up so that they are 10%
  /// greater than the current value.
  ///
  /// For the valid values for allocated storage for each engine, see
  /// <code>CreateDBInstance</code>.
  ///
  /// Parameter [allowMajorVersionUpgrade] :
  /// A value that indicates whether major version upgrades are allowed.
  /// Changing this parameter doesn't result in an outage and the change is
  /// asynchronously applied as soon as possible.
  ///
  /// Constraints: Major version upgrades must be allowed when specifying a
  /// value for the EngineVersion parameter that is a different major version
  /// than the DB instance's current version.
  ///
  /// Parameter [applyImmediately] :
  /// A value that indicates whether the modifications in this request and any
  /// pending modifications are asynchronously applied as soon as possible,
  /// regardless of the <code>PreferredMaintenanceWindow</code> setting for the
  /// DB instance. By default, this parameter is disabled.
  ///
  /// If this parameter is disabled, changes to the DB instance are applied
  /// during the next maintenance window. Some parameter changes can cause an
  /// outage and are applied on the next call to <a>RebootDBInstance</a>, or the
  /// next failure reboot. Review the table of parameters in <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.DBInstance.Modifying.html">Modifying
  /// a DB Instance</a> in the <i>Amazon RDS User Guide.</i> to see the impact
  /// of enabling or disabling <code>ApplyImmediately</code> for each modified
  /// parameter and to determine when the changes are applied.
  ///
  /// Parameter [autoMinorVersionUpgrade] :
  /// A value that indicates whether minor version upgrades are applied
  /// automatically to the DB instance during the maintenance window. Changing
  /// this parameter doesn't result in an outage except in the following case
  /// and the change is asynchronously applied as soon as possible. An outage
  /// results if this parameter is enabled during the maintenance window, and a
  /// newer minor version is available, and RDS has enabled auto patching for
  /// that engine version.
  ///
  /// Parameter [backupRetentionPeriod] :
  /// The number of days to retain automated backups. Setting this parameter to
  /// a positive number enables backups. Setting this parameter to 0 disables
  /// automated backups.
  ///
  /// Changing this parameter can result in an outage if you change from 0 to a
  /// non-zero value or from a non-zero value to 0. These changes are applied
  /// during the next maintenance window unless the
  /// <code>ApplyImmediately</code> parameter is enabled for this request. If
  /// you change the parameter from one non-zero value to another non-zero
  /// value, the change is asynchronously applied as soon as possible.
  ///
  /// <b>Amazon Aurora</b>
  ///
  /// Not applicable. The retention period for automated backups is managed by
  /// the DB cluster. For more information, see <code>ModifyDBCluster</code>.
  ///
  /// Default: Uses existing setting
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be a value from 0 to 35
  /// </li>
  /// <li>
  /// Can be specified for a MySQL read replica only if the source is running
  /// MySQL 5.6 or later
  /// </li>
  /// <li>
  /// Can be specified for a PostgreSQL read replica only if the source is
  /// running PostgreSQL 9.3.5
  /// </li>
  /// <li>
  /// Can't be set to 0 if the DB instance is a source to read replicas
  /// </li>
  /// </ul>
  ///
  /// Parameter [cACertificateIdentifier] :
  /// Indicates the certificate that needs to be associated with the instance.
  ///
  /// Parameter [certificateRotationRestart] :
  /// A value that indicates whether the DB instance is restarted when you
  /// rotate your SSL/TLS certificate.
  ///
  /// By default, the DB instance is restarted when you rotate your SSL/TLS
  /// certificate. The certificate is not updated until the DB instance is
  /// restarted.
  /// <important>
  /// Set this parameter only if you are <i>not</i> using SSL/TLS to connect to
  /// the DB instance.
  /// </important>
  /// If you are using SSL/TLS to connect to the DB instance, follow the
  /// appropriate instructions for your DB engine to rotate your SSL/TLS
  /// certificate:
  ///
  /// <ul>
  /// <li>
  /// For more information about rotating your SSL/TLS certificate for RDS DB
  /// engines, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.SSL-certificate-rotation.html">
  /// Rotating Your SSL/TLS Certificate.</a> in the <i>Amazon RDS User
  /// Guide.</i>
  /// </li>
  /// <li>
  /// For more information about rotating your SSL/TLS certificate for Aurora DB
  /// engines, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/UsingWithRDS.SSL-certificate-rotation.html">
  /// Rotating Your SSL/TLS Certificate</a> in the <i>Amazon Aurora User
  /// Guide.</i>
  /// </li>
  /// </ul>
  ///
  /// Parameter [cloudwatchLogsExportConfiguration] :
  /// The configuration setting for the log types to be enabled for export to
  /// CloudWatch Logs for a specific DB instance.
  ///
  /// A change to the <code>CloudwatchLogsExportConfiguration</code> parameter
  /// is always applied to the DB instance immediately. Therefore, the
  /// <code>ApplyImmediately</code> parameter has no effect.
  ///
  /// Parameter [copyTagsToSnapshot] :
  /// A value that indicates whether to copy all tags from the DB instance to
  /// snapshots of the DB instance. By default, tags are not copied.
  ///
  /// <b>Amazon Aurora</b>
  ///
  /// Not applicable. Copying tags to snapshots is managed by the DB cluster.
  /// Setting this value for an Aurora DB instance has no effect on the DB
  /// cluster setting. For more information, see <code>ModifyDBCluster</code>.
  ///
  /// Parameter [dBInstanceClass] :
  /// The new compute and memory capacity of the DB instance, for example,
  /// <code>db.m4.large</code>. Not all DB instance classes are available in all
  /// AWS Regions, or for all database engines. For the full list of DB instance
  /// classes, and availability for your engine, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.DBInstanceClass.html">DB
  /// Instance Class</a> in the <i>Amazon RDS User Guide.</i>
  ///
  /// If you modify the DB instance class, an outage occurs during the change.
  /// The change is applied during the next maintenance window, unless
  /// <code>ApplyImmediately</code> is enabled for this request.
  ///
  /// Default: Uses existing setting
  ///
  /// Parameter [dBParameterGroupName] :
  /// The name of the DB parameter group to apply to the DB instance. Changing
  /// this setting doesn't result in an outage. The parameter group name itself
  /// is changed immediately, but the actual parameter changes are not applied
  /// until you reboot the instance without failover. In this case, the DB
  /// instance isn't rebooted automatically and the parameter changes isn't
  /// applied during the next maintenance window.
  ///
  /// Default: Uses existing setting
  ///
  /// Constraints: The DB parameter group must be in the same DB parameter group
  /// family as this DB instance.
  ///
  /// Parameter [dBPortNumber] :
  /// The port number on which the database accepts connections.
  ///
  /// The value of the <code>DBPortNumber</code> parameter must not match any of
  /// the port values specified for options in the option group for the DB
  /// instance.
  ///
  /// Your database will restart when you change the <code>DBPortNumber</code>
  /// value regardless of the value of the <code>ApplyImmediately</code>
  /// parameter.
  ///
  /// <b>MySQL</b>
  ///
  /// Default: <code>3306</code>
  ///
  /// Valid values: <code>1150-65535</code>
  ///
  /// <b>MariaDB</b>
  ///
  /// Default: <code>3306</code>
  ///
  /// Valid values: <code>1150-65535</code>
  ///
  /// <b>PostgreSQL</b>
  ///
  /// Default: <code>5432</code>
  ///
  /// Valid values: <code>1150-65535</code>
  ///
  /// Type: Integer
  ///
  /// <b>Oracle</b>
  ///
  /// Default: <code>1521</code>
  ///
  /// Valid values: <code>1150-65535</code>
  ///
  /// <b>SQL Server</b>
  ///
  /// Default: <code>1433</code>
  ///
  /// Valid values: <code>1150-65535</code> except <code>1234</code>,
  /// <code>1434</code>, <code>3260</code>, <code>3343</code>,
  /// <code>3389</code>, <code>47001</code>, and <code>49152-49156</code>.
  ///
  /// <b>Amazon Aurora</b>
  ///
  /// Default: <code>3306</code>
  ///
  /// Valid values: <code>1150-65535</code>
  ///
  /// Parameter [dBSecurityGroups] :
  /// A list of DB security groups to authorize on this DB instance. Changing
  /// this setting doesn't result in an outage and the change is asynchronously
  /// applied as soon as possible.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If supplied, must match existing DBSecurityGroups.
  /// </li>
  /// </ul>
  ///
  /// Parameter [dBSubnetGroupName] :
  /// The new DB subnet group for the DB instance. You can use this parameter to
  /// move your DB instance to a different VPC. If your DB instance isn't in a
  /// VPC, you can also use this parameter to move your DB instance into a VPC.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_VPC.WorkingWithRDSInstanceinaVPC.html#USER_VPC.Non-VPC2VPC">Working
  /// with a DB instance in a VPC</a> in the <i>Amazon RDS User Guide.</i>
  ///
  /// Changing the subnet group causes an outage during the change. The change
  /// is applied during the next maintenance window, unless you enable
  /// <code>ApplyImmediately</code>.
  ///
  /// Constraints: If supplied, must match the name of an existing
  /// DBSubnetGroup.
  ///
  /// Example: <code>mySubnetGroup</code>
  ///
  /// Parameter [deletionProtection] :
  /// A value that indicates whether the DB instance has deletion protection
  /// enabled. The database can't be deleted when deletion protection is
  /// enabled. By default, deletion protection is disabled. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_DeleteInstance.html">
  /// Deleting a DB Instance</a>.
  ///
  /// Parameter [domain] :
  /// The Active Directory directory ID to move the DB instance to. Specify
  /// <code>none</code> to remove the instance from its current domain. The
  /// domain must be created prior to this operation. Currently, only MySQL,
  /// Microsoft SQL Server, Oracle, and PostgreSQL DB instances can be created
  /// in an Active Directory Domain.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/kerberos-authentication.html">
  /// Kerberos Authentication</a> in the <i>Amazon RDS User Guide</i>.
  ///
  /// Parameter [domainIAMRoleName] :
  /// The name of the IAM role to use when making API calls to the Directory
  /// Service.
  ///
  /// Parameter [enableCustomerOwnedIp] :
  /// A value that indicates whether to enable a customer-owned IP address
  /// (CoIP) for an RDS on Outposts DB instance.
  ///
  /// A <i>CoIP</i> provides local or external connectivity to resources in your
  /// Outpost subnets through your on-premises network. For some use cases, a
  /// CoIP can provide lower latency for connections to the DB instance from
  /// outside of its virtual private cloud (VPC) on your local network.
  ///
  /// For more information about RDS on Outposts, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/rds-on-outposts.html">Working
  /// with Amazon RDS on AWS Outposts</a> in the <i>Amazon RDS User Guide</i>.
  ///
  /// For more information about CoIPs, see <a
  /// href="https://docs.aws.amazon.com/outposts/latest/userguide/outposts-networking-components.html#ip-addressing">Customer-owned
  /// IP addresses</a> in the <i>AWS Outposts User Guide</i>.
  ///
  /// Parameter [enableIAMDatabaseAuthentication] :
  /// A value that indicates whether to enable mapping of AWS Identity and
  /// Access Management (IAM) accounts to database accounts. By default, mapping
  /// is disabled.
  ///
  /// This setting doesn't apply to Amazon Aurora. Mapping AWS IAM accounts to
  /// database accounts is managed by the DB cluster.
  ///
  /// For more information about IAM database authentication, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.IAMDBAuth.html">
  /// IAM Database Authentication for MySQL and PostgreSQL</a> in the <i>Amazon
  /// RDS User Guide.</i>
  ///
  /// Parameter [enablePerformanceInsights] :
  /// A value that indicates whether to enable Performance Insights for the DB
  /// instance.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PerfInsights.html">Using
  /// Amazon Performance Insights</a> in the <i>Amazon Relational Database
  /// Service User Guide</i>.
  ///
  /// Parameter [engineVersion] :
  /// The version number of the database engine to upgrade to. Changing this
  /// parameter results in an outage and the change is applied during the next
  /// maintenance window unless the <code>ApplyImmediately</code> parameter is
  /// enabled for this request.
  ///
  /// For major version upgrades, if a nondefault DB parameter group is
  /// currently in use, a new DB parameter group in the DB parameter group
  /// family for the new engine version must be specified. The new DB parameter
  /// group can be the default for that DB parameter group family.
  ///
  /// For information about valid engine versions, see
  /// <code>CreateDBInstance</code>, or call
  /// <code>DescribeDBEngineVersions</code>.
  ///
  /// Parameter [iops] :
  /// The new Provisioned IOPS (I/O operations per second) value for the RDS
  /// instance.
  ///
  /// Changing this setting doesn't result in an outage and the change is
  /// applied during the next maintenance window unless the
  /// <code>ApplyImmediately</code> parameter is enabled for this request. If
  /// you are migrating from Provisioned IOPS to standard storage, set this
  /// value to 0. The DB instance will require a reboot for the change in
  /// storage type to take effect.
  ///
  /// If you choose to migrate your DB instance from using standard storage to
  /// using Provisioned IOPS, or from using Provisioned IOPS to using standard
  /// storage, the process can take time. The duration of the migration depends
  /// on several factors such as database load, storage size, storage type
  /// (standard or Provisioned IOPS), amount of IOPS provisioned (if any), and
  /// the number of prior scale storage operations. Typical migration times are
  /// under 24 hours, but the process can take up to several days in some cases.
  /// During the migration, the DB instance is available for use, but might
  /// experience performance degradation. While the migration takes place,
  /// nightly backups for the instance are suspended. No other Amazon RDS
  /// operations can take place for the instance, including modifying the
  /// instance, rebooting the instance, deleting the instance, creating a read
  /// replica for the instance, and creating a DB snapshot of the instance.
  ///
  /// Constraints: For MariaDB, MySQL, Oracle, and PostgreSQL, the value
  /// supplied must be at least 10% greater than the current value. Values that
  /// are not at least 10% greater than the existing value are rounded up so
  /// that they are 10% greater than the current value.
  ///
  /// Default: Uses existing setting
  ///
  /// Parameter [licenseModel] :
  /// The license model for the DB instance.
  ///
  /// Valid values: <code>license-included</code> |
  /// <code>bring-your-own-license</code> | <code>general-public-license</code>
  ///
  /// Parameter [masterUserPassword] :
  /// The new password for the master user. The password can include any
  /// printable ASCII character except "/", """, or "@".
  ///
  /// Changing this parameter doesn't result in an outage and the change is
  /// asynchronously applied as soon as possible. Between the time of the
  /// request and the completion of the request, the
  /// <code>MasterUserPassword</code> element exists in the
  /// <code>PendingModifiedValues</code> element of the operation response.
  ///
  /// <b>Amazon Aurora</b>
  ///
  /// Not applicable. The password for the master user is managed by the DB
  /// cluster. For more information, see <code>ModifyDBCluster</code>.
  ///
  /// Default: Uses existing setting
  ///
  /// <b>MariaDB</b>
  ///
  /// Constraints: Must contain from 8 to 41 characters.
  ///
  /// <b>Microsoft SQL Server</b>
  ///
  /// Constraints: Must contain from 8 to 128 characters.
  ///
  /// <b>MySQL</b>
  ///
  /// Constraints: Must contain from 8 to 41 characters.
  ///
  /// <b>Oracle</b>
  ///
  /// Constraints: Must contain from 8 to 30 characters.
  ///
  /// <b>PostgreSQL</b>
  ///
  /// Constraints: Must contain from 8 to 128 characters.
  /// <note>
  /// Amazon RDS API actions never return the password, so this action provides
  /// a way to regain access to a primary instance user if the password is lost.
  /// This includes restoring privileges that might have been accidentally
  /// revoked.
  /// </note>
  ///
  /// Parameter [maxAllocatedStorage] :
  /// The upper limit to which Amazon RDS can automatically scale the storage of
  /// the DB instance.
  ///
  /// Parameter [monitoringInterval] :
  /// The interval, in seconds, between points when Enhanced Monitoring metrics
  /// are collected for the DB instance. To disable collecting Enhanced
  /// Monitoring metrics, specify 0. The default is 0.
  ///
  /// If <code>MonitoringRoleArn</code> is specified, then you must also set
  /// <code>MonitoringInterval</code> to a value other than 0.
  ///
  /// Valid Values: <code>0, 1, 5, 10, 15, 30, 60</code>
  ///
  /// Parameter [monitoringRoleArn] :
  /// The ARN for the IAM role that permits RDS to send enhanced monitoring
  /// metrics to Amazon CloudWatch Logs. For example,
  /// <code>arn:aws:iam:123456789012:role/emaccess</code>. For information on
  /// creating a monitoring role, go to <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Monitoring.html#USER_Monitoring.OS.IAMRole">To
  /// create an IAM role for Amazon RDS Enhanced Monitoring</a> in the <i>Amazon
  /// RDS User Guide.</i>
  ///
  /// If <code>MonitoringInterval</code> is set to a value other than 0, then
  /// you must supply a <code>MonitoringRoleArn</code> value.
  ///
  /// Parameter [multiAZ] :
  /// A value that indicates whether the DB instance is a Multi-AZ deployment.
  /// Changing this parameter doesn't result in an outage and the change is
  /// applied during the next maintenance window unless the
  /// <code>ApplyImmediately</code> parameter is enabled for this request.
  ///
  /// Parameter [newDBInstanceIdentifier] :
  /// The new DB instance identifier for the DB instance when renaming a DB
  /// instance. When you change the DB instance identifier, an instance reboot
  /// occurs immediately if you enable <code>ApplyImmediately</code>, or will
  /// occur during the next maintenance window if you disable Apply Immediately.
  /// This value is stored as a lowercase string.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 1 to 63 letters, numbers, or hyphens.
  /// </li>
  /// <li>
  /// The first character must be a letter.
  /// </li>
  /// <li>
  /// Can't end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul>
  /// Example: <code>mydbinstance</code>
  ///
  /// Parameter [optionGroupName] :
  /// Indicates that the DB instance should be associated with the specified
  /// option group. Changing this parameter doesn't result in an outage except
  /// in the following case and the change is applied during the next
  /// maintenance window unless the <code>ApplyImmediately</code> parameter is
  /// enabled for this request. If the parameter change results in an option
  /// group that enables OEM, this change can cause a brief (sub-second) period
  /// during which new connections are rejected but existing connections are not
  /// interrupted.
  ///
  /// Permanent options, such as the TDE option for Oracle Advanced Security
  /// TDE, can't be removed from an option group, and that option group can't be
  /// removed from a DB instance once it is associated with a DB instance
  ///
  /// Parameter [performanceInsightsKMSKeyId] :
  /// The AWS KMS key identifier for encryption of Performance Insights data.
  ///
  /// The AWS KMS key identifier is the key ARN, key ID, alias ARN, or alias
  /// name for the AWS KMS customer master key (CMK).
  ///
  /// If you do not specify a value for
  /// <code>PerformanceInsightsKMSKeyId</code>, then Amazon RDS uses your
  /// default CMK. There is a default CMK for your AWS account. Your AWS account
  /// has a different default CMK for each AWS Region.
  ///
  /// Parameter [performanceInsightsRetentionPeriod] :
  /// The amount of time, in days, to retain Performance Insights data. Valid
  /// values are 7 or 731 (2 years).
  ///
  /// Parameter [preferredBackupWindow] :
  /// The daily time range during which automated backups are created if
  /// automated backups are enabled, as determined by the
  /// <code>BackupRetentionPeriod</code> parameter. Changing this parameter
  /// doesn't result in an outage and the change is asynchronously applied as
  /// soon as possible.
  ///
  /// <b>Amazon Aurora</b>
  ///
  /// Not applicable. The daily time range for creating automated backups is
  /// managed by the DB cluster. For more information, see
  /// <code>ModifyDBCluster</code>.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be in the format hh24:mi-hh24:mi
  /// </li>
  /// <li>
  /// Must be in Universal Time Coordinated (UTC)
  /// </li>
  /// <li>
  /// Must not conflict with the preferred maintenance window
  /// </li>
  /// <li>
  /// Must be at least 30 minutes
  /// </li>
  /// </ul>
  ///
  /// Parameter [preferredMaintenanceWindow] :
  /// The weekly time range (in UTC) during which system maintenance can occur,
  /// which might result in an outage. Changing this parameter doesn't result in
  /// an outage, except in the following situation, and the change is
  /// asynchronously applied as soon as possible. If there are pending actions
  /// that cause a reboot, and the maintenance window is changed to include the
  /// current time, then changing this parameter will cause a reboot of the DB
  /// instance. If moving this window to the current time, there must be at
  /// least 30 minutes between the current time and end of the window to ensure
  /// pending changes are applied.
  ///
  /// Default: Uses existing setting
  ///
  /// Format: ddd:hh24:mi-ddd:hh24:mi
  ///
  /// Valid Days: Mon | Tue | Wed | Thu | Fri | Sat | Sun
  ///
  /// Constraints: Must be at least 30 minutes
  ///
  /// Parameter [processorFeatures] :
  /// The number of CPU cores and the number of threads per core for the DB
  /// instance class of the DB instance.
  ///
  /// Parameter [promotionTier] :
  /// A value that specifies the order in which an Aurora Replica is promoted to
  /// the primary instance after a failure of the existing primary instance. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Aurora.Managing.Backups.html#Aurora.Managing.FaultTolerance">
  /// Fault Tolerance for an Aurora DB Cluster</a> in the <i>Amazon Aurora User
  /// Guide</i>.
  ///
  /// Default: 1
  ///
  /// Valid Values: 0 - 15
  ///
  /// Parameter [publiclyAccessible] :
  /// A value that indicates whether the DB instance is publicly accessible.
  ///
  /// When the DB instance is publicly accessible, its DNS endpoint resolves to
  /// the private IP address from within the DB instance's VPC, and to the
  /// public IP address from outside of the DB instance's VPC. Access to the DB
  /// instance is ultimately controlled by the security group it uses, and that
  /// public access is not permitted if the security group assigned to the DB
  /// instance doesn't permit it.
  ///
  /// When the DB instance isn't publicly accessible, it is an internal DB
  /// instance with a DNS name that resolves to a private IP address.
  ///
  /// <code>PubliclyAccessible</code> only applies to DB instances in a VPC. The
  /// DB instance must be part of a public subnet and
  /// <code>PubliclyAccessible</code> must be enabled for it to be publicly
  /// accessible.
  ///
  /// Changes to the <code>PubliclyAccessible</code> parameter are applied
  /// immediately regardless of the value of the <code>ApplyImmediately</code>
  /// parameter.
  ///
  /// Parameter [replicaMode] :
  /// A value that sets the open mode of a replica database to either mounted or
  /// read-only.
  /// <note>
  /// Currently, this parameter is only supported for Oracle DB instances.
  /// </note>
  /// Mounted DB replicas are included in Oracle Enterprise Edition. The main
  /// use case for mounted replicas is cross-Region disaster recovery. The
  /// primary database doesn't use Active Data Guard to transmit information to
  /// the mounted replica. Because it doesn't accept user connections, a mounted
  /// replica can't serve a read-only workload. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/oracle-read-replicas.html">Working
  /// with Oracle Read Replicas for Amazon RDS</a> in the <i>Amazon RDS User
  /// Guide</i>.
  ///
  /// Parameter [storageType] :
  /// Specifies the storage type to be associated with the DB instance.
  ///
  /// If you specify Provisioned IOPS (<code>io1</code>), you must also include
  /// a value for the <code>Iops</code> parameter.
  ///
  /// If you choose to migrate your DB instance from using standard storage to
  /// using Provisioned IOPS, or from using Provisioned IOPS to using standard
  /// storage, the process can take time. The duration of the migration depends
  /// on several factors such as database load, storage size, storage type
  /// (standard or Provisioned IOPS), amount of IOPS provisioned (if any), and
  /// the number of prior scale storage operations. Typical migration times are
  /// under 24 hours, but the process can take up to several days in some cases.
  /// During the migration, the DB instance is available for use, but might
  /// experience performance degradation. While the migration takes place,
  /// nightly backups for the instance are suspended. No other Amazon RDS
  /// operations can take place for the instance, including modifying the
  /// instance, rebooting the instance, deleting the instance, creating a read
  /// replica for the instance, and creating a DB snapshot of the instance.
  ///
  /// Valid values: <code>standard | gp2 | io1</code>
  ///
  /// Default: <code>io1</code> if the <code>Iops</code> parameter is specified,
  /// otherwise <code>gp2</code>
  ///
  /// Parameter [tdeCredentialArn] :
  /// The ARN from the key store with which to associate the instance for TDE
  /// encryption.
  ///
  /// Parameter [tdeCredentialPassword] :
  /// The password for the given ARN from the key store in order to access the
  /// device.
  ///
  /// Parameter [useDefaultProcessorFeatures] :
  /// A value that indicates whether the DB instance class of the DB instance
  /// uses its default processor features.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// A list of EC2 VPC security groups to authorize on this DB instance. This
  /// change is asynchronously applied as soon as possible.
  ///
  /// <b>Amazon Aurora</b>
  ///
  /// Not applicable. The associated list of EC2 VPC security groups is managed
  /// by the DB cluster. For more information, see <code>ModifyDBCluster</code>.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If supplied, must match existing VpcSecurityGroupIds.
  /// </li>
  /// </ul>
  Future<ModifyDBInstanceResult> modifyDBInstance({
    required String dBInstanceIdentifier,
    int? allocatedStorage,
    bool? allowMajorVersionUpgrade,
    bool? applyImmediately,
    bool? autoMinorVersionUpgrade,
    int? backupRetentionPeriod,
    String? cACertificateIdentifier,
    bool? certificateRotationRestart,
    CloudwatchLogsExportConfiguration? cloudwatchLogsExportConfiguration,
    bool? copyTagsToSnapshot,
    String? dBInstanceClass,
    String? dBParameterGroupName,
    int? dBPortNumber,
    List<String>? dBSecurityGroups,
    String? dBSubnetGroupName,
    bool? deletionProtection,
    String? domain,
    String? domainIAMRoleName,
    bool? enableCustomerOwnedIp,
    bool? enableIAMDatabaseAuthentication,
    bool? enablePerformanceInsights,
    String? engineVersion,
    int? iops,
    String? licenseModel,
    String? masterUserPassword,
    int? maxAllocatedStorage,
    int? monitoringInterval,
    String? monitoringRoleArn,
    bool? multiAZ,
    String? newDBInstanceIdentifier,
    String? optionGroupName,
    String? performanceInsightsKMSKeyId,
    int? performanceInsightsRetentionPeriod,
    String? preferredBackupWindow,
    String? preferredMaintenanceWindow,
    List<ProcessorFeature>? processorFeatures,
    int? promotionTier,
    bool? publiclyAccessible,
    ReplicaMode? replicaMode,
    String? storageType,
    String? tdeCredentialArn,
    String? tdeCredentialPassword,
    bool? useDefaultProcessorFeatures,
    List<String>? vpcSecurityGroupIds,
  }) async {
    ArgumentError.checkNotNull(dBInstanceIdentifier, 'dBInstanceIdentifier');
    final $request = <String, dynamic>{};
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    allocatedStorage?.also((arg) => $request['AllocatedStorage'] = arg);
    allowMajorVersionUpgrade
        ?.also((arg) => $request['AllowMajorVersionUpgrade'] = arg);
    applyImmediately?.also((arg) => $request['ApplyImmediately'] = arg);
    autoMinorVersionUpgrade
        ?.also((arg) => $request['AutoMinorVersionUpgrade'] = arg);
    backupRetentionPeriod
        ?.also((arg) => $request['BackupRetentionPeriod'] = arg);
    cACertificateIdentifier
        ?.also((arg) => $request['CACertificateIdentifier'] = arg);
    certificateRotationRestart
        ?.also((arg) => $request['CertificateRotationRestart'] = arg);
    cloudwatchLogsExportConfiguration
        ?.also((arg) => $request['CloudwatchLogsExportConfiguration'] = arg);
    copyTagsToSnapshot?.also((arg) => $request['CopyTagsToSnapshot'] = arg);
    dBInstanceClass?.also((arg) => $request['DBInstanceClass'] = arg);
    dBParameterGroupName?.also((arg) => $request['DBParameterGroupName'] = arg);
    dBPortNumber?.also((arg) => $request['DBPortNumber'] = arg);
    dBSecurityGroups?.also((arg) => $request['DBSecurityGroups'] = arg);
    dBSubnetGroupName?.also((arg) => $request['DBSubnetGroupName'] = arg);
    deletionProtection?.also((arg) => $request['DeletionProtection'] = arg);
    domain?.also((arg) => $request['Domain'] = arg);
    domainIAMRoleName?.also((arg) => $request['DomainIAMRoleName'] = arg);
    enableCustomerOwnedIp
        ?.also((arg) => $request['EnableCustomerOwnedIp'] = arg);
    enableIAMDatabaseAuthentication
        ?.also((arg) => $request['EnableIAMDatabaseAuthentication'] = arg);
    enablePerformanceInsights
        ?.also((arg) => $request['EnablePerformanceInsights'] = arg);
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
    iops?.also((arg) => $request['Iops'] = arg);
    licenseModel?.also((arg) => $request['LicenseModel'] = arg);
    masterUserPassword?.also((arg) => $request['MasterUserPassword'] = arg);
    maxAllocatedStorage?.also((arg) => $request['MaxAllocatedStorage'] = arg);
    monitoringInterval?.also((arg) => $request['MonitoringInterval'] = arg);
    monitoringRoleArn?.also((arg) => $request['MonitoringRoleArn'] = arg);
    multiAZ?.also((arg) => $request['MultiAZ'] = arg);
    newDBInstanceIdentifier
        ?.also((arg) => $request['NewDBInstanceIdentifier'] = arg);
    optionGroupName?.also((arg) => $request['OptionGroupName'] = arg);
    performanceInsightsKMSKeyId
        ?.also((arg) => $request['PerformanceInsightsKMSKeyId'] = arg);
    performanceInsightsRetentionPeriod
        ?.also((arg) => $request['PerformanceInsightsRetentionPeriod'] = arg);
    preferredBackupWindow
        ?.also((arg) => $request['PreferredBackupWindow'] = arg);
    preferredMaintenanceWindow
        ?.also((arg) => $request['PreferredMaintenanceWindow'] = arg);
    processorFeatures?.also((arg) => $request['ProcessorFeatures'] = arg);
    promotionTier?.also((arg) => $request['PromotionTier'] = arg);
    publiclyAccessible?.also((arg) => $request['PubliclyAccessible'] = arg);
    replicaMode?.also((arg) => $request['ReplicaMode'] = arg.toValue());
    storageType?.also((arg) => $request['StorageType'] = arg);
    tdeCredentialArn?.also((arg) => $request['TdeCredentialArn'] = arg);
    tdeCredentialPassword
        ?.also((arg) => $request['TdeCredentialPassword'] = arg);
    useDefaultProcessorFeatures
        ?.also((arg) => $request['UseDefaultProcessorFeatures'] = arg);
    vpcSecurityGroupIds?.also((arg) => $request['VpcSecurityGroupIds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyDBInstance',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyDBInstanceMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyDBInstanceResult',
    );
    return ModifyDBInstanceResult.fromXml($result);
  }

  /// Modifies the parameters of a DB parameter group. To modify more than one
  /// parameter, submit a list of the following: <code>ParameterName</code>,
  /// <code>ParameterValue</code>, and <code>ApplyMethod</code>. A maximum of 20
  /// parameters can be modified in a single request.
  /// <note>
  /// Changes to dynamic parameters are applied immediately. Changes to static
  /// parameters require a reboot without failover to the DB instance associated
  /// with the parameter group before the change can take effect.
  /// </note> <important>
  /// After you modify a DB parameter group, you should wait at least 5 minutes
  /// before creating your first DB instance that uses that DB parameter group
  /// as the default parameter group. This allows Amazon RDS to fully complete
  /// the modify action before the parameter group is used as the default for a
  /// new DB instance. This is especially important for parameters that are
  /// critical when creating the default database for a DB instance, such as the
  /// character set for the default database defined by the
  /// <code>character_set_database</code> parameter. You can use the
  /// <i>Parameter Groups</i> option of the <a
  /// href="https://console.aws.amazon.com/rds/">Amazon RDS console</a> or the
  /// <i>DescribeDBParameters</i> command to verify that your DB parameter group
  /// has been created or modified.
  /// </important>
  ///
  /// May throw [DBParameterGroupNotFoundFault].
  /// May throw [InvalidDBParameterGroupStateFault].
  ///
  /// Parameter [dBParameterGroupName] :
  /// The name of the DB parameter group.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If supplied, must match the name of an existing
  /// <code>DBParameterGroup</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [parameters] :
  /// An array of parameter names, values, and the apply method for the
  /// parameter update. At least one parameter name, value, and apply method
  /// must be supplied; later arguments are optional. A maximum of 20 parameters
  /// can be modified in a single request.
  ///
  /// Valid Values (for the application method): <code>immediate |
  /// pending-reboot</code>
  /// <note>
  /// You can use the immediate value with dynamic parameters only. You can use
  /// the pending-reboot value for both dynamic and static parameters, and
  /// changes are applied when you reboot the DB instance without failover.
  /// </note>
  Future<DBParameterGroupNameMessage> modifyDBParameterGroup({
    required String dBParameterGroupName,
    required List<Parameter> parameters,
  }) async {
    ArgumentError.checkNotNull(dBParameterGroupName, 'dBParameterGroupName');
    ArgumentError.checkNotNull(parameters, 'parameters');
    final $request = <String, dynamic>{};
    $request['DBParameterGroupName'] = dBParameterGroupName;
    $request['Parameters'] = parameters;
    final $result = await _protocol.send(
      $request,
      action: 'ModifyDBParameterGroup',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyDBParameterGroupMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyDBParameterGroupResult',
    );
    return DBParameterGroupNameMessage.fromXml($result);
  }

  /// Changes the settings for an existing DB proxy.
  ///
  /// May throw [DBProxyNotFoundFault].
  /// May throw [DBProxyAlreadyExistsFault].
  /// May throw [InvalidDBProxyStateFault].
  ///
  /// Parameter [dBProxyName] :
  /// The identifier for the <code>DBProxy</code> to modify.
  ///
  /// Parameter [auth] :
  /// The new authentication settings for the <code>DBProxy</code>.
  ///
  /// Parameter [debugLogging] :
  /// Whether the proxy includes detailed information about SQL statements in
  /// its logs. This information helps you to debug issues involving SQL
  /// behavior or the performance and scalability of the proxy connections. The
  /// debug information includes the text of SQL statements that you submit
  /// through the proxy. Thus, only enable this setting when needed for
  /// debugging, and only when you have security measures in place to safeguard
  /// any sensitive information that appears in the logs.
  ///
  /// Parameter [idleClientTimeout] :
  /// The number of seconds that a connection to the proxy can be inactive
  /// before the proxy disconnects it. You can set this value higher or lower
  /// than the connection timeout limit for the associated database.
  ///
  /// Parameter [newDBProxyName] :
  /// The new identifier for the <code>DBProxy</code>. An identifier must begin
  /// with a letter and must contain only ASCII letters, digits, and hyphens; it
  /// can't end with a hyphen or contain two consecutive hyphens.
  ///
  /// Parameter [requireTLS] :
  /// Whether Transport Layer Security (TLS) encryption is required for
  /// connections to the proxy. By enabling this setting, you can enforce
  /// encrypted TLS connections to the proxy, even if the associated database
  /// doesn't use TLS.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that the proxy uses to
  /// access secrets in AWS Secrets Manager.
  ///
  /// Parameter [securityGroups] :
  /// The new list of security groups for the <code>DBProxy</code>.
  Future<ModifyDBProxyResponse> modifyDBProxy({
    required String dBProxyName,
    List<UserAuthConfig>? auth,
    bool? debugLogging,
    int? idleClientTimeout,
    String? newDBProxyName,
    bool? requireTLS,
    String? roleArn,
    List<String>? securityGroups,
  }) async {
    ArgumentError.checkNotNull(dBProxyName, 'dBProxyName');
    final $request = <String, dynamic>{};
    $request['DBProxyName'] = dBProxyName;
    auth?.also((arg) => $request['Auth'] = arg);
    debugLogging?.also((arg) => $request['DebugLogging'] = arg);
    idleClientTimeout?.also((arg) => $request['IdleClientTimeout'] = arg);
    newDBProxyName?.also((arg) => $request['NewDBProxyName'] = arg);
    requireTLS?.also((arg) => $request['RequireTLS'] = arg);
    roleArn?.also((arg) => $request['RoleArn'] = arg);
    securityGroups?.also((arg) => $request['SecurityGroups'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyDBProxy',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyDBProxyRequest'],
      shapes: shapes,
      resultWrapper: 'ModifyDBProxyResult',
    );
    return ModifyDBProxyResponse.fromXml($result);
  }

  /// Modifies the properties of a <code>DBProxyTargetGroup</code>.
  ///
  /// May throw [DBProxyNotFoundFault].
  /// May throw [DBProxyTargetGroupNotFoundFault].
  /// May throw [InvalidDBProxyStateFault].
  ///
  /// Parameter [dBProxyName] :
  /// The name of the new proxy to which to assign the target group.
  ///
  /// Parameter [targetGroupName] :
  /// The name of the new target group to assign to the proxy.
  ///
  /// Parameter [connectionPoolConfig] :
  /// The settings that determine the size and behavior of the connection pool
  /// for the target group.
  ///
  /// Parameter [newName] :
  /// The new name for the modified <code>DBProxyTarget</code>. An identifier
  /// must begin with a letter and must contain only ASCII letters, digits, and
  /// hyphens; it can't end with a hyphen or contain two consecutive hyphens.
  Future<ModifyDBProxyTargetGroupResponse> modifyDBProxyTargetGroup({
    required String dBProxyName,
    required String targetGroupName,
    ConnectionPoolConfiguration? connectionPoolConfig,
    String? newName,
  }) async {
    ArgumentError.checkNotNull(dBProxyName, 'dBProxyName');
    ArgumentError.checkNotNull(targetGroupName, 'targetGroupName');
    final $request = <String, dynamic>{};
    $request['DBProxyName'] = dBProxyName;
    $request['TargetGroupName'] = targetGroupName;
    connectionPoolConfig?.also((arg) => $request['ConnectionPoolConfig'] = arg);
    newName?.also((arg) => $request['NewName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyDBProxyTargetGroup',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyDBProxyTargetGroupRequest'],
      shapes: shapes,
      resultWrapper: 'ModifyDBProxyTargetGroupResult',
    );
    return ModifyDBProxyTargetGroupResponse.fromXml($result);
  }

  /// Updates a manual DB snapshot with a new engine version. The snapshot can
  /// be encrypted or unencrypted, but not shared or public.
  ///
  /// Amazon RDS supports upgrading DB snapshots for MySQL, Oracle, and
  /// PostgreSQL.
  ///
  /// May throw [DBSnapshotNotFoundFault].
  ///
  /// Parameter [dBSnapshotIdentifier] :
  /// The identifier of the DB snapshot to modify.
  ///
  /// Parameter [engineVersion] :
  /// The engine version to upgrade the DB snapshot to.
  ///
  /// The following are the database engines and engine versions that are
  /// available when you upgrade a DB snapshot.
  ///
  /// <b>MySQL</b>
  ///
  /// <ul>
  /// <li>
  /// <code>5.5.46</code> (supported for 5.1 DB snapshots)
  /// </li>
  /// </ul>
  /// <b>Oracle</b>
  ///
  /// <ul>
  /// <li>
  /// <code>12.1.0.2.v8</code> (supported for 12.1.0.1 DB snapshots)
  /// </li>
  /// <li>
  /// <code>11.2.0.4.v12</code> (supported for 11.2.0.2 DB snapshots)
  /// </li>
  /// <li>
  /// <code>11.2.0.4.v11</code> (supported for 11.2.0.3 DB snapshots)
  /// </li>
  /// </ul>
  /// <b>PostgreSQL</b>
  ///
  /// For the list of engine versions that are available for upgrading a DB
  /// snapshot, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_UpgradeDBInstance.PostgreSQL.html#USER_UpgradeDBInstance.PostgreSQL.MajorVersion">
  /// Upgrading the PostgreSQL DB Engine for Amazon RDS</a>.
  ///
  /// Parameter [optionGroupName] :
  /// The option group to identify with the upgraded DB snapshot.
  ///
  /// You can specify this parameter when you upgrade an Oracle DB snapshot. The
  /// same option group considerations apply when upgrading a DB snapshot as
  /// when upgrading a DB instance. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_UpgradeDBInstance.Oracle.html#USER_UpgradeDBInstance.Oracle.OGPG.OG">Option
  /// group considerations</a> in the <i>Amazon RDS User Guide.</i>
  Future<ModifyDBSnapshotResult> modifyDBSnapshot({
    required String dBSnapshotIdentifier,
    String? engineVersion,
    String? optionGroupName,
  }) async {
    ArgumentError.checkNotNull(dBSnapshotIdentifier, 'dBSnapshotIdentifier');
    final $request = <String, dynamic>{};
    $request['DBSnapshotIdentifier'] = dBSnapshotIdentifier;
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
    optionGroupName?.also((arg) => $request['OptionGroupName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyDBSnapshot',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyDBSnapshotMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyDBSnapshotResult',
    );
    return ModifyDBSnapshotResult.fromXml($result);
  }

  /// Adds an attribute and values to, or removes an attribute and values from,
  /// a manual DB snapshot.
  ///
  /// To share a manual DB snapshot with other AWS accounts, specify
  /// <code>restore</code> as the <code>AttributeName</code> and use the
  /// <code>ValuesToAdd</code> parameter to add a list of IDs of the AWS
  /// accounts that are authorized to restore the manual DB snapshot. Uses the
  /// value <code>all</code> to make the manual DB snapshot public, which means
  /// it can be copied or restored by all AWS accounts.
  /// <note>
  /// Don't add the <code>all</code> value for any manual DB snapshots that
  /// contain private information that you don't want available to all AWS
  /// accounts.
  /// </note>
  /// If the manual DB snapshot is encrypted, it can be shared, but only by
  /// specifying a list of authorized AWS account IDs for the
  /// <code>ValuesToAdd</code> parameter. You can't use <code>all</code> as a
  /// value for that parameter in this case.
  ///
  /// To view which AWS accounts have access to copy or restore a manual DB
  /// snapshot, or whether a manual DB snapshot public or private, use the
  /// <a>DescribeDBSnapshotAttributes</a> API action. The accounts are returned
  /// as values for the <code>restore</code> attribute.
  ///
  /// May throw [DBSnapshotNotFoundFault].
  /// May throw [InvalidDBSnapshotStateFault].
  /// May throw [SharedSnapshotQuotaExceededFault].
  ///
  /// Parameter [attributeName] :
  /// The name of the DB snapshot attribute to modify.
  ///
  /// To manage authorization for other AWS accounts to copy or restore a manual
  /// DB snapshot, set this value to <code>restore</code>.
  /// <note>
  /// To view the list of attributes available to modify, use the
  /// <a>DescribeDBSnapshotAttributes</a> API action.
  /// </note>
  ///
  /// Parameter [dBSnapshotIdentifier] :
  /// The identifier for the DB snapshot to modify the attributes for.
  ///
  /// Parameter [valuesToAdd] :
  /// A list of DB snapshot attributes to add to the attribute specified by
  /// <code>AttributeName</code>.
  ///
  /// To authorize other AWS accounts to copy or restore a manual snapshot, set
  /// this list to include one or more AWS account IDs, or <code>all</code> to
  /// make the manual DB snapshot restorable by any AWS account. Do not add the
  /// <code>all</code> value for any manual DB snapshots that contain private
  /// information that you don't want available to all AWS accounts.
  ///
  /// Parameter [valuesToRemove] :
  /// A list of DB snapshot attributes to remove from the attribute specified by
  /// <code>AttributeName</code>.
  ///
  /// To remove authorization for other AWS accounts to copy or restore a manual
  /// snapshot, set this list to include one or more AWS account identifiers, or
  /// <code>all</code> to remove authorization for any AWS account to copy or
  /// restore the DB snapshot. If you specify <code>all</code>, an AWS account
  /// whose account ID is explicitly added to the <code>restore</code> attribute
  /// can still copy or restore the manual DB snapshot.
  Future<ModifyDBSnapshotAttributeResult> modifyDBSnapshotAttribute({
    required String attributeName,
    required String dBSnapshotIdentifier,
    List<String>? valuesToAdd,
    List<String>? valuesToRemove,
  }) async {
    ArgumentError.checkNotNull(attributeName, 'attributeName');
    ArgumentError.checkNotNull(dBSnapshotIdentifier, 'dBSnapshotIdentifier');
    final $request = <String, dynamic>{};
    $request['AttributeName'] = attributeName;
    $request['DBSnapshotIdentifier'] = dBSnapshotIdentifier;
    valuesToAdd?.also((arg) => $request['ValuesToAdd'] = arg);
    valuesToRemove?.also((arg) => $request['ValuesToRemove'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyDBSnapshotAttribute',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyDBSnapshotAttributeMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyDBSnapshotAttributeResult',
    );
    return ModifyDBSnapshotAttributeResult.fromXml($result);
  }

  /// Modifies an existing DB subnet group. DB subnet groups must contain at
  /// least one subnet in at least two AZs in the AWS Region.
  ///
  /// May throw [DBSubnetGroupNotFoundFault].
  /// May throw [DBSubnetQuotaExceededFault].
  /// May throw [SubnetAlreadyInUse].
  /// May throw [DBSubnetGroupDoesNotCoverEnoughAZs].
  /// May throw [InvalidSubnet].
  ///
  /// Parameter [dBSubnetGroupName] :
  /// The name for the DB subnet group. This value is stored as a lowercase
  /// string. You can't modify the default subnet group.
  ///
  /// Constraints: Must match the name of an existing DBSubnetGroup. Must not be
  /// default.
  ///
  /// Example: <code>mySubnetgroup</code>
  ///
  /// Parameter [subnetIds] :
  /// The EC2 subnet IDs for the DB subnet group.
  ///
  /// Parameter [dBSubnetGroupDescription] :
  /// The description for the DB subnet group.
  Future<ModifyDBSubnetGroupResult> modifyDBSubnetGroup({
    required String dBSubnetGroupName,
    required List<String> subnetIds,
    String? dBSubnetGroupDescription,
  }) async {
    ArgumentError.checkNotNull(dBSubnetGroupName, 'dBSubnetGroupName');
    ArgumentError.checkNotNull(subnetIds, 'subnetIds');
    final $request = <String, dynamic>{};
    $request['DBSubnetGroupName'] = dBSubnetGroupName;
    $request['SubnetIds'] = subnetIds;
    dBSubnetGroupDescription
        ?.also((arg) => $request['DBSubnetGroupDescription'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyDBSubnetGroup',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyDBSubnetGroupMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyDBSubnetGroupResult',
    );
    return ModifyDBSubnetGroupResult.fromXml($result);
  }

  /// Modifies an existing RDS event notification subscription. You can't modify
  /// the source identifiers using this call. To change source identifiers for a
  /// subscription, use the <code>AddSourceIdentifierToSubscription</code> and
  /// <code>RemoveSourceIdentifierFromSubscription</code> calls.
  ///
  /// You can see a list of the event categories for a given source type
  /// (<code>SourceType</code>) in <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Events.html">Events</a>
  /// in the <i>Amazon RDS User Guide</i> or by using the
  /// <code>DescribeEventCategories</code> operation.
  ///
  /// May throw [EventSubscriptionQuotaExceededFault].
  /// May throw [SubscriptionNotFoundFault].
  /// May throw [SNSInvalidTopicFault].
  /// May throw [SNSNoAuthorizationFault].
  /// May throw [SNSTopicArnNotFoundFault].
  /// May throw [SubscriptionCategoryNotFoundFault].
  ///
  /// Parameter [subscriptionName] :
  /// The name of the RDS event notification subscription.
  ///
  /// Parameter [enabled] :
  /// A value that indicates whether to activate the subscription.
  ///
  /// Parameter [eventCategories] :
  /// A list of event categories for a source type (<code>SourceType</code>)
  /// that you want to subscribe to. You can see a list of the categories for a
  /// given source type in <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Events.html">Events</a>
  /// in the <i>Amazon RDS User Guide</i> or by using the
  /// <code>DescribeEventCategories</code> operation.
  ///
  /// Parameter [snsTopicArn] :
  /// The Amazon Resource Name (ARN) of the SNS topic created for event
  /// notification. The ARN is created by Amazon SNS when you create a topic and
  /// subscribe to it.
  ///
  /// Parameter [sourceType] :
  /// The type of source that is generating the events. For example, if you want
  /// to be notified of events generated by a DB instance, you would set this
  /// parameter to db-instance. If this value isn't specified, all events are
  /// returned.
  ///
  /// Valid values: <code>db-instance</code> | <code>db-cluster</code> |
  /// <code>db-parameter-group</code> | <code>db-security-group</code> |
  /// <code>db-snapshot</code> | <code>db-cluster-snapshot</code>
  Future<ModifyEventSubscriptionResult> modifyEventSubscription({
    required String subscriptionName,
    bool? enabled,
    List<String>? eventCategories,
    String? snsTopicArn,
    String? sourceType,
  }) async {
    ArgumentError.checkNotNull(subscriptionName, 'subscriptionName');
    final $request = <String, dynamic>{};
    $request['SubscriptionName'] = subscriptionName;
    enabled?.also((arg) => $request['Enabled'] = arg);
    eventCategories?.also((arg) => $request['EventCategories'] = arg);
    snsTopicArn?.also((arg) => $request['SnsTopicArn'] = arg);
    sourceType?.also((arg) => $request['SourceType'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyEventSubscription',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyEventSubscriptionMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyEventSubscriptionResult',
    );
    return ModifyEventSubscriptionResult.fromXml($result);
  }

  /// Modify a setting for an Amazon Aurora global cluster. You can change one
  /// or more database configuration parameters by specifying these parameters
  /// and the new values in the request. For more information on Amazon Aurora,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
  /// What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i>
  /// <note>
  /// This action only applies to Aurora DB clusters.
  /// </note>
  ///
  /// May throw [GlobalClusterNotFoundFault].
  /// May throw [InvalidGlobalClusterStateFault].
  ///
  /// Parameter [deletionProtection] :
  /// Indicates if the global database cluster has deletion protection enabled.
  /// The global database cluster can't be deleted when deletion protection is
  /// enabled.
  ///
  /// Parameter [globalClusterIdentifier] :
  /// The DB cluster identifier for the global cluster being modified. This
  /// parameter isn't case-sensitive.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match the identifier of an existing global database cluster.
  /// </li>
  /// </ul>
  ///
  /// Parameter [newGlobalClusterIdentifier] :
  /// The new cluster identifier for the global database cluster when modifying
  /// a global database cluster. This value is stored as a lowercase string.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 1 to 63 letters, numbers, or hyphens
  /// </li>
  /// <li>
  /// The first character must be a letter
  /// </li>
  /// <li>
  /// Can't end with a hyphen or contain two consecutive hyphens
  /// </li>
  /// </ul>
  /// Example: <code>my-cluster2</code>
  Future<ModifyGlobalClusterResult> modifyGlobalCluster({
    bool? deletionProtection,
    String? globalClusterIdentifier,
    String? newGlobalClusterIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    deletionProtection?.also((arg) => $request['DeletionProtection'] = arg);
    globalClusterIdentifier
        ?.also((arg) => $request['GlobalClusterIdentifier'] = arg);
    newGlobalClusterIdentifier
        ?.also((arg) => $request['NewGlobalClusterIdentifier'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyGlobalCluster',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyGlobalClusterMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyGlobalClusterResult',
    );
    return ModifyGlobalClusterResult.fromXml($result);
  }

  /// Modifies an existing option group.
  ///
  /// May throw [InvalidOptionGroupStateFault].
  /// May throw [OptionGroupNotFoundFault].
  ///
  /// Parameter [optionGroupName] :
  /// The name of the option group to be modified.
  ///
  /// Permanent options, such as the TDE option for Oracle Advanced Security
  /// TDE, can't be removed from an option group, and that option group can't be
  /// removed from a DB instance once it is associated with a DB instance
  ///
  /// Parameter [applyImmediately] :
  /// A value that indicates whether to apply the change immediately or during
  /// the next maintenance window for each instance associated with the option
  /// group.
  ///
  /// Parameter [optionsToInclude] :
  /// Options in this list are added to the option group or, if already present,
  /// the specified configuration is used to update the existing configuration.
  ///
  /// Parameter [optionsToRemove] :
  /// Options in this list are removed from the option group.
  Future<ModifyOptionGroupResult> modifyOptionGroup({
    required String optionGroupName,
    bool? applyImmediately,
    List<OptionConfiguration>? optionsToInclude,
    List<String>? optionsToRemove,
  }) async {
    ArgumentError.checkNotNull(optionGroupName, 'optionGroupName');
    final $request = <String, dynamic>{};
    $request['OptionGroupName'] = optionGroupName;
    applyImmediately?.also((arg) => $request['ApplyImmediately'] = arg);
    optionsToInclude?.also((arg) => $request['OptionsToInclude'] = arg);
    optionsToRemove?.also((arg) => $request['OptionsToRemove'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyOptionGroup',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyOptionGroupMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyOptionGroupResult',
    );
    return ModifyOptionGroupResult.fromXml($result);
  }

  /// Promotes a read replica DB instance to a standalone DB instance.
  /// <note>
  /// <ul>
  /// <li>
  /// Backup duration is a function of the amount of changes to the database
  /// since the previous backup. If you plan to promote a read replica to a
  /// standalone instance, we recommend that you enable backups and complete at
  /// least one backup prior to promotion. In addition, a read replica cannot be
  /// promoted to a standalone instance when it is in the
  /// <code>backing-up</code> status. If you have enabled backups on your read
  /// replica, configure the automated backup window so that daily backups do
  /// not interfere with read replica promotion.
  /// </li>
  /// <li>
  /// This command doesn't apply to Aurora MySQL and Aurora PostgreSQL.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [InvalidDBInstanceStateFault].
  /// May throw [DBInstanceNotFoundFault].
  ///
  /// Parameter [dBInstanceIdentifier] :
  /// The DB instance identifier. This value is stored as a lowercase string.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match the identifier of an existing read replica DB instance.
  /// </li>
  /// </ul>
  /// Example: <code>mydbinstance</code>
  ///
  /// Parameter [backupRetentionPeriod] :
  /// The number of days for which automated backups are retained. Setting this
  /// parameter to a positive number enables backups. Setting this parameter to
  /// 0 disables automated backups.
  ///
  /// Default: 1
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be a value from 0 to 35.
  /// </li>
  /// <li>
  /// Can't be set to 0 if the DB instance is a source to read replicas.
  /// </li>
  /// </ul>
  ///
  /// Parameter [preferredBackupWindow] :
  /// The daily time range during which automated backups are created if
  /// automated backups are enabled, using the
  /// <code>BackupRetentionPeriod</code> parameter.
  ///
  /// The default is a 30-minute window selected at random from an 8-hour block
  /// of time for each AWS Region. To see the time blocks available, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/AdjustingTheMaintenanceWindow.html">
  /// Adjusting the Preferred Maintenance Window</a> in the <i>Amazon RDS User
  /// Guide.</i>
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be in the format <code>hh24:mi-hh24:mi</code>.
  /// </li>
  /// <li>
  /// Must be in Universal Coordinated Time (UTC).
  /// </li>
  /// <li>
  /// Must not conflict with the preferred maintenance window.
  /// </li>
  /// <li>
  /// Must be at least 30 minutes.
  /// </li>
  /// </ul>
  Future<PromoteReadReplicaResult> promoteReadReplica({
    required String dBInstanceIdentifier,
    int? backupRetentionPeriod,
    String? preferredBackupWindow,
  }) async {
    ArgumentError.checkNotNull(dBInstanceIdentifier, 'dBInstanceIdentifier');
    final $request = <String, dynamic>{};
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    backupRetentionPeriod
        ?.also((arg) => $request['BackupRetentionPeriod'] = arg);
    preferredBackupWindow
        ?.also((arg) => $request['PreferredBackupWindow'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'PromoteReadReplica',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['PromoteReadReplicaMessage'],
      shapes: shapes,
      resultWrapper: 'PromoteReadReplicaResult',
    );
    return PromoteReadReplicaResult.fromXml($result);
  }

  /// Promotes a read replica DB cluster to a standalone DB cluster.
  /// <note>
  /// This action only applies to Aurora DB clusters.
  /// </note>
  ///
  /// May throw [DBClusterNotFoundFault].
  /// May throw [InvalidDBClusterStateFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The identifier of the DB cluster read replica to promote. This parameter
  /// isn't case-sensitive.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match the identifier of an existing DB cluster read replica.
  /// </li>
  /// </ul>
  /// Example: <code>my-cluster-replica1</code>
  Future<PromoteReadReplicaDBClusterResult> promoteReadReplicaDBCluster({
    required String dBClusterIdentifier,
  }) async {
    ArgumentError.checkNotNull(dBClusterIdentifier, 'dBClusterIdentifier');
    final $request = <String, dynamic>{};
    $request['DBClusterIdentifier'] = dBClusterIdentifier;
    final $result = await _protocol.send(
      $request,
      action: 'PromoteReadReplicaDBCluster',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['PromoteReadReplicaDBClusterMessage'],
      shapes: shapes,
      resultWrapper: 'PromoteReadReplicaDBClusterResult',
    );
    return PromoteReadReplicaDBClusterResult.fromXml($result);
  }

  /// Purchases a reserved DB instance offering.
  ///
  /// May throw [ReservedDBInstancesOfferingNotFoundFault].
  /// May throw [ReservedDBInstanceAlreadyExistsFault].
  /// May throw [ReservedDBInstanceQuotaExceededFault].
  ///
  /// Parameter [reservedDBInstancesOfferingId] :
  /// The ID of the Reserved DB instance offering to purchase.
  ///
  /// Example: 438012d3-4052-4cc7-b2e3-8d3372e0e706
  ///
  /// Parameter [dBInstanceCount] :
  /// The number of instances to reserve.
  ///
  /// Default: <code>1</code>
  ///
  /// Parameter [reservedDBInstanceId] :
  /// Customer-specified identifier to track this reservation.
  ///
  /// Example: myreservationID
  Future<PurchaseReservedDBInstancesOfferingResult>
      purchaseReservedDBInstancesOffering({
    required String reservedDBInstancesOfferingId,
    int? dBInstanceCount,
    String? reservedDBInstanceId,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(
        reservedDBInstancesOfferingId, 'reservedDBInstancesOfferingId');
    final $request = <String, dynamic>{};
    $request['ReservedDBInstancesOfferingId'] = reservedDBInstancesOfferingId;
    dBInstanceCount?.also((arg) => $request['DBInstanceCount'] = arg);
    reservedDBInstanceId?.also((arg) => $request['ReservedDBInstanceId'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'PurchaseReservedDBInstancesOffering',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['PurchaseReservedDBInstancesOfferingMessage'],
      shapes: shapes,
      resultWrapper: 'PurchaseReservedDBInstancesOfferingResult',
    );
    return PurchaseReservedDBInstancesOfferingResult.fromXml($result);
  }

  /// You might need to reboot your DB instance, usually for maintenance
  /// reasons. For example, if you make certain modifications, or if you change
  /// the DB parameter group associated with the DB instance, you must reboot
  /// the instance for the changes to take effect.
  ///
  /// Rebooting a DB instance restarts the database engine service. Rebooting a
  /// DB instance results in a momentary outage, during which the DB instance
  /// status is set to rebooting.
  ///
  /// For more information about rebooting, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_RebootInstance.html">Rebooting
  /// a DB Instance</a> in the <i>Amazon RDS User Guide.</i>
  ///
  /// May throw [InvalidDBInstanceStateFault].
  /// May throw [DBInstanceNotFoundFault].
  ///
  /// Parameter [dBInstanceIdentifier] :
  /// The DB instance identifier. This parameter is stored as a lowercase
  /// string.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match the identifier of an existing DBInstance.
  /// </li>
  /// </ul>
  ///
  /// Parameter [forceFailover] :
  /// A value that indicates whether the reboot is conducted through a Multi-AZ
  /// failover.
  ///
  /// Constraint: You can't enable force failover if the instance isn't
  /// configured for Multi-AZ.
  Future<RebootDBInstanceResult> rebootDBInstance({
    required String dBInstanceIdentifier,
    bool? forceFailover,
  }) async {
    ArgumentError.checkNotNull(dBInstanceIdentifier, 'dBInstanceIdentifier');
    final $request = <String, dynamic>{};
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    forceFailover?.also((arg) => $request['ForceFailover'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'RebootDBInstance',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RebootDBInstanceMessage'],
      shapes: shapes,
      resultWrapper: 'RebootDBInstanceResult',
    );
    return RebootDBInstanceResult.fromXml($result);
  }

  /// Associate one or more <code>DBProxyTarget</code> data structures with a
  /// <code>DBProxyTargetGroup</code>.
  ///
  /// May throw [DBProxyNotFoundFault].
  /// May throw [DBProxyTargetGroupNotFoundFault].
  /// May throw [DBClusterNotFoundFault].
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [DBProxyTargetAlreadyRegisteredFault].
  /// May throw [InvalidDBInstanceStateFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [InvalidDBProxyStateFault].
  /// May throw [InsufficientAvailableIPsInSubnetFault].
  ///
  /// Parameter [dBProxyName] :
  /// The identifier of the <code>DBProxy</code> that is associated with the
  /// <code>DBProxyTargetGroup</code>.
  ///
  /// Parameter [dBClusterIdentifiers] :
  /// One or more DB cluster identifiers.
  ///
  /// Parameter [dBInstanceIdentifiers] :
  /// One or more DB instance identifiers.
  ///
  /// Parameter [targetGroupName] :
  /// The identifier of the <code>DBProxyTargetGroup</code>.
  Future<RegisterDBProxyTargetsResponse> registerDBProxyTargets({
    required String dBProxyName,
    List<String>? dBClusterIdentifiers,
    List<String>? dBInstanceIdentifiers,
    String? targetGroupName,
  }) async {
    ArgumentError.checkNotNull(dBProxyName, 'dBProxyName');
    final $request = <String, dynamic>{};
    $request['DBProxyName'] = dBProxyName;
    dBClusterIdentifiers?.also((arg) => $request['DBClusterIdentifiers'] = arg);
    dBInstanceIdentifiers
        ?.also((arg) => $request['DBInstanceIdentifiers'] = arg);
    targetGroupName?.also((arg) => $request['TargetGroupName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'RegisterDBProxyTargets',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RegisterDBProxyTargetsRequest'],
      shapes: shapes,
      resultWrapper: 'RegisterDBProxyTargetsResult',
    );
    return RegisterDBProxyTargetsResponse.fromXml($result);
  }

  /// Detaches an Aurora secondary cluster from an Aurora global database
  /// cluster. The cluster becomes a standalone cluster with read-write
  /// capability instead of being read-only and receiving data from a primary
  /// cluster in a different region.
  /// <note>
  /// This action only applies to Aurora DB clusters.
  /// </note>
  ///
  /// May throw [GlobalClusterNotFoundFault].
  /// May throw [InvalidGlobalClusterStateFault].
  /// May throw [DBClusterNotFoundFault].
  ///
  /// Parameter [dbClusterIdentifier] :
  /// The Amazon Resource Name (ARN) identifying the cluster that was detached
  /// from the Aurora global database cluster.
  ///
  /// Parameter [globalClusterIdentifier] :
  /// The cluster identifier to detach from the Aurora global database cluster.
  Future<RemoveFromGlobalClusterResult> removeFromGlobalCluster({
    String? dbClusterIdentifier,
    String? globalClusterIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    dbClusterIdentifier?.also((arg) => $request['DbClusterIdentifier'] = arg);
    globalClusterIdentifier
        ?.also((arg) => $request['GlobalClusterIdentifier'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'RemoveFromGlobalCluster',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RemoveFromGlobalClusterMessage'],
      shapes: shapes,
      resultWrapper: 'RemoveFromGlobalClusterResult',
    );
    return RemoveFromGlobalClusterResult.fromXml($result);
  }

  /// Disassociates an AWS Identity and Access Management (IAM) role from an
  /// Amazon Aurora DB cluster. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Integrating.Authorizing.html">Authorizing
  /// Amazon Aurora MySQL to Access Other AWS Services on Your Behalf </a> in
  /// the <i>Amazon Aurora User Guide</i>.
  /// <note>
  /// This action only applies to Aurora DB clusters.
  /// </note>
  ///
  /// May throw [DBClusterNotFoundFault].
  /// May throw [DBClusterRoleNotFoundFault].
  /// May throw [InvalidDBClusterStateFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The name of the DB cluster to disassociate the IAM role from.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role to disassociate from the
  /// Aurora DB cluster, for example
  /// <code>arn:aws:iam::123456789012:role/AuroraAccessRole</code>.
  ///
  /// Parameter [featureName] :
  /// The name of the feature for the DB cluster that the IAM role is to be
  /// disassociated from. For the list of supported feature names, see
  /// <a>DBEngineVersion</a>.
  Future<void> removeRoleFromDBCluster({
    required String dBClusterIdentifier,
    required String roleArn,
    String? featureName,
  }) async {
    ArgumentError.checkNotNull(dBClusterIdentifier, 'dBClusterIdentifier');
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    final $request = <String, dynamic>{};
    $request['DBClusterIdentifier'] = dBClusterIdentifier;
    $request['RoleArn'] = roleArn;
    featureName?.also((arg) => $request['FeatureName'] = arg);
    await _protocol.send(
      $request,
      action: 'RemoveRoleFromDBCluster',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RemoveRoleFromDBClusterMessage'],
      shapes: shapes,
    );
  }

  /// Disassociates an AWS Identity and Access Management (IAM) role from a DB
  /// instance.
  ///
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [DBInstanceRoleNotFoundFault].
  /// May throw [InvalidDBInstanceStateFault].
  ///
  /// Parameter [dBInstanceIdentifier] :
  /// The name of the DB instance to disassociate the IAM role from.
  ///
  /// Parameter [featureName] :
  /// The name of the feature for the DB instance that the IAM role is to be
  /// disassociated from. For the list of supported feature names, see
  /// <code>DBEngineVersion</code>.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role to disassociate from the DB
  /// instance, for example,
  /// <code>arn:aws:iam::123456789012:role/AccessRole</code>.
  Future<void> removeRoleFromDBInstance({
    required String dBInstanceIdentifier,
    required String featureName,
    required String roleArn,
  }) async {
    ArgumentError.checkNotNull(dBInstanceIdentifier, 'dBInstanceIdentifier');
    ArgumentError.checkNotNull(featureName, 'featureName');
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    final $request = <String, dynamic>{};
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    $request['FeatureName'] = featureName;
    $request['RoleArn'] = roleArn;
    await _protocol.send(
      $request,
      action: 'RemoveRoleFromDBInstance',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RemoveRoleFromDBInstanceMessage'],
      shapes: shapes,
    );
  }

  /// Removes a source identifier from an existing RDS event notification
  /// subscription.
  ///
  /// May throw [SubscriptionNotFoundFault].
  /// May throw [SourceNotFoundFault].
  ///
  /// Parameter [sourceIdentifier] :
  /// The source identifier to be removed from the subscription, such as the
  /// <b>DB instance identifier</b> for a DB instance or the name of a security
  /// group.
  ///
  /// Parameter [subscriptionName] :
  /// The name of the RDS event notification subscription you want to remove a
  /// source identifier from.
  Future<RemoveSourceIdentifierFromSubscriptionResult>
      removeSourceIdentifierFromSubscription({
    required String sourceIdentifier,
    required String subscriptionName,
  }) async {
    ArgumentError.checkNotNull(sourceIdentifier, 'sourceIdentifier');
    ArgumentError.checkNotNull(subscriptionName, 'subscriptionName');
    final $request = <String, dynamic>{};
    $request['SourceIdentifier'] = sourceIdentifier;
    $request['SubscriptionName'] = subscriptionName;
    final $result = await _protocol.send(
      $request,
      action: 'RemoveSourceIdentifierFromSubscription',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RemoveSourceIdentifierFromSubscriptionMessage'],
      shapes: shapes,
      resultWrapper: 'RemoveSourceIdentifierFromSubscriptionResult',
    );
    return RemoveSourceIdentifierFromSubscriptionResult.fromXml($result);
  }

  /// Removes metadata tags from an Amazon RDS resource.
  ///
  /// For an overview on tagging an Amazon RDS resource, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.Tagging.html">Tagging
  /// Amazon RDS Resources</a> in the <i>Amazon RDS User Guide.</i>
  ///
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [DBSnapshotNotFoundFault].
  /// May throw [DBClusterNotFoundFault].
  /// May throw [DBProxyNotFoundFault].
  /// May throw [DBProxyTargetGroupNotFoundFault].
  ///
  /// Parameter [resourceName] :
  /// The Amazon RDS resource that the tags are removed from. This value is an
  /// Amazon Resource Name (ARN). For information about creating an ARN, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.ARN.html#USER_Tagging.ARN.Constructing">
  /// Constructing an ARN for Amazon RDS</a> in the <i>Amazon RDS User
  /// Guide.</i>
  ///
  /// Parameter [tagKeys] :
  /// The tag key (name) of the tag to be removed.
  Future<void> removeTagsFromResource({
    required String resourceName,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceName, 'resourceName');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $request = <String, dynamic>{};
    $request['ResourceName'] = resourceName;
    $request['TagKeys'] = tagKeys;
    await _protocol.send(
      $request,
      action: 'RemoveTagsFromResource',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RemoveTagsFromResourceMessage'],
      shapes: shapes,
    );
  }

  /// Modifies the parameters of a DB cluster parameter group to the default
  /// value. To reset specific parameters submit a list of the following:
  /// <code>ParameterName</code> and <code>ApplyMethod</code>. To reset the
  /// entire DB cluster parameter group, specify the
  /// <code>DBClusterParameterGroupName</code> and
  /// <code>ResetAllParameters</code> parameters.
  ///
  /// When resetting the entire group, dynamic parameters are updated
  /// immediately and static parameters are set to <code>pending-reboot</code>
  /// to take effect on the next DB instance restart or
  /// <code>RebootDBInstance</code> request. You must call
  /// <code>RebootDBInstance</code> for every DB instance in your DB cluster
  /// that you want the updated static parameter to apply to.
  ///
  /// For more information on Amazon Aurora, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
  /// What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i>
  /// <note>
  /// This action only applies to Aurora DB clusters.
  /// </note>
  ///
  /// May throw [InvalidDBParameterGroupStateFault].
  /// May throw [DBParameterGroupNotFoundFault].
  ///
  /// Parameter [dBClusterParameterGroupName] :
  /// The name of the DB cluster parameter group to reset.
  ///
  /// Parameter [parameters] :
  /// A list of parameter names in the DB cluster parameter group to reset to
  /// the default values. You can't use this parameter if the
  /// <code>ResetAllParameters</code> parameter is enabled.
  ///
  /// Parameter [resetAllParameters] :
  /// A value that indicates whether to reset all parameters in the DB cluster
  /// parameter group to their default values. You can't use this parameter if
  /// there is a list of parameter names specified for the
  /// <code>Parameters</code> parameter.
  Future<DBClusterParameterGroupNameMessage> resetDBClusterParameterGroup({
    required String dBClusterParameterGroupName,
    List<Parameter>? parameters,
    bool? resetAllParameters,
  }) async {
    ArgumentError.checkNotNull(
        dBClusterParameterGroupName, 'dBClusterParameterGroupName');
    final $request = <String, dynamic>{};
    $request['DBClusterParameterGroupName'] = dBClusterParameterGroupName;
    parameters?.also((arg) => $request['Parameters'] = arg);
    resetAllParameters?.also((arg) => $request['ResetAllParameters'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ResetDBClusterParameterGroup',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ResetDBClusterParameterGroupMessage'],
      shapes: shapes,
      resultWrapper: 'ResetDBClusterParameterGroupResult',
    );
    return DBClusterParameterGroupNameMessage.fromXml($result);
  }

  /// Modifies the parameters of a DB parameter group to the engine/system
  /// default value. To reset specific parameters, provide a list of the
  /// following: <code>ParameterName</code> and <code>ApplyMethod</code>. To
  /// reset the entire DB parameter group, specify the
  /// <code>DBParameterGroup</code> name and <code>ResetAllParameters</code>
  /// parameters. When resetting the entire group, dynamic parameters are
  /// updated immediately and static parameters are set to
  /// <code>pending-reboot</code> to take effect on the next DB instance restart
  /// or <code>RebootDBInstance</code> request.
  ///
  /// May throw [InvalidDBParameterGroupStateFault].
  /// May throw [DBParameterGroupNotFoundFault].
  ///
  /// Parameter [dBParameterGroupName] :
  /// The name of the DB parameter group.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match the name of an existing <code>DBParameterGroup</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [parameters] :
  /// To reset the entire DB parameter group, specify the
  /// <code>DBParameterGroup</code> name and <code>ResetAllParameters</code>
  /// parameters. To reset specific parameters, provide a list of the following:
  /// <code>ParameterName</code> and <code>ApplyMethod</code>. A maximum of 20
  /// parameters can be modified in a single request.
  ///
  /// <b>MySQL</b>
  ///
  /// Valid Values (for Apply method): <code>immediate</code> |
  /// <code>pending-reboot</code>
  ///
  /// You can use the immediate value with dynamic parameters only. You can use
  /// the <code>pending-reboot</code> value for both dynamic and static
  /// parameters, and changes are applied when DB instance reboots.
  ///
  /// <b>MariaDB</b>
  ///
  /// Valid Values (for Apply method): <code>immediate</code> |
  /// <code>pending-reboot</code>
  ///
  /// You can use the immediate value with dynamic parameters only. You can use
  /// the <code>pending-reboot</code> value for both dynamic and static
  /// parameters, and changes are applied when DB instance reboots.
  ///
  /// <b>Oracle</b>
  ///
  /// Valid Values (for Apply method): <code>pending-reboot</code>
  ///
  /// Parameter [resetAllParameters] :
  /// A value that indicates whether to reset all parameters in the DB parameter
  /// group to default values. By default, all parameters in the DB parameter
  /// group are reset to default values.
  Future<DBParameterGroupNameMessage> resetDBParameterGroup({
    required String dBParameterGroupName,
    List<Parameter>? parameters,
    bool? resetAllParameters,
  }) async {
    ArgumentError.checkNotNull(dBParameterGroupName, 'dBParameterGroupName');
    final $request = <String, dynamic>{};
    $request['DBParameterGroupName'] = dBParameterGroupName;
    parameters?.also((arg) => $request['Parameters'] = arg);
    resetAllParameters?.also((arg) => $request['ResetAllParameters'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ResetDBParameterGroup',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ResetDBParameterGroupMessage'],
      shapes: shapes,
      resultWrapper: 'ResetDBParameterGroupResult',
    );
    return DBParameterGroupNameMessage.fromXml($result);
  }

  /// Creates an Amazon Aurora DB cluster from MySQL data stored in an Amazon S3
  /// bucket. Amazon RDS must be authorized to access the Amazon S3 bucket and
  /// the data must be created using the Percona XtraBackup utility as described
  /// in <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Migrating.ExtMySQL.html#AuroraMySQL.Migrating.ExtMySQL.S3">
  /// Migrating Data from MySQL by Using an Amazon S3 Bucket</a> in the
  /// <i>Amazon Aurora User Guide</i>.
  /// <note>
  /// This action only restores the DB cluster, not the DB instances for that DB
  /// cluster. You must invoke the <code>CreateDBInstance</code> action to
  /// create DB instances for the restored DB cluster, specifying the identifier
  /// of the restored DB cluster in <code>DBClusterIdentifier</code>. You can
  /// create DB instances only after the <code>RestoreDBClusterFromS3</code>
  /// action has completed and the DB cluster is available.
  /// </note>
  /// For more information on Amazon Aurora, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
  /// What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i>
  /// <note>
  /// This action only applies to Aurora DB clusters. The source DB engine must
  /// be MySQL.
  /// </note>
  ///
  /// May throw [DBClusterAlreadyExistsFault].
  /// May throw [DBClusterQuotaExceededFault].
  /// May throw [StorageQuotaExceededFault].
  /// May throw [DBSubnetGroupNotFoundFault].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [InvalidDBSubnetGroupStateFault].
  /// May throw [InvalidSubnet].
  /// May throw [InvalidS3BucketFault].
  /// May throw [DBClusterParameterGroupNotFoundFault].
  /// May throw [KMSKeyNotAccessibleFault].
  /// May throw [DBClusterNotFoundFault].
  /// May throw [DomainNotFoundFault].
  /// May throw [InsufficientStorageClusterCapacityFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The name of the DB cluster to create from the source data in the Amazon S3
  /// bucket. This parameter isn't case-sensitive.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 1 to 63 letters, numbers, or hyphens.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Can't end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul>
  /// Example: <code>my-cluster1</code>
  ///
  /// Parameter [engine] :
  /// The name of the database engine to be used for this DB cluster.
  ///
  /// Valid Values: <code>aurora</code> (for MySQL 5.6-compatible Aurora),
  /// <code>aurora-mysql</code> (for MySQL 5.7-compatible Aurora), and
  /// <code>aurora-postgresql</code>
  ///
  /// Parameter [masterUserPassword] :
  /// The password for the master database user. This password can contain any
  /// printable ASCII character except "/", """, or "@".
  ///
  /// Constraints: Must contain from 8 to 41 characters.
  ///
  /// Parameter [masterUsername] :
  /// The name of the master user for the restored DB cluster.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be 1 to 16 letters or numbers.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Can't be a reserved word for the chosen database engine.
  /// </li>
  /// </ul>
  ///
  /// Parameter [s3BucketName] :
  /// The name of the Amazon S3 bucket that contains the data used to create the
  /// Amazon Aurora DB cluster.
  ///
  /// Parameter [s3IngestionRoleArn] :
  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that authorizes Amazon RDS to access the Amazon S3 bucket on
  /// your behalf.
  ///
  /// Parameter [sourceEngine] :
  /// The identifier for the database engine that was backed up to create the
  /// files stored in the Amazon S3 bucket.
  ///
  /// Valid values: <code>mysql</code>
  ///
  /// Parameter [sourceEngineVersion] :
  /// The version of the database that the backup files were created from.
  ///
  /// MySQL versions 5.5, 5.6, and 5.7 are supported.
  ///
  /// Example: <code>5.6.40</code>, <code>5.7.28</code>
  ///
  /// Parameter [availabilityZones] :
  /// A list of Availability Zones (AZs) where instances in the restored DB
  /// cluster can be created.
  ///
  /// Parameter [backtrackWindow] :
  /// The target backtrack window, in seconds. To disable backtracking, set this
  /// value to 0.
  /// <note>
  /// Currently, Backtrack is only supported for Aurora MySQL DB clusters.
  /// </note>
  /// Default: 0
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If specified, this value must be set to a number from 0 to 259,200 (72
  /// hours).
  /// </li>
  /// </ul>
  ///
  /// Parameter [backupRetentionPeriod] :
  /// The number of days for which automated backups of the restored DB cluster
  /// are retained. You must specify a minimum value of 1.
  ///
  /// Default: 1
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be a value from 1 to 35
  /// </li>
  /// </ul>
  ///
  /// Parameter [characterSetName] :
  /// A value that indicates that the restored DB cluster should be associated
  /// with the specified CharacterSet.
  ///
  /// Parameter [copyTagsToSnapshot] :
  /// A value that indicates whether to copy all tags from the restored DB
  /// cluster to snapshots of the restored DB cluster. The default is not to
  /// copy them.
  ///
  /// Parameter [dBClusterParameterGroupName] :
  /// The name of the DB cluster parameter group to associate with the restored
  /// DB cluster. If this argument is omitted, <code>default.aurora5.6</code> is
  /// used.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If supplied, must match the name of an existing DBClusterParameterGroup.
  /// </li>
  /// </ul>
  ///
  /// Parameter [dBSubnetGroupName] :
  /// A DB subnet group to associate with the restored DB cluster.
  ///
  /// Constraints: If supplied, must match the name of an existing
  /// DBSubnetGroup.
  ///
  /// Example: <code>mySubnetgroup</code>
  ///
  /// Parameter [databaseName] :
  /// The database name for the restored DB cluster.
  ///
  /// Parameter [deletionProtection] :
  /// A value that indicates whether the DB cluster has deletion protection
  /// enabled. The database can't be deleted when deletion protection is
  /// enabled. By default, deletion protection is disabled.
  ///
  /// Parameter [domain] :
  /// Specify the Active Directory directory ID to restore the DB cluster in.
  /// The domain must be created prior to this operation.
  ///
  /// For Amazon Aurora DB clusters, Amazon RDS can use Kerberos Authentication
  /// to authenticate users that connect to the DB cluster. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/kerberos-authentication.html">Kerberos
  /// Authentication</a> in the <i>Amazon Aurora User Guide</i>.
  ///
  /// Parameter [domainIAMRoleName] :
  /// Specify the name of the IAM role to be used when making API calls to the
  /// Directory Service.
  ///
  /// Parameter [enableCloudwatchLogsExports] :
  /// The list of logs that the restored DB cluster is to export to CloudWatch
  /// Logs. The values in the list depend on the DB engine being used. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_LogAccess.html#USER_LogAccess.Procedural.UploadtoCloudWatch">Publishing
  /// Database Logs to Amazon CloudWatch Logs</a> in the <i>Amazon Aurora User
  /// Guide</i>.
  ///
  /// Parameter [enableIAMDatabaseAuthentication] :
  /// A value that indicates whether to enable mapping of AWS Identity and
  /// Access Management (IAM) accounts to database accounts. By default, mapping
  /// is disabled.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/UsingWithRDS.IAMDBAuth.html">
  /// IAM Database Authentication</a> in the <i>Amazon Aurora User Guide.</i>
  ///
  /// Parameter [engineVersion] :
  /// The version number of the database engine to use.
  ///
  /// To list all of the available engine versions for <code>aurora</code> (for
  /// MySQL 5.6-compatible Aurora), use the following command:
  ///
  /// <code>aws rds describe-db-engine-versions --engine aurora --query
  /// "DBEngineVersions[].EngineVersion"</code>
  ///
  /// To list all of the available engine versions for <code>aurora-mysql</code>
  /// (for MySQL 5.7-compatible Aurora), use the following command:
  ///
  /// <code>aws rds describe-db-engine-versions --engine aurora-mysql --query
  /// "DBEngineVersions[].EngineVersion"</code>
  ///
  /// To list all of the available engine versions for
  /// <code>aurora-postgresql</code>, use the following command:
  ///
  /// <code>aws rds describe-db-engine-versions --engine aurora-postgresql
  /// --query "DBEngineVersions[].EngineVersion"</code>
  ///
  /// <b>Aurora MySQL</b>
  ///
  /// Example: <code>5.6.10a</code>, <code>5.6.mysql_aurora.1.19.2</code>,
  /// <code>5.7.12</code>, <code>5.7.mysql_aurora.2.04.5</code>
  ///
  /// <b>Aurora PostgreSQL</b>
  ///
  /// Example: <code>9.6.3</code>, <code>10.7</code>
  ///
  /// Parameter [kmsKeyId] :
  /// The AWS KMS key identifier for an encrypted DB cluster.
  ///
  /// The AWS KMS key identifier is the key ARN, key ID, alias ARN, or alias
  /// name for the AWS KMS customer master key (CMK). To use a CMK in a
  /// different AWS account, specify the key ARN or alias ARN.
  ///
  /// If the StorageEncrypted parameter is enabled, and you do not specify a
  /// value for the <code>KmsKeyId</code> parameter, then Amazon RDS will use
  /// your default CMK. There is a default CMK for your AWS account. Your AWS
  /// account has a different default CMK for each AWS Region.
  ///
  /// Parameter [optionGroupName] :
  /// A value that indicates that the restored DB cluster should be associated
  /// with the specified option group.
  ///
  /// Permanent options can't be removed from an option group. An option group
  /// can't be removed from a DB cluster once it is associated with a DB
  /// cluster.
  ///
  /// Parameter [port] :
  /// The port number on which the instances in the restored DB cluster accept
  /// connections.
  ///
  /// Default: <code>3306</code>
  ///
  /// Parameter [preferredBackupWindow] :
  /// The daily time range during which automated backups are created if
  /// automated backups are enabled using the <code>BackupRetentionPeriod</code>
  /// parameter.
  ///
  /// The default is a 30-minute window selected at random from an 8-hour block
  /// of time for each AWS Region. To see the time blocks available, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_UpgradeDBInstance.Maintenance.html#AdjustingTheMaintenanceWindow.Aurora">
  /// Adjusting the Preferred Maintenance Window</a> in the <i>Amazon Aurora
  /// User Guide.</i>
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be in the format <code>hh24:mi-hh24:mi</code>.
  /// </li>
  /// <li>
  /// Must be in Universal Coordinated Time (UTC).
  /// </li>
  /// <li>
  /// Must not conflict with the preferred maintenance window.
  /// </li>
  /// <li>
  /// Must be at least 30 minutes.
  /// </li>
  /// </ul>
  ///
  /// Parameter [preferredMaintenanceWindow] :
  /// The weekly time range during which system maintenance can occur, in
  /// Universal Coordinated Time (UTC).
  ///
  /// Format: <code>ddd:hh24:mi-ddd:hh24:mi</code>
  ///
  /// The default is a 30-minute window selected at random from an 8-hour block
  /// of time for each AWS Region, occurring on a random day of the week. To see
  /// the time blocks available, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_UpgradeDBInstance.Maintenance.html#AdjustingTheMaintenanceWindow.Aurora">
  /// Adjusting the Preferred Maintenance Window</a> in the <i>Amazon Aurora
  /// User Guide.</i>
  ///
  /// Valid Days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.
  ///
  /// Constraints: Minimum 30-minute window.
  ///
  /// Parameter [s3Prefix] :
  /// The prefix for all of the file names that contain the data used to create
  /// the Amazon Aurora DB cluster. If you do not specify a
  /// <b>SourceS3Prefix</b> value, then the Amazon Aurora DB cluster is created
  /// by using all of the files in the Amazon S3 bucket.
  ///
  /// Parameter [storageEncrypted] :
  /// A value that indicates whether the restored DB cluster is encrypted.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// A list of EC2 VPC security groups to associate with the restored DB
  /// cluster.
  Future<RestoreDBClusterFromS3Result> restoreDBClusterFromS3({
    required String dBClusterIdentifier,
    required String engine,
    required String masterUserPassword,
    required String masterUsername,
    required String s3BucketName,
    required String s3IngestionRoleArn,
    required String sourceEngine,
    required String sourceEngineVersion,
    List<String>? availabilityZones,
    int? backtrackWindow,
    int? backupRetentionPeriod,
    String? characterSetName,
    bool? copyTagsToSnapshot,
    String? dBClusterParameterGroupName,
    String? dBSubnetGroupName,
    String? databaseName,
    bool? deletionProtection,
    String? domain,
    String? domainIAMRoleName,
    List<String>? enableCloudwatchLogsExports,
    bool? enableIAMDatabaseAuthentication,
    String? engineVersion,
    String? kmsKeyId,
    String? optionGroupName,
    int? port,
    String? preferredBackupWindow,
    String? preferredMaintenanceWindow,
    String? s3Prefix,
    bool? storageEncrypted,
    List<Tag>? tags,
    List<String>? vpcSecurityGroupIds,
  }) async {
    ArgumentError.checkNotNull(dBClusterIdentifier, 'dBClusterIdentifier');
    ArgumentError.checkNotNull(engine, 'engine');
    ArgumentError.checkNotNull(masterUserPassword, 'masterUserPassword');
    ArgumentError.checkNotNull(masterUsername, 'masterUsername');
    ArgumentError.checkNotNull(s3BucketName, 's3BucketName');
    ArgumentError.checkNotNull(s3IngestionRoleArn, 's3IngestionRoleArn');
    ArgumentError.checkNotNull(sourceEngine, 'sourceEngine');
    ArgumentError.checkNotNull(sourceEngineVersion, 'sourceEngineVersion');
    final $request = <String, dynamic>{};
    $request['DBClusterIdentifier'] = dBClusterIdentifier;
    $request['Engine'] = engine;
    $request['MasterUserPassword'] = masterUserPassword;
    $request['MasterUsername'] = masterUsername;
    $request['S3BucketName'] = s3BucketName;
    $request['S3IngestionRoleArn'] = s3IngestionRoleArn;
    $request['SourceEngine'] = sourceEngine;
    $request['SourceEngineVersion'] = sourceEngineVersion;
    availabilityZones?.also((arg) => $request['AvailabilityZones'] = arg);
    backtrackWindow?.also((arg) => $request['BacktrackWindow'] = arg);
    backupRetentionPeriod
        ?.also((arg) => $request['BackupRetentionPeriod'] = arg);
    characterSetName?.also((arg) => $request['CharacterSetName'] = arg);
    copyTagsToSnapshot?.also((arg) => $request['CopyTagsToSnapshot'] = arg);
    dBClusterParameterGroupName
        ?.also((arg) => $request['DBClusterParameterGroupName'] = arg);
    dBSubnetGroupName?.also((arg) => $request['DBSubnetGroupName'] = arg);
    databaseName?.also((arg) => $request['DatabaseName'] = arg);
    deletionProtection?.also((arg) => $request['DeletionProtection'] = arg);
    domain?.also((arg) => $request['Domain'] = arg);
    domainIAMRoleName?.also((arg) => $request['DomainIAMRoleName'] = arg);
    enableCloudwatchLogsExports
        ?.also((arg) => $request['EnableCloudwatchLogsExports'] = arg);
    enableIAMDatabaseAuthentication
        ?.also((arg) => $request['EnableIAMDatabaseAuthentication'] = arg);
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
    kmsKeyId?.also((arg) => $request['KmsKeyId'] = arg);
    optionGroupName?.also((arg) => $request['OptionGroupName'] = arg);
    port?.also((arg) => $request['Port'] = arg);
    preferredBackupWindow
        ?.also((arg) => $request['PreferredBackupWindow'] = arg);
    preferredMaintenanceWindow
        ?.also((arg) => $request['PreferredMaintenanceWindow'] = arg);
    s3Prefix?.also((arg) => $request['S3Prefix'] = arg);
    storageEncrypted?.also((arg) => $request['StorageEncrypted'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    vpcSecurityGroupIds?.also((arg) => $request['VpcSecurityGroupIds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'RestoreDBClusterFromS3',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RestoreDBClusterFromS3Message'],
      shapes: shapes,
      resultWrapper: 'RestoreDBClusterFromS3Result',
    );
    return RestoreDBClusterFromS3Result.fromXml($result);
  }

  /// Creates a new DB cluster from a DB snapshot or DB cluster snapshot. This
  /// action only applies to Aurora DB clusters.
  ///
  /// The target DB cluster is created from the source snapshot with a default
  /// configuration. If you don't specify a security group, the new DB cluster
  /// is associated with the default security group.
  /// <note>
  /// This action only restores the DB cluster, not the DB instances for that DB
  /// cluster. You must invoke the <code>CreateDBInstance</code> action to
  /// create DB instances for the restored DB cluster, specifying the identifier
  /// of the restored DB cluster in <code>DBClusterIdentifier</code>. You can
  /// create DB instances only after the
  /// <code>RestoreDBClusterFromSnapshot</code> action has completed and the DB
  /// cluster is available.
  /// </note>
  /// For more information on Amazon Aurora, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
  /// What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i>
  /// <note>
  /// This action only applies to Aurora DB clusters.
  /// </note>
  ///
  /// May throw [DBClusterAlreadyExistsFault].
  /// May throw [DBClusterQuotaExceededFault].
  /// May throw [StorageQuotaExceededFault].
  /// May throw [DBSubnetGroupNotFoundFault].
  /// May throw [DBSnapshotNotFoundFault].
  /// May throw [DBClusterSnapshotNotFoundFault].
  /// May throw [InsufficientDBClusterCapacityFault].
  /// May throw [InsufficientStorageClusterCapacityFault].
  /// May throw [InvalidDBSnapshotStateFault].
  /// May throw [InvalidDBClusterSnapshotStateFault].
  /// May throw [StorageQuotaExceededFault].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [InvalidRestoreFault].
  /// May throw [DBSubnetGroupNotFoundFault].
  /// May throw [InvalidSubnet].
  /// May throw [OptionGroupNotFoundFault].
  /// May throw [KMSKeyNotAccessibleFault].
  /// May throw [DomainNotFoundFault].
  /// May throw [DBClusterParameterGroupNotFoundFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The name of the DB cluster to create from the DB snapshot or DB cluster
  /// snapshot. This parameter isn't case-sensitive.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 1 to 63 letters, numbers, or hyphens
  /// </li>
  /// <li>
  /// First character must be a letter
  /// </li>
  /// <li>
  /// Can't end with a hyphen or contain two consecutive hyphens
  /// </li>
  /// </ul>
  /// Example: <code>my-snapshot-id</code>
  ///
  /// Parameter [engine] :
  /// The database engine to use for the new DB cluster.
  ///
  /// Default: The same as source
  ///
  /// Constraint: Must be compatible with the engine of the source
  ///
  /// Parameter [snapshotIdentifier] :
  /// The identifier for the DB snapshot or DB cluster snapshot to restore from.
  ///
  /// You can use either the name or the Amazon Resource Name (ARN) to specify a
  /// DB cluster snapshot. However, you can use only the ARN to specify a DB
  /// snapshot.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match the identifier of an existing Snapshot.
  /// </li>
  /// </ul>
  ///
  /// Parameter [availabilityZones] :
  /// Provides the list of Availability Zones (AZs) where instances in the
  /// restored DB cluster can be created.
  ///
  /// Parameter [backtrackWindow] :
  /// The target backtrack window, in seconds. To disable backtracking, set this
  /// value to 0.
  /// <note>
  /// Currently, Backtrack is only supported for Aurora MySQL DB clusters.
  /// </note>
  /// Default: 0
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If specified, this value must be set to a number from 0 to 259,200 (72
  /// hours).
  /// </li>
  /// </ul>
  ///
  /// Parameter [copyTagsToSnapshot] :
  /// A value that indicates whether to copy all tags from the restored DB
  /// cluster to snapshots of the restored DB cluster. The default is not to
  /// copy them.
  ///
  /// Parameter [dBClusterParameterGroupName] :
  /// The name of the DB cluster parameter group to associate with this DB
  /// cluster. If this argument is omitted, the default DB cluster parameter
  /// group for the specified engine is used.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If supplied, must match the name of an existing default DB cluster
  /// parameter group.
  /// </li>
  /// <li>
  /// Must be 1 to 255 letters, numbers, or hyphens.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Can't end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul>
  ///
  /// Parameter [dBSubnetGroupName] :
  /// The name of the DB subnet group to use for the new DB cluster.
  ///
  /// Constraints: If supplied, must match the name of an existing DB subnet
  /// group.
  ///
  /// Example: <code>mySubnetgroup</code>
  ///
  /// Parameter [databaseName] :
  /// The database name for the restored DB cluster.
  ///
  /// Parameter [deletionProtection] :
  /// A value that indicates whether the DB cluster has deletion protection
  /// enabled. The database can't be deleted when deletion protection is
  /// enabled. By default, deletion protection is disabled.
  ///
  /// Parameter [domain] :
  /// Specify the Active Directory directory ID to restore the DB cluster in.
  /// The domain must be created prior to this operation. Currently, only MySQL,
  /// Microsoft SQL Server, Oracle, and PostgreSQL DB instances can be created
  /// in an Active Directory Domain.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/kerberos-authentication.html">
  /// Kerberos Authentication</a> in the <i>Amazon RDS User Guide</i>.
  ///
  /// Parameter [domainIAMRoleName] :
  /// Specify the name of the IAM role to be used when making API calls to the
  /// Directory Service.
  ///
  /// Parameter [enableCloudwatchLogsExports] :
  /// The list of logs that the restored DB cluster is to export to Amazon
  /// CloudWatch Logs. The values in the list depend on the DB engine being
  /// used. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_LogAccess.html#USER_LogAccess.Procedural.UploadtoCloudWatch">Publishing
  /// Database Logs to Amazon CloudWatch Logs </a> in the <i>Amazon Aurora User
  /// Guide</i>.
  ///
  /// Parameter [enableIAMDatabaseAuthentication] :
  /// A value that indicates whether to enable mapping of AWS Identity and
  /// Access Management (IAM) accounts to database accounts. By default, mapping
  /// is disabled.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/UsingWithRDS.IAMDBAuth.html">
  /// IAM Database Authentication</a> in the <i>Amazon Aurora User Guide.</i>
  ///
  /// Parameter [engineMode] :
  /// The DB engine mode of the DB cluster, either <code>provisioned</code>,
  /// <code>serverless</code>, <code>parallelquery</code>, <code>global</code>,
  /// or <code>multimaster</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_CreateDBCluster.html">
  /// CreateDBCluster</a>.
  ///
  /// Parameter [engineVersion] :
  /// The version of the database engine to use for the new DB cluster.
  ///
  /// To list all of the available engine versions for <code>aurora</code> (for
  /// MySQL 5.6-compatible Aurora), use the following command:
  ///
  /// <code>aws rds describe-db-engine-versions --engine aurora --query
  /// "DBEngineVersions[].EngineVersion"</code>
  ///
  /// To list all of the available engine versions for <code>aurora-mysql</code>
  /// (for MySQL 5.7-compatible Aurora), use the following command:
  ///
  /// <code>aws rds describe-db-engine-versions --engine aurora-mysql --query
  /// "DBEngineVersions[].EngineVersion"</code>
  ///
  /// To list all of the available engine versions for
  /// <code>aurora-postgresql</code>, use the following command:
  ///
  /// <code>aws rds describe-db-engine-versions --engine aurora-postgresql
  /// --query "DBEngineVersions[].EngineVersion"</code>
  /// <note>
  /// If you aren't using the default engine version, then you must specify the
  /// engine version.
  /// </note>
  /// <b>Aurora MySQL</b>
  ///
  /// Example: <code>5.6.10a</code>, <code>5.6.mysql_aurora.1.19.2</code>,
  /// <code>5.7.12</code>, <code>5.7.mysql_aurora.2.04.5</code>
  ///
  /// <b>Aurora PostgreSQL</b>
  ///
  /// Example: <code>9.6.3</code>, <code>10.7</code>
  ///
  /// Parameter [kmsKeyId] :
  /// The AWS KMS key identifier to use when restoring an encrypted DB cluster
  /// from a DB snapshot or DB cluster snapshot.
  ///
  /// The AWS KMS key identifier is the key ARN, key ID, alias ARN, or alias
  /// name for the AWS KMS customer master key (CMK). To use a CMK in a
  /// different AWS account, specify the key ARN or alias ARN.
  ///
  /// When you don't specify a value for the <code>KmsKeyId</code> parameter,
  /// then the following occurs:
  ///
  /// <ul>
  /// <li>
  /// If the DB snapshot or DB cluster snapshot in
  /// <code>SnapshotIdentifier</code> is encrypted, then the restored DB cluster
  /// is encrypted using the AWS KMS CMK that was used to encrypt the DB
  /// snapshot or DB cluster snapshot.
  /// </li>
  /// <li>
  /// If the DB snapshot or DB cluster snapshot in
  /// <code>SnapshotIdentifier</code> isn't encrypted, then the restored DB
  /// cluster isn't encrypted.
  /// </li>
  /// </ul>
  ///
  /// Parameter [optionGroupName] :
  /// The name of the option group to use for the restored DB cluster.
  ///
  /// Parameter [port] :
  /// The port number on which the new DB cluster accepts connections.
  ///
  /// Constraints: This value must be <code>1150-65535</code>
  ///
  /// Default: The same port as the original DB cluster.
  ///
  /// Parameter [scalingConfiguration] :
  /// For DB clusters in <code>serverless</code> DB engine mode, the scaling
  /// properties of the DB cluster.
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the restored DB cluster.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// A list of VPC security groups that the new DB cluster will belong to.
  Future<RestoreDBClusterFromSnapshotResult> restoreDBClusterFromSnapshot({
    required String dBClusterIdentifier,
    required String engine,
    required String snapshotIdentifier,
    List<String>? availabilityZones,
    int? backtrackWindow,
    bool? copyTagsToSnapshot,
    String? dBClusterParameterGroupName,
    String? dBSubnetGroupName,
    String? databaseName,
    bool? deletionProtection,
    String? domain,
    String? domainIAMRoleName,
    List<String>? enableCloudwatchLogsExports,
    bool? enableIAMDatabaseAuthentication,
    String? engineMode,
    String? engineVersion,
    String? kmsKeyId,
    String? optionGroupName,
    int? port,
    ScalingConfiguration? scalingConfiguration,
    List<Tag>? tags,
    List<String>? vpcSecurityGroupIds,
  }) async {
    ArgumentError.checkNotNull(dBClusterIdentifier, 'dBClusterIdentifier');
    ArgumentError.checkNotNull(engine, 'engine');
    ArgumentError.checkNotNull(snapshotIdentifier, 'snapshotIdentifier');
    final $request = <String, dynamic>{};
    $request['DBClusterIdentifier'] = dBClusterIdentifier;
    $request['Engine'] = engine;
    $request['SnapshotIdentifier'] = snapshotIdentifier;
    availabilityZones?.also((arg) => $request['AvailabilityZones'] = arg);
    backtrackWindow?.also((arg) => $request['BacktrackWindow'] = arg);
    copyTagsToSnapshot?.also((arg) => $request['CopyTagsToSnapshot'] = arg);
    dBClusterParameterGroupName
        ?.also((arg) => $request['DBClusterParameterGroupName'] = arg);
    dBSubnetGroupName?.also((arg) => $request['DBSubnetGroupName'] = arg);
    databaseName?.also((arg) => $request['DatabaseName'] = arg);
    deletionProtection?.also((arg) => $request['DeletionProtection'] = arg);
    domain?.also((arg) => $request['Domain'] = arg);
    domainIAMRoleName?.also((arg) => $request['DomainIAMRoleName'] = arg);
    enableCloudwatchLogsExports
        ?.also((arg) => $request['EnableCloudwatchLogsExports'] = arg);
    enableIAMDatabaseAuthentication
        ?.also((arg) => $request['EnableIAMDatabaseAuthentication'] = arg);
    engineMode?.also((arg) => $request['EngineMode'] = arg);
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
    kmsKeyId?.also((arg) => $request['KmsKeyId'] = arg);
    optionGroupName?.also((arg) => $request['OptionGroupName'] = arg);
    port?.also((arg) => $request['Port'] = arg);
    scalingConfiguration?.also((arg) => $request['ScalingConfiguration'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    vpcSecurityGroupIds?.also((arg) => $request['VpcSecurityGroupIds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'RestoreDBClusterFromSnapshot',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RestoreDBClusterFromSnapshotMessage'],
      shapes: shapes,
      resultWrapper: 'RestoreDBClusterFromSnapshotResult',
    );
    return RestoreDBClusterFromSnapshotResult.fromXml($result);
  }

  /// Restores a DB cluster to an arbitrary point in time. Users can restore to
  /// any point in time before <code>LatestRestorableTime</code> for up to
  /// <code>BackupRetentionPeriod</code> days. The target DB cluster is created
  /// from the source DB cluster with the same configuration as the original DB
  /// cluster, except that the new DB cluster is created with the default DB
  /// security group.
  /// <note>
  /// This action only restores the DB cluster, not the DB instances for that DB
  /// cluster. You must invoke the <code>CreateDBInstance</code> action to
  /// create DB instances for the restored DB cluster, specifying the identifier
  /// of the restored DB cluster in <code>DBClusterIdentifier</code>. You can
  /// create DB instances only after the
  /// <code>RestoreDBClusterToPointInTime</code> action has completed and the DB
  /// cluster is available.
  /// </note>
  /// For more information on Amazon Aurora, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
  /// What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i>
  /// <note>
  /// This action only applies to Aurora DB clusters.
  /// </note>
  ///
  /// May throw [DBClusterAlreadyExistsFault].
  /// May throw [DBClusterNotFoundFault].
  /// May throw [DBClusterQuotaExceededFault].
  /// May throw [DBClusterSnapshotNotFoundFault].
  /// May throw [DBSubnetGroupNotFoundFault].
  /// May throw [InsufficientDBClusterCapacityFault].
  /// May throw [InsufficientStorageClusterCapacityFault].
  /// May throw [InvalidDBClusterSnapshotStateFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [InvalidDBSnapshotStateFault].
  /// May throw [InvalidRestoreFault].
  /// May throw [InvalidSubnet].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [KMSKeyNotAccessibleFault].
  /// May throw [OptionGroupNotFoundFault].
  /// May throw [StorageQuotaExceededFault].
  /// May throw [DomainNotFoundFault].
  /// May throw [DBClusterParameterGroupNotFoundFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The name of the new DB cluster to be created.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 1 to 63 letters, numbers, or hyphens
  /// </li>
  /// <li>
  /// First character must be a letter
  /// </li>
  /// <li>
  /// Can't end with a hyphen or contain two consecutive hyphens
  /// </li>
  /// </ul>
  ///
  /// Parameter [sourceDBClusterIdentifier] :
  /// The identifier of the source DB cluster from which to restore.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match the identifier of an existing DBCluster.
  /// </li>
  /// </ul>
  ///
  /// Parameter [backtrackWindow] :
  /// The target backtrack window, in seconds. To disable backtracking, set this
  /// value to 0.
  /// <note>
  /// Currently, Backtrack is only supported for Aurora MySQL DB clusters.
  /// </note>
  /// Default: 0
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If specified, this value must be set to a number from 0 to 259,200 (72
  /// hours).
  /// </li>
  /// </ul>
  ///
  /// Parameter [copyTagsToSnapshot] :
  /// A value that indicates whether to copy all tags from the restored DB
  /// cluster to snapshots of the restored DB cluster. The default is not to
  /// copy them.
  ///
  /// Parameter [dBClusterParameterGroupName] :
  /// The name of the DB cluster parameter group to associate with this DB
  /// cluster. If this argument is omitted, the default DB cluster parameter
  /// group for the specified engine is used.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If supplied, must match the name of an existing DB cluster parameter
  /// group.
  /// </li>
  /// <li>
  /// Must be 1 to 255 letters, numbers, or hyphens.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Can't end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul>
  ///
  /// Parameter [dBSubnetGroupName] :
  /// The DB subnet group name to use for the new DB cluster.
  ///
  /// Constraints: If supplied, must match the name of an existing
  /// DBSubnetGroup.
  ///
  /// Example: <code>mySubnetgroup</code>
  ///
  /// Parameter [deletionProtection] :
  /// A value that indicates whether the DB cluster has deletion protection
  /// enabled. The database can't be deleted when deletion protection is
  /// enabled. By default, deletion protection is disabled.
  ///
  /// Parameter [domain] :
  /// Specify the Active Directory directory ID to restore the DB cluster in.
  /// The domain must be created prior to this operation.
  ///
  /// For Amazon Aurora DB clusters, Amazon RDS can use Kerberos Authentication
  /// to authenticate users that connect to the DB cluster. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/kerberos-authentication.html">Kerberos
  /// Authentication</a> in the <i>Amazon Aurora User Guide</i>.
  ///
  /// Parameter [domainIAMRoleName] :
  /// Specify the name of the IAM role to be used when making API calls to the
  /// Directory Service.
  ///
  /// Parameter [enableCloudwatchLogsExports] :
  /// The list of logs that the restored DB cluster is to export to CloudWatch
  /// Logs. The values in the list depend on the DB engine being used. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_LogAccess.html#USER_LogAccess.Procedural.UploadtoCloudWatch">Publishing
  /// Database Logs to Amazon CloudWatch Logs</a> in the <i>Amazon Aurora User
  /// Guide</i>.
  ///
  /// Parameter [enableIAMDatabaseAuthentication] :
  /// A value that indicates whether to enable mapping of AWS Identity and
  /// Access Management (IAM) accounts to database accounts. By default, mapping
  /// is disabled.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/UsingWithRDS.IAMDBAuth.html">
  /// IAM Database Authentication</a> in the <i>Amazon Aurora User Guide.</i>
  ///
  /// Parameter [kmsKeyId] :
  /// The AWS KMS key identifier to use when restoring an encrypted DB cluster
  /// from an encrypted DB cluster.
  ///
  /// The AWS KMS key identifier is the key ARN, key ID, alias ARN, or alias
  /// name for the AWS KMS customer master key (CMK). To use a CMK in a
  /// different AWS account, specify the key ARN or alias ARN.
  ///
  /// You can restore to a new DB cluster and encrypt the new DB cluster with a
  /// AWS KMS CMK that is different than the AWS KMS key used to encrypt the
  /// source DB cluster. The new DB cluster is encrypted with the AWS KMS CMK
  /// identified by the <code>KmsKeyId</code> parameter.
  ///
  /// If you don't specify a value for the <code>KmsKeyId</code> parameter, then
  /// the following occurs:
  ///
  /// <ul>
  /// <li>
  /// If the DB cluster is encrypted, then the restored DB cluster is encrypted
  /// using the AWS KMS CMK that was used to encrypt the source DB cluster.
  /// </li>
  /// <li>
  /// If the DB cluster isn't encrypted, then the restored DB cluster isn't
  /// encrypted.
  /// </li>
  /// </ul>
  /// If <code>DBClusterIdentifier</code> refers to a DB cluster that isn't
  /// encrypted, then the restore request is rejected.
  ///
  /// Parameter [optionGroupName] :
  /// The name of the option group for the new DB cluster.
  ///
  /// Parameter [port] :
  /// The port number on which the new DB cluster accepts connections.
  ///
  /// Constraints: A value from <code>1150-65535</code>.
  ///
  /// Default: The default port for the engine.
  ///
  /// Parameter [restoreToTime] :
  /// The date and time to restore the DB cluster to.
  ///
  /// Valid Values: Value must be a time in Universal Coordinated Time (UTC)
  /// format
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be before the latest restorable time for the DB instance
  /// </li>
  /// <li>
  /// Must be specified if <code>UseLatestRestorableTime</code> parameter isn't
  /// provided
  /// </li>
  /// <li>
  /// Can't be specified if the <code>UseLatestRestorableTime</code> parameter
  /// is enabled
  /// </li>
  /// <li>
  /// Can't be specified if the <code>RestoreType</code> parameter is
  /// <code>copy-on-write</code>
  /// </li>
  /// </ul>
  /// Example: <code>2015-03-07T23:45:00Z</code>
  ///
  /// Parameter [restoreType] :
  /// The type of restore to be performed. You can specify one of the following
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <code>full-copy</code> - The new DB cluster is restored as a full copy of
  /// the source DB cluster.
  /// </li>
  /// <li>
  /// <code>copy-on-write</code> - The new DB cluster is restored as a clone of
  /// the source DB cluster.
  /// </li>
  /// </ul>
  /// Constraints: You can't specify <code>copy-on-write</code> if the engine
  /// version of the source DB cluster is earlier than 1.11.
  ///
  /// If you don't specify a <code>RestoreType</code> value, then the new DB
  /// cluster is restored as a full copy of the source DB cluster.
  ///
  /// Parameter [useLatestRestorableTime] :
  /// A value that indicates whether to restore the DB cluster to the latest
  /// restorable backup time. By default, the DB cluster isn't restored to the
  /// latest restorable backup time.
  ///
  /// Constraints: Can't be specified if <code>RestoreToTime</code> parameter is
  /// provided.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// A list of VPC security groups that the new DB cluster belongs to.
  Future<RestoreDBClusterToPointInTimeResult> restoreDBClusterToPointInTime({
    required String dBClusterIdentifier,
    required String sourceDBClusterIdentifier,
    int? backtrackWindow,
    bool? copyTagsToSnapshot,
    String? dBClusterParameterGroupName,
    String? dBSubnetGroupName,
    bool? deletionProtection,
    String? domain,
    String? domainIAMRoleName,
    List<String>? enableCloudwatchLogsExports,
    bool? enableIAMDatabaseAuthentication,
    String? kmsKeyId,
    String? optionGroupName,
    int? port,
    DateTime? restoreToTime,
    String? restoreType,
    List<Tag>? tags,
    bool? useLatestRestorableTime,
    List<String>? vpcSecurityGroupIds,
  }) async {
    ArgumentError.checkNotNull(dBClusterIdentifier, 'dBClusterIdentifier');
    ArgumentError.checkNotNull(
        sourceDBClusterIdentifier, 'sourceDBClusterIdentifier');
    final $request = <String, dynamic>{};
    $request['DBClusterIdentifier'] = dBClusterIdentifier;
    $request['SourceDBClusterIdentifier'] = sourceDBClusterIdentifier;
    backtrackWindow?.also((arg) => $request['BacktrackWindow'] = arg);
    copyTagsToSnapshot?.also((arg) => $request['CopyTagsToSnapshot'] = arg);
    dBClusterParameterGroupName
        ?.also((arg) => $request['DBClusterParameterGroupName'] = arg);
    dBSubnetGroupName?.also((arg) => $request['DBSubnetGroupName'] = arg);
    deletionProtection?.also((arg) => $request['DeletionProtection'] = arg);
    domain?.also((arg) => $request['Domain'] = arg);
    domainIAMRoleName?.also((arg) => $request['DomainIAMRoleName'] = arg);
    enableCloudwatchLogsExports
        ?.also((arg) => $request['EnableCloudwatchLogsExports'] = arg);
    enableIAMDatabaseAuthentication
        ?.also((arg) => $request['EnableIAMDatabaseAuthentication'] = arg);
    kmsKeyId?.also((arg) => $request['KmsKeyId'] = arg);
    optionGroupName?.also((arg) => $request['OptionGroupName'] = arg);
    port?.also((arg) => $request['Port'] = arg);
    restoreToTime
        ?.also((arg) => $request['RestoreToTime'] = _s.iso8601ToJson(arg));
    restoreType?.also((arg) => $request['RestoreType'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    useLatestRestorableTime
        ?.also((arg) => $request['UseLatestRestorableTime'] = arg);
    vpcSecurityGroupIds?.also((arg) => $request['VpcSecurityGroupIds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'RestoreDBClusterToPointInTime',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RestoreDBClusterToPointInTimeMessage'],
      shapes: shapes,
      resultWrapper: 'RestoreDBClusterToPointInTimeResult',
    );
    return RestoreDBClusterToPointInTimeResult.fromXml($result);
  }

  /// Creates a new DB instance from a DB snapshot. The target database is
  /// created from the source database restore point with most of the source's
  /// original configuration, including the default security group and DB
  /// parameter group. By default, the new DB instance is created as a Single-AZ
  /// deployment, except when the instance is a SQL Server instance that has an
  /// option group associated with mirroring. In this case, the instance becomes
  /// a Multi-AZ deployment, not a Single-AZ deployment.
  ///
  /// If you want to replace your original DB instance with the new, restored DB
  /// instance, then rename your original DB instance before you call the
  /// RestoreDBInstanceFromDBSnapshot action. RDS doesn't allow two DB instances
  /// with the same name. After you have renamed your original DB instance with
  /// a different identifier, then you can pass the original name of the DB
  /// instance as the DBInstanceIdentifier in the call to the
  /// RestoreDBInstanceFromDBSnapshot action. The result is that you replace the
  /// original DB instance with the DB instance created from the snapshot.
  ///
  /// If you are restoring from a shared manual DB snapshot, the
  /// <code>DBSnapshotIdentifier</code> must be the ARN of the shared DB
  /// snapshot.
  /// <note>
  /// This command doesn't apply to Aurora MySQL and Aurora PostgreSQL. For
  /// Aurora, use <code>RestoreDBClusterFromSnapshot</code>.
  /// </note>
  ///
  /// May throw [DBInstanceAlreadyExistsFault].
  /// May throw [DBSnapshotNotFoundFault].
  /// May throw [InstanceQuotaExceededFault].
  /// May throw [InsufficientDBInstanceCapacityFault].
  /// May throw [InvalidDBSnapshotStateFault].
  /// May throw [StorageQuotaExceededFault].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [InvalidRestoreFault].
  /// May throw [DBSubnetGroupNotFoundFault].
  /// May throw [DBSubnetGroupDoesNotCoverEnoughAZs].
  /// May throw [InvalidSubnet].
  /// May throw [ProvisionedIopsNotAvailableInAZFault].
  /// May throw [OptionGroupNotFoundFault].
  /// May throw [StorageTypeNotSupportedFault].
  /// May throw [AuthorizationNotFoundFault].
  /// May throw [KMSKeyNotAccessibleFault].
  /// May throw [DBSecurityGroupNotFoundFault].
  /// May throw [DomainNotFoundFault].
  /// May throw [DBParameterGroupNotFoundFault].
  /// May throw [BackupPolicyNotFoundFault].
  ///
  /// Parameter [dBInstanceIdentifier] :
  /// Name of the DB instance to create from the DB snapshot. This parameter
  /// isn't case-sensitive.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 1 to 63 numbers, letters, or hyphens
  /// </li>
  /// <li>
  /// First character must be a letter
  /// </li>
  /// <li>
  /// Can't end with a hyphen or contain two consecutive hyphens
  /// </li>
  /// </ul>
  /// Example: <code>my-snapshot-id</code>
  ///
  /// Parameter [dBSnapshotIdentifier] :
  /// The identifier for the DB snapshot to restore from.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match the identifier of an existing DBSnapshot.
  /// </li>
  /// <li>
  /// If you are restoring from a shared manual DB snapshot, the
  /// <code>DBSnapshotIdentifier</code> must be the ARN of the shared DB
  /// snapshot.
  /// </li>
  /// </ul>
  ///
  /// Parameter [autoMinorVersionUpgrade] :
  /// A value that indicates whether minor version upgrades are applied
  /// automatically to the DB instance during the maintenance window.
  ///
  /// Parameter [availabilityZone] :
  /// The Availability Zone (AZ) where the DB instance will be created.
  ///
  /// Default: A random, system-chosen Availability Zone.
  ///
  /// Constraint: You can't specify the <code>AvailabilityZone</code> parameter
  /// if the DB instance is a Multi-AZ deployment.
  ///
  /// Example: <code>us-east-1a</code>
  ///
  /// Parameter [copyTagsToSnapshot] :
  /// A value that indicates whether to copy all tags from the restored DB
  /// instance to snapshots of the DB instance. By default, tags are not copied.
  ///
  /// Parameter [dBInstanceClass] :
  /// The compute and memory capacity of the Amazon RDS DB instance, for
  /// example, <code>db.m4.large</code>. Not all DB instance classes are
  /// available in all AWS Regions, or for all database engines. For the full
  /// list of DB instance classes, and availability for your engine, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.DBInstanceClass.html">DB
  /// Instance Class</a> in the <i>Amazon RDS User Guide.</i>
  ///
  /// Default: The same DBInstanceClass as the original DB instance.
  ///
  /// Parameter [dBName] :
  /// The database name for the restored DB instance.
  /// <note>
  /// This parameter doesn't apply to the MySQL, PostgreSQL, or MariaDB engines.
  /// </note>
  ///
  /// Parameter [dBParameterGroupName] :
  /// The name of the DB parameter group to associate with this DB instance.
  ///
  /// If you do not specify a value for <code>DBParameterGroupName</code>, then
  /// the default <code>DBParameterGroup</code> for the specified DB engine is
  /// used.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If supplied, must match the name of an existing DBParameterGroup.
  /// </li>
  /// <li>
  /// Must be 1 to 255 letters, numbers, or hyphens.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Can't end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul>
  ///
  /// Parameter [dBSubnetGroupName] :
  /// The DB subnet group name to use for the new instance.
  ///
  /// Constraints: If supplied, must match the name of an existing
  /// DBSubnetGroup.
  ///
  /// Example: <code>mySubnetgroup</code>
  ///
  /// Parameter [deletionProtection] :
  /// A value that indicates whether the DB instance has deletion protection
  /// enabled. The database can't be deleted when deletion protection is
  /// enabled. By default, deletion protection is disabled. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_DeleteInstance.html">
  /// Deleting a DB Instance</a>.
  ///
  /// Parameter [domain] :
  /// Specify the Active Directory directory ID to restore the DB instance in.
  /// The domain must be created prior to this operation. Currently, only MySQL,
  /// Microsoft SQL Server, Oracle, and PostgreSQL DB instances can be created
  /// in an Active Directory Domain.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/kerberos-authentication.html">
  /// Kerberos Authentication</a> in the <i>Amazon RDS User Guide</i>.
  ///
  /// Parameter [domainIAMRoleName] :
  /// Specify the name of the IAM role to be used when making API calls to the
  /// Directory Service.
  ///
  /// Parameter [enableCloudwatchLogsExports] :
  /// The list of logs that the restored DB instance is to export to CloudWatch
  /// Logs. The values in the list depend on the DB engine being used. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_LogAccess.html#USER_LogAccess.Procedural.UploadtoCloudWatch">Publishing
  /// Database Logs to Amazon CloudWatch Logs</a> in the <i>Amazon RDS User
  /// Guide</i>.
  ///
  /// Parameter [enableCustomerOwnedIp] :
  /// A value that indicates whether to enable a customer-owned IP address
  /// (CoIP) for an RDS on Outposts DB instance.
  ///
  /// A <i>CoIP</i> provides local or external connectivity to resources in your
  /// Outpost subnets through your on-premises network. For some use cases, a
  /// CoIP can provide lower latency for connections to the DB instance from
  /// outside of its virtual private cloud (VPC) on your local network.
  ///
  /// For more information about RDS on Outposts, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/rds-on-outposts.html">Working
  /// with Amazon RDS on AWS Outposts</a> in the <i>Amazon RDS User Guide</i>.
  ///
  /// For more information about CoIPs, see <a
  /// href="https://docs.aws.amazon.com/outposts/latest/userguide/outposts-networking-components.html#ip-addressing">Customer-owned
  /// IP addresses</a> in the <i>AWS Outposts User Guide</i>.
  ///
  /// Parameter [enableIAMDatabaseAuthentication] :
  /// A value that indicates whether to enable mapping of AWS Identity and
  /// Access Management (IAM) accounts to database accounts. By default, mapping
  /// is disabled.
  ///
  /// For more information about IAM database authentication, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.IAMDBAuth.html">
  /// IAM Database Authentication for MySQL and PostgreSQL</a> in the <i>Amazon
  /// RDS User Guide.</i>
  ///
  /// Parameter [engine] :
  /// The database engine to use for the new instance.
  ///
  /// Default: The same as source
  ///
  /// Constraint: Must be compatible with the engine of the source. For example,
  /// you can restore a MariaDB 10.1 DB instance from a MySQL 5.6 snapshot.
  ///
  /// Valid Values:
  ///
  /// <ul>
  /// <li>
  /// <code>mariadb</code>
  /// </li>
  /// <li>
  /// <code>mysql</code>
  /// </li>
  /// <li>
  /// <code>oracle-ee</code>
  /// </li>
  /// <li>
  /// <code>oracle-se2</code>
  /// </li>
  /// <li>
  /// <code>oracle-se1</code>
  /// </li>
  /// <li>
  /// <code>oracle-se</code>
  /// </li>
  /// <li>
  /// <code>postgres</code>
  /// </li>
  /// <li>
  /// <code>sqlserver-ee</code>
  /// </li>
  /// <li>
  /// <code>sqlserver-se</code>
  /// </li>
  /// <li>
  /// <code>sqlserver-ex</code>
  /// </li>
  /// <li>
  /// <code>sqlserver-web</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [iops] :
  /// Specifies the amount of provisioned IOPS for the DB instance, expressed in
  /// I/O operations per second. If this parameter isn't specified, the IOPS
  /// value is taken from the backup. If this parameter is set to 0, the new
  /// instance is converted to a non-PIOPS instance. The conversion takes
  /// additional time, though your DB instance is available for connections
  /// before the conversion starts.
  ///
  /// The provisioned IOPS value must follow the requirements for your database
  /// engine. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_Storage.html#USER_PIOPS">Amazon
  /// RDS Provisioned IOPS Storage to Improve Performance</a> in the <i>Amazon
  /// RDS User Guide.</i>
  ///
  /// Constraints: Must be an integer greater than 1000.
  ///
  /// Parameter [licenseModel] :
  /// License model information for the restored DB instance.
  ///
  /// Default: Same as source.
  ///
  /// Valid values: <code>license-included</code> |
  /// <code>bring-your-own-license</code> | <code>general-public-license</code>
  ///
  /// Parameter [multiAZ] :
  /// A value that indicates whether the DB instance is a Multi-AZ deployment.
  ///
  /// Constraint: You can't specify the <code>AvailabilityZone</code> parameter
  /// if the DB instance is a Multi-AZ deployment.
  ///
  /// Parameter [optionGroupName] :
  /// The name of the option group to be used for the restored DB instance.
  ///
  /// Permanent options, such as the TDE option for Oracle Advanced Security
  /// TDE, can't be removed from an option group, and that option group can't be
  /// removed from a DB instance once it is associated with a DB instance
  ///
  /// Parameter [port] :
  /// The port number on which the database accepts connections.
  ///
  /// Default: The same port as the original DB instance
  ///
  /// Constraints: Value must be <code>1150-65535</code>
  ///
  /// Parameter [processorFeatures] :
  /// The number of CPU cores and the number of threads per core for the DB
  /// instance class of the DB instance.
  ///
  /// Parameter [publiclyAccessible] :
  /// A value that indicates whether the DB instance is publicly accessible.
  ///
  /// When the DB instance is publicly accessible, its DNS endpoint resolves to
  /// the private IP address from within the DB instance's VPC, and to the
  /// public IP address from outside of the DB instance's VPC. Access to the DB
  /// instance is ultimately controlled by the security group it uses, and that
  /// public access is not permitted if the security group assigned to the DB
  /// instance doesn't permit it.
  ///
  /// When the DB instance isn't publicly accessible, it is an internal DB
  /// instance with a DNS name that resolves to a private IP address.
  ///
  /// For more information, see <a>CreateDBInstance</a>.
  ///
  /// Parameter [storageType] :
  /// Specifies the storage type to be associated with the DB instance.
  ///
  /// Valid values: <code>standard | gp2 | io1</code>
  ///
  /// If you specify <code>io1</code>, you must also include a value for the
  /// <code>Iops</code> parameter.
  ///
  /// Default: <code>io1</code> if the <code>Iops</code> parameter is specified,
  /// otherwise <code>gp2</code>
  ///
  /// Parameter [tdeCredentialArn] :
  /// The ARN from the key store with which to associate the instance for TDE
  /// encryption.
  ///
  /// Parameter [tdeCredentialPassword] :
  /// The password for the given ARN from the key store in order to access the
  /// device.
  ///
  /// Parameter [useDefaultProcessorFeatures] :
  /// A value that indicates whether the DB instance class of the DB instance
  /// uses its default processor features.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// A list of EC2 VPC security groups to associate with this DB instance.
  ///
  /// Default: The default EC2 VPC security group for the DB subnet group's VPC.
  Future<RestoreDBInstanceFromDBSnapshotResult>
      restoreDBInstanceFromDBSnapshot({
    required String dBInstanceIdentifier,
    required String dBSnapshotIdentifier,
    bool? autoMinorVersionUpgrade,
    String? availabilityZone,
    bool? copyTagsToSnapshot,
    String? dBInstanceClass,
    String? dBName,
    String? dBParameterGroupName,
    String? dBSubnetGroupName,
    bool? deletionProtection,
    String? domain,
    String? domainIAMRoleName,
    List<String>? enableCloudwatchLogsExports,
    bool? enableCustomerOwnedIp,
    bool? enableIAMDatabaseAuthentication,
    String? engine,
    int? iops,
    String? licenseModel,
    bool? multiAZ,
    String? optionGroupName,
    int? port,
    List<ProcessorFeature>? processorFeatures,
    bool? publiclyAccessible,
    String? storageType,
    List<Tag>? tags,
    String? tdeCredentialArn,
    String? tdeCredentialPassword,
    bool? useDefaultProcessorFeatures,
    List<String>? vpcSecurityGroupIds,
  }) async {
    ArgumentError.checkNotNull(dBInstanceIdentifier, 'dBInstanceIdentifier');
    ArgumentError.checkNotNull(dBSnapshotIdentifier, 'dBSnapshotIdentifier');
    final $request = <String, dynamic>{};
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    $request['DBSnapshotIdentifier'] = dBSnapshotIdentifier;
    autoMinorVersionUpgrade
        ?.also((arg) => $request['AutoMinorVersionUpgrade'] = arg);
    availabilityZone?.also((arg) => $request['AvailabilityZone'] = arg);
    copyTagsToSnapshot?.also((arg) => $request['CopyTagsToSnapshot'] = arg);
    dBInstanceClass?.also((arg) => $request['DBInstanceClass'] = arg);
    dBName?.also((arg) => $request['DBName'] = arg);
    dBParameterGroupName?.also((arg) => $request['DBParameterGroupName'] = arg);
    dBSubnetGroupName?.also((arg) => $request['DBSubnetGroupName'] = arg);
    deletionProtection?.also((arg) => $request['DeletionProtection'] = arg);
    domain?.also((arg) => $request['Domain'] = arg);
    domainIAMRoleName?.also((arg) => $request['DomainIAMRoleName'] = arg);
    enableCloudwatchLogsExports
        ?.also((arg) => $request['EnableCloudwatchLogsExports'] = arg);
    enableCustomerOwnedIp
        ?.also((arg) => $request['EnableCustomerOwnedIp'] = arg);
    enableIAMDatabaseAuthentication
        ?.also((arg) => $request['EnableIAMDatabaseAuthentication'] = arg);
    engine?.also((arg) => $request['Engine'] = arg);
    iops?.also((arg) => $request['Iops'] = arg);
    licenseModel?.also((arg) => $request['LicenseModel'] = arg);
    multiAZ?.also((arg) => $request['MultiAZ'] = arg);
    optionGroupName?.also((arg) => $request['OptionGroupName'] = arg);
    port?.also((arg) => $request['Port'] = arg);
    processorFeatures?.also((arg) => $request['ProcessorFeatures'] = arg);
    publiclyAccessible?.also((arg) => $request['PubliclyAccessible'] = arg);
    storageType?.also((arg) => $request['StorageType'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    tdeCredentialArn?.also((arg) => $request['TdeCredentialArn'] = arg);
    tdeCredentialPassword
        ?.also((arg) => $request['TdeCredentialPassword'] = arg);
    useDefaultProcessorFeatures
        ?.also((arg) => $request['UseDefaultProcessorFeatures'] = arg);
    vpcSecurityGroupIds?.also((arg) => $request['VpcSecurityGroupIds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'RestoreDBInstanceFromDBSnapshot',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RestoreDBInstanceFromDBSnapshotMessage'],
      shapes: shapes,
      resultWrapper: 'RestoreDBInstanceFromDBSnapshotResult',
    );
    return RestoreDBInstanceFromDBSnapshotResult.fromXml($result);
  }

  /// Amazon Relational Database Service (Amazon RDS) supports importing MySQL
  /// databases by using backup files. You can create a backup of your
  /// on-premises database, store it on Amazon Simple Storage Service (Amazon
  /// S3), and then restore the backup file onto a new Amazon RDS DB instance
  /// running MySQL. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/MySQL.Procedural.Importing.html">Importing
  /// Data into an Amazon RDS MySQL DB Instance</a> in the <i>Amazon RDS User
  /// Guide.</i>
  ///
  /// May throw [DBInstanceAlreadyExistsFault].
  /// May throw [InsufficientDBInstanceCapacityFault].
  /// May throw [DBParameterGroupNotFoundFault].
  /// May throw [DBSecurityGroupNotFoundFault].
  /// May throw [InstanceQuotaExceededFault].
  /// May throw [StorageQuotaExceededFault].
  /// May throw [DBSubnetGroupNotFoundFault].
  /// May throw [DBSubnetGroupDoesNotCoverEnoughAZs].
  /// May throw [InvalidSubnet].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [InvalidS3BucketFault].
  /// May throw [ProvisionedIopsNotAvailableInAZFault].
  /// May throw [OptionGroupNotFoundFault].
  /// May throw [StorageTypeNotSupportedFault].
  /// May throw [AuthorizationNotFoundFault].
  /// May throw [KMSKeyNotAccessibleFault].
  /// May throw [BackupPolicyNotFoundFault].
  ///
  /// Parameter [dBInstanceClass] :
  /// The compute and memory capacity of the DB instance, for example,
  /// <code>db.m4.large</code>. Not all DB instance classes are available in all
  /// AWS Regions, or for all database engines. For the full list of DB instance
  /// classes, and availability for your engine, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.DBInstanceClass.html">DB
  /// Instance Class</a> in the <i>Amazon RDS User Guide.</i>
  ///
  /// Importing from Amazon S3 isn't supported on the db.t2.micro DB instance
  /// class.
  ///
  /// Parameter [dBInstanceIdentifier] :
  /// The DB instance identifier. This parameter is stored as a lowercase
  /// string.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 1 to 63 letters, numbers, or hyphens.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Can't end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul>
  /// Example: <code>mydbinstance</code>
  ///
  /// Parameter [engine] :
  /// The name of the database engine to be used for this instance.
  ///
  /// Valid Values: <code>mysql</code>
  ///
  /// Parameter [s3BucketName] :
  /// The name of your Amazon S3 bucket that contains your database backup file.
  ///
  /// Parameter [s3IngestionRoleArn] :
  /// An AWS Identity and Access Management (IAM) role to allow Amazon RDS to
  /// access your Amazon S3 bucket.
  ///
  /// Parameter [sourceEngine] :
  /// The name of the engine of your source database.
  ///
  /// Valid Values: <code>mysql</code>
  ///
  /// Parameter [sourceEngineVersion] :
  /// The version of the database that the backup files were created from.
  ///
  /// MySQL versions 5.6 and 5.7 are supported.
  ///
  /// Example: <code>5.6.40</code>
  ///
  /// Parameter [allocatedStorage] :
  /// The amount of storage (in gigabytes) to allocate initially for the DB
  /// instance. Follow the allocation rules specified in
  /// <code>CreateDBInstance</code>.
  /// <note>
  /// Be sure to allocate enough memory for your new DB instance so that the
  /// restore operation can succeed. You can also allocate additional memory for
  /// future growth.
  /// </note>
  ///
  /// Parameter [autoMinorVersionUpgrade] :
  /// A value that indicates whether minor engine upgrades are applied
  /// automatically to the DB instance during the maintenance window. By
  /// default, minor engine upgrades are not applied automatically.
  ///
  /// Parameter [availabilityZone] :
  /// The Availability Zone that the DB instance is created in. For information
  /// about AWS Regions and Availability Zones, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html">Regions
  /// and Availability Zones</a> in the <i>Amazon RDS User Guide.</i>
  ///
  /// Default: A random, system-chosen Availability Zone in the endpoint's AWS
  /// Region.
  ///
  /// Example: <code>us-east-1d</code>
  ///
  /// Constraint: The <code>AvailabilityZone</code> parameter can't be specified
  /// if the DB instance is a Multi-AZ deployment. The specified Availability
  /// Zone must be in the same AWS Region as the current endpoint.
  ///
  /// Parameter [backupRetentionPeriod] :
  /// The number of days for which automated backups are retained. Setting this
  /// parameter to a positive number enables backups. For more information, see
  /// <code>CreateDBInstance</code>.
  ///
  /// Parameter [copyTagsToSnapshot] :
  /// A value that indicates whether to copy all tags from the DB instance to
  /// snapshots of the DB instance. By default, tags are not copied.
  ///
  /// Parameter [dBName] :
  /// The name of the database to create when the DB instance is created. Follow
  /// the naming rules specified in <code>CreateDBInstance</code>.
  ///
  /// Parameter [dBParameterGroupName] :
  /// The name of the DB parameter group to associate with this DB instance.
  ///
  /// If you do not specify a value for <code>DBParameterGroupName</code>, then
  /// the default <code>DBParameterGroup</code> for the specified DB engine is
  /// used.
  ///
  /// Parameter [dBSecurityGroups] :
  /// A list of DB security groups to associate with this DB instance.
  ///
  /// Default: The default DB security group for the database engine.
  ///
  /// Parameter [dBSubnetGroupName] :
  /// A DB subnet group to associate with this DB instance.
  ///
  /// Parameter [deletionProtection] :
  /// A value that indicates whether the DB instance has deletion protection
  /// enabled. The database can't be deleted when deletion protection is
  /// enabled. By default, deletion protection is disabled. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_DeleteInstance.html">
  /// Deleting a DB Instance</a>.
  ///
  /// Parameter [enableCloudwatchLogsExports] :
  /// The list of logs that the restored DB instance is to export to CloudWatch
  /// Logs. The values in the list depend on the DB engine being used. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_LogAccess.html#USER_LogAccess.Procedural.UploadtoCloudWatch">Publishing
  /// Database Logs to Amazon CloudWatch Logs</a> in the <i>Amazon RDS User
  /// Guide</i>.
  ///
  /// Parameter [enableIAMDatabaseAuthentication] :
  /// A value that indicates whether to enable mapping of AWS Identity and
  /// Access Management (IAM) accounts to database accounts. By default, mapping
  /// is disabled.
  ///
  /// For more information about IAM database authentication, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.IAMDBAuth.html">
  /// IAM Database Authentication for MySQL and PostgreSQL</a> in the <i>Amazon
  /// RDS User Guide.</i>
  ///
  /// Parameter [enablePerformanceInsights] :
  /// A value that indicates whether to enable Performance Insights for the DB
  /// instance.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PerfInsights.html">Using
  /// Amazon Performance Insights</a> in the <i>Amazon Relational Database
  /// Service User Guide</i>.
  ///
  /// Parameter [engineVersion] :
  /// The version number of the database engine to use. Choose the latest minor
  /// version of your database engine. For information about engine versions,
  /// see <code>CreateDBInstance</code>, or call
  /// <code>DescribeDBEngineVersions</code>.
  ///
  /// Parameter [iops] :
  /// The amount of Provisioned IOPS (input/output operations per second) to
  /// allocate initially for the DB instance. For information about valid Iops
  /// values, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_Storage.html#USER_PIOPS">Amazon
  /// RDS Provisioned IOPS Storage to Improve Performance</a> in the <i>Amazon
  /// RDS User Guide.</i>
  ///
  /// Parameter [kmsKeyId] :
  /// The AWS KMS key identifier for an encrypted DB instance.
  ///
  /// The AWS KMS key identifier is the key ARN, key ID, alias ARN, or alias
  /// name for the AWS KMS customer master key (CMK). To use a CMK in a
  /// different AWS account, specify the key ARN or alias ARN.
  ///
  /// If the <code>StorageEncrypted</code> parameter is enabled, and you do not
  /// specify a value for the <code>KmsKeyId</code> parameter, then Amazon RDS
  /// will use your default CMK. There is a default CMK for your AWS account.
  /// Your AWS account has a different default CMK for each AWS Region.
  ///
  /// Parameter [licenseModel] :
  /// The license model for this DB instance. Use
  /// <code>general-public-license</code>.
  ///
  /// Parameter [masterUserPassword] :
  /// The password for the master user. The password can include any printable
  /// ASCII character except "/", """, or "@".
  ///
  /// Constraints: Must contain from 8 to 41 characters.
  ///
  /// Parameter [masterUsername] :
  /// The name for the master user.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be 1 to 16 letters or numbers.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Can't be a reserved word for the chosen database engine.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxAllocatedStorage] :
  /// The upper limit to which Amazon RDS can automatically scale the storage of
  /// the DB instance.
  ///
  /// Parameter [monitoringInterval] :
  /// The interval, in seconds, between points when Enhanced Monitoring metrics
  /// are collected for the DB instance. To disable collecting Enhanced
  /// Monitoring metrics, specify 0.
  ///
  /// If <code>MonitoringRoleArn</code> is specified, then you must also set
  /// <code>MonitoringInterval</code> to a value other than 0.
  ///
  /// Valid Values: 0, 1, 5, 10, 15, 30, 60
  ///
  /// Default: <code>0</code>
  ///
  /// Parameter [monitoringRoleArn] :
  /// The ARN for the IAM role that permits RDS to send enhanced monitoring
  /// metrics to Amazon CloudWatch Logs. For example,
  /// <code>arn:aws:iam:123456789012:role/emaccess</code>. For information on
  /// creating a monitoring role, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Monitoring.OS.html#USER_Monitoring.OS.Enabling">Setting
  /// Up and Enabling Enhanced Monitoring</a> in the <i>Amazon RDS User
  /// Guide.</i>
  ///
  /// If <code>MonitoringInterval</code> is set to a value other than 0, then
  /// you must supply a <code>MonitoringRoleArn</code> value.
  ///
  /// Parameter [multiAZ] :
  /// A value that indicates whether the DB instance is a Multi-AZ deployment.
  /// If the DB instance is a Multi-AZ deployment, you can't set the
  /// <code>AvailabilityZone</code> parameter.
  ///
  /// Parameter [optionGroupName] :
  /// The name of the option group to associate with this DB instance. If this
  /// argument is omitted, the default option group for the specified engine is
  /// used.
  ///
  /// Parameter [performanceInsightsKMSKeyId] :
  /// The AWS KMS key identifier for encryption of Performance Insights data.
  ///
  /// The AWS KMS key identifier is the key ARN, key ID, alias ARN, or alias
  /// name for the AWS KMS customer master key (CMK).
  ///
  /// If you do not specify a value for
  /// <code>PerformanceInsightsKMSKeyId</code>, then Amazon RDS uses your
  /// default CMK. There is a default CMK for your AWS account. Your AWS account
  /// has a different default CMK for each AWS Region.
  ///
  /// Parameter [performanceInsightsRetentionPeriod] :
  /// The amount of time, in days, to retain Performance Insights data. Valid
  /// values are 7 or 731 (2 years).
  ///
  /// Parameter [port] :
  /// The port number on which the database accepts connections.
  ///
  /// Type: Integer
  ///
  /// Valid Values: <code>1150</code>-<code>65535</code>
  ///
  /// Default: <code>3306</code>
  ///
  /// Parameter [preferredBackupWindow] :
  /// The time range each day during which automated backups are created if
  /// automated backups are enabled. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_WorkingWithAutomatedBackups.html#USER_WorkingWithAutomatedBackups.BackupWindow">The
  /// Backup Window</a> in the <i>Amazon RDS User Guide.</i>
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be in the format <code>hh24:mi-hh24:mi</code>.
  /// </li>
  /// <li>
  /// Must be in Universal Coordinated Time (UTC).
  /// </li>
  /// <li>
  /// Must not conflict with the preferred maintenance window.
  /// </li>
  /// <li>
  /// Must be at least 30 minutes.
  /// </li>
  /// </ul>
  ///
  /// Parameter [preferredMaintenanceWindow] :
  /// The time range each week during which system maintenance can occur, in
  /// Universal Coordinated Time (UTC). For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_UpgradeDBInstance.Maintenance.html#Concepts.DBMaintenance">Amazon
  /// RDS Maintenance Window</a> in the <i>Amazon RDS User Guide.</i>
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be in the format <code>ddd:hh24:mi-ddd:hh24:mi</code>.
  /// </li>
  /// <li>
  /// Valid Days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.
  /// </li>
  /// <li>
  /// Must be in Universal Coordinated Time (UTC).
  /// </li>
  /// <li>
  /// Must not conflict with the preferred backup window.
  /// </li>
  /// <li>
  /// Must be at least 30 minutes.
  /// </li>
  /// </ul>
  ///
  /// Parameter [processorFeatures] :
  /// The number of CPU cores and the number of threads per core for the DB
  /// instance class of the DB instance.
  ///
  /// Parameter [publiclyAccessible] :
  /// A value that indicates whether the DB instance is publicly accessible.
  ///
  /// When the DB instance is publicly accessible, its DNS endpoint resolves to
  /// the private IP address from within the DB instance's VPC, and to the
  /// public IP address from outside of the DB instance's VPC. Access to the DB
  /// instance is ultimately controlled by the security group it uses, and that
  /// public access is not permitted if the security group assigned to the DB
  /// instance doesn't permit it.
  ///
  /// When the DB instance isn't publicly accessible, it is an internal DB
  /// instance with a DNS name that resolves to a private IP address.
  ///
  /// For more information, see <a>CreateDBInstance</a>.
  ///
  /// Parameter [s3Prefix] :
  /// The prefix of your Amazon S3 bucket.
  ///
  /// Parameter [storageEncrypted] :
  /// A value that indicates whether the new DB instance is encrypted or not.
  ///
  /// Parameter [storageType] :
  /// Specifies the storage type to be associated with the DB instance.
  ///
  /// Valid values: <code>standard</code> | <code>gp2</code> | <code>io1</code>
  ///
  /// If you specify <code>io1</code>, you must also include a value for the
  /// <code>Iops</code> parameter.
  ///
  /// Default: <code>io1</code> if the <code>Iops</code> parameter is specified;
  /// otherwise <code>gp2</code>
  ///
  /// Parameter [tags] :
  /// A list of tags to associate with this DB instance. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.html">Tagging
  /// Amazon RDS Resources</a> in the <i>Amazon RDS User Guide.</i>
  ///
  /// Parameter [useDefaultProcessorFeatures] :
  /// A value that indicates whether the DB instance class of the DB instance
  /// uses its default processor features.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// A list of VPC security groups to associate with this DB instance.
  Future<RestoreDBInstanceFromS3Result> restoreDBInstanceFromS3({
    required String dBInstanceClass,
    required String dBInstanceIdentifier,
    required String engine,
    required String s3BucketName,
    required String s3IngestionRoleArn,
    required String sourceEngine,
    required String sourceEngineVersion,
    int? allocatedStorage,
    bool? autoMinorVersionUpgrade,
    String? availabilityZone,
    int? backupRetentionPeriod,
    bool? copyTagsToSnapshot,
    String? dBName,
    String? dBParameterGroupName,
    List<String>? dBSecurityGroups,
    String? dBSubnetGroupName,
    bool? deletionProtection,
    List<String>? enableCloudwatchLogsExports,
    bool? enableIAMDatabaseAuthentication,
    bool? enablePerformanceInsights,
    String? engineVersion,
    int? iops,
    String? kmsKeyId,
    String? licenseModel,
    String? masterUserPassword,
    String? masterUsername,
    int? maxAllocatedStorage,
    int? monitoringInterval,
    String? monitoringRoleArn,
    bool? multiAZ,
    String? optionGroupName,
    String? performanceInsightsKMSKeyId,
    int? performanceInsightsRetentionPeriod,
    int? port,
    String? preferredBackupWindow,
    String? preferredMaintenanceWindow,
    List<ProcessorFeature>? processorFeatures,
    bool? publiclyAccessible,
    String? s3Prefix,
    bool? storageEncrypted,
    String? storageType,
    List<Tag>? tags,
    bool? useDefaultProcessorFeatures,
    List<String>? vpcSecurityGroupIds,
  }) async {
    ArgumentError.checkNotNull(dBInstanceClass, 'dBInstanceClass');
    ArgumentError.checkNotNull(dBInstanceIdentifier, 'dBInstanceIdentifier');
    ArgumentError.checkNotNull(engine, 'engine');
    ArgumentError.checkNotNull(s3BucketName, 's3BucketName');
    ArgumentError.checkNotNull(s3IngestionRoleArn, 's3IngestionRoleArn');
    ArgumentError.checkNotNull(sourceEngine, 'sourceEngine');
    ArgumentError.checkNotNull(sourceEngineVersion, 'sourceEngineVersion');
    final $request = <String, dynamic>{};
    $request['DBInstanceClass'] = dBInstanceClass;
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    $request['Engine'] = engine;
    $request['S3BucketName'] = s3BucketName;
    $request['S3IngestionRoleArn'] = s3IngestionRoleArn;
    $request['SourceEngine'] = sourceEngine;
    $request['SourceEngineVersion'] = sourceEngineVersion;
    allocatedStorage?.also((arg) => $request['AllocatedStorage'] = arg);
    autoMinorVersionUpgrade
        ?.also((arg) => $request['AutoMinorVersionUpgrade'] = arg);
    availabilityZone?.also((arg) => $request['AvailabilityZone'] = arg);
    backupRetentionPeriod
        ?.also((arg) => $request['BackupRetentionPeriod'] = arg);
    copyTagsToSnapshot?.also((arg) => $request['CopyTagsToSnapshot'] = arg);
    dBName?.also((arg) => $request['DBName'] = arg);
    dBParameterGroupName?.also((arg) => $request['DBParameterGroupName'] = arg);
    dBSecurityGroups?.also((arg) => $request['DBSecurityGroups'] = arg);
    dBSubnetGroupName?.also((arg) => $request['DBSubnetGroupName'] = arg);
    deletionProtection?.also((arg) => $request['DeletionProtection'] = arg);
    enableCloudwatchLogsExports
        ?.also((arg) => $request['EnableCloudwatchLogsExports'] = arg);
    enableIAMDatabaseAuthentication
        ?.also((arg) => $request['EnableIAMDatabaseAuthentication'] = arg);
    enablePerformanceInsights
        ?.also((arg) => $request['EnablePerformanceInsights'] = arg);
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
    iops?.also((arg) => $request['Iops'] = arg);
    kmsKeyId?.also((arg) => $request['KmsKeyId'] = arg);
    licenseModel?.also((arg) => $request['LicenseModel'] = arg);
    masterUserPassword?.also((arg) => $request['MasterUserPassword'] = arg);
    masterUsername?.also((arg) => $request['MasterUsername'] = arg);
    maxAllocatedStorage?.also((arg) => $request['MaxAllocatedStorage'] = arg);
    monitoringInterval?.also((arg) => $request['MonitoringInterval'] = arg);
    monitoringRoleArn?.also((arg) => $request['MonitoringRoleArn'] = arg);
    multiAZ?.also((arg) => $request['MultiAZ'] = arg);
    optionGroupName?.also((arg) => $request['OptionGroupName'] = arg);
    performanceInsightsKMSKeyId
        ?.also((arg) => $request['PerformanceInsightsKMSKeyId'] = arg);
    performanceInsightsRetentionPeriod
        ?.also((arg) => $request['PerformanceInsightsRetentionPeriod'] = arg);
    port?.also((arg) => $request['Port'] = arg);
    preferredBackupWindow
        ?.also((arg) => $request['PreferredBackupWindow'] = arg);
    preferredMaintenanceWindow
        ?.also((arg) => $request['PreferredMaintenanceWindow'] = arg);
    processorFeatures?.also((arg) => $request['ProcessorFeatures'] = arg);
    publiclyAccessible?.also((arg) => $request['PubliclyAccessible'] = arg);
    s3Prefix?.also((arg) => $request['S3Prefix'] = arg);
    storageEncrypted?.also((arg) => $request['StorageEncrypted'] = arg);
    storageType?.also((arg) => $request['StorageType'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    useDefaultProcessorFeatures
        ?.also((arg) => $request['UseDefaultProcessorFeatures'] = arg);
    vpcSecurityGroupIds?.also((arg) => $request['VpcSecurityGroupIds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'RestoreDBInstanceFromS3',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RestoreDBInstanceFromS3Message'],
      shapes: shapes,
      resultWrapper: 'RestoreDBInstanceFromS3Result',
    );
    return RestoreDBInstanceFromS3Result.fromXml($result);
  }

  /// Restores a DB instance to an arbitrary point in time. You can restore to
  /// any point in time before the time identified by the LatestRestorableTime
  /// property. You can restore to a point up to the number of days specified by
  /// the BackupRetentionPeriod property.
  ///
  /// The target database is created with most of the original configuration,
  /// but in a system-selected Availability Zone, with the default security
  /// group, the default subnet group, and the default DB parameter group. By
  /// default, the new DB instance is created as a single-AZ deployment except
  /// when the instance is a SQL Server instance that has an option group that
  /// is associated with mirroring; in this case, the instance becomes a
  /// mirrored deployment and not a single-AZ deployment.
  /// <note>
  /// This command doesn't apply to Aurora MySQL and Aurora PostgreSQL. For
  /// Aurora, use <code>RestoreDBClusterToPointInTime</code>.
  /// </note>
  ///
  /// May throw [DBInstanceAlreadyExistsFault].
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [InstanceQuotaExceededFault].
  /// May throw [InsufficientDBInstanceCapacityFault].
  /// May throw [InvalidDBInstanceStateFault].
  /// May throw [PointInTimeRestoreNotEnabledFault].
  /// May throw [StorageQuotaExceededFault].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [InvalidRestoreFault].
  /// May throw [DBSubnetGroupNotFoundFault].
  /// May throw [DBSubnetGroupDoesNotCoverEnoughAZs].
  /// May throw [InvalidSubnet].
  /// May throw [ProvisionedIopsNotAvailableInAZFault].
  /// May throw [OptionGroupNotFoundFault].
  /// May throw [StorageTypeNotSupportedFault].
  /// May throw [AuthorizationNotFoundFault].
  /// May throw [KMSKeyNotAccessibleFault].
  /// May throw [DBSecurityGroupNotFoundFault].
  /// May throw [DomainNotFoundFault].
  /// May throw [BackupPolicyNotFoundFault].
  /// May throw [DBParameterGroupNotFoundFault].
  /// May throw [DBInstanceAutomatedBackupNotFoundFault].
  ///
  /// Parameter [targetDBInstanceIdentifier] :
  /// The name of the new DB instance to be created.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 1 to 63 letters, numbers, or hyphens
  /// </li>
  /// <li>
  /// First character must be a letter
  /// </li>
  /// <li>
  /// Can't end with a hyphen or contain two consecutive hyphens
  /// </li>
  /// </ul>
  ///
  /// Parameter [autoMinorVersionUpgrade] :
  /// A value that indicates whether minor version upgrades are applied
  /// automatically to the DB instance during the maintenance window.
  ///
  /// Parameter [availabilityZone] :
  /// The Availability Zone (AZ) where the DB instance will be created.
  ///
  /// Default: A random, system-chosen Availability Zone.
  ///
  /// Constraint: You can't specify the <code>AvailabilityZone</code> parameter
  /// if the DB instance is a Multi-AZ deployment.
  ///
  /// Example: <code>us-east-1a</code>
  ///
  /// Parameter [copyTagsToSnapshot] :
  /// A value that indicates whether to copy all tags from the restored DB
  /// instance to snapshots of the DB instance. By default, tags are not copied.
  ///
  /// Parameter [dBInstanceClass] :
  /// The compute and memory capacity of the Amazon RDS DB instance, for
  /// example, <code>db.m4.large</code>. Not all DB instance classes are
  /// available in all AWS Regions, or for all database engines. For the full
  /// list of DB instance classes, and availability for your engine, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.DBInstanceClass.html">DB
  /// Instance Class</a> in the <i>Amazon RDS User Guide.</i>
  ///
  /// Default: The same DBInstanceClass as the original DB instance.
  ///
  /// Parameter [dBName] :
  /// The database name for the restored DB instance.
  /// <note>
  /// This parameter isn't used for the MySQL or MariaDB engines.
  /// </note>
  ///
  /// Parameter [dBParameterGroupName] :
  /// The name of the DB parameter group to associate with this DB instance.
  ///
  /// If you do not specify a value for <code>DBParameterGroupName</code>, then
  /// the default <code>DBParameterGroup</code> for the specified DB engine is
  /// used.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If supplied, must match the name of an existing DBParameterGroup.
  /// </li>
  /// <li>
  /// Must be 1 to 255 letters, numbers, or hyphens.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Can't end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul>
  ///
  /// Parameter [dBSubnetGroupName] :
  /// The DB subnet group name to use for the new instance.
  ///
  /// Constraints: If supplied, must match the name of an existing
  /// DBSubnetGroup.
  ///
  /// Example: <code>mySubnetgroup</code>
  ///
  /// Parameter [deletionProtection] :
  /// A value that indicates whether the DB instance has deletion protection
  /// enabled. The database can't be deleted when deletion protection is
  /// enabled. By default, deletion protection is disabled. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_DeleteInstance.html">
  /// Deleting a DB Instance</a>.
  ///
  /// Parameter [domain] :
  /// Specify the Active Directory directory ID to restore the DB instance in.
  /// The domain must be created prior to this operation. Currently, only MySQL,
  /// Microsoft SQL Server, Oracle, and PostgreSQL DB instances can be created
  /// in an Active Directory Domain.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/kerberos-authentication.html">
  /// Kerberos Authentication</a> in the <i>Amazon RDS User Guide</i>.
  ///
  /// Parameter [domainIAMRoleName] :
  /// Specify the name of the IAM role to be used when making API calls to the
  /// Directory Service.
  ///
  /// Parameter [enableCloudwatchLogsExports] :
  /// The list of logs that the restored DB instance is to export to CloudWatch
  /// Logs. The values in the list depend on the DB engine being used. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_LogAccess.html#USER_LogAccess.Procedural.UploadtoCloudWatch">Publishing
  /// Database Logs to Amazon CloudWatch Logs</a> in the <i>Amazon RDS User
  /// Guide</i>.
  ///
  /// Parameter [enableCustomerOwnedIp] :
  /// A value that indicates whether to enable a customer-owned IP address
  /// (CoIP) for an RDS on Outposts DB instance.
  ///
  /// A <i>CoIP</i> provides local or external connectivity to resources in your
  /// Outpost subnets through your on-premises network. For some use cases, a
  /// CoIP can provide lower latency for connections to the DB instance from
  /// outside of its virtual private cloud (VPC) on your local network.
  ///
  /// For more information about RDS on Outposts, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/rds-on-outposts.html">Working
  /// with Amazon RDS on AWS Outposts</a> in the <i>Amazon RDS User Guide</i>.
  ///
  /// For more information about CoIPs, see <a
  /// href="https://docs.aws.amazon.com/outposts/latest/userguide/outposts-networking-components.html#ip-addressing">Customer-owned
  /// IP addresses</a> in the <i>AWS Outposts User Guide</i>.
  ///
  /// Parameter [enableIAMDatabaseAuthentication] :
  /// A value that indicates whether to enable mapping of AWS Identity and
  /// Access Management (IAM) accounts to database accounts. By default, mapping
  /// is disabled.
  ///
  /// For more information about IAM database authentication, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.IAMDBAuth.html">
  /// IAM Database Authentication for MySQL and PostgreSQL</a> in the <i>Amazon
  /// RDS User Guide.</i>
  ///
  /// Parameter [engine] :
  /// The database engine to use for the new instance.
  ///
  /// Default: The same as source
  ///
  /// Constraint: Must be compatible with the engine of the source
  ///
  /// Valid Values:
  ///
  /// <ul>
  /// <li>
  /// <code>mariadb</code>
  /// </li>
  /// <li>
  /// <code>mysql</code>
  /// </li>
  /// <li>
  /// <code>oracle-ee</code>
  /// </li>
  /// <li>
  /// <code>oracle-se2</code>
  /// </li>
  /// <li>
  /// <code>oracle-se1</code>
  /// </li>
  /// <li>
  /// <code>oracle-se</code>
  /// </li>
  /// <li>
  /// <code>postgres</code>
  /// </li>
  /// <li>
  /// <code>sqlserver-ee</code>
  /// </li>
  /// <li>
  /// <code>sqlserver-se</code>
  /// </li>
  /// <li>
  /// <code>sqlserver-ex</code>
  /// </li>
  /// <li>
  /// <code>sqlserver-web</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [iops] :
  /// The amount of Provisioned IOPS (input/output operations per second) to be
  /// initially allocated for the DB instance.
  ///
  /// Constraints: Must be an integer greater than 1000.
  ///
  /// <b>SQL Server</b>
  ///
  /// Setting the IOPS value for the SQL Server database engine isn't supported.
  ///
  /// Parameter [licenseModel] :
  /// License model information for the restored DB instance.
  ///
  /// Default: Same as source.
  ///
  /// Valid values: <code>license-included</code> |
  /// <code>bring-your-own-license</code> | <code>general-public-license</code>
  ///
  /// Parameter [maxAllocatedStorage] :
  /// The upper limit to which Amazon RDS can automatically scale the storage of
  /// the DB instance.
  ///
  /// Parameter [multiAZ] :
  /// A value that indicates whether the DB instance is a Multi-AZ deployment.
  ///
  /// Constraint: You can't specify the <code>AvailabilityZone</code> parameter
  /// if the DB instance is a Multi-AZ deployment.
  ///
  /// Parameter [optionGroupName] :
  /// The name of the option group to be used for the restored DB instance.
  ///
  /// Permanent options, such as the TDE option for Oracle Advanced Security
  /// TDE, can't be removed from an option group, and that option group can't be
  /// removed from a DB instance once it is associated with a DB instance
  ///
  /// Parameter [port] :
  /// The port number on which the database accepts connections.
  ///
  /// Constraints: Value must be <code>1150-65535</code>
  ///
  /// Default: The same port as the original DB instance.
  ///
  /// Parameter [processorFeatures] :
  /// The number of CPU cores and the number of threads per core for the DB
  /// instance class of the DB instance.
  ///
  /// Parameter [publiclyAccessible] :
  /// A value that indicates whether the DB instance is publicly accessible.
  ///
  /// When the DB instance is publicly accessible, its DNS endpoint resolves to
  /// the private IP address from within the DB instance's VPC, and to the
  /// public IP address from outside of the DB instance's VPC. Access to the DB
  /// instance is ultimately controlled by the security group it uses, and that
  /// public access is not permitted if the security group assigned to the DB
  /// instance doesn't permit it.
  ///
  /// When the DB instance isn't publicly accessible, it is an internal DB
  /// instance with a DNS name that resolves to a private IP address.
  ///
  /// For more information, see <a>CreateDBInstance</a>.
  ///
  /// Parameter [restoreTime] :
  /// The date and time to restore from.
  ///
  /// Valid Values: Value must be a time in Universal Coordinated Time (UTC)
  /// format
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be before the latest restorable time for the DB instance
  /// </li>
  /// <li>
  /// Can't be specified if the <code>UseLatestRestorableTime</code> parameter
  /// is enabled
  /// </li>
  /// </ul>
  /// Example: <code>2009-09-07T23:45:00Z</code>
  ///
  /// Parameter [sourceDBInstanceAutomatedBackupsArn] :
  /// The Amazon Resource Name (ARN) of the replicated automated backups from
  /// which to restore, for example,
  /// <code>arn:aws:rds:useast-1:123456789012:auto-backup:ab-L2IJCEXJP7XQ7HOJ4SIEXAMPLE</code>.
  ///
  /// Parameter [sourceDBInstanceIdentifier] :
  /// The identifier of the source DB instance from which to restore.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match the identifier of an existing DB instance.
  /// </li>
  /// </ul>
  ///
  /// Parameter [sourceDbiResourceId] :
  /// The resource ID of the source DB instance from which to restore.
  ///
  /// Parameter [storageType] :
  /// Specifies the storage type to be associated with the DB instance.
  ///
  /// Valid values: <code>standard | gp2 | io1</code>
  ///
  /// If you specify <code>io1</code>, you must also include a value for the
  /// <code>Iops</code> parameter.
  ///
  /// Default: <code>io1</code> if the <code>Iops</code> parameter is specified,
  /// otherwise <code>gp2</code>
  ///
  /// Parameter [tdeCredentialArn] :
  /// The ARN from the key store with which to associate the instance for TDE
  /// encryption.
  ///
  /// Parameter [tdeCredentialPassword] :
  /// The password for the given ARN from the key store in order to access the
  /// device.
  ///
  /// Parameter [useDefaultProcessorFeatures] :
  /// A value that indicates whether the DB instance class of the DB instance
  /// uses its default processor features.
  ///
  /// Parameter [useLatestRestorableTime] :
  /// A value that indicates whether the DB instance is restored from the latest
  /// backup time. By default, the DB instance isn't restored from the latest
  /// backup time.
  ///
  /// Constraints: Can't be specified if the <code>RestoreTime</code> parameter
  /// is provided.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// A list of EC2 VPC security groups to associate with this DB instance.
  ///
  /// Default: The default EC2 VPC security group for the DB subnet group's VPC.
  Future<RestoreDBInstanceToPointInTimeResult> restoreDBInstanceToPointInTime({
    required String targetDBInstanceIdentifier,
    bool? autoMinorVersionUpgrade,
    String? availabilityZone,
    bool? copyTagsToSnapshot,
    String? dBInstanceClass,
    String? dBName,
    String? dBParameterGroupName,
    String? dBSubnetGroupName,
    bool? deletionProtection,
    String? domain,
    String? domainIAMRoleName,
    List<String>? enableCloudwatchLogsExports,
    bool? enableCustomerOwnedIp,
    bool? enableIAMDatabaseAuthentication,
    String? engine,
    int? iops,
    String? licenseModel,
    int? maxAllocatedStorage,
    bool? multiAZ,
    String? optionGroupName,
    int? port,
    List<ProcessorFeature>? processorFeatures,
    bool? publiclyAccessible,
    DateTime? restoreTime,
    String? sourceDBInstanceAutomatedBackupsArn,
    String? sourceDBInstanceIdentifier,
    String? sourceDbiResourceId,
    String? storageType,
    List<Tag>? tags,
    String? tdeCredentialArn,
    String? tdeCredentialPassword,
    bool? useDefaultProcessorFeatures,
    bool? useLatestRestorableTime,
    List<String>? vpcSecurityGroupIds,
  }) async {
    ArgumentError.checkNotNull(
        targetDBInstanceIdentifier, 'targetDBInstanceIdentifier');
    final $request = <String, dynamic>{};
    $request['TargetDBInstanceIdentifier'] = targetDBInstanceIdentifier;
    autoMinorVersionUpgrade
        ?.also((arg) => $request['AutoMinorVersionUpgrade'] = arg);
    availabilityZone?.also((arg) => $request['AvailabilityZone'] = arg);
    copyTagsToSnapshot?.also((arg) => $request['CopyTagsToSnapshot'] = arg);
    dBInstanceClass?.also((arg) => $request['DBInstanceClass'] = arg);
    dBName?.also((arg) => $request['DBName'] = arg);
    dBParameterGroupName?.also((arg) => $request['DBParameterGroupName'] = arg);
    dBSubnetGroupName?.also((arg) => $request['DBSubnetGroupName'] = arg);
    deletionProtection?.also((arg) => $request['DeletionProtection'] = arg);
    domain?.also((arg) => $request['Domain'] = arg);
    domainIAMRoleName?.also((arg) => $request['DomainIAMRoleName'] = arg);
    enableCloudwatchLogsExports
        ?.also((arg) => $request['EnableCloudwatchLogsExports'] = arg);
    enableCustomerOwnedIp
        ?.also((arg) => $request['EnableCustomerOwnedIp'] = arg);
    enableIAMDatabaseAuthentication
        ?.also((arg) => $request['EnableIAMDatabaseAuthentication'] = arg);
    engine?.also((arg) => $request['Engine'] = arg);
    iops?.also((arg) => $request['Iops'] = arg);
    licenseModel?.also((arg) => $request['LicenseModel'] = arg);
    maxAllocatedStorage?.also((arg) => $request['MaxAllocatedStorage'] = arg);
    multiAZ?.also((arg) => $request['MultiAZ'] = arg);
    optionGroupName?.also((arg) => $request['OptionGroupName'] = arg);
    port?.also((arg) => $request['Port'] = arg);
    processorFeatures?.also((arg) => $request['ProcessorFeatures'] = arg);
    publiclyAccessible?.also((arg) => $request['PubliclyAccessible'] = arg);
    restoreTime?.also((arg) => $request['RestoreTime'] = _s.iso8601ToJson(arg));
    sourceDBInstanceAutomatedBackupsArn
        ?.also((arg) => $request['SourceDBInstanceAutomatedBackupsArn'] = arg);
    sourceDBInstanceIdentifier
        ?.also((arg) => $request['SourceDBInstanceIdentifier'] = arg);
    sourceDbiResourceId?.also((arg) => $request['SourceDbiResourceId'] = arg);
    storageType?.also((arg) => $request['StorageType'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    tdeCredentialArn?.also((arg) => $request['TdeCredentialArn'] = arg);
    tdeCredentialPassword
        ?.also((arg) => $request['TdeCredentialPassword'] = arg);
    useDefaultProcessorFeatures
        ?.also((arg) => $request['UseDefaultProcessorFeatures'] = arg);
    useLatestRestorableTime
        ?.also((arg) => $request['UseLatestRestorableTime'] = arg);
    vpcSecurityGroupIds?.also((arg) => $request['VpcSecurityGroupIds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'RestoreDBInstanceToPointInTime',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RestoreDBInstanceToPointInTimeMessage'],
      shapes: shapes,
      resultWrapper: 'RestoreDBInstanceToPointInTimeResult',
    );
    return RestoreDBInstanceToPointInTimeResult.fromXml($result);
  }

  /// Revokes ingress from a DBSecurityGroup for previously authorized IP ranges
  /// or EC2 or VPC Security Groups. Required parameters for this API are one of
  /// CIDRIP, EC2SecurityGroupId for VPC, or (EC2SecurityGroupOwnerId and either
  /// EC2SecurityGroupName or EC2SecurityGroupId).
  ///
  /// May throw [DBSecurityGroupNotFoundFault].
  /// May throw [AuthorizationNotFoundFault].
  /// May throw [InvalidDBSecurityGroupStateFault].
  ///
  /// Parameter [dBSecurityGroupName] :
  /// The name of the DB security group to revoke ingress from.
  ///
  /// Parameter [cidrip] :
  /// The IP range to revoke access from. Must be a valid CIDR range. If
  /// <code>CIDRIP</code> is specified, <code>EC2SecurityGroupName</code>,
  /// <code>EC2SecurityGroupId</code> and <code>EC2SecurityGroupOwnerId</code>
  /// can't be provided.
  ///
  /// Parameter [eC2SecurityGroupId] :
  /// The id of the EC2 security group to revoke access from. For VPC DB
  /// security groups, <code>EC2SecurityGroupId</code> must be provided.
  /// Otherwise, EC2SecurityGroupOwnerId and either
  /// <code>EC2SecurityGroupName</code> or <code>EC2SecurityGroupId</code> must
  /// be provided.
  ///
  /// Parameter [eC2SecurityGroupName] :
  /// The name of the EC2 security group to revoke access from. For VPC DB
  /// security groups, <code>EC2SecurityGroupId</code> must be provided.
  /// Otherwise, EC2SecurityGroupOwnerId and either
  /// <code>EC2SecurityGroupName</code> or <code>EC2SecurityGroupId</code> must
  /// be provided.
  ///
  /// Parameter [eC2SecurityGroupOwnerId] :
  /// The AWS account number of the owner of the EC2 security group specified in
  /// the <code>EC2SecurityGroupName</code> parameter. The AWS access key ID
  /// isn't an acceptable value. For VPC DB security groups,
  /// <code>EC2SecurityGroupId</code> must be provided. Otherwise,
  /// EC2SecurityGroupOwnerId and either <code>EC2SecurityGroupName</code> or
  /// <code>EC2SecurityGroupId</code> must be provided.
  Future<RevokeDBSecurityGroupIngressResult> revokeDBSecurityGroupIngress({
    required String dBSecurityGroupName,
    String? cidrip,
    String? eC2SecurityGroupId,
    String? eC2SecurityGroupName,
    String? eC2SecurityGroupOwnerId,
  }) async {
    ArgumentError.checkNotNull(dBSecurityGroupName, 'dBSecurityGroupName');
    final $request = <String, dynamic>{};
    $request['DBSecurityGroupName'] = dBSecurityGroupName;
    cidrip?.also((arg) => $request['CIDRIP'] = arg);
    eC2SecurityGroupId?.also((arg) => $request['EC2SecurityGroupId'] = arg);
    eC2SecurityGroupName?.also((arg) => $request['EC2SecurityGroupName'] = arg);
    eC2SecurityGroupOwnerId
        ?.also((arg) => $request['EC2SecurityGroupOwnerId'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'RevokeDBSecurityGroupIngress',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RevokeDBSecurityGroupIngressMessage'],
      shapes: shapes,
      resultWrapper: 'RevokeDBSecurityGroupIngressResult',
    );
    return RevokeDBSecurityGroupIngressResult.fromXml($result);
  }

  /// Starts a database activity stream to monitor activity on the database. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/DBActivityStreams.html">Database
  /// Activity Streams</a> in the <i>Amazon Aurora User Guide</i>.
  ///
  /// May throw [InvalidDBInstanceStateFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [ResourceNotFoundFault].
  /// May throw [DBClusterNotFoundFault].
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [KMSKeyNotAccessibleFault].
  ///
  /// Parameter [kmsKeyId] :
  /// The AWS KMS key identifier for encrypting messages in the database
  /// activity stream. The AWS KMS key identifier is the key ARN, key ID, alias
  /// ARN, or alias name for the AWS KMS customer master key (CMK).
  ///
  /// Parameter [mode] :
  /// Specifies the mode of the database activity stream. Database events such
  /// as a change or access generate an activity stream event. The database
  /// session can handle these events either synchronously or asynchronously.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the DB cluster, for example,
  /// <code>arn:aws:rds:us-east-1:12345667890:cluster:das-cluster</code>.
  ///
  /// Parameter [applyImmediately] :
  /// Specifies whether or not the database activity stream is to start as soon
  /// as possible, regardless of the maintenance window for the database.
  Future<StartActivityStreamResponse> startActivityStream({
    required String kmsKeyId,
    required ActivityStreamMode mode,
    required String resourceArn,
    bool? applyImmediately,
  }) async {
    ArgumentError.checkNotNull(kmsKeyId, 'kmsKeyId');
    ArgumentError.checkNotNull(mode, 'mode');
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final $request = <String, dynamic>{};
    $request['KmsKeyId'] = kmsKeyId;
    $request['Mode'] = mode.toValue();
    $request['ResourceArn'] = resourceArn;
    applyImmediately?.also((arg) => $request['ApplyImmediately'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'StartActivityStream',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['StartActivityStreamRequest'],
      shapes: shapes,
      resultWrapper: 'StartActivityStreamResult',
    );
    return StartActivityStreamResponse.fromXml($result);
  }

  /// Starts an Amazon Aurora DB cluster that was stopped using the AWS console,
  /// the stop-db-cluster AWS CLI command, or the StopDBCluster action.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-cluster-stop-start.html">
  /// Stopping and Starting an Aurora Cluster</a> in the <i>Amazon Aurora User
  /// Guide.</i>
  /// <note>
  /// This action only applies to Aurora DB clusters.
  /// </note>
  ///
  /// May throw [DBClusterNotFoundFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [InvalidDBInstanceStateFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The DB cluster identifier of the Amazon Aurora DB cluster to be started.
  /// This parameter is stored as a lowercase string.
  Future<StartDBClusterResult> startDBCluster({
    required String dBClusterIdentifier,
  }) async {
    ArgumentError.checkNotNull(dBClusterIdentifier, 'dBClusterIdentifier');
    final $request = <String, dynamic>{};
    $request['DBClusterIdentifier'] = dBClusterIdentifier;
    final $result = await _protocol.send(
      $request,
      action: 'StartDBCluster',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['StartDBClusterMessage'],
      shapes: shapes,
      resultWrapper: 'StartDBClusterResult',
    );
    return StartDBClusterResult.fromXml($result);
  }

  /// Starts an Amazon RDS DB instance that was stopped using the AWS console,
  /// the stop-db-instance AWS CLI command, or the StopDBInstance action.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_StartInstance.html">
  /// Starting an Amazon RDS DB instance That Was Previously Stopped</a> in the
  /// <i>Amazon RDS User Guide.</i>
  /// <note>
  /// This command doesn't apply to Aurora MySQL and Aurora PostgreSQL. For
  /// Aurora DB clusters, use <code>StartDBCluster</code> instead.
  /// </note>
  ///
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [InvalidDBInstanceStateFault].
  /// May throw [InsufficientDBInstanceCapacityFault].
  /// May throw [DBSubnetGroupNotFoundFault].
  /// May throw [DBSubnetGroupDoesNotCoverEnoughAZs].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [InvalidSubnet].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [DBClusterNotFoundFault].
  /// May throw [AuthorizationNotFoundFault].
  /// May throw [KMSKeyNotAccessibleFault].
  ///
  /// Parameter [dBInstanceIdentifier] :
  /// The user-supplied instance identifier.
  Future<StartDBInstanceResult> startDBInstance({
    required String dBInstanceIdentifier,
  }) async {
    ArgumentError.checkNotNull(dBInstanceIdentifier, 'dBInstanceIdentifier');
    final $request = <String, dynamic>{};
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    final $result = await _protocol.send(
      $request,
      action: 'StartDBInstance',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['StartDBInstanceMessage'],
      shapes: shapes,
      resultWrapper: 'StartDBInstanceResult',
    );
    return StartDBInstanceResult.fromXml($result);
  }

  /// Enables replication of automated backups to a different AWS Region.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ReplicateBackups.html">
  /// Replicating Automated Backups to Another AWS Region</a> in the <i>Amazon
  /// RDS User Guide.</i>
  ///
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [InvalidDBInstanceStateFault].
  /// May throw [KMSKeyNotAccessibleFault].
  /// May throw [DBInstanceAutomatedBackupQuotaExceededFault].
  /// May throw [StorageTypeNotSupportedFault].
  ///
  /// Parameter [sourceDBInstanceArn] :
  /// The Amazon Resource Name (ARN) of the source DB instance for the
  /// replicated automated backups, for example,
  /// <code>arn:aws:rds:us-west-2:123456789012:db:mydatabase</code>.
  ///
  /// Parameter [backupRetentionPeriod] :
  /// The retention period for the replicated automated backups.
  ///
  /// Parameter [kmsKeyId] :
  /// The AWS KMS key identifier for encryption of the replicated automated
  /// backups. The KMS key ID is the Amazon Resource Name (ARN) for the KMS
  /// encryption key in the destination AWS Region, for example,
  /// <code>arn:aws:kms:us-east-1:123456789012:key/AKIAIOSFODNN7EXAMPLE</code>.
  ///
  /// Parameter [preSignedUrl] :
  /// A URL that contains a Signature Version 4 signed request for the
  /// StartDBInstanceAutomatedBackupsReplication action to be called in the AWS
  /// Region of the source DB instance. The presigned URL must be a valid
  /// request for the StartDBInstanceAutomatedBackupsReplication API action that
  /// can be executed in the AWS Region that contains the source DB instance.
  Future<StartDBInstanceAutomatedBackupsReplicationResult>
      startDBInstanceAutomatedBackupsReplication({
    required String sourceDBInstanceArn,
    int? backupRetentionPeriod,
    String? kmsKeyId,
    String? preSignedUrl,
  }) async {
    ArgumentError.checkNotNull(sourceDBInstanceArn, 'sourceDBInstanceArn');
    final $request = <String, dynamic>{};
    $request['SourceDBInstanceArn'] = sourceDBInstanceArn;
    backupRetentionPeriod
        ?.also((arg) => $request['BackupRetentionPeriod'] = arg);
    kmsKeyId?.also((arg) => $request['KmsKeyId'] = arg);
    preSignedUrl?.also((arg) => $request['PreSignedUrl'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'StartDBInstanceAutomatedBackupsReplication',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['StartDBInstanceAutomatedBackupsReplicationMessage'],
      shapes: shapes,
      resultWrapper: 'StartDBInstanceAutomatedBackupsReplicationResult',
    );
    return StartDBInstanceAutomatedBackupsReplicationResult.fromXml($result);
  }

  /// Starts an export of a snapshot to Amazon S3. The provided IAM role must
  /// have access to the S3 bucket.
  ///
  /// May throw [DBSnapshotNotFoundFault].
  /// May throw [DBClusterSnapshotNotFoundFault].
  /// May throw [ExportTaskAlreadyExistsFault].
  /// May throw [InvalidS3BucketFault].
  /// May throw [IamRoleNotFoundFault].
  /// May throw [IamRoleMissingPermissionsFault].
  /// May throw [InvalidExportOnlyFault].
  /// May throw [KMSKeyNotAccessibleFault].
  /// May throw [InvalidExportSourceStateFault].
  ///
  /// Parameter [exportTaskIdentifier] :
  /// A unique identifier for the snapshot export task. This ID isn't an
  /// identifier for the Amazon S3 bucket where the snapshot is to be exported
  /// to.
  ///
  /// Parameter [iamRoleArn] :
  /// The name of the IAM role to use for writing to the Amazon S3 bucket when
  /// exporting a snapshot.
  ///
  /// Parameter [kmsKeyId] :
  /// The ID of the AWS KMS customer master key (CMK) to use to encrypt the
  /// snapshot exported to Amazon S3. The AWS KMS key identifier is the key ARN,
  /// key ID, alias ARN, or alias name for the AWS KMS customer master key
  /// (CMK). The caller of this operation must be authorized to execute the
  /// following operations. These can be set in the AWS KMS key policy:
  ///
  /// <ul>
  /// <li>
  /// GrantOperation.Encrypt
  /// </li>
  /// <li>
  /// GrantOperation.Decrypt
  /// </li>
  /// <li>
  /// GrantOperation.GenerateDataKey
  /// </li>
  /// <li>
  /// GrantOperation.GenerateDataKeyWithoutPlaintext
  /// </li>
  /// <li>
  /// GrantOperation.ReEncryptFrom
  /// </li>
  /// <li>
  /// GrantOperation.ReEncryptTo
  /// </li>
  /// <li>
  /// GrantOperation.CreateGrant
  /// </li>
  /// <li>
  /// GrantOperation.DescribeKey
  /// </li>
  /// <li>
  /// GrantOperation.RetireGrant
  /// </li>
  /// </ul>
  ///
  /// Parameter [s3BucketName] :
  /// The name of the Amazon S3 bucket to export the snapshot to.
  ///
  /// Parameter [sourceArn] :
  /// The Amazon Resource Name (ARN) of the snapshot to export to Amazon S3.
  ///
  /// Parameter [exportOnly] :
  /// The data to be exported from the snapshot. If this parameter is not
  /// provided, all the snapshot data is exported. Valid values are the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// <code>database</code> - Export all the data from a specified database.
  /// </li>
  /// <li>
  /// <code>database.table</code> <i>table-name</i> - Export a table of the
  /// snapshot. This format is valid only for RDS for MySQL, RDS for MariaDB,
  /// and Aurora MySQL.
  /// </li>
  /// <li>
  /// <code>database.schema</code> <i>schema-name</i> - Export a database schema
  /// of the snapshot. This format is valid only for RDS for PostgreSQL and
  /// Aurora PostgreSQL.
  /// </li>
  /// <li>
  /// <code>database.schema.table</code> <i>table-name</i> - Export a table of
  /// the database schema. This format is valid only for RDS for PostgreSQL and
  /// Aurora PostgreSQL.
  /// </li>
  /// </ul>
  ///
  /// Parameter [s3Prefix] :
  /// The Amazon S3 bucket prefix to use as the file name and path of the
  /// exported snapshot.
  Future<ExportTask> startExportTask({
    required String exportTaskIdentifier,
    required String iamRoleArn,
    required String kmsKeyId,
    required String s3BucketName,
    required String sourceArn,
    List<String>? exportOnly,
    String? s3Prefix,
  }) async {
    ArgumentError.checkNotNull(exportTaskIdentifier, 'exportTaskIdentifier');
    ArgumentError.checkNotNull(iamRoleArn, 'iamRoleArn');
    ArgumentError.checkNotNull(kmsKeyId, 'kmsKeyId');
    ArgumentError.checkNotNull(s3BucketName, 's3BucketName');
    ArgumentError.checkNotNull(sourceArn, 'sourceArn');
    final $request = <String, dynamic>{};
    $request['ExportTaskIdentifier'] = exportTaskIdentifier;
    $request['IamRoleArn'] = iamRoleArn;
    $request['KmsKeyId'] = kmsKeyId;
    $request['S3BucketName'] = s3BucketName;
    $request['SourceArn'] = sourceArn;
    exportOnly?.also((arg) => $request['ExportOnly'] = arg);
    s3Prefix?.also((arg) => $request['S3Prefix'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'StartExportTask',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['StartExportTaskMessage'],
      shapes: shapes,
      resultWrapper: 'StartExportTaskResult',
    );
    return ExportTask.fromXml($result);
  }

  /// Stops a database activity stream that was started using the AWS console,
  /// the <code>start-activity-stream</code> AWS CLI command, or the
  /// <code>StartActivityStream</code> action.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/DBActivityStreams.html">Database
  /// Activity Streams</a> in the <i>Amazon Aurora User Guide</i>.
  ///
  /// May throw [InvalidDBInstanceStateFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [ResourceNotFoundFault].
  /// May throw [DBClusterNotFoundFault].
  /// May throw [DBInstanceNotFoundFault].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the DB cluster for the database activity
  /// stream. For example,
  /// <code>arn:aws:rds:us-east-1:12345667890:cluster:das-cluster</code>.
  ///
  /// Parameter [applyImmediately] :
  /// Specifies whether or not the database activity stream is to stop as soon
  /// as possible, regardless of the maintenance window for the database.
  Future<StopActivityStreamResponse> stopActivityStream({
    required String resourceArn,
    bool? applyImmediately,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final $request = <String, dynamic>{};
    $request['ResourceArn'] = resourceArn;
    applyImmediately?.also((arg) => $request['ApplyImmediately'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'StopActivityStream',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['StopActivityStreamRequest'],
      shapes: shapes,
      resultWrapper: 'StopActivityStreamResult',
    );
    return StopActivityStreamResponse.fromXml($result);
  }

  /// Stops an Amazon Aurora DB cluster. When you stop a DB cluster, Aurora
  /// retains the DB cluster's metadata, including its endpoints and DB
  /// parameter groups. Aurora also retains the transaction logs so you can do a
  /// point-in-time restore if necessary.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-cluster-stop-start.html">
  /// Stopping and Starting an Aurora Cluster</a> in the <i>Amazon Aurora User
  /// Guide.</i>
  /// <note>
  /// This action only applies to Aurora DB clusters.
  /// </note>
  ///
  /// May throw [DBClusterNotFoundFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [InvalidDBInstanceStateFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The DB cluster identifier of the Amazon Aurora DB cluster to be stopped.
  /// This parameter is stored as a lowercase string.
  Future<StopDBClusterResult> stopDBCluster({
    required String dBClusterIdentifier,
  }) async {
    ArgumentError.checkNotNull(dBClusterIdentifier, 'dBClusterIdentifier');
    final $request = <String, dynamic>{};
    $request['DBClusterIdentifier'] = dBClusterIdentifier;
    final $result = await _protocol.send(
      $request,
      action: 'StopDBCluster',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['StopDBClusterMessage'],
      shapes: shapes,
      resultWrapper: 'StopDBClusterResult',
    );
    return StopDBClusterResult.fromXml($result);
  }

  /// Stops an Amazon RDS DB instance. When you stop a DB instance, Amazon RDS
  /// retains the DB instance's metadata, including its endpoint, DB parameter
  /// group, and option group membership. Amazon RDS also retains the
  /// transaction logs so you can do a point-in-time restore if necessary.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_StopInstance.html">
  /// Stopping an Amazon RDS DB Instance Temporarily</a> in the <i>Amazon RDS
  /// User Guide.</i>
  /// <note>
  /// This command doesn't apply to Aurora MySQL and Aurora PostgreSQL. For
  /// Aurora clusters, use <code>StopDBCluster</code> instead.
  /// </note>
  ///
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [InvalidDBInstanceStateFault].
  /// May throw [DBSnapshotAlreadyExistsFault].
  /// May throw [SnapshotQuotaExceededFault].
  /// May throw [InvalidDBClusterStateFault].
  ///
  /// Parameter [dBInstanceIdentifier] :
  /// The user-supplied instance identifier.
  ///
  /// Parameter [dBSnapshotIdentifier] :
  /// The user-supplied instance identifier of the DB Snapshot created
  /// immediately before the DB instance is stopped.
  Future<StopDBInstanceResult> stopDBInstance({
    required String dBInstanceIdentifier,
    String? dBSnapshotIdentifier,
  }) async {
    ArgumentError.checkNotNull(dBInstanceIdentifier, 'dBInstanceIdentifier');
    final $request = <String, dynamic>{};
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    dBSnapshotIdentifier?.also((arg) => $request['DBSnapshotIdentifier'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'StopDBInstance',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['StopDBInstanceMessage'],
      shapes: shapes,
      resultWrapper: 'StopDBInstanceResult',
    );
    return StopDBInstanceResult.fromXml($result);
  }

  /// Stops automated backup replication for a DB instance.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ReplicateBackups.html">
  /// Replicating Automated Backups to Another AWS Region</a> in the <i>Amazon
  /// RDS User Guide.</i>
  ///
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [InvalidDBInstanceStateFault].
  ///
  /// Parameter [sourceDBInstanceArn] :
  /// The Amazon Resource Name (ARN) of the source DB instance for which to stop
  /// replicating automated backups, for example,
  /// <code>arn:aws:rds:us-west-2:123456789012:db:mydatabase</code>.
  Future<StopDBInstanceAutomatedBackupsReplicationResult>
      stopDBInstanceAutomatedBackupsReplication({
    required String sourceDBInstanceArn,
  }) async {
    ArgumentError.checkNotNull(sourceDBInstanceArn, 'sourceDBInstanceArn');
    final $request = <String, dynamic>{};
    $request['SourceDBInstanceArn'] = sourceDBInstanceArn;
    final $result = await _protocol.send(
      $request,
      action: 'StopDBInstanceAutomatedBackupsReplication',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['StopDBInstanceAutomatedBackupsReplicationMessage'],
      shapes: shapes,
      resultWrapper: 'StopDBInstanceAutomatedBackupsReplicationResult',
    );
    return StopDBInstanceAutomatedBackupsReplicationResult.fromXml($result);
  }
}

/// Data returned by the <b>DescribeAccountAttributes</b> action.
class AccountAttributesMessage {
  /// A list of <code>AccountQuota</code> objects. Within this list, each quota
  /// has a name, a count of usage toward the quota maximum, and a maximum value
  /// for the quota.
  final List<AccountQuota>? accountQuotas;

  AccountAttributesMessage({
    this.accountQuotas,
  });
  factory AccountAttributesMessage.fromXml(_s.XmlElement elem) {
    return AccountAttributesMessage(
      accountQuotas: _s.extractXmlChild(elem, 'AccountQuotas')?.let((elem) =>
          elem
              .findElements('AccountQuota')
              .map((c) => AccountQuota.fromXml(c))
              .toList()),
    );
  }
}

/// Describes a quota for an AWS account.
///
/// The following are account quotas:
///
/// <ul>
/// <li>
/// <code>AllocatedStorage</code> - The total allocated storage per account, in
/// GiB. The used value is the total allocated storage in the account, in GiB.
/// </li>
/// <li>
/// <code>AuthorizationsPerDBSecurityGroup</code> - The number of ingress rules
/// per DB security group. The used value is the highest number of ingress rules
/// in a DB security group in the account. Other DB security groups in the
/// account might have a lower number of ingress rules.
/// </li>
/// <li>
/// <code>CustomEndpointsPerDBCluster</code> - The number of custom endpoints
/// per DB cluster. The used value is the highest number of custom endpoints in
/// a DB clusters in the account. Other DB clusters in the account might have a
/// lower number of custom endpoints.
/// </li>
/// <li>
/// <code>DBClusterParameterGroups</code> - The number of DB cluster parameter
/// groups per account, excluding default parameter groups. The used value is
/// the count of nondefault DB cluster parameter groups in the account.
/// </li>
/// <li>
/// <code>DBClusterRoles</code> - The number of associated AWS Identity and
/// Access Management (IAM) roles per DB cluster. The used value is the highest
/// number of associated IAM roles for a DB cluster in the account. Other DB
/// clusters in the account might have a lower number of associated IAM roles.
/// </li>
/// <li>
/// <code>DBClusters</code> - The number of DB clusters per account. The used
/// value is the count of DB clusters in the account.
/// </li>
/// <li>
/// <code>DBInstanceRoles</code> - The number of associated IAM roles per DB
/// instance. The used value is the highest number of associated IAM roles for a
/// DB instance in the account. Other DB instances in the account might have a
/// lower number of associated IAM roles.
/// </li>
/// <li>
/// <code>DBInstances</code> - The number of DB instances per account. The used
/// value is the count of the DB instances in the account.
///
/// Amazon RDS DB instances, Amazon Aurora DB instances, Amazon Neptune
/// instances, and Amazon DocumentDB instances apply to this quota.
/// </li>
/// <li>
/// <code>DBParameterGroups</code> - The number of DB parameter groups per
/// account, excluding default parameter groups. The used value is the count of
/// nondefault DB parameter groups in the account.
/// </li>
/// <li>
/// <code>DBSecurityGroups</code> - The number of DB security groups (not VPC
/// security groups) per account, excluding the default security group. The used
/// value is the count of nondefault DB security groups in the account.
/// </li>
/// <li>
/// <code>DBSubnetGroups</code> - The number of DB subnet groups per account.
/// The used value is the count of the DB subnet groups in the account.
/// </li>
/// <li>
/// <code>EventSubscriptions</code> - The number of event subscriptions per
/// account. The used value is the count of the event subscriptions in the
/// account.
/// </li>
/// <li>
/// <code>ManualClusterSnapshots</code> - The number of manual DB cluster
/// snapshots per account. The used value is the count of the manual DB cluster
/// snapshots in the account.
/// </li>
/// <li>
/// <code>ManualSnapshots</code> - The number of manual DB instance snapshots
/// per account. The used value is the count of the manual DB instance snapshots
/// in the account.
/// </li>
/// <li>
/// <code>OptionGroups</code> - The number of DB option groups per account,
/// excluding default option groups. The used value is the count of nondefault
/// DB option groups in the account.
/// </li>
/// <li>
/// <code>ReadReplicasPerMaster</code> - The number of read replicas per DB
/// instance. The used value is the highest number of read replicas for a DB
/// instance in the account. Other DB instances in the account might have a
/// lower number of read replicas.
/// </li>
/// <li>
/// <code>ReservedDBInstances</code> - The number of reserved DB instances per
/// account. The used value is the count of the active reserved DB instances in
/// the account.
/// </li>
/// <li>
/// <code>SubnetsPerDBSubnetGroup</code> - The number of subnets per DB subnet
/// group. The used value is highest number of subnets for a DB subnet group in
/// the account. Other DB subnet groups in the account might have a lower number
/// of subnets.
/// </li>
/// </ul>
/// For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_Limits.html">Quotas
/// for Amazon RDS</a> in the <i>Amazon RDS User Guide</i> and <a
/// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_Limits.html">Quotas
/// for Amazon Aurora</a> in the <i>Amazon Aurora User Guide</i>.
class AccountQuota {
  /// The name of the Amazon RDS quota for this AWS account.
  final String? accountQuotaName;

  /// The maximum allowed value for the quota.
  final int? max;

  /// The amount currently used toward the quota maximum.
  final int? used;

  AccountQuota({
    this.accountQuotaName,
    this.max,
    this.used,
  });
  factory AccountQuota.fromXml(_s.XmlElement elem) {
    return AccountQuota(
      accountQuotaName: _s.extractXmlStringValue(elem, 'AccountQuotaName'),
      max: _s.extractXmlIntValue(elem, 'Max'),
      used: _s.extractXmlIntValue(elem, 'Used'),
    );
  }
}

enum ActivityStreamMode {
  sync,
  async,
}

extension on ActivityStreamMode {
  String toValue() {
    switch (this) {
      case ActivityStreamMode.sync:
        return 'sync';
      case ActivityStreamMode.async:
        return 'async';
    }
  }
}

extension on String {
  ActivityStreamMode toActivityStreamMode() {
    switch (this) {
      case 'sync':
        return ActivityStreamMode.sync;
      case 'async':
        return ActivityStreamMode.async;
    }
    throw Exception('$this is not known in enum ActivityStreamMode');
  }
}

enum ActivityStreamStatus {
  stopped,
  starting,
  started,
  stopping,
}

extension on ActivityStreamStatus {
  String toValue() {
    switch (this) {
      case ActivityStreamStatus.stopped:
        return 'stopped';
      case ActivityStreamStatus.starting:
        return 'starting';
      case ActivityStreamStatus.started:
        return 'started';
      case ActivityStreamStatus.stopping:
        return 'stopping';
    }
  }
}

extension on String {
  ActivityStreamStatus toActivityStreamStatus() {
    switch (this) {
      case 'stopped':
        return ActivityStreamStatus.stopped;
      case 'starting':
        return ActivityStreamStatus.starting;
      case 'started':
        return ActivityStreamStatus.started;
      case 'stopping':
        return ActivityStreamStatus.stopping;
    }
    throw Exception('$this is not known in enum ActivityStreamStatus');
  }
}

class AddSourceIdentifierToSubscriptionResult {
  final EventSubscription? eventSubscription;

  AddSourceIdentifierToSubscriptionResult({
    this.eventSubscription,
  });
  factory AddSourceIdentifierToSubscriptionResult.fromXml(_s.XmlElement elem) {
    return AddSourceIdentifierToSubscriptionResult(
      eventSubscription: _s
          .extractXmlChild(elem, 'EventSubscription')
          ?.let((e) => EventSubscription.fromXml(e)),
    );
  }
}

enum ApplyMethod {
  immediate,
  pendingReboot,
}

extension on ApplyMethod {
  String toValue() {
    switch (this) {
      case ApplyMethod.immediate:
        return 'immediate';
      case ApplyMethod.pendingReboot:
        return 'pending-reboot';
    }
  }
}

extension on String {
  ApplyMethod toApplyMethod() {
    switch (this) {
      case 'immediate':
        return ApplyMethod.immediate;
      case 'pending-reboot':
        return ApplyMethod.pendingReboot;
    }
    throw Exception('$this is not known in enum ApplyMethod');
  }
}

class ApplyPendingMaintenanceActionResult {
  final ResourcePendingMaintenanceActions? resourcePendingMaintenanceActions;

  ApplyPendingMaintenanceActionResult({
    this.resourcePendingMaintenanceActions,
  });
  factory ApplyPendingMaintenanceActionResult.fromXml(_s.XmlElement elem) {
    return ApplyPendingMaintenanceActionResult(
      resourcePendingMaintenanceActions: _s
          .extractXmlChild(elem, 'ResourcePendingMaintenanceActions')
          ?.let((e) => ResourcePendingMaintenanceActions.fromXml(e)),
    );
  }
}

enum AuthScheme {
  secrets,
}

extension on AuthScheme {
  String toValue() {
    switch (this) {
      case AuthScheme.secrets:
        return 'SECRETS';
    }
  }
}

extension on String {
  AuthScheme toAuthScheme() {
    switch (this) {
      case 'SECRETS':
        return AuthScheme.secrets;
    }
    throw Exception('$this is not known in enum AuthScheme');
  }
}

class AuthorizeDBSecurityGroupIngressResult {
  final DBSecurityGroup? dBSecurityGroup;

  AuthorizeDBSecurityGroupIngressResult({
    this.dBSecurityGroup,
  });
  factory AuthorizeDBSecurityGroupIngressResult.fromXml(_s.XmlElement elem) {
    return AuthorizeDBSecurityGroupIngressResult(
      dBSecurityGroup: _s
          .extractXmlChild(elem, 'DBSecurityGroup')
          ?.let((e) => DBSecurityGroup.fromXml(e)),
    );
  }
}

/// Contains Availability Zone information.
///
/// This data type is used as an element in the
/// <code>OrderableDBInstanceOption</code> data type.
class AvailabilityZone {
  /// The name of the Availability Zone.
  final String? name;

  AvailabilityZone({
    this.name,
  });
  factory AvailabilityZone.fromXml(_s.XmlElement elem) {
    return AvailabilityZone(
      name: _s.extractXmlStringValue(elem, 'Name'),
    );
  }
}

/// Contains the available processor feature information for the DB instance
/// class of a DB instance.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.DBInstanceClass.html#USER_ConfigureProcessor">Configuring
/// the Processor of the DB Instance Class</a> in the <i>Amazon RDS User Guide.
/// </i>
class AvailableProcessorFeature {
  /// The allowed values for the processor feature of the DB instance class.
  final String? allowedValues;

  /// The default value for the processor feature of the DB instance class.
  final String? defaultValue;

  /// The name of the processor feature. Valid names are <code>coreCount</code>
  /// and <code>threadsPerCore</code>.
  final String? name;

  AvailableProcessorFeature({
    this.allowedValues,
    this.defaultValue,
    this.name,
  });
  factory AvailableProcessorFeature.fromXml(_s.XmlElement elem) {
    return AvailableProcessorFeature(
      allowedValues: _s.extractXmlStringValue(elem, 'AllowedValues'),
      defaultValue: _s.extractXmlStringValue(elem, 'DefaultValue'),
      name: _s.extractXmlStringValue(elem, 'Name'),
    );
  }
}

/// A CA certificate for an AWS account.
class Certificate {
  /// The Amazon Resource Name (ARN) for the certificate.
  final String? certificateArn;

  /// The unique key that identifies a certificate.
  final String? certificateIdentifier;

  /// The type of the certificate.
  final String? certificateType;

  /// Whether there is an override for the default certificate identifier.
  final bool? customerOverride;

  /// If there is an override for the default certificate identifier, when the
  /// override expires.
  final DateTime? customerOverrideValidTill;

  /// The thumbprint of the certificate.
  final String? thumbprint;

  /// The starting date from which the certificate is valid.
  final DateTime? validFrom;

  /// The final date that the certificate continues to be valid.
  final DateTime? validTill;

  Certificate({
    this.certificateArn,
    this.certificateIdentifier,
    this.certificateType,
    this.customerOverride,
    this.customerOverrideValidTill,
    this.thumbprint,
    this.validFrom,
    this.validTill,
  });
  factory Certificate.fromXml(_s.XmlElement elem) {
    return Certificate(
      certificateArn: _s.extractXmlStringValue(elem, 'CertificateArn'),
      certificateIdentifier:
          _s.extractXmlStringValue(elem, 'CertificateIdentifier'),
      certificateType: _s.extractXmlStringValue(elem, 'CertificateType'),
      customerOverride: _s.extractXmlBoolValue(elem, 'CustomerOverride'),
      customerOverrideValidTill:
          _s.extractXmlDateTimeValue(elem, 'CustomerOverrideValidTill'),
      thumbprint: _s.extractXmlStringValue(elem, 'Thumbprint'),
      validFrom: _s.extractXmlDateTimeValue(elem, 'ValidFrom'),
      validTill: _s.extractXmlDateTimeValue(elem, 'ValidTill'),
    );
  }
}

/// Data returned by the <b>DescribeCertificates</b> action.
class CertificateMessage {
  /// The list of <code>Certificate</code> objects for the AWS account.
  final List<Certificate>? certificates;

  /// An optional pagination token provided by a previous
  /// <code>DescribeCertificates</code> request. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by <code>MaxRecords</code> .
  final String? marker;

  CertificateMessage({
    this.certificates,
    this.marker,
  });
  factory CertificateMessage.fromXml(_s.XmlElement elem) {
    return CertificateMessage(
      certificates: _s.extractXmlChild(elem, 'Certificates')?.let((elem) => elem
          .findElements('Certificate')
          .map((c) => Certificate.fromXml(c))
          .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// This data type is used as a response element in the action
/// <code>DescribeDBEngineVersions</code>.
class CharacterSet {
  /// The description of the character set.
  final String? characterSetDescription;

  /// The name of the character set.
  final String? characterSetName;

  CharacterSet({
    this.characterSetDescription,
    this.characterSetName,
  });
  factory CharacterSet.fromXml(_s.XmlElement elem) {
    return CharacterSet(
      characterSetDescription:
          _s.extractXmlStringValue(elem, 'CharacterSetDescription'),
      characterSetName: _s.extractXmlStringValue(elem, 'CharacterSetName'),
    );
  }
}

/// The configuration setting for the log types to be enabled for export to
/// CloudWatch Logs for a specific DB instance or DB cluster.
///
/// The <code>EnableLogTypes</code> and <code>DisableLogTypes</code> arrays
/// determine which logs will be exported (or not exported) to CloudWatch Logs.
/// The values within these arrays depend on the DB engine being used.
///
/// For more information about exporting CloudWatch Logs for Amazon RDS DB
/// instances, see <a
/// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_LogAccess.html#USER_LogAccess.Procedural.UploadtoCloudWatch">Publishing
/// Database Logs to Amazon CloudWatch Logs </a> in the <i>Amazon RDS User
/// Guide</i>.
///
/// For more information about exporting CloudWatch Logs for Amazon Aurora DB
/// clusters, see <a
/// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_LogAccess.html#USER_LogAccess.Procedural.UploadtoCloudWatch">Publishing
/// Database Logs to Amazon CloudWatch Logs</a> in the <i>Amazon Aurora User
/// Guide</i>.
class CloudwatchLogsExportConfiguration {
  /// The list of log types to disable.
  final List<String>? disableLogTypes;

  /// The list of log types to enable.
  final List<String>? enableLogTypes;

  CloudwatchLogsExportConfiguration({
    this.disableLogTypes,
    this.enableLogTypes,
  });
  Map<String, dynamic> toJson() {
    final disableLogTypes = this.disableLogTypes;
    final enableLogTypes = this.enableLogTypes;
    return {
      if (disableLogTypes != null) 'DisableLogTypes': disableLogTypes,
      if (enableLogTypes != null) 'EnableLogTypes': enableLogTypes,
    };
  }
}

/// This data type is used as a response element in the
/// <code>ModifyDBCluster</code> operation and contains changes that will be
/// applied during the next maintenance window.
class ClusterPendingModifiedValues {
  /// The DBClusterIdentifier for the DB cluster.
  final String? dBClusterIdentifier;

  /// The database engine version.
  final String? engineVersion;

  /// Whether mapping of AWS Identity and Access Management (IAM) accounts to
  /// database accounts is enabled.
  final bool? iAMDatabaseAuthenticationEnabled;

  /// The master credentials for the DB cluster.
  final String? masterUserPassword;
  final PendingCloudwatchLogsExports? pendingCloudwatchLogsExports;

  ClusterPendingModifiedValues({
    this.dBClusterIdentifier,
    this.engineVersion,
    this.iAMDatabaseAuthenticationEnabled,
    this.masterUserPassword,
    this.pendingCloudwatchLogsExports,
  });
  factory ClusterPendingModifiedValues.fromXml(_s.XmlElement elem) {
    return ClusterPendingModifiedValues(
      dBClusterIdentifier:
          _s.extractXmlStringValue(elem, 'DBClusterIdentifier'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      iAMDatabaseAuthenticationEnabled:
          _s.extractXmlBoolValue(elem, 'IAMDatabaseAuthenticationEnabled'),
      masterUserPassword: _s.extractXmlStringValue(elem, 'MasterUserPassword'),
      pendingCloudwatchLogsExports: _s
          .extractXmlChild(elem, 'PendingCloudwatchLogsExports')
          ?.let((e) => PendingCloudwatchLogsExports.fromXml(e)),
    );
  }
}

/// Specifies the settings that control the size and behavior of the connection
/// pool associated with a <code>DBProxyTargetGroup</code>.
class ConnectionPoolConfiguration {
  /// The number of seconds for a proxy to wait for a connection to become
  /// available in the connection pool. Only applies when the proxy has opened its
  /// maximum number of connections and all connections are busy with client
  /// sessions.
  ///
  /// Default: 120
  ///
  /// Constraints: between 1 and 3600, or 0 representing unlimited
  final int? connectionBorrowTimeout;

  /// One or more SQL statements for the proxy to run when opening each new
  /// database connection. Typically used with <code>SET</code> statements to make
  /// sure that each connection has identical settings such as time zone and
  /// character set. For multiple statements, use semicolons as the separator. You
  /// can also include multiple variables in a single <code>SET</code> statement,
  /// such as <code>SET x=1, y=2</code>.
  ///
  /// Default: no initialization query
  final String? initQuery;

  /// The maximum size of the connection pool for each target in a target group.
  /// For Aurora MySQL, it is expressed as a percentage of the
  /// <code>max_connections</code> setting for the RDS DB instance or Aurora DB
  /// cluster used by the target group.
  ///
  /// Default: 100
  ///
  /// Constraints: between 1 and 100
  final int? maxConnectionsPercent;

  /// Controls how actively the proxy closes idle database connections in the
  /// connection pool. A high value enables the proxy to leave a high percentage
  /// of idle connections open. A low value causes the proxy to close idle client
  /// connections and return the underlying database connections to the connection
  /// pool. For Aurora MySQL, it is expressed as a percentage of the
  /// <code>max_connections</code> setting for the RDS DB instance or Aurora DB
  /// cluster used by the target group.
  ///
  /// Default: 50
  ///
  /// Constraints: between 0 and <code>MaxConnectionsPercent</code>
  final int? maxIdleConnectionsPercent;

  /// Each item in the list represents a class of SQL operations that normally
  /// cause all later statements in a session using a proxy to be pinned to the
  /// same underlying database connection. Including an item in the list exempts
  /// that class of SQL operations from the pinning behavior.
  ///
  /// Default: no session pinning filters
  final List<String>? sessionPinningFilters;

  ConnectionPoolConfiguration({
    this.connectionBorrowTimeout,
    this.initQuery,
    this.maxConnectionsPercent,
    this.maxIdleConnectionsPercent,
    this.sessionPinningFilters,
  });
  Map<String, dynamic> toJson() {
    final connectionBorrowTimeout = this.connectionBorrowTimeout;
    final initQuery = this.initQuery;
    final maxConnectionsPercent = this.maxConnectionsPercent;
    final maxIdleConnectionsPercent = this.maxIdleConnectionsPercent;
    final sessionPinningFilters = this.sessionPinningFilters;
    return {
      if (connectionBorrowTimeout != null)
        'ConnectionBorrowTimeout': connectionBorrowTimeout,
      if (initQuery != null) 'InitQuery': initQuery,
      if (maxConnectionsPercent != null)
        'MaxConnectionsPercent': maxConnectionsPercent,
      if (maxIdleConnectionsPercent != null)
        'MaxIdleConnectionsPercent': maxIdleConnectionsPercent,
      if (sessionPinningFilters != null)
        'SessionPinningFilters': sessionPinningFilters,
    };
  }
}

/// Displays the settings that control the size and behavior of the connection
/// pool associated with a <code>DBProxyTarget</code>.
class ConnectionPoolConfigurationInfo {
  /// The number of seconds for a proxy to wait for a connection to become
  /// available in the connection pool. Only applies when the proxy has opened its
  /// maximum number of connections and all connections are busy with client
  /// sessions.
  final int? connectionBorrowTimeout;

  /// One or more SQL statements for the proxy to run when opening each new
  /// database connection. Typically used with <code>SET</code> statements to make
  /// sure that each connection has identical settings such as time zone and
  /// character set. This setting is empty by default. For multiple statements,
  /// use semicolons as the separator. You can also include multiple variables in
  /// a single <code>SET</code> statement, such as <code>SET x=1, y=2</code>.
  final String? initQuery;

  /// The maximum size of the connection pool for each target in a target group.
  /// For Aurora MySQL, it is expressed as a percentage of the
  /// <code>max_connections</code> setting for the RDS DB instance or Aurora DB
  /// cluster used by the target group.
  final int? maxConnectionsPercent;

  /// Controls how actively the proxy closes idle database connections in the
  /// connection pool. A high value enables the proxy to leave a high percentage
  /// of idle connections open. A low value causes the proxy to close idle client
  /// connections and return the underlying database connections to the connection
  /// pool. For Aurora MySQL, it is expressed as a percentage of the
  /// <code>max_connections</code> setting for the RDS DB instance or Aurora DB
  /// cluster used by the target group.
  final int? maxIdleConnectionsPercent;

  /// Each item in the list represents a class of SQL operations that normally
  /// cause all later statements in a session using a proxy to be pinned to the
  /// same underlying database connection. Including an item in the list exempts
  /// that class of SQL operations from the pinning behavior. Currently, the only
  /// allowed value is <code>EXCLUDE_VARIABLE_SETS</code>.
  final List<String>? sessionPinningFilters;

  ConnectionPoolConfigurationInfo({
    this.connectionBorrowTimeout,
    this.initQuery,
    this.maxConnectionsPercent,
    this.maxIdleConnectionsPercent,
    this.sessionPinningFilters,
  });
  factory ConnectionPoolConfigurationInfo.fromXml(_s.XmlElement elem) {
    return ConnectionPoolConfigurationInfo(
      connectionBorrowTimeout:
          _s.extractXmlIntValue(elem, 'ConnectionBorrowTimeout'),
      initQuery: _s.extractXmlStringValue(elem, 'InitQuery'),
      maxConnectionsPercent:
          _s.extractXmlIntValue(elem, 'MaxConnectionsPercent'),
      maxIdleConnectionsPercent:
          _s.extractXmlIntValue(elem, 'MaxIdleConnectionsPercent'),
      sessionPinningFilters: _s
          .extractXmlChild(elem, 'SessionPinningFilters')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }
}

class CopyDBClusterParameterGroupResult {
  final DBClusterParameterGroup? dBClusterParameterGroup;

  CopyDBClusterParameterGroupResult({
    this.dBClusterParameterGroup,
  });
  factory CopyDBClusterParameterGroupResult.fromXml(_s.XmlElement elem) {
    return CopyDBClusterParameterGroupResult(
      dBClusterParameterGroup: _s
          .extractXmlChild(elem, 'DBClusterParameterGroup')
          ?.let((e) => DBClusterParameterGroup.fromXml(e)),
    );
  }
}

class CopyDBClusterSnapshotResult {
  final DBClusterSnapshot? dBClusterSnapshot;

  CopyDBClusterSnapshotResult({
    this.dBClusterSnapshot,
  });
  factory CopyDBClusterSnapshotResult.fromXml(_s.XmlElement elem) {
    return CopyDBClusterSnapshotResult(
      dBClusterSnapshot: _s
          .extractXmlChild(elem, 'DBClusterSnapshot')
          ?.let((e) => DBClusterSnapshot.fromXml(e)),
    );
  }
}

class CopyDBParameterGroupResult {
  final DBParameterGroup? dBParameterGroup;

  CopyDBParameterGroupResult({
    this.dBParameterGroup,
  });
  factory CopyDBParameterGroupResult.fromXml(_s.XmlElement elem) {
    return CopyDBParameterGroupResult(
      dBParameterGroup: _s
          .extractXmlChild(elem, 'DBParameterGroup')
          ?.let((e) => DBParameterGroup.fromXml(e)),
    );
  }
}

class CopyDBSnapshotResult {
  final DBSnapshot? dBSnapshot;

  CopyDBSnapshotResult({
    this.dBSnapshot,
  });
  factory CopyDBSnapshotResult.fromXml(_s.XmlElement elem) {
    return CopyDBSnapshotResult(
      dBSnapshot: _s
          .extractXmlChild(elem, 'DBSnapshot')
          ?.let((e) => DBSnapshot.fromXml(e)),
    );
  }
}

class CopyOptionGroupResult {
  final OptionGroup? optionGroup;

  CopyOptionGroupResult({
    this.optionGroup,
  });
  factory CopyOptionGroupResult.fromXml(_s.XmlElement elem) {
    return CopyOptionGroupResult(
      optionGroup: _s
          .extractXmlChild(elem, 'OptionGroup')
          ?.let((e) => OptionGroup.fromXml(e)),
    );
  }
}

class CreateCustomAvailabilityZoneResult {
  final CustomAvailabilityZone? customAvailabilityZone;

  CreateCustomAvailabilityZoneResult({
    this.customAvailabilityZone,
  });
  factory CreateCustomAvailabilityZoneResult.fromXml(_s.XmlElement elem) {
    return CreateCustomAvailabilityZoneResult(
      customAvailabilityZone: _s
          .extractXmlChild(elem, 'CustomAvailabilityZone')
          ?.let((e) => CustomAvailabilityZone.fromXml(e)),
    );
  }
}

class CreateDBClusterParameterGroupResult {
  final DBClusterParameterGroup? dBClusterParameterGroup;

  CreateDBClusterParameterGroupResult({
    this.dBClusterParameterGroup,
  });
  factory CreateDBClusterParameterGroupResult.fromXml(_s.XmlElement elem) {
    return CreateDBClusterParameterGroupResult(
      dBClusterParameterGroup: _s
          .extractXmlChild(elem, 'DBClusterParameterGroup')
          ?.let((e) => DBClusterParameterGroup.fromXml(e)),
    );
  }
}

class CreateDBClusterResult {
  final DBCluster? dBCluster;

  CreateDBClusterResult({
    this.dBCluster,
  });
  factory CreateDBClusterResult.fromXml(_s.XmlElement elem) {
    return CreateDBClusterResult(
      dBCluster: _s
          .extractXmlChild(elem, 'DBCluster')
          ?.let((e) => DBCluster.fromXml(e)),
    );
  }
}

class CreateDBClusterSnapshotResult {
  final DBClusterSnapshot? dBClusterSnapshot;

  CreateDBClusterSnapshotResult({
    this.dBClusterSnapshot,
  });
  factory CreateDBClusterSnapshotResult.fromXml(_s.XmlElement elem) {
    return CreateDBClusterSnapshotResult(
      dBClusterSnapshot: _s
          .extractXmlChild(elem, 'DBClusterSnapshot')
          ?.let((e) => DBClusterSnapshot.fromXml(e)),
    );
  }
}

class CreateDBInstanceReadReplicaResult {
  final DBInstance? dBInstance;

  CreateDBInstanceReadReplicaResult({
    this.dBInstance,
  });
  factory CreateDBInstanceReadReplicaResult.fromXml(_s.XmlElement elem) {
    return CreateDBInstanceReadReplicaResult(
      dBInstance: _s
          .extractXmlChild(elem, 'DBInstance')
          ?.let((e) => DBInstance.fromXml(e)),
    );
  }
}

class CreateDBInstanceResult {
  final DBInstance? dBInstance;

  CreateDBInstanceResult({
    this.dBInstance,
  });
  factory CreateDBInstanceResult.fromXml(_s.XmlElement elem) {
    return CreateDBInstanceResult(
      dBInstance: _s
          .extractXmlChild(elem, 'DBInstance')
          ?.let((e) => DBInstance.fromXml(e)),
    );
  }
}

class CreateDBParameterGroupResult {
  final DBParameterGroup? dBParameterGroup;

  CreateDBParameterGroupResult({
    this.dBParameterGroup,
  });
  factory CreateDBParameterGroupResult.fromXml(_s.XmlElement elem) {
    return CreateDBParameterGroupResult(
      dBParameterGroup: _s
          .extractXmlChild(elem, 'DBParameterGroup')
          ?.let((e) => DBParameterGroup.fromXml(e)),
    );
  }
}

class CreateDBProxyResponse {
  /// The <code>DBProxy</code> structure corresponding to the new proxy.
  final DBProxy? dBProxy;

  CreateDBProxyResponse({
    this.dBProxy,
  });
  factory CreateDBProxyResponse.fromXml(_s.XmlElement elem) {
    return CreateDBProxyResponse(
      dBProxy:
          _s.extractXmlChild(elem, 'DBProxy')?.let((e) => DBProxy.fromXml(e)),
    );
  }
}

class CreateDBSecurityGroupResult {
  final DBSecurityGroup? dBSecurityGroup;

  CreateDBSecurityGroupResult({
    this.dBSecurityGroup,
  });
  factory CreateDBSecurityGroupResult.fromXml(_s.XmlElement elem) {
    return CreateDBSecurityGroupResult(
      dBSecurityGroup: _s
          .extractXmlChild(elem, 'DBSecurityGroup')
          ?.let((e) => DBSecurityGroup.fromXml(e)),
    );
  }
}

class CreateDBSnapshotResult {
  final DBSnapshot? dBSnapshot;

  CreateDBSnapshotResult({
    this.dBSnapshot,
  });
  factory CreateDBSnapshotResult.fromXml(_s.XmlElement elem) {
    return CreateDBSnapshotResult(
      dBSnapshot: _s
          .extractXmlChild(elem, 'DBSnapshot')
          ?.let((e) => DBSnapshot.fromXml(e)),
    );
  }
}

class CreateDBSubnetGroupResult {
  final DBSubnetGroup? dBSubnetGroup;

  CreateDBSubnetGroupResult({
    this.dBSubnetGroup,
  });
  factory CreateDBSubnetGroupResult.fromXml(_s.XmlElement elem) {
    return CreateDBSubnetGroupResult(
      dBSubnetGroup: _s
          .extractXmlChild(elem, 'DBSubnetGroup')
          ?.let((e) => DBSubnetGroup.fromXml(e)),
    );
  }
}

class CreateEventSubscriptionResult {
  final EventSubscription? eventSubscription;

  CreateEventSubscriptionResult({
    this.eventSubscription,
  });
  factory CreateEventSubscriptionResult.fromXml(_s.XmlElement elem) {
    return CreateEventSubscriptionResult(
      eventSubscription: _s
          .extractXmlChild(elem, 'EventSubscription')
          ?.let((e) => EventSubscription.fromXml(e)),
    );
  }
}

class CreateGlobalClusterResult {
  final GlobalCluster? globalCluster;

  CreateGlobalClusterResult({
    this.globalCluster,
  });
  factory CreateGlobalClusterResult.fromXml(_s.XmlElement elem) {
    return CreateGlobalClusterResult(
      globalCluster: _s
          .extractXmlChild(elem, 'GlobalCluster')
          ?.let((e) => GlobalCluster.fromXml(e)),
    );
  }
}

class CreateOptionGroupResult {
  final OptionGroup? optionGroup;

  CreateOptionGroupResult({
    this.optionGroup,
  });
  factory CreateOptionGroupResult.fromXml(_s.XmlElement elem) {
    return CreateOptionGroupResult(
      optionGroup: _s
          .extractXmlChild(elem, 'OptionGroup')
          ?.let((e) => OptionGroup.fromXml(e)),
    );
  }
}

/// A custom Availability Zone (AZ) is an on-premises AZ that is integrated with
/// a VMware vSphere cluster.
///
/// For more information about RDS on VMware, see the <a
/// href="https://docs.aws.amazon.com/AmazonRDS/latest/RDSonVMwareUserGuide/rds-on-vmware.html">
/// RDS on VMware User Guide.</a>
class CustomAvailabilityZone {
  /// The identifier of the custom AZ.
  ///
  /// Amazon RDS generates a unique identifier when a custom AZ is created.
  final String? customAvailabilityZoneId;

  /// The name of the custom AZ.
  final String? customAvailabilityZoneName;

  /// The status of the custom AZ.
  final String? customAvailabilityZoneStatus;

  /// Information about the virtual private network (VPN) between the VMware
  /// vSphere cluster and the AWS website.
  final VpnDetails? vpnDetails;

  CustomAvailabilityZone({
    this.customAvailabilityZoneId,
    this.customAvailabilityZoneName,
    this.customAvailabilityZoneStatus,
    this.vpnDetails,
  });
  factory CustomAvailabilityZone.fromXml(_s.XmlElement elem) {
    return CustomAvailabilityZone(
      customAvailabilityZoneId:
          _s.extractXmlStringValue(elem, 'CustomAvailabilityZoneId'),
      customAvailabilityZoneName:
          _s.extractXmlStringValue(elem, 'CustomAvailabilityZoneName'),
      customAvailabilityZoneStatus:
          _s.extractXmlStringValue(elem, 'CustomAvailabilityZoneStatus'),
      vpnDetails: _s
          .extractXmlChild(elem, 'VpnDetails')
          ?.let((e) => VpnDetails.fromXml(e)),
    );
  }
}

class CustomAvailabilityZoneMessage {
  /// The list of <a>CustomAvailabilityZone</a> objects for the AWS account.
  final List<CustomAvailabilityZone>? customAvailabilityZones;

  /// An optional pagination token provided by a previous
  /// <code>DescribeCustomAvailabilityZones</code> request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by <code>MaxRecords</code>.
  final String? marker;

  CustomAvailabilityZoneMessage({
    this.customAvailabilityZones,
    this.marker,
  });
  factory CustomAvailabilityZoneMessage.fromXml(_s.XmlElement elem) {
    return CustomAvailabilityZoneMessage(
      customAvailabilityZones: _s
          .extractXmlChild(elem, 'CustomAvailabilityZones')
          ?.let((elem) => elem
              .findElements('CustomAvailabilityZone')
              .map((c) => CustomAvailabilityZone.fromXml(c))
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// Contains the details of an Amazon Aurora DB cluster.
///
/// This data type is used as a response element in the
/// <code>DescribeDBClusters</code>, <code>StopDBCluster</code>, and
/// <code>StartDBCluster</code> actions.
class DBCluster {
  /// The name of the Amazon Kinesis data stream used for the database activity
  /// stream.
  final String? activityStreamKinesisStreamName;

  /// The AWS KMS key identifier used for encrypting messages in the database
  /// activity stream.
  ///
  /// The AWS KMS key identifier is the key ARN, key ID, alias ARN, or alias name
  /// for the AWS KMS customer master key (CMK).
  final String? activityStreamKmsKeyId;

  /// The mode of the database activity stream. Database events such as a change
  /// or access generate an activity stream event. The database session can handle
  /// these events either synchronously or asynchronously.
  final ActivityStreamMode? activityStreamMode;

  /// The status of the database activity stream.
  final ActivityStreamStatus? activityStreamStatus;

  /// For all database engines except Amazon Aurora, <code>AllocatedStorage</code>
  /// specifies the allocated storage size in gibibytes (GiB). For Aurora,
  /// <code>AllocatedStorage</code> always returns 1, because Aurora DB cluster
  /// storage size isn't fixed, but instead automatically adjusts as needed.
  final int? allocatedStorage;

  /// Provides a list of the AWS Identity and Access Management (IAM) roles that
  /// are associated with the DB cluster. IAM roles that are associated with a DB
  /// cluster grant permission for the DB cluster to access other AWS services on
  /// your behalf.
  final List<DBClusterRole>? associatedRoles;

  /// Provides the list of Availability Zones (AZs) where instances in the DB
  /// cluster can be created.
  final List<String>? availabilityZones;

  /// The number of change records stored for Backtrack.
  final int? backtrackConsumedChangeRecords;

  /// The target backtrack window, in seconds. If this value is set to 0,
  /// backtracking is disabled for the DB cluster. Otherwise, backtracking is
  /// enabled.
  final int? backtrackWindow;

  /// Specifies the number of days for which automatic DB snapshots are retained.
  final int? backupRetentionPeriod;

  /// The current capacity of an Aurora Serverless DB cluster. The capacity is 0
  /// (zero) when the cluster is paused.
  ///
  /// For more information about Aurora Serverless, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.html">Using
  /// Amazon Aurora Serverless</a> in the <i>Amazon Aurora User Guide</i>.
  final int? capacity;

  /// If present, specifies the name of the character set that this cluster is
  /// associated with.
  final String? characterSetName;

  /// Identifies the clone group to which the DB cluster is associated.
  final String? cloneGroupId;

  /// Specifies the time when the DB cluster was created, in Universal Coordinated
  /// Time (UTC).
  final DateTime? clusterCreateTime;

  /// Specifies whether tags are copied from the DB cluster to snapshots of the DB
  /// cluster.
  final bool? copyTagsToSnapshot;

  /// Specifies whether the DB cluster is a clone of a DB cluster owned by a
  /// different AWS account.
  final bool? crossAccountClone;

  /// Identifies all custom endpoints associated with the cluster.
  final List<String>? customEndpoints;

  /// The Amazon Resource Name (ARN) for the DB cluster.
  final String? dBClusterArn;

  /// Contains a user-supplied DB cluster identifier. This identifier is the
  /// unique key that identifies a DB cluster.
  final String? dBClusterIdentifier;

  /// Provides the list of instances that make up the DB cluster.
  final List<DBClusterMember>? dBClusterMembers;

  /// Provides the list of option group memberships for this DB cluster.
  final List<DBClusterOptionGroupStatus>? dBClusterOptionGroupMemberships;

  /// Specifies the name of the DB cluster parameter group for the DB cluster.
  final String? dBClusterParameterGroup;

  /// Specifies information on the subnet group associated with the DB cluster,
  /// including the name, description, and subnets in the subnet group.
  final String? dBSubnetGroup;

  /// Contains the name of the initial database of this DB cluster that was
  /// provided at create time, if one was specified when the DB cluster was
  /// created. This same name is returned for the life of the DB cluster.
  final String? databaseName;

  /// The AWS Region-unique, immutable identifier for the DB cluster. This
  /// identifier is found in AWS CloudTrail log entries whenever the AWS KMS CMK
  /// for the DB cluster is accessed.
  final String? dbClusterResourceId;

  /// Indicates if the DB cluster has deletion protection enabled. The database
  /// can't be deleted when deletion protection is enabled.
  final bool? deletionProtection;

  /// The Active Directory Domain membership records associated with the DB
  /// cluster.
  final List<DomainMembership>? domainMemberships;

  /// The earliest time to which a DB cluster can be backtracked.
  final DateTime? earliestBacktrackTime;

  /// The earliest time to which a database can be restored with point-in-time
  /// restore.
  final DateTime? earliestRestorableTime;

  /// A list of log types that this DB cluster is configured to export to
  /// CloudWatch Logs.
  ///
  /// Log types vary by DB engine. For information about the log types for each DB
  /// engine, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_LogAccess.html">Amazon
  /// RDS Database Log Files</a> in the <i>Amazon Aurora User Guide.</i>
  final List<String>? enabledCloudwatchLogsExports;

  /// Specifies the connection endpoint for the primary instance of the DB
  /// cluster.
  final String? endpoint;

  /// The name of the database engine to be used for this DB cluster.
  final String? engine;

  /// The DB engine mode of the DB cluster, either <code>provisioned</code>,
  /// <code>serverless</code>, <code>parallelquery</code>, <code>global</code>, or
  /// <code>multimaster</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_CreateDBCluster.html">
  /// CreateDBCluster</a>.
  final String? engineMode;

  /// Indicates the database engine version.
  final String? engineVersion;

  /// Specifies whether you have requested to enable write forwarding for a
  /// secondary cluster in an Aurora global database. Because write forwarding
  /// takes time to enable, check the value of
  /// <code>GlobalWriteForwardingStatus</code> to confirm that the request has
  /// completed before using the write forwarding feature for this cluster.
  final bool? globalWriteForwardingRequested;

  /// Specifies whether a secondary cluster in an Aurora global database has write
  /// forwarding enabled, not enabled, or is in the process of enabling it.
  final WriteForwardingStatus? globalWriteForwardingStatus;

  /// Specifies the ID that Amazon Route 53 assigns when you create a hosted zone.
  final String? hostedZoneId;

  /// A value that indicates whether the HTTP endpoint for an Aurora Serverless DB
  /// cluster is enabled.
  ///
  /// When enabled, the HTTP endpoint provides a connectionless web service API
  /// for running SQL queries on the Aurora Serverless DB cluster. You can also
  /// query your database from inside the RDS console with the query editor.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/data-api.html">Using
  /// the Data API for Aurora Serverless</a> in the <i>Amazon Aurora User
  /// Guide</i>.
  final bool? httpEndpointEnabled;

  /// A value that indicates whether the mapping of AWS Identity and Access
  /// Management (IAM) accounts to database accounts is enabled.
  final bool? iAMDatabaseAuthenticationEnabled;

  /// If <code>StorageEncrypted</code> is enabled, the AWS KMS key identifier for
  /// the encrypted DB cluster.
  ///
  /// The AWS KMS key identifier is the key ARN, key ID, alias ARN, or alias name
  /// for the AWS KMS customer master key (CMK).
  final String? kmsKeyId;

  /// Specifies the latest time to which a database can be restored with
  /// point-in-time restore.
  final DateTime? latestRestorableTime;

  /// Contains the master username for the DB cluster.
  final String? masterUsername;

  /// Specifies whether the DB cluster has instances in multiple Availability
  /// Zones.
  final bool? multiAZ;

  /// Specifies that changes to the DB cluster are pending. This element is only
  /// included when changes are pending. Specific changes are identified by
  /// subelements.
  final ClusterPendingModifiedValues? pendingModifiedValues;

  /// Specifies the progress of the operation as a percentage.
  final String? percentProgress;

  /// Specifies the port that the database engine is listening on.
  final int? port;

  /// Specifies the daily time range during which automated backups are created if
  /// automated backups are enabled, as determined by the
  /// <code>BackupRetentionPeriod</code>.
  final String? preferredBackupWindow;

  /// Specifies the weekly time range during which system maintenance can occur,
  /// in Universal Coordinated Time (UTC).
  final String? preferredMaintenanceWindow;

  /// Contains one or more identifiers of the read replicas associated with this
  /// DB cluster.
  final List<String>? readReplicaIdentifiers;

  /// The reader endpoint for the DB cluster. The reader endpoint for a DB cluster
  /// load-balances connections across the Aurora Replicas that are available in a
  /// DB cluster. As clients request new connections to the reader endpoint,
  /// Aurora distributes the connection requests among the Aurora Replicas in the
  /// DB cluster. This functionality can help balance your read workload across
  /// multiple Aurora Replicas in your DB cluster.
  ///
  /// If a failover occurs, and the Aurora Replica that you are connected to is
  /// promoted to be the primary instance, your connection is dropped. To continue
  /// sending your read workload to other Aurora Replicas in the cluster, you can
  /// then reconnect to the reader endpoint.
  final String? readerEndpoint;

  /// Contains the identifier of the source DB cluster if this DB cluster is a
  /// read replica.
  final String? replicationSourceIdentifier;
  final ScalingConfigurationInfo? scalingConfigurationInfo;

  /// Specifies the current state of this DB cluster.
  final String? status;

  /// Specifies whether the DB cluster is encrypted.
  final bool? storageEncrypted;
  final List<Tag>? tagList;

  /// Provides a list of VPC security groups that the DB cluster belongs to.
  final List<VpcSecurityGroupMembership>? vpcSecurityGroups;

  DBCluster({
    this.activityStreamKinesisStreamName,
    this.activityStreamKmsKeyId,
    this.activityStreamMode,
    this.activityStreamStatus,
    this.allocatedStorage,
    this.associatedRoles,
    this.availabilityZones,
    this.backtrackConsumedChangeRecords,
    this.backtrackWindow,
    this.backupRetentionPeriod,
    this.capacity,
    this.characterSetName,
    this.cloneGroupId,
    this.clusterCreateTime,
    this.copyTagsToSnapshot,
    this.crossAccountClone,
    this.customEndpoints,
    this.dBClusterArn,
    this.dBClusterIdentifier,
    this.dBClusterMembers,
    this.dBClusterOptionGroupMemberships,
    this.dBClusterParameterGroup,
    this.dBSubnetGroup,
    this.databaseName,
    this.dbClusterResourceId,
    this.deletionProtection,
    this.domainMemberships,
    this.earliestBacktrackTime,
    this.earliestRestorableTime,
    this.enabledCloudwatchLogsExports,
    this.endpoint,
    this.engine,
    this.engineMode,
    this.engineVersion,
    this.globalWriteForwardingRequested,
    this.globalWriteForwardingStatus,
    this.hostedZoneId,
    this.httpEndpointEnabled,
    this.iAMDatabaseAuthenticationEnabled,
    this.kmsKeyId,
    this.latestRestorableTime,
    this.masterUsername,
    this.multiAZ,
    this.pendingModifiedValues,
    this.percentProgress,
    this.port,
    this.preferredBackupWindow,
    this.preferredMaintenanceWindow,
    this.readReplicaIdentifiers,
    this.readerEndpoint,
    this.replicationSourceIdentifier,
    this.scalingConfigurationInfo,
    this.status,
    this.storageEncrypted,
    this.tagList,
    this.vpcSecurityGroups,
  });
  factory DBCluster.fromXml(_s.XmlElement elem) {
    return DBCluster(
      activityStreamKinesisStreamName:
          _s.extractXmlStringValue(elem, 'ActivityStreamKinesisStreamName'),
      activityStreamKmsKeyId:
          _s.extractXmlStringValue(elem, 'ActivityStreamKmsKeyId'),
      activityStreamMode: _s
          .extractXmlStringValue(elem, 'ActivityStreamMode')
          ?.toActivityStreamMode(),
      activityStreamStatus: _s
          .extractXmlStringValue(elem, 'ActivityStreamStatus')
          ?.toActivityStreamStatus(),
      allocatedStorage: _s.extractXmlIntValue(elem, 'AllocatedStorage'),
      associatedRoles: _s.extractXmlChild(elem, 'AssociatedRoles')?.let(
          (elem) => elem
              .findElements('DBClusterRole')
              .map((c) => DBClusterRole.fromXml(c))
              .toList()),
      availabilityZones: _s.extractXmlChild(elem, 'AvailabilityZones')?.let(
          (elem) => _s.extractXmlStringListValues(elem, 'AvailabilityZone')),
      backtrackConsumedChangeRecords:
          _s.extractXmlIntValue(elem, 'BacktrackConsumedChangeRecords'),
      backtrackWindow: _s.extractXmlIntValue(elem, 'BacktrackWindow'),
      backupRetentionPeriod:
          _s.extractXmlIntValue(elem, 'BackupRetentionPeriod'),
      capacity: _s.extractXmlIntValue(elem, 'Capacity'),
      characterSetName: _s.extractXmlStringValue(elem, 'CharacterSetName'),
      cloneGroupId: _s.extractXmlStringValue(elem, 'CloneGroupId'),
      clusterCreateTime: _s.extractXmlDateTimeValue(elem, 'ClusterCreateTime'),
      copyTagsToSnapshot: _s.extractXmlBoolValue(elem, 'CopyTagsToSnapshot'),
      crossAccountClone: _s.extractXmlBoolValue(elem, 'CrossAccountClone'),
      customEndpoints: _s
          .extractXmlChild(elem, 'CustomEndpoints')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      dBClusterArn: _s.extractXmlStringValue(elem, 'DBClusterArn'),
      dBClusterIdentifier:
          _s.extractXmlStringValue(elem, 'DBClusterIdentifier'),
      dBClusterMembers: _s.extractXmlChild(elem, 'DBClusterMembers')?.let(
          (elem) => elem
              .findElements('DBClusterMember')
              .map((c) => DBClusterMember.fromXml(c))
              .toList()),
      dBClusterOptionGroupMemberships: _s
          .extractXmlChild(elem, 'DBClusterOptionGroupMemberships')
          ?.let((elem) => elem
              .findElements('DBClusterOptionGroup')
              .map((c) => DBClusterOptionGroupStatus.fromXml(c))
              .toList()),
      dBClusterParameterGroup:
          _s.extractXmlStringValue(elem, 'DBClusterParameterGroup'),
      dBSubnetGroup: _s.extractXmlStringValue(elem, 'DBSubnetGroup'),
      databaseName: _s.extractXmlStringValue(elem, 'DatabaseName'),
      dbClusterResourceId:
          _s.extractXmlStringValue(elem, 'DbClusterResourceId'),
      deletionProtection: _s.extractXmlBoolValue(elem, 'DeletionProtection'),
      domainMemberships: _s.extractXmlChild(elem, 'DomainMemberships')?.let(
          (elem) => elem
              .findElements('DomainMembership')
              .map((c) => DomainMembership.fromXml(c))
              .toList()),
      earliestBacktrackTime:
          _s.extractXmlDateTimeValue(elem, 'EarliestBacktrackTime'),
      earliestRestorableTime:
          _s.extractXmlDateTimeValue(elem, 'EarliestRestorableTime'),
      enabledCloudwatchLogsExports: _s
          .extractXmlChild(elem, 'EnabledCloudwatchLogsExports')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      endpoint: _s.extractXmlStringValue(elem, 'Endpoint'),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      engineMode: _s.extractXmlStringValue(elem, 'EngineMode'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      globalWriteForwardingRequested:
          _s.extractXmlBoolValue(elem, 'GlobalWriteForwardingRequested'),
      globalWriteForwardingStatus: _s
          .extractXmlStringValue(elem, 'GlobalWriteForwardingStatus')
          ?.toWriteForwardingStatus(),
      hostedZoneId: _s.extractXmlStringValue(elem, 'HostedZoneId'),
      httpEndpointEnabled: _s.extractXmlBoolValue(elem, 'HttpEndpointEnabled'),
      iAMDatabaseAuthenticationEnabled:
          _s.extractXmlBoolValue(elem, 'IAMDatabaseAuthenticationEnabled'),
      kmsKeyId: _s.extractXmlStringValue(elem, 'KmsKeyId'),
      latestRestorableTime:
          _s.extractXmlDateTimeValue(elem, 'LatestRestorableTime'),
      masterUsername: _s.extractXmlStringValue(elem, 'MasterUsername'),
      multiAZ: _s.extractXmlBoolValue(elem, 'MultiAZ'),
      pendingModifiedValues: _s
          .extractXmlChild(elem, 'PendingModifiedValues')
          ?.let((e) => ClusterPendingModifiedValues.fromXml(e)),
      percentProgress: _s.extractXmlStringValue(elem, 'PercentProgress'),
      port: _s.extractXmlIntValue(elem, 'Port'),
      preferredBackupWindow:
          _s.extractXmlStringValue(elem, 'PreferredBackupWindow'),
      preferredMaintenanceWindow:
          _s.extractXmlStringValue(elem, 'PreferredMaintenanceWindow'),
      readReplicaIdentifiers: _s
          .extractXmlChild(elem, 'ReadReplicaIdentifiers')
          ?.let((elem) =>
              _s.extractXmlStringListValues(elem, 'ReadReplicaIdentifier')),
      readerEndpoint: _s.extractXmlStringValue(elem, 'ReaderEndpoint'),
      replicationSourceIdentifier:
          _s.extractXmlStringValue(elem, 'ReplicationSourceIdentifier'),
      scalingConfigurationInfo: _s
          .extractXmlChild(elem, 'ScalingConfigurationInfo')
          ?.let((e) => ScalingConfigurationInfo.fromXml(e)),
      status: _s.extractXmlStringValue(elem, 'Status'),
      storageEncrypted: _s.extractXmlBoolValue(elem, 'StorageEncrypted'),
      tagList: _s.extractXmlChild(elem, 'TagList')?.let((elem) =>
          elem.findElements('Tag').map((c) => Tag.fromXml(c)).toList()),
      vpcSecurityGroups: _s.extractXmlChild(elem, 'VpcSecurityGroups')?.let(
          (elem) => elem
              .findElements('VpcSecurityGroupMembership')
              .map((c) => VpcSecurityGroupMembership.fromXml(c))
              .toList()),
    );
  }
}

/// This data type is used as a response element in the
/// <code>DescribeDBClusterBacktracks</code> action.
class DBClusterBacktrack {
  /// Contains the backtrack identifier.
  final String? backtrackIdentifier;

  /// The timestamp of the time at which the backtrack was requested.
  final DateTime? backtrackRequestCreationTime;

  /// The timestamp of the time to which the DB cluster was backtracked.
  final DateTime? backtrackTo;

  /// The timestamp of the time from which the DB cluster was backtracked.
  final DateTime? backtrackedFrom;

  /// Contains a user-supplied DB cluster identifier. This identifier is the
  /// unique key that identifies a DB cluster.
  final String? dBClusterIdentifier;

  /// The status of the backtrack. This property returns one of the following
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <code>applying</code> - The backtrack is currently being applied to or
  /// rolled back from the DB cluster.
  /// </li>
  /// <li>
  /// <code>completed</code> - The backtrack has successfully been applied to or
  /// rolled back from the DB cluster.
  /// </li>
  /// <li>
  /// <code>failed</code> - An error occurred while the backtrack was applied to
  /// or rolled back from the DB cluster.
  /// </li>
  /// <li>
  /// <code>pending</code> - The backtrack is currently pending application to or
  /// rollback from the DB cluster.
  /// </li>
  /// </ul>
  final String? status;

  DBClusterBacktrack({
    this.backtrackIdentifier,
    this.backtrackRequestCreationTime,
    this.backtrackTo,
    this.backtrackedFrom,
    this.dBClusterIdentifier,
    this.status,
  });
  factory DBClusterBacktrack.fromXml(_s.XmlElement elem) {
    return DBClusterBacktrack(
      backtrackIdentifier:
          _s.extractXmlStringValue(elem, 'BacktrackIdentifier'),
      backtrackRequestCreationTime:
          _s.extractXmlDateTimeValue(elem, 'BacktrackRequestCreationTime'),
      backtrackTo: _s.extractXmlDateTimeValue(elem, 'BacktrackTo'),
      backtrackedFrom: _s.extractXmlDateTimeValue(elem, 'BacktrackedFrom'),
      dBClusterIdentifier:
          _s.extractXmlStringValue(elem, 'DBClusterIdentifier'),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }
}

/// Contains the result of a successful invocation of the
/// <code>DescribeDBClusterBacktracks</code> action.
class DBClusterBacktrackMessage {
  /// Contains a list of backtracks for the user.
  final List<DBClusterBacktrack>? dBClusterBacktracks;

  /// A pagination token that can be used in a later
  /// <code>DescribeDBClusterBacktracks</code> request.
  final String? marker;

  DBClusterBacktrackMessage({
    this.dBClusterBacktracks,
    this.marker,
  });
  factory DBClusterBacktrackMessage.fromXml(_s.XmlElement elem) {
    return DBClusterBacktrackMessage(
      dBClusterBacktracks: _s.extractXmlChild(elem, 'DBClusterBacktracks')?.let(
          (elem) => elem
              .findElements('DBClusterBacktrack')
              .map((c) => DBClusterBacktrack.fromXml(c))
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

class DBClusterCapacityInfo {
  /// The current capacity of the DB cluster.
  final int? currentCapacity;

  /// A user-supplied DB cluster identifier. This identifier is the unique key
  /// that identifies a DB cluster.
  final String? dBClusterIdentifier;

  /// A value that specifies the capacity that the DB cluster scales to next.
  final int? pendingCapacity;

  /// The number of seconds before a call to
  /// <code>ModifyCurrentDBClusterCapacity</code> times out.
  final int? secondsBeforeTimeout;

  /// The timeout action of a call to <code>ModifyCurrentDBClusterCapacity</code>,
  /// either <code>ForceApplyCapacityChange</code> or
  /// <code>RollbackCapacityChange</code>.
  final String? timeoutAction;

  DBClusterCapacityInfo({
    this.currentCapacity,
    this.dBClusterIdentifier,
    this.pendingCapacity,
    this.secondsBeforeTimeout,
    this.timeoutAction,
  });
  factory DBClusterCapacityInfo.fromXml(_s.XmlElement elem) {
    return DBClusterCapacityInfo(
      currentCapacity: _s.extractXmlIntValue(elem, 'CurrentCapacity'),
      dBClusterIdentifier:
          _s.extractXmlStringValue(elem, 'DBClusterIdentifier'),
      pendingCapacity: _s.extractXmlIntValue(elem, 'PendingCapacity'),
      secondsBeforeTimeout: _s.extractXmlIntValue(elem, 'SecondsBeforeTimeout'),
      timeoutAction: _s.extractXmlStringValue(elem, 'TimeoutAction'),
    );
  }
}

/// This data type represents the information you need to connect to an Amazon
/// Aurora DB cluster. This data type is used as a response element in the
/// following actions:
///
/// <ul>
/// <li>
/// <code>CreateDBClusterEndpoint</code>
/// </li>
/// <li>
/// <code>DescribeDBClusterEndpoints</code>
/// </li>
/// <li>
/// <code>ModifyDBClusterEndpoint</code>
/// </li>
/// <li>
/// <code>DeleteDBClusterEndpoint</code>
/// </li>
/// </ul>
/// For the data structure that represents Amazon RDS DB instance endpoints, see
/// <code>Endpoint</code>.
class DBClusterEndpoint {
  /// The type associated with a custom endpoint. One of: <code>READER</code>,
  /// <code>WRITER</code>, <code>ANY</code>.
  final String? customEndpointType;

  /// The Amazon Resource Name (ARN) for the endpoint.
  final String? dBClusterEndpointArn;

  /// The identifier associated with the endpoint. This parameter is stored as a
  /// lowercase string.
  final String? dBClusterEndpointIdentifier;

  /// A unique system-generated identifier for an endpoint. It remains the same
  /// for the whole life of the endpoint.
  final String? dBClusterEndpointResourceIdentifier;

  /// The DB cluster identifier of the DB cluster associated with the endpoint.
  /// This parameter is stored as a lowercase string.
  final String? dBClusterIdentifier;

  /// The DNS address of the endpoint.
  final String? endpoint;

  /// The type of the endpoint. One of: <code>READER</code>, <code>WRITER</code>,
  /// <code>CUSTOM</code>.
  final String? endpointType;

  /// List of DB instance identifiers that aren't part of the custom endpoint
  /// group. All other eligible instances are reachable through the custom
  /// endpoint. Only relevant if the list of static members is empty.
  final List<String>? excludedMembers;

  /// List of DB instance identifiers that are part of the custom endpoint group.
  final List<String>? staticMembers;

  /// The current status of the endpoint. One of: <code>creating</code>,
  /// <code>available</code>, <code>deleting</code>, <code>inactive</code>,
  /// <code>modifying</code>. The <code>inactive</code> state applies to an
  /// endpoint that can't be used for a certain kind of cluster, such as a
  /// <code>writer</code> endpoint for a read-only secondary cluster in a global
  /// database.
  final String? status;

  DBClusterEndpoint({
    this.customEndpointType,
    this.dBClusterEndpointArn,
    this.dBClusterEndpointIdentifier,
    this.dBClusterEndpointResourceIdentifier,
    this.dBClusterIdentifier,
    this.endpoint,
    this.endpointType,
    this.excludedMembers,
    this.staticMembers,
    this.status,
  });
  factory DBClusterEndpoint.fromXml(_s.XmlElement elem) {
    return DBClusterEndpoint(
      customEndpointType: _s.extractXmlStringValue(elem, 'CustomEndpointType'),
      dBClusterEndpointArn:
          _s.extractXmlStringValue(elem, 'DBClusterEndpointArn'),
      dBClusterEndpointIdentifier:
          _s.extractXmlStringValue(elem, 'DBClusterEndpointIdentifier'),
      dBClusterEndpointResourceIdentifier:
          _s.extractXmlStringValue(elem, 'DBClusterEndpointResourceIdentifier'),
      dBClusterIdentifier:
          _s.extractXmlStringValue(elem, 'DBClusterIdentifier'),
      endpoint: _s.extractXmlStringValue(elem, 'Endpoint'),
      endpointType: _s.extractXmlStringValue(elem, 'EndpointType'),
      excludedMembers: _s
          .extractXmlChild(elem, 'ExcludedMembers')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      staticMembers: _s
          .extractXmlChild(elem, 'StaticMembers')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }
}

class DBClusterEndpointMessage {
  /// Contains the details of the endpoints associated with the cluster and
  /// matching any filter conditions.
  final List<DBClusterEndpoint>? dBClusterEndpoints;

  /// An optional pagination token provided by a previous
  /// <code>DescribeDBClusterEndpoints</code> request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by <code>MaxRecords</code>.
  final String? marker;

  DBClusterEndpointMessage({
    this.dBClusterEndpoints,
    this.marker,
  });
  factory DBClusterEndpointMessage.fromXml(_s.XmlElement elem) {
    return DBClusterEndpointMessage(
      dBClusterEndpoints: _s.extractXmlChild(elem, 'DBClusterEndpoints')?.let(
          (elem) => elem
              .findElements('DBClusterEndpointList')
              .map((c) => DBClusterEndpoint.fromXml(c))
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// Contains information about an instance that is part of a DB cluster.
class DBClusterMember {
  /// Specifies the status of the DB cluster parameter group for this member of
  /// the DB cluster.
  final String? dBClusterParameterGroupStatus;

  /// Specifies the instance identifier for this member of the DB cluster.
  final String? dBInstanceIdentifier;

  /// Value that is <code>true</code> if the cluster member is the primary
  /// instance for the DB cluster and <code>false</code> otherwise.
  final bool? isClusterWriter;

  /// A value that specifies the order in which an Aurora Replica is promoted to
  /// the primary instance after a failure of the existing primary instance. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Aurora.Managing.Backups.html#Aurora.Managing.FaultTolerance">
  /// Fault Tolerance for an Aurora DB Cluster</a> in the <i>Amazon Aurora User
  /// Guide</i>.
  final int? promotionTier;

  DBClusterMember({
    this.dBClusterParameterGroupStatus,
    this.dBInstanceIdentifier,
    this.isClusterWriter,
    this.promotionTier,
  });
  factory DBClusterMember.fromXml(_s.XmlElement elem) {
    return DBClusterMember(
      dBClusterParameterGroupStatus:
          _s.extractXmlStringValue(elem, 'DBClusterParameterGroupStatus'),
      dBInstanceIdentifier:
          _s.extractXmlStringValue(elem, 'DBInstanceIdentifier'),
      isClusterWriter: _s.extractXmlBoolValue(elem, 'IsClusterWriter'),
      promotionTier: _s.extractXmlIntValue(elem, 'PromotionTier'),
    );
  }
}

/// Contains the result of a successful invocation of the
/// <code>DescribeDBClusters</code> action.
class DBClusterMessage {
  /// Contains a list of DB clusters for the user.
  final List<DBCluster>? dBClusters;

  /// A pagination token that can be used in a later DescribeDBClusters request.
  final String? marker;

  DBClusterMessage({
    this.dBClusters,
    this.marker,
  });
  factory DBClusterMessage.fromXml(_s.XmlElement elem) {
    return DBClusterMessage(
      dBClusters: _s.extractXmlChild(elem, 'DBClusters')?.let((elem) => elem
          .findElements('DBCluster')
          .map((c) => DBCluster.fromXml(c))
          .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// Contains status information for a DB cluster option group.
class DBClusterOptionGroupStatus {
  /// Specifies the name of the DB cluster option group.
  final String? dBClusterOptionGroupName;

  /// Specifies the status of the DB cluster option group.
  final String? status;

  DBClusterOptionGroupStatus({
    this.dBClusterOptionGroupName,
    this.status,
  });
  factory DBClusterOptionGroupStatus.fromXml(_s.XmlElement elem) {
    return DBClusterOptionGroupStatus(
      dBClusterOptionGroupName:
          _s.extractXmlStringValue(elem, 'DBClusterOptionGroupName'),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }
}

/// Contains the details of an Amazon RDS DB cluster parameter group.
///
/// This data type is used as a response element in the
/// <code>DescribeDBClusterParameterGroups</code> action.
class DBClusterParameterGroup {
  /// The Amazon Resource Name (ARN) for the DB cluster parameter group.
  final String? dBClusterParameterGroupArn;

  /// The name of the DB cluster parameter group.
  final String? dBClusterParameterGroupName;

  /// The name of the DB parameter group family that this DB cluster parameter
  /// group is compatible with.
  final String? dBParameterGroupFamily;

  /// Provides the customer-specified description for this DB cluster parameter
  /// group.
  final String? description;

  DBClusterParameterGroup({
    this.dBClusterParameterGroupArn,
    this.dBClusterParameterGroupName,
    this.dBParameterGroupFamily,
    this.description,
  });
  factory DBClusterParameterGroup.fromXml(_s.XmlElement elem) {
    return DBClusterParameterGroup(
      dBClusterParameterGroupArn:
          _s.extractXmlStringValue(elem, 'DBClusterParameterGroupArn'),
      dBClusterParameterGroupName:
          _s.extractXmlStringValue(elem, 'DBClusterParameterGroupName'),
      dBParameterGroupFamily:
          _s.extractXmlStringValue(elem, 'DBParameterGroupFamily'),
      description: _s.extractXmlStringValue(elem, 'Description'),
    );
  }
}

/// Provides details about a DB cluster parameter group including the parameters
/// in the DB cluster parameter group.
class DBClusterParameterGroupDetails {
  /// An optional pagination token provided by a previous
  /// DescribeDBClusterParameters request. If this parameter is specified, the
  /// response includes only records beyond the marker, up to the value specified
  /// by <code>MaxRecords</code> .
  final String? marker;

  /// Provides a list of parameters for the DB cluster parameter group.
  final List<Parameter>? parameters;

  DBClusterParameterGroupDetails({
    this.marker,
    this.parameters,
  });
  factory DBClusterParameterGroupDetails.fromXml(_s.XmlElement elem) {
    return DBClusterParameterGroupDetails(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      parameters: _s.extractXmlChild(elem, 'Parameters')?.let((elem) => elem
          .findElements('Parameter')
          .map((c) => Parameter.fromXml(c))
          .toList()),
    );
  }
}

/// <p/>
class DBClusterParameterGroupNameMessage {
  /// The name of the DB cluster parameter group.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be 1 to 255 letters or numbers.
  /// </li>
  /// <li>
  /// First character must be a letter
  /// </li>
  /// <li>
  /// Can't end with a hyphen or contain two consecutive hyphens
  /// </li>
  /// </ul> <note>
  /// This value is stored as a lowercase string.
  /// </note>
  final String? dBClusterParameterGroupName;

  DBClusterParameterGroupNameMessage({
    this.dBClusterParameterGroupName,
  });
  factory DBClusterParameterGroupNameMessage.fromXml(_s.XmlElement elem) {
    return DBClusterParameterGroupNameMessage(
      dBClusterParameterGroupName:
          _s.extractXmlStringValue(elem, 'DBClusterParameterGroupName'),
    );
  }
}

/// <p/>
class DBClusterParameterGroupsMessage {
  /// A list of DB cluster parameter groups.
  final List<DBClusterParameterGroup>? dBClusterParameterGroups;

  /// An optional pagination token provided by a previous
  /// <code>DescribeDBClusterParameterGroups</code> request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by <code>MaxRecords</code>.
  final String? marker;

  DBClusterParameterGroupsMessage({
    this.dBClusterParameterGroups,
    this.marker,
  });
  factory DBClusterParameterGroupsMessage.fromXml(_s.XmlElement elem) {
    return DBClusterParameterGroupsMessage(
      dBClusterParameterGroups: _s
          .extractXmlChild(elem, 'DBClusterParameterGroups')
          ?.let((elem) => elem
              .findElements('DBClusterParameterGroup')
              .map((c) => DBClusterParameterGroup.fromXml(c))
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// Describes an AWS Identity and Access Management (IAM) role that is
/// associated with a DB cluster.
class DBClusterRole {
  /// The name of the feature associated with the AWS Identity and Access
  /// Management (IAM) role. For the list of supported feature names, see
  /// <a>DBEngineVersion</a>.
  final String? featureName;

  /// The Amazon Resource Name (ARN) of the IAM role that is associated with the
  /// DB cluster.
  final String? roleArn;

  /// Describes the state of association between the IAM role and the DB cluster.
  /// The Status property returns one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code> - the IAM role ARN is associated with the DB cluster and
  /// can be used to access other AWS services on your behalf.
  /// </li>
  /// <li>
  /// <code>PENDING</code> - the IAM role ARN is being associated with the DB
  /// cluster.
  /// </li>
  /// <li>
  /// <code>INVALID</code> - the IAM role ARN is associated with the DB cluster,
  /// but the DB cluster is unable to assume the IAM role in order to access other
  /// AWS services on your behalf.
  /// </li>
  /// </ul>
  final String? status;

  DBClusterRole({
    this.featureName,
    this.roleArn,
    this.status,
  });
  factory DBClusterRole.fromXml(_s.XmlElement elem) {
    return DBClusterRole(
      featureName: _s.extractXmlStringValue(elem, 'FeatureName'),
      roleArn: _s.extractXmlStringValue(elem, 'RoleArn'),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }
}

/// Contains the details for an Amazon RDS DB cluster snapshot
///
/// This data type is used as a response element in the
/// <code>DescribeDBClusterSnapshots</code> action.
class DBClusterSnapshot {
  /// Specifies the allocated storage size in gibibytes (GiB).
  final int? allocatedStorage;

  /// Provides the list of Availability Zones (AZs) where instances in the DB
  /// cluster snapshot can be restored.
  final List<String>? availabilityZones;

  /// Specifies the time when the DB cluster was created, in Universal Coordinated
  /// Time (UTC).
  final DateTime? clusterCreateTime;

  /// Specifies the DB cluster identifier of the DB cluster that this DB cluster
  /// snapshot was created from.
  final String? dBClusterIdentifier;

  /// The Amazon Resource Name (ARN) for the DB cluster snapshot.
  final String? dBClusterSnapshotArn;

  /// Specifies the identifier for the DB cluster snapshot.
  final String? dBClusterSnapshotIdentifier;

  /// Specifies the name of the database engine.
  final String? engine;

  /// Provides the version of the database engine for this DB cluster snapshot.
  final String? engineVersion;

  /// True if mapping of AWS Identity and Access Management (IAM) accounts to
  /// database accounts is enabled, and otherwise false.
  final bool? iAMDatabaseAuthenticationEnabled;

  /// If <code>StorageEncrypted</code> is true, the AWS KMS key identifier for the
  /// encrypted DB cluster snapshot.
  ///
  /// The AWS KMS key identifier is the key ARN, key ID, alias ARN, or alias name
  /// for the AWS KMS customer master key (CMK).
  final String? kmsKeyId;

  /// Provides the license model information for this DB cluster snapshot.
  final String? licenseModel;

  /// Provides the master username for the DB cluster snapshot.
  final String? masterUsername;

  /// Specifies the percentage of the estimated data that has been transferred.
  final int? percentProgress;

  /// Specifies the port that the DB cluster was listening on at the time of the
  /// snapshot.
  final int? port;

  /// Provides the time when the snapshot was taken, in Universal Coordinated Time
  /// (UTC).
  final DateTime? snapshotCreateTime;

  /// Provides the type of the DB cluster snapshot.
  final String? snapshotType;

  /// If the DB cluster snapshot was copied from a source DB cluster snapshot, the
  /// Amazon Resource Name (ARN) for the source DB cluster snapshot, otherwise, a
  /// null value.
  final String? sourceDBClusterSnapshotArn;

  /// Specifies the status of this DB cluster snapshot.
  final String? status;

  /// Specifies whether the DB cluster snapshot is encrypted.
  final bool? storageEncrypted;
  final List<Tag>? tagList;

  /// Provides the VPC ID associated with the DB cluster snapshot.
  final String? vpcId;

  DBClusterSnapshot({
    this.allocatedStorage,
    this.availabilityZones,
    this.clusterCreateTime,
    this.dBClusterIdentifier,
    this.dBClusterSnapshotArn,
    this.dBClusterSnapshotIdentifier,
    this.engine,
    this.engineVersion,
    this.iAMDatabaseAuthenticationEnabled,
    this.kmsKeyId,
    this.licenseModel,
    this.masterUsername,
    this.percentProgress,
    this.port,
    this.snapshotCreateTime,
    this.snapshotType,
    this.sourceDBClusterSnapshotArn,
    this.status,
    this.storageEncrypted,
    this.tagList,
    this.vpcId,
  });
  factory DBClusterSnapshot.fromXml(_s.XmlElement elem) {
    return DBClusterSnapshot(
      allocatedStorage: _s.extractXmlIntValue(elem, 'AllocatedStorage'),
      availabilityZones: _s.extractXmlChild(elem, 'AvailabilityZones')?.let(
          (elem) => _s.extractXmlStringListValues(elem, 'AvailabilityZone')),
      clusterCreateTime: _s.extractXmlDateTimeValue(elem, 'ClusterCreateTime'),
      dBClusterIdentifier:
          _s.extractXmlStringValue(elem, 'DBClusterIdentifier'),
      dBClusterSnapshotArn:
          _s.extractXmlStringValue(elem, 'DBClusterSnapshotArn'),
      dBClusterSnapshotIdentifier:
          _s.extractXmlStringValue(elem, 'DBClusterSnapshotIdentifier'),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      iAMDatabaseAuthenticationEnabled:
          _s.extractXmlBoolValue(elem, 'IAMDatabaseAuthenticationEnabled'),
      kmsKeyId: _s.extractXmlStringValue(elem, 'KmsKeyId'),
      licenseModel: _s.extractXmlStringValue(elem, 'LicenseModel'),
      masterUsername: _s.extractXmlStringValue(elem, 'MasterUsername'),
      percentProgress: _s.extractXmlIntValue(elem, 'PercentProgress'),
      port: _s.extractXmlIntValue(elem, 'Port'),
      snapshotCreateTime:
          _s.extractXmlDateTimeValue(elem, 'SnapshotCreateTime'),
      snapshotType: _s.extractXmlStringValue(elem, 'SnapshotType'),
      sourceDBClusterSnapshotArn:
          _s.extractXmlStringValue(elem, 'SourceDBClusterSnapshotArn'),
      status: _s.extractXmlStringValue(elem, 'Status'),
      storageEncrypted: _s.extractXmlBoolValue(elem, 'StorageEncrypted'),
      tagList: _s.extractXmlChild(elem, 'TagList')?.let((elem) =>
          elem.findElements('Tag').map((c) => Tag.fromXml(c)).toList()),
      vpcId: _s.extractXmlStringValue(elem, 'VpcId'),
    );
  }
}

/// Contains the name and values of a manual DB cluster snapshot attribute.
///
/// Manual DB cluster snapshot attributes are used to authorize other AWS
/// accounts to restore a manual DB cluster snapshot. For more information, see
/// the <code>ModifyDBClusterSnapshotAttribute</code> API action.
class DBClusterSnapshotAttribute {
  /// The name of the manual DB cluster snapshot attribute.
  ///
  /// The attribute named <code>restore</code> refers to the list of AWS accounts
  /// that have permission to copy or restore the manual DB cluster snapshot. For
  /// more information, see the <code>ModifyDBClusterSnapshotAttribute</code> API
  /// action.
  final String? attributeName;

  /// The value(s) for the manual DB cluster snapshot attribute.
  ///
  /// If the <code>AttributeName</code> field is set to <code>restore</code>, then
  /// this element returns a list of IDs of the AWS accounts that are authorized
  /// to copy or restore the manual DB cluster snapshot. If a value of
  /// <code>all</code> is in the list, then the manual DB cluster snapshot is
  /// public and available for any AWS account to copy or restore.
  final List<String>? attributeValues;

  DBClusterSnapshotAttribute({
    this.attributeName,
    this.attributeValues,
  });
  factory DBClusterSnapshotAttribute.fromXml(_s.XmlElement elem) {
    return DBClusterSnapshotAttribute(
      attributeName: _s.extractXmlStringValue(elem, 'AttributeName'),
      attributeValues: _s.extractXmlChild(elem, 'AttributeValues')?.let(
          (elem) => _s.extractXmlStringListValues(elem, 'AttributeValue')),
    );
  }
}

/// Contains the results of a successful call to the
/// <code>DescribeDBClusterSnapshotAttributes</code> API action.
///
/// Manual DB cluster snapshot attributes are used to authorize other AWS
/// accounts to copy or restore a manual DB cluster snapshot. For more
/// information, see the <code>ModifyDBClusterSnapshotAttribute</code> API
/// action.
class DBClusterSnapshotAttributesResult {
  /// The list of attributes and values for the manual DB cluster snapshot.
  final List<DBClusterSnapshotAttribute>? dBClusterSnapshotAttributes;

  /// The identifier of the manual DB cluster snapshot that the attributes apply
  /// to.
  final String? dBClusterSnapshotIdentifier;

  DBClusterSnapshotAttributesResult({
    this.dBClusterSnapshotAttributes,
    this.dBClusterSnapshotIdentifier,
  });
  factory DBClusterSnapshotAttributesResult.fromXml(_s.XmlElement elem) {
    return DBClusterSnapshotAttributesResult(
      dBClusterSnapshotAttributes: _s
          .extractXmlChild(elem, 'DBClusterSnapshotAttributes')
          ?.let((elem) => elem
              .findElements('DBClusterSnapshotAttribute')
              .map((c) => DBClusterSnapshotAttribute.fromXml(c))
              .toList()),
      dBClusterSnapshotIdentifier:
          _s.extractXmlStringValue(elem, 'DBClusterSnapshotIdentifier'),
    );
  }
}

/// Provides a list of DB cluster snapshots for the user as the result of a call
/// to the <code>DescribeDBClusterSnapshots</code> action.
class DBClusterSnapshotMessage {
  /// Provides a list of DB cluster snapshots for the user.
  final List<DBClusterSnapshot>? dBClusterSnapshots;

  /// An optional pagination token provided by a previous
  /// <code>DescribeDBClusterSnapshots</code> request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by <code>MaxRecords</code>.
  final String? marker;

  DBClusterSnapshotMessage({
    this.dBClusterSnapshots,
    this.marker,
  });
  factory DBClusterSnapshotMessage.fromXml(_s.XmlElement elem) {
    return DBClusterSnapshotMessage(
      dBClusterSnapshots: _s.extractXmlChild(elem, 'DBClusterSnapshots')?.let(
          (elem) => elem
              .findElements('DBClusterSnapshot')
              .map((c) => DBClusterSnapshot.fromXml(c))
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// This data type is used as a response element in the action
/// <code>DescribeDBEngineVersions</code>.
class DBEngineVersion {
  /// The description of the database engine.
  final String? dBEngineDescription;

  /// The description of the database engine version.
  final String? dBEngineVersionDescription;

  /// The name of the DB parameter group family for the database engine.
  final String? dBParameterGroupFamily;

  /// The default character set for new instances of this engine version, if the
  /// <code>CharacterSetName</code> parameter of the CreateDBInstance API isn't
  /// specified.
  final CharacterSet? defaultCharacterSet;

  /// The name of the database engine.
  final String? engine;

  /// The version number of the database engine.
  final String? engineVersion;

  /// The types of logs that the database engine has available for export to
  /// CloudWatch Logs.
  final List<String>? exportableLogTypes;

  /// The status of the DB engine version, either <code>available</code> or
  /// <code>deprecated</code>.
  final String? status;

  /// A list of the character sets supported by this engine for the
  /// <code>CharacterSetName</code> parameter of the <code>CreateDBInstance</code>
  /// operation.
  final List<CharacterSet>? supportedCharacterSets;

  /// A list of the supported DB engine modes.
  final List<String>? supportedEngineModes;

  /// A list of features supported by the DB engine. Supported feature names
  /// include the following.
  ///
  /// <ul>
  /// <li>
  /// s3Import
  /// </li>
  /// </ul>
  final List<String>? supportedFeatureNames;

  /// A list of the character sets supported by the Oracle DB engine for the
  /// <code>NcharCharacterSetName</code> parameter of the
  /// <code>CreateDBInstance</code> operation.
  final List<CharacterSet>? supportedNcharCharacterSets;

  /// A list of the time zones supported by this engine for the
  /// <code>Timezone</code> parameter of the <code>CreateDBInstance</code> action.
  final List<Timezone>? supportedTimezones;

  /// A value that indicates whether you can use Aurora global databases with a
  /// specific DB engine version.
  final bool? supportsGlobalDatabases;

  /// A value that indicates whether the engine version supports exporting the log
  /// types specified by ExportableLogTypes to CloudWatch Logs.
  final bool? supportsLogExportsToCloudwatchLogs;

  /// A value that indicates whether you can use Aurora parallel query with a
  /// specific DB engine version.
  final bool? supportsParallelQuery;

  /// Indicates whether the database engine version supports read replicas.
  final bool? supportsReadReplica;

  /// A list of engine versions that this database engine version can be upgraded
  /// to.
  final List<UpgradeTarget>? validUpgradeTarget;

  DBEngineVersion({
    this.dBEngineDescription,
    this.dBEngineVersionDescription,
    this.dBParameterGroupFamily,
    this.defaultCharacterSet,
    this.engine,
    this.engineVersion,
    this.exportableLogTypes,
    this.status,
    this.supportedCharacterSets,
    this.supportedEngineModes,
    this.supportedFeatureNames,
    this.supportedNcharCharacterSets,
    this.supportedTimezones,
    this.supportsGlobalDatabases,
    this.supportsLogExportsToCloudwatchLogs,
    this.supportsParallelQuery,
    this.supportsReadReplica,
    this.validUpgradeTarget,
  });
  factory DBEngineVersion.fromXml(_s.XmlElement elem) {
    return DBEngineVersion(
      dBEngineDescription:
          _s.extractXmlStringValue(elem, 'DBEngineDescription'),
      dBEngineVersionDescription:
          _s.extractXmlStringValue(elem, 'DBEngineVersionDescription'),
      dBParameterGroupFamily:
          _s.extractXmlStringValue(elem, 'DBParameterGroupFamily'),
      defaultCharacterSet: _s
          .extractXmlChild(elem, 'DefaultCharacterSet')
          ?.let((e) => CharacterSet.fromXml(e)),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      exportableLogTypes: _s
          .extractXmlChild(elem, 'ExportableLogTypes')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      status: _s.extractXmlStringValue(elem, 'Status'),
      supportedCharacterSets: _s
          .extractXmlChild(elem, 'SupportedCharacterSets')
          ?.let((elem) => elem
              .findElements('CharacterSet')
              .map((c) => CharacterSet.fromXml(c))
              .toList()),
      supportedEngineModes: _s
          .extractXmlChild(elem, 'SupportedEngineModes')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      supportedFeatureNames: _s
          .extractXmlChild(elem, 'SupportedFeatureNames')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      supportedNcharCharacterSets: _s
          .extractXmlChild(elem, 'SupportedNcharCharacterSets')
          ?.let((elem) => elem
              .findElements('CharacterSet')
              .map((c) => CharacterSet.fromXml(c))
              .toList()),
      supportedTimezones: _s.extractXmlChild(elem, 'SupportedTimezones')?.let(
          (elem) => elem
              .findElements('Timezone')
              .map((c) => Timezone.fromXml(c))
              .toList()),
      supportsGlobalDatabases:
          _s.extractXmlBoolValue(elem, 'SupportsGlobalDatabases'),
      supportsLogExportsToCloudwatchLogs:
          _s.extractXmlBoolValue(elem, 'SupportsLogExportsToCloudwatchLogs'),
      supportsParallelQuery:
          _s.extractXmlBoolValue(elem, 'SupportsParallelQuery'),
      supportsReadReplica: _s.extractXmlBoolValue(elem, 'SupportsReadReplica'),
      validUpgradeTarget: _s.extractXmlChild(elem, 'ValidUpgradeTarget')?.let(
          (elem) => elem
              .findElements('UpgradeTarget')
              .map((c) => UpgradeTarget.fromXml(c))
              .toList()),
    );
  }
}

/// Contains the result of a successful invocation of the
/// <code>DescribeDBEngineVersions</code> action.
class DBEngineVersionMessage {
  /// A list of <code>DBEngineVersion</code> elements.
  final List<DBEngineVersion>? dBEngineVersions;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String? marker;

  DBEngineVersionMessage({
    this.dBEngineVersions,
    this.marker,
  });
  factory DBEngineVersionMessage.fromXml(_s.XmlElement elem) {
    return DBEngineVersionMessage(
      dBEngineVersions: _s.extractXmlChild(elem, 'DBEngineVersions')?.let(
          (elem) => elem
              .findElements('DBEngineVersion')
              .map((c) => DBEngineVersion.fromXml(c))
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// Contains the details of an Amazon RDS DB instance.
///
/// This data type is used as a response element in the
/// <code>DescribeDBInstances</code> action.
class DBInstance {
  /// Specifies the allocated storage size specified in gibibytes.
  final int? allocatedStorage;

  /// The AWS Identity and Access Management (IAM) roles associated with the DB
  /// instance.
  final List<DBInstanceRole>? associatedRoles;

  /// Indicates that minor version patches are applied automatically.
  final bool? autoMinorVersionUpgrade;

  /// Specifies the name of the Availability Zone the DB instance is located in.
  final String? availabilityZone;

  /// Specifies the number of days for which automatic DB snapshots are retained.
  final int? backupRetentionPeriod;

  /// The identifier of the CA certificate for this DB instance.
  final String? cACertificateIdentifier;

  /// If present, specifies the name of the character set that this instance is
  /// associated with.
  final String? characterSetName;

  /// Specifies whether tags are copied from the DB instance to snapshots of the
  /// DB instance.
  ///
  /// <b>Amazon Aurora</b>
  ///
  /// Not applicable. Copying tags to snapshots is managed by the DB cluster.
  /// Setting this value for an Aurora DB instance has no effect on the DB cluster
  /// setting. For more information, see <code>DBCluster</code>.
  final bool? copyTagsToSnapshot;

  /// Specifies whether a customer-owned IP address (CoIP) is enabled for an RDS
  /// on Outposts DB instance.
  ///
  /// A <i>CoIP </i>provides local or external connectivity to resources in your
  /// Outpost subnets through your on-premises network. For some use cases, a CoIP
  /// can provide lower latency for connections to the DB instance from outside of
  /// its virtual private cloud (VPC) on your local network.
  ///
  /// For more information about RDS on Outposts, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/rds-on-outposts.html">Working
  /// with Amazon RDS on AWS Outposts</a> in the <i>Amazon RDS User Guide</i>.
  ///
  /// For more information about CoIPs, see <a
  /// href="https://docs.aws.amazon.com/outposts/latest/userguide/outposts-networking-components.html#ip-addressing">Customer-owned
  /// IP addresses</a> in the <i>AWS Outposts User Guide</i>.
  final bool? customerOwnedIpEnabled;

  /// If the DB instance is a member of a DB cluster, contains the name of the DB
  /// cluster that the DB instance is a member of.
  final String? dBClusterIdentifier;

  /// The Amazon Resource Name (ARN) for the DB instance.
  final String? dBInstanceArn;

  /// The list of replicated automated backups associated with the DB instance.
  final List<DBInstanceAutomatedBackupsReplication>?
      dBInstanceAutomatedBackupsReplications;

  /// Contains the name of the compute and memory capacity class of the DB
  /// instance.
  final String? dBInstanceClass;

  /// Contains a user-supplied database identifier. This identifier is the unique
  /// key that identifies a DB instance.
  final String? dBInstanceIdentifier;

  /// Specifies the current state of this database.
  ///
  /// For information about DB instance statuses, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.DBInstance.Status.html">DB
  /// Instance Status</a> in the <i>Amazon RDS User Guide.</i>
  final String? dBInstanceStatus;

  /// The meaning of this parameter differs according to the database engine you
  /// use.
  ///
  /// <b>MySQL, MariaDB, SQL Server, PostgreSQL</b>
  ///
  /// Contains the name of the initial database of this instance that was provided
  /// at create time, if one was specified when the DB instance was created. This
  /// same name is returned for the life of the DB instance.
  ///
  /// Type: String
  ///
  /// <b>Oracle</b>
  ///
  /// Contains the Oracle System ID (SID) of the created DB instance. Not shown
  /// when the returned parameters do not apply to an Oracle DB instance.
  final String? dBName;

  /// Provides the list of DB parameter groups applied to this DB instance.
  final List<DBParameterGroupStatus>? dBParameterGroups;

  /// A list of DB security group elements containing
  /// <code>DBSecurityGroup.Name</code> and <code>DBSecurityGroup.Status</code>
  /// subelements.
  final List<DBSecurityGroupMembership>? dBSecurityGroups;

  /// Specifies information on the subnet group associated with the DB instance,
  /// including the name, description, and subnets in the subnet group.
  final DBSubnetGroup? dBSubnetGroup;

  /// Specifies the port that the DB instance listens on. If the DB instance is
  /// part of a DB cluster, this can be a different port than the DB cluster port.
  final int? dbInstancePort;

  /// The AWS Region-unique, immutable identifier for the DB instance. This
  /// identifier is found in AWS CloudTrail log entries whenever the AWS KMS
  /// customer master key (CMK) for the DB instance is accessed.
  final String? dbiResourceId;

  /// Indicates if the DB instance has deletion protection enabled. The database
  /// can't be deleted when deletion protection is enabled. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_DeleteInstance.html">
  /// Deleting a DB Instance</a>.
  final bool? deletionProtection;

  /// The Active Directory Domain membership records associated with the DB
  /// instance.
  final List<DomainMembership>? domainMemberships;

  /// A list of log types that this DB instance is configured to export to
  /// CloudWatch Logs.
  ///
  /// Log types vary by DB engine. For information about the log types for each DB
  /// engine, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_LogAccess.html">Amazon
  /// RDS Database Log Files</a> in the <i>Amazon RDS User Guide.</i>
  final List<String>? enabledCloudwatchLogsExports;

  /// Specifies the connection endpoint.
  final Endpoint? endpoint;

  /// The name of the database engine to be used for this DB instance.
  final String? engine;

  /// Indicates the database engine version.
  final String? engineVersion;

  /// The Amazon Resource Name (ARN) of the Amazon CloudWatch Logs log stream that
  /// receives the Enhanced Monitoring metrics data for the DB instance.
  final String? enhancedMonitoringResourceArn;

  /// True if mapping of AWS Identity and Access Management (IAM) accounts to
  /// database accounts is enabled, and otherwise false.
  ///
  /// IAM database authentication can be enabled for the following database
  /// engines
  ///
  /// <ul>
  /// <li>
  /// For MySQL 5.6, minor version 5.6.34 or higher
  /// </li>
  /// <li>
  /// For MySQL 5.7, minor version 5.7.16 or higher
  /// </li>
  /// <li>
  /// Aurora 5.6 or higher. To enable IAM database authentication for Aurora, see
  /// DBCluster Type.
  /// </li>
  /// </ul>
  final bool? iAMDatabaseAuthenticationEnabled;

  /// Provides the date and time the DB instance was created.
  final DateTime? instanceCreateTime;

  /// Specifies the Provisioned IOPS (I/O operations per second) value.
  final int? iops;

  /// If <code>StorageEncrypted</code> is true, the AWS KMS key identifier for the
  /// encrypted DB instance.
  ///
  /// The AWS KMS key identifier is the key ARN, key ID, alias ARN, or alias name
  /// for the AWS KMS customer master key (CMK).
  final String? kmsKeyId;

  /// Specifies the latest time to which a database can be restored with
  /// point-in-time restore.
  final DateTime? latestRestorableTime;

  /// License model information for this DB instance.
  final String? licenseModel;

  /// Specifies the listener connection endpoint for SQL Server Always On.
  final Endpoint? listenerEndpoint;

  /// Contains the master username for the DB instance.
  final String? masterUsername;

  /// The upper limit to which Amazon RDS can automatically scale the storage of
  /// the DB instance.
  final int? maxAllocatedStorage;

  /// The interval, in seconds, between points when Enhanced Monitoring metrics
  /// are collected for the DB instance.
  final int? monitoringInterval;

  /// The ARN for the IAM role that permits RDS to send Enhanced Monitoring
  /// metrics to Amazon CloudWatch Logs.
  final String? monitoringRoleArn;

  /// Specifies if the DB instance is a Multi-AZ deployment.
  final bool? multiAZ;

  /// The name of the NCHAR character set for the Oracle DB instance. This
  /// character set specifies the Unicode encoding for data stored in table
  /// columns of type NCHAR, NCLOB, or NVARCHAR2.
  final String? ncharCharacterSetName;

  /// Provides the list of option group memberships for this DB instance.
  final List<OptionGroupMembership>? optionGroupMemberships;

  /// Specifies that changes to the DB instance are pending. This element is only
  /// included when changes are pending. Specific changes are identified by
  /// subelements.
  final PendingModifiedValues? pendingModifiedValues;

  /// True if Performance Insights is enabled for the DB instance, and otherwise
  /// false.
  final bool? performanceInsightsEnabled;

  /// The AWS KMS key identifier for encryption of Performance Insights data.
  ///
  /// The AWS KMS key identifier is the key ARN, key ID, alias ARN, or alias name
  /// for the AWS KMS customer master key (CMK).
  final String? performanceInsightsKMSKeyId;

  /// The amount of time, in days, to retain Performance Insights data. Valid
  /// values are 7 or 731 (2 years).
  final int? performanceInsightsRetentionPeriod;

  /// Specifies the daily time range during which automated backups are created if
  /// automated backups are enabled, as determined by the
  /// <code>BackupRetentionPeriod</code>.
  final String? preferredBackupWindow;

  /// Specifies the weekly time range during which system maintenance can occur,
  /// in Universal Coordinated Time (UTC).
  final String? preferredMaintenanceWindow;

  /// The number of CPU cores and the number of threads per core for the DB
  /// instance class of the DB instance.
  final List<ProcessorFeature>? processorFeatures;

  /// A value that specifies the order in which an Aurora Replica is promoted to
  /// the primary instance after a failure of the existing primary instance. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Aurora.Managing.Backups.html#Aurora.Managing.FaultTolerance">
  /// Fault Tolerance for an Aurora DB Cluster</a> in the <i>Amazon Aurora User
  /// Guide</i>.
  final int? promotionTier;

  /// Specifies the accessibility options for the DB instance.
  ///
  /// When the DB instance is publicly accessible, its DNS endpoint resolves to
  /// the private IP address from within the DB instance's VPC, and to the public
  /// IP address from outside of the DB instance's VPC. Access to the DB instance
  /// is ultimately controlled by the security group it uses, and that public
  /// access is not permitted if the security group assigned to the DB instance
  /// doesn't permit it.
  ///
  /// When the DB instance isn't publicly accessible, it is an internal DB
  /// instance with a DNS name that resolves to a private IP address.
  ///
  /// For more information, see <a>CreateDBInstance</a>.
  final bool? publiclyAccessible;

  /// Contains one or more identifiers of Aurora DB clusters to which the RDS DB
  /// instance is replicated as a read replica. For example, when you create an
  /// Aurora read replica of an RDS MySQL DB instance, the Aurora MySQL DB cluster
  /// for the Aurora read replica is shown. This output does not contain
  /// information about cross region Aurora read replicas.
  /// <note>
  /// Currently, each RDS DB instance can have only one Aurora read replica.
  /// </note>
  final List<String>? readReplicaDBClusterIdentifiers;

  /// Contains one or more identifiers of the read replicas associated with this
  /// DB instance.
  final List<String>? readReplicaDBInstanceIdentifiers;

  /// Contains the identifier of the source DB instance if this DB instance is a
  /// read replica.
  final String? readReplicaSourceDBInstanceIdentifier;

  /// The open mode of an Oracle read replica. The default is
  /// <code>open-read-only</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/oracle-read-replicas.html">Working
  /// with Oracle Read Replicas for Amazon RDS</a> in the <i>Amazon RDS User
  /// Guide</i>.
  /// <note>
  /// This attribute is only supported in RDS for Oracle.
  /// </note>
  final ReplicaMode? replicaMode;

  /// If present, specifies the name of the secondary Availability Zone for a DB
  /// instance with multi-AZ support.
  final String? secondaryAvailabilityZone;

  /// The status of a read replica. If the instance isn't a read replica, this is
  /// blank.
  final List<DBInstanceStatusInfo>? statusInfos;

  /// Specifies whether the DB instance is encrypted.
  final bool? storageEncrypted;

  /// Specifies the storage type associated with DB instance.
  final String? storageType;
  final List<Tag>? tagList;

  /// The ARN from the key store with which the instance is associated for TDE
  /// encryption.
  final String? tdeCredentialArn;

  /// The time zone of the DB instance. In most cases, the <code>Timezone</code>
  /// element is empty. <code>Timezone</code> content appears only for Microsoft
  /// SQL Server DB instances that were created with a time zone specified.
  final String? timezone;

  /// Provides a list of VPC security group elements that the DB instance belongs
  /// to.
  final List<VpcSecurityGroupMembership>? vpcSecurityGroups;

  DBInstance({
    this.allocatedStorage,
    this.associatedRoles,
    this.autoMinorVersionUpgrade,
    this.availabilityZone,
    this.backupRetentionPeriod,
    this.cACertificateIdentifier,
    this.characterSetName,
    this.copyTagsToSnapshot,
    this.customerOwnedIpEnabled,
    this.dBClusterIdentifier,
    this.dBInstanceArn,
    this.dBInstanceAutomatedBackupsReplications,
    this.dBInstanceClass,
    this.dBInstanceIdentifier,
    this.dBInstanceStatus,
    this.dBName,
    this.dBParameterGroups,
    this.dBSecurityGroups,
    this.dBSubnetGroup,
    this.dbInstancePort,
    this.dbiResourceId,
    this.deletionProtection,
    this.domainMemberships,
    this.enabledCloudwatchLogsExports,
    this.endpoint,
    this.engine,
    this.engineVersion,
    this.enhancedMonitoringResourceArn,
    this.iAMDatabaseAuthenticationEnabled,
    this.instanceCreateTime,
    this.iops,
    this.kmsKeyId,
    this.latestRestorableTime,
    this.licenseModel,
    this.listenerEndpoint,
    this.masterUsername,
    this.maxAllocatedStorage,
    this.monitoringInterval,
    this.monitoringRoleArn,
    this.multiAZ,
    this.ncharCharacterSetName,
    this.optionGroupMemberships,
    this.pendingModifiedValues,
    this.performanceInsightsEnabled,
    this.performanceInsightsKMSKeyId,
    this.performanceInsightsRetentionPeriod,
    this.preferredBackupWindow,
    this.preferredMaintenanceWindow,
    this.processorFeatures,
    this.promotionTier,
    this.publiclyAccessible,
    this.readReplicaDBClusterIdentifiers,
    this.readReplicaDBInstanceIdentifiers,
    this.readReplicaSourceDBInstanceIdentifier,
    this.replicaMode,
    this.secondaryAvailabilityZone,
    this.statusInfos,
    this.storageEncrypted,
    this.storageType,
    this.tagList,
    this.tdeCredentialArn,
    this.timezone,
    this.vpcSecurityGroups,
  });
  factory DBInstance.fromXml(_s.XmlElement elem) {
    return DBInstance(
      allocatedStorage: _s.extractXmlIntValue(elem, 'AllocatedStorage'),
      associatedRoles: _s.extractXmlChild(elem, 'AssociatedRoles')?.let(
          (elem) => elem
              .findElements('DBInstanceRole')
              .map((c) => DBInstanceRole.fromXml(c))
              .toList()),
      autoMinorVersionUpgrade:
          _s.extractXmlBoolValue(elem, 'AutoMinorVersionUpgrade'),
      availabilityZone: _s.extractXmlStringValue(elem, 'AvailabilityZone'),
      backupRetentionPeriod:
          _s.extractXmlIntValue(elem, 'BackupRetentionPeriod'),
      cACertificateIdentifier:
          _s.extractXmlStringValue(elem, 'CACertificateIdentifier'),
      characterSetName: _s.extractXmlStringValue(elem, 'CharacterSetName'),
      copyTagsToSnapshot: _s.extractXmlBoolValue(elem, 'CopyTagsToSnapshot'),
      customerOwnedIpEnabled:
          _s.extractXmlBoolValue(elem, 'CustomerOwnedIpEnabled'),
      dBClusterIdentifier:
          _s.extractXmlStringValue(elem, 'DBClusterIdentifier'),
      dBInstanceArn: _s.extractXmlStringValue(elem, 'DBInstanceArn'),
      dBInstanceAutomatedBackupsReplications: _s
          .extractXmlChild(elem, 'DBInstanceAutomatedBackupsReplications')
          ?.let((elem) => elem
              .findElements('DBInstanceAutomatedBackupsReplication')
              .map((c) => DBInstanceAutomatedBackupsReplication.fromXml(c))
              .toList()),
      dBInstanceClass: _s.extractXmlStringValue(elem, 'DBInstanceClass'),
      dBInstanceIdentifier:
          _s.extractXmlStringValue(elem, 'DBInstanceIdentifier'),
      dBInstanceStatus: _s.extractXmlStringValue(elem, 'DBInstanceStatus'),
      dBName: _s.extractXmlStringValue(elem, 'DBName'),
      dBParameterGroups: _s.extractXmlChild(elem, 'DBParameterGroups')?.let(
          (elem) => elem
              .findElements('DBParameterGroup')
              .map((c) => DBParameterGroupStatus.fromXml(c))
              .toList()),
      dBSecurityGroups: _s.extractXmlChild(elem, 'DBSecurityGroups')?.let(
          (elem) => elem
              .findElements('DBSecurityGroup')
              .map((c) => DBSecurityGroupMembership.fromXml(c))
              .toList()),
      dBSubnetGroup: _s
          .extractXmlChild(elem, 'DBSubnetGroup')
          ?.let((e) => DBSubnetGroup.fromXml(e)),
      dbInstancePort: _s.extractXmlIntValue(elem, 'DbInstancePort'),
      dbiResourceId: _s.extractXmlStringValue(elem, 'DbiResourceId'),
      deletionProtection: _s.extractXmlBoolValue(elem, 'DeletionProtection'),
      domainMemberships: _s.extractXmlChild(elem, 'DomainMemberships')?.let(
          (elem) => elem
              .findElements('DomainMembership')
              .map((c) => DomainMembership.fromXml(c))
              .toList()),
      enabledCloudwatchLogsExports: _s
          .extractXmlChild(elem, 'EnabledCloudwatchLogsExports')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      endpoint:
          _s.extractXmlChild(elem, 'Endpoint')?.let((e) => Endpoint.fromXml(e)),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      enhancedMonitoringResourceArn:
          _s.extractXmlStringValue(elem, 'EnhancedMonitoringResourceArn'),
      iAMDatabaseAuthenticationEnabled:
          _s.extractXmlBoolValue(elem, 'IAMDatabaseAuthenticationEnabled'),
      instanceCreateTime:
          _s.extractXmlDateTimeValue(elem, 'InstanceCreateTime'),
      iops: _s.extractXmlIntValue(elem, 'Iops'),
      kmsKeyId: _s.extractXmlStringValue(elem, 'KmsKeyId'),
      latestRestorableTime:
          _s.extractXmlDateTimeValue(elem, 'LatestRestorableTime'),
      licenseModel: _s.extractXmlStringValue(elem, 'LicenseModel'),
      listenerEndpoint: _s
          .extractXmlChild(elem, 'ListenerEndpoint')
          ?.let((e) => Endpoint.fromXml(e)),
      masterUsername: _s.extractXmlStringValue(elem, 'MasterUsername'),
      maxAllocatedStorage: _s.extractXmlIntValue(elem, 'MaxAllocatedStorage'),
      monitoringInterval: _s.extractXmlIntValue(elem, 'MonitoringInterval'),
      monitoringRoleArn: _s.extractXmlStringValue(elem, 'MonitoringRoleArn'),
      multiAZ: _s.extractXmlBoolValue(elem, 'MultiAZ'),
      ncharCharacterSetName:
          _s.extractXmlStringValue(elem, 'NcharCharacterSetName'),
      optionGroupMemberships: _s
          .extractXmlChild(elem, 'OptionGroupMemberships')
          ?.let((elem) => elem
              .findElements('OptionGroupMembership')
              .map((c) => OptionGroupMembership.fromXml(c))
              .toList()),
      pendingModifiedValues: _s
          .extractXmlChild(elem, 'PendingModifiedValues')
          ?.let((e) => PendingModifiedValues.fromXml(e)),
      performanceInsightsEnabled:
          _s.extractXmlBoolValue(elem, 'PerformanceInsightsEnabled'),
      performanceInsightsKMSKeyId:
          _s.extractXmlStringValue(elem, 'PerformanceInsightsKMSKeyId'),
      performanceInsightsRetentionPeriod:
          _s.extractXmlIntValue(elem, 'PerformanceInsightsRetentionPeriod'),
      preferredBackupWindow:
          _s.extractXmlStringValue(elem, 'PreferredBackupWindow'),
      preferredMaintenanceWindow:
          _s.extractXmlStringValue(elem, 'PreferredMaintenanceWindow'),
      processorFeatures: _s.extractXmlChild(elem, 'ProcessorFeatures')?.let(
          (elem) => elem
              .findElements('ProcessorFeature')
              .map((c) => ProcessorFeature.fromXml(c))
              .toList()),
      promotionTier: _s.extractXmlIntValue(elem, 'PromotionTier'),
      publiclyAccessible: _s.extractXmlBoolValue(elem, 'PubliclyAccessible'),
      readReplicaDBClusterIdentifiers: _s
          .extractXmlChild(elem, 'ReadReplicaDBClusterIdentifiers')
          ?.let((elem) => _s.extractXmlStringListValues(
              elem, 'ReadReplicaDBClusterIdentifier')),
      readReplicaDBInstanceIdentifiers: _s
          .extractXmlChild(elem, 'ReadReplicaDBInstanceIdentifiers')
          ?.let((elem) => _s.extractXmlStringListValues(
              elem, 'ReadReplicaDBInstanceIdentifier')),
      readReplicaSourceDBInstanceIdentifier: _s.extractXmlStringValue(
          elem, 'ReadReplicaSourceDBInstanceIdentifier'),
      replicaMode:
          _s.extractXmlStringValue(elem, 'ReplicaMode')?.toReplicaMode(),
      secondaryAvailabilityZone:
          _s.extractXmlStringValue(elem, 'SecondaryAvailabilityZone'),
      statusInfos: _s.extractXmlChild(elem, 'StatusInfos')?.let((elem) => elem
          .findElements('DBInstanceStatusInfo')
          .map((c) => DBInstanceStatusInfo.fromXml(c))
          .toList()),
      storageEncrypted: _s.extractXmlBoolValue(elem, 'StorageEncrypted'),
      storageType: _s.extractXmlStringValue(elem, 'StorageType'),
      tagList: _s.extractXmlChild(elem, 'TagList')?.let((elem) =>
          elem.findElements('Tag').map((c) => Tag.fromXml(c)).toList()),
      tdeCredentialArn: _s.extractXmlStringValue(elem, 'TdeCredentialArn'),
      timezone: _s.extractXmlStringValue(elem, 'Timezone'),
      vpcSecurityGroups: _s.extractXmlChild(elem, 'VpcSecurityGroups')?.let(
          (elem) => elem
              .findElements('VpcSecurityGroupMembership')
              .map((c) => VpcSecurityGroupMembership.fromXml(c))
              .toList()),
    );
  }
}

/// An automated backup of a DB instance. It consists of system backups,
/// transaction logs, and the database instance properties that existed at the
/// time you deleted the source instance.
class DBInstanceAutomatedBackup {
  /// Specifies the allocated storage size in gibibytes (GiB).
  final int? allocatedStorage;

  /// The Availability Zone that the automated backup was created in. For
  /// information on AWS Regions and Availability Zones, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html">Regions
  /// and Availability Zones</a>.
  final String? availabilityZone;

  /// The retention period for the automated backups.
  final int? backupRetentionPeriod;

  /// The Amazon Resource Name (ARN) for the automated backups.
  final String? dBInstanceArn;

  /// The Amazon Resource Name (ARN) for the replicated automated backups.
  final String? dBInstanceAutomatedBackupsArn;

  /// The list of replications to different AWS Regions associated with the
  /// automated backup.
  final List<DBInstanceAutomatedBackupsReplication>?
      dBInstanceAutomatedBackupsReplications;

  /// The customer id of the instance that is/was associated with the automated
  /// backup.
  final String? dBInstanceIdentifier;

  /// The identifier for the source DB instance, which can't be changed and which
  /// is unique to an AWS Region.
  final String? dbiResourceId;

  /// Specifies whether the automated backup is encrypted.
  final bool? encrypted;

  /// The name of the database engine for this automated backup.
  final String? engine;

  /// The version of the database engine for the automated backup.
  final String? engineVersion;

  /// True if mapping of AWS Identity and Access Management (IAM) accounts to
  /// database accounts is enabled, and otherwise false.
  final bool? iAMDatabaseAuthenticationEnabled;

  /// Provides the date and time that the DB instance was created.
  final DateTime? instanceCreateTime;

  /// The IOPS (I/O operations per second) value for the automated backup.
  final int? iops;

  /// The AWS KMS key ID for an automated backup.
  ///
  /// The AWS KMS key identifier is the key ARN, key ID, alias ARN, or alias name
  /// for the AWS KMS customer master key (CMK).
  final String? kmsKeyId;

  /// License model information for the automated backup.
  final String? licenseModel;

  /// The license model of an automated backup.
  final String? masterUsername;

  /// The option group the automated backup is associated with. If omitted, the
  /// default option group for the engine specified is used.
  final String? optionGroupName;

  /// The port number that the automated backup used for connections.
  ///
  /// Default: Inherits from the source DB instance
  ///
  /// Valid Values: <code>1150-65535</code>
  final int? port;

  /// The AWS Region associated with the automated backup.
  final String? region;

  /// Earliest and latest time an instance can be restored to.
  final RestoreWindow? restoreWindow;

  /// Provides a list of status information for an automated backup:
  ///
  /// <ul>
  /// <li>
  /// <code>active</code> - automated backups for current instances
  /// </li>
  /// <li>
  /// <code>retained</code> - automated backups for deleted instances
  /// </li>
  /// <li>
  /// <code>creating</code> - automated backups that are waiting for the first
  /// automated snapshot to be available.
  /// </li>
  /// </ul>
  final String? status;

  /// Specifies the storage type associated with the automated backup.
  final String? storageType;

  /// The ARN from the key store with which the automated backup is associated for
  /// TDE encryption.
  final String? tdeCredentialArn;

  /// The time zone of the automated backup. In most cases, the
  /// <code>Timezone</code> element is empty. <code>Timezone</code> content
  /// appears only for Microsoft SQL Server DB instances that were created with a
  /// time zone specified.
  final String? timezone;

  /// Provides the VPC ID associated with the DB instance
  final String? vpcId;

  DBInstanceAutomatedBackup({
    this.allocatedStorage,
    this.availabilityZone,
    this.backupRetentionPeriod,
    this.dBInstanceArn,
    this.dBInstanceAutomatedBackupsArn,
    this.dBInstanceAutomatedBackupsReplications,
    this.dBInstanceIdentifier,
    this.dbiResourceId,
    this.encrypted,
    this.engine,
    this.engineVersion,
    this.iAMDatabaseAuthenticationEnabled,
    this.instanceCreateTime,
    this.iops,
    this.kmsKeyId,
    this.licenseModel,
    this.masterUsername,
    this.optionGroupName,
    this.port,
    this.region,
    this.restoreWindow,
    this.status,
    this.storageType,
    this.tdeCredentialArn,
    this.timezone,
    this.vpcId,
  });
  factory DBInstanceAutomatedBackup.fromXml(_s.XmlElement elem) {
    return DBInstanceAutomatedBackup(
      allocatedStorage: _s.extractXmlIntValue(elem, 'AllocatedStorage'),
      availabilityZone: _s.extractXmlStringValue(elem, 'AvailabilityZone'),
      backupRetentionPeriod:
          _s.extractXmlIntValue(elem, 'BackupRetentionPeriod'),
      dBInstanceArn: _s.extractXmlStringValue(elem, 'DBInstanceArn'),
      dBInstanceAutomatedBackupsArn:
          _s.extractXmlStringValue(elem, 'DBInstanceAutomatedBackupsArn'),
      dBInstanceAutomatedBackupsReplications: _s
          .extractXmlChild(elem, 'DBInstanceAutomatedBackupsReplications')
          ?.let((elem) => elem
              .findElements('DBInstanceAutomatedBackupsReplication')
              .map((c) => DBInstanceAutomatedBackupsReplication.fromXml(c))
              .toList()),
      dBInstanceIdentifier:
          _s.extractXmlStringValue(elem, 'DBInstanceIdentifier'),
      dbiResourceId: _s.extractXmlStringValue(elem, 'DbiResourceId'),
      encrypted: _s.extractXmlBoolValue(elem, 'Encrypted'),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      iAMDatabaseAuthenticationEnabled:
          _s.extractXmlBoolValue(elem, 'IAMDatabaseAuthenticationEnabled'),
      instanceCreateTime:
          _s.extractXmlDateTimeValue(elem, 'InstanceCreateTime'),
      iops: _s.extractXmlIntValue(elem, 'Iops'),
      kmsKeyId: _s.extractXmlStringValue(elem, 'KmsKeyId'),
      licenseModel: _s.extractXmlStringValue(elem, 'LicenseModel'),
      masterUsername: _s.extractXmlStringValue(elem, 'MasterUsername'),
      optionGroupName: _s.extractXmlStringValue(elem, 'OptionGroupName'),
      port: _s.extractXmlIntValue(elem, 'Port'),
      region: _s.extractXmlStringValue(elem, 'Region'),
      restoreWindow: _s
          .extractXmlChild(elem, 'RestoreWindow')
          ?.let((e) => RestoreWindow.fromXml(e)),
      status: _s.extractXmlStringValue(elem, 'Status'),
      storageType: _s.extractXmlStringValue(elem, 'StorageType'),
      tdeCredentialArn: _s.extractXmlStringValue(elem, 'TdeCredentialArn'),
      timezone: _s.extractXmlStringValue(elem, 'Timezone'),
      vpcId: _s.extractXmlStringValue(elem, 'VpcId'),
    );
  }
}

/// Contains the result of a successful invocation of the
/// <code>DescribeDBInstanceAutomatedBackups</code> action.
class DBInstanceAutomatedBackupMessage {
  /// A list of <code>DBInstanceAutomatedBackup</code> instances.
  final List<DBInstanceAutomatedBackup>? dBInstanceAutomatedBackups;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code> .
  final String? marker;

  DBInstanceAutomatedBackupMessage({
    this.dBInstanceAutomatedBackups,
    this.marker,
  });
  factory DBInstanceAutomatedBackupMessage.fromXml(_s.XmlElement elem) {
    return DBInstanceAutomatedBackupMessage(
      dBInstanceAutomatedBackups: _s
          .extractXmlChild(elem, 'DBInstanceAutomatedBackups')
          ?.let((elem) => elem
              .findElements('DBInstanceAutomatedBackup')
              .map((c) => DBInstanceAutomatedBackup.fromXml(c))
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// Automated backups of a DB instance replicated to another AWS Region. They
/// consist of system backups, transaction logs, and database instance
/// properties.
class DBInstanceAutomatedBackupsReplication {
  /// The Amazon Resource Name (ARN) of the replicated automated backups.
  final String? dBInstanceAutomatedBackupsArn;

  DBInstanceAutomatedBackupsReplication({
    this.dBInstanceAutomatedBackupsArn,
  });
  factory DBInstanceAutomatedBackupsReplication.fromXml(_s.XmlElement elem) {
    return DBInstanceAutomatedBackupsReplication(
      dBInstanceAutomatedBackupsArn:
          _s.extractXmlStringValue(elem, 'DBInstanceAutomatedBackupsArn'),
    );
  }
}

/// Contains the result of a successful invocation of the
/// <code>DescribeDBInstances</code> action.
class DBInstanceMessage {
  /// A list of <code>DBInstance</code> instances.
  final List<DBInstance>? dBInstances;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code> .
  final String? marker;

  DBInstanceMessage({
    this.dBInstances,
    this.marker,
  });
  factory DBInstanceMessage.fromXml(_s.XmlElement elem) {
    return DBInstanceMessage(
      dBInstances: _s.extractXmlChild(elem, 'DBInstances')?.let((elem) => elem
          .findElements('DBInstance')
          .map((c) => DBInstance.fromXml(c))
          .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// Describes an AWS Identity and Access Management (IAM) role that is
/// associated with a DB instance.
class DBInstanceRole {
  /// The name of the feature associated with the AWS Identity and Access
  /// Management (IAM) role. For the list of supported feature names, see
  /// <code>DBEngineVersion</code>.
  final String? featureName;

  /// The Amazon Resource Name (ARN) of the IAM role that is associated with the
  /// DB instance.
  final String? roleArn;

  /// Describes the state of association between the IAM role and the DB instance.
  /// The Status property returns one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code> - the IAM role ARN is associated with the DB instance
  /// and can be used to access other AWS services on your behalf.
  /// </li>
  /// <li>
  /// <code>PENDING</code> - the IAM role ARN is being associated with the DB
  /// instance.
  /// </li>
  /// <li>
  /// <code>INVALID</code> - the IAM role ARN is associated with the DB instance,
  /// but the DB instance is unable to assume the IAM role in order to access
  /// other AWS services on your behalf.
  /// </li>
  /// </ul>
  final String? status;

  DBInstanceRole({
    this.featureName,
    this.roleArn,
    this.status,
  });
  factory DBInstanceRole.fromXml(_s.XmlElement elem) {
    return DBInstanceRole(
      featureName: _s.extractXmlStringValue(elem, 'FeatureName'),
      roleArn: _s.extractXmlStringValue(elem, 'RoleArn'),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }
}

/// Provides a list of status information for a DB instance.
class DBInstanceStatusInfo {
  /// Details of the error if there is an error for the instance. If the instance
  /// isn't in an error state, this value is blank.
  final String? message;

  /// Boolean value that is true if the instance is operating normally, or false
  /// if the instance is in an error state.
  final bool? normal;

  /// Status of the DB instance. For a StatusType of read replica, the values can
  /// be replicating, replication stop point set, replication stop point reached,
  /// error, stopped, or terminated.
  final String? status;

  /// This value is currently "read replication."
  final String? statusType;

  DBInstanceStatusInfo({
    this.message,
    this.normal,
    this.status,
    this.statusType,
  });
  factory DBInstanceStatusInfo.fromXml(_s.XmlElement elem) {
    return DBInstanceStatusInfo(
      message: _s.extractXmlStringValue(elem, 'Message'),
      normal: _s.extractXmlBoolValue(elem, 'Normal'),
      status: _s.extractXmlStringValue(elem, 'Status'),
      statusType: _s.extractXmlStringValue(elem, 'StatusType'),
    );
  }
}

/// Contains the details of an Amazon RDS DB parameter group.
///
/// This data type is used as a response element in the
/// <code>DescribeDBParameterGroups</code> action.
class DBParameterGroup {
  /// The Amazon Resource Name (ARN) for the DB parameter group.
  final String? dBParameterGroupArn;

  /// The name of the DB parameter group family that this DB parameter group is
  /// compatible with.
  final String? dBParameterGroupFamily;

  /// The name of the DB parameter group.
  final String? dBParameterGroupName;

  /// Provides the customer-specified description for this DB parameter group.
  final String? description;

  DBParameterGroup({
    this.dBParameterGroupArn,
    this.dBParameterGroupFamily,
    this.dBParameterGroupName,
    this.description,
  });
  factory DBParameterGroup.fromXml(_s.XmlElement elem) {
    return DBParameterGroup(
      dBParameterGroupArn:
          _s.extractXmlStringValue(elem, 'DBParameterGroupArn'),
      dBParameterGroupFamily:
          _s.extractXmlStringValue(elem, 'DBParameterGroupFamily'),
      dBParameterGroupName:
          _s.extractXmlStringValue(elem, 'DBParameterGroupName'),
      description: _s.extractXmlStringValue(elem, 'Description'),
    );
  }
}

/// Contains the result of a successful invocation of the
/// <code>DescribeDBParameters</code> action.
class DBParameterGroupDetails {
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String? marker;

  /// A list of <code>Parameter</code> values.
  final List<Parameter>? parameters;

  DBParameterGroupDetails({
    this.marker,
    this.parameters,
  });
  factory DBParameterGroupDetails.fromXml(_s.XmlElement elem) {
    return DBParameterGroupDetails(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      parameters: _s.extractXmlChild(elem, 'Parameters')?.let((elem) => elem
          .findElements('Parameter')
          .map((c) => Parameter.fromXml(c))
          .toList()),
    );
  }
}

/// Contains the result of a successful invocation of the
/// <code>ModifyDBParameterGroup</code> or <code>ResetDBParameterGroup</code>
/// action.
class DBParameterGroupNameMessage {
  /// The name of the DB parameter group.
  final String? dBParameterGroupName;

  DBParameterGroupNameMessage({
    this.dBParameterGroupName,
  });
  factory DBParameterGroupNameMessage.fromXml(_s.XmlElement elem) {
    return DBParameterGroupNameMessage(
      dBParameterGroupName:
          _s.extractXmlStringValue(elem, 'DBParameterGroupName'),
    );
  }
}

/// The status of the DB parameter group.
///
/// This data type is used as a response element in the following actions:
///
/// <ul>
/// <li>
/// <code>CreateDBInstance</code>
/// </li>
/// <li>
/// <code>CreateDBInstanceReadReplica</code>
/// </li>
/// <li>
/// <code>DeleteDBInstance</code>
/// </li>
/// <li>
/// <code>ModifyDBInstance</code>
/// </li>
/// <li>
/// <code>RebootDBInstance</code>
/// </li>
/// <li>
/// <code>RestoreDBInstanceFromDBSnapshot</code>
/// </li>
/// </ul>
class DBParameterGroupStatus {
  /// The name of the DB parameter group.
  final String? dBParameterGroupName;

  /// The status of parameter updates.
  final String? parameterApplyStatus;

  DBParameterGroupStatus({
    this.dBParameterGroupName,
    this.parameterApplyStatus,
  });
  factory DBParameterGroupStatus.fromXml(_s.XmlElement elem) {
    return DBParameterGroupStatus(
      dBParameterGroupName:
          _s.extractXmlStringValue(elem, 'DBParameterGroupName'),
      parameterApplyStatus:
          _s.extractXmlStringValue(elem, 'ParameterApplyStatus'),
    );
  }
}

/// Contains the result of a successful invocation of the
/// <code>DescribeDBParameterGroups</code> action.
class DBParameterGroupsMessage {
  /// A list of <code>DBParameterGroup</code> instances.
  final List<DBParameterGroup>? dBParameterGroups;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String? marker;

  DBParameterGroupsMessage({
    this.dBParameterGroups,
    this.marker,
  });
  factory DBParameterGroupsMessage.fromXml(_s.XmlElement elem) {
    return DBParameterGroupsMessage(
      dBParameterGroups: _s.extractXmlChild(elem, 'DBParameterGroups')?.let(
          (elem) => elem
              .findElements('DBParameterGroup')
              .map((c) => DBParameterGroup.fromXml(c))
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// The data structure representing a proxy managed by the RDS Proxy.
///
/// This data type is used as a response element in the
/// <code>DescribeDBProxies</code> action.
class DBProxy {
  /// One or more data structures specifying the authorization mechanism to
  /// connect to the associated RDS DB instance or Aurora DB cluster.
  final List<UserAuthConfigInfo>? auth;

  /// The date and time when the proxy was first created.
  final DateTime? createdDate;

  /// The Amazon Resource Name (ARN) for the proxy.
  final String? dBProxyArn;

  /// The identifier for the proxy. This name must be unique for all proxies owned
  /// by your AWS account in the specified AWS Region.
  final String? dBProxyName;

  /// Whether the proxy includes detailed information about SQL statements in its
  /// logs. This information helps you to debug issues involving SQL behavior or
  /// the performance and scalability of the proxy connections. The debug
  /// information includes the text of SQL statements that you submit through the
  /// proxy. Thus, only enable this setting when needed for debugging, and only
  /// when you have security measures in place to safeguard any sensitive
  /// information that appears in the logs.
  final bool? debugLogging;

  /// The endpoint that you can use to connect to the proxy. You include the
  /// endpoint value in the connection string for a database client application.
  final String? endpoint;

  /// The engine family applies to MySQL and PostgreSQL for both RDS and Aurora.
  final String? engineFamily;

  /// The number of seconds a connection to the proxy can have no activity before
  /// the proxy drops the client connection. The proxy keeps the underlying
  /// database connection open and puts it back into the connection pool for reuse
  /// by later connection requests.
  ///
  /// Default: 1800 (30 minutes)
  ///
  /// Constraints: 1 to 28,800
  final int? idleClientTimeout;

  /// Indicates whether Transport Layer Security (TLS) encryption is required for
  /// connections to the proxy.
  final bool? requireTLS;

  /// The Amazon Resource Name (ARN) for the IAM role that the proxy uses to
  /// access Amazon Secrets Manager.
  final String? roleArn;

  /// The current status of this proxy. A status of <code>available</code> means
  /// the proxy is ready to handle requests. Other values indicate that you must
  /// wait for the proxy to be ready, or take some action to resolve an issue.
  final DBProxyStatus? status;

  /// The date and time when the proxy was last updated.
  final DateTime? updatedDate;

  /// Provides a list of VPC security groups that the proxy belongs to.
  final List<String>? vpcSecurityGroupIds;

  /// The EC2 subnet IDs for the proxy.
  final List<String>? vpcSubnetIds;

  DBProxy({
    this.auth,
    this.createdDate,
    this.dBProxyArn,
    this.dBProxyName,
    this.debugLogging,
    this.endpoint,
    this.engineFamily,
    this.idleClientTimeout,
    this.requireTLS,
    this.roleArn,
    this.status,
    this.updatedDate,
    this.vpcSecurityGroupIds,
    this.vpcSubnetIds,
  });
  factory DBProxy.fromXml(_s.XmlElement elem) {
    return DBProxy(
      auth: _s.extractXmlChild(elem, 'Auth')?.let((elem) => elem
          .findElements('member')
          .map((c) => UserAuthConfigInfo.fromXml(c))
          .toList()),
      createdDate: _s.extractXmlDateTimeValue(elem, 'CreatedDate'),
      dBProxyArn: _s.extractXmlStringValue(elem, 'DBProxyArn'),
      dBProxyName: _s.extractXmlStringValue(elem, 'DBProxyName'),
      debugLogging: _s.extractXmlBoolValue(elem, 'DebugLogging'),
      endpoint: _s.extractXmlStringValue(elem, 'Endpoint'),
      engineFamily: _s.extractXmlStringValue(elem, 'EngineFamily'),
      idleClientTimeout: _s.extractXmlIntValue(elem, 'IdleClientTimeout'),
      requireTLS: _s.extractXmlBoolValue(elem, 'RequireTLS'),
      roleArn: _s.extractXmlStringValue(elem, 'RoleArn'),
      status: _s.extractXmlStringValue(elem, 'Status')?.toDBProxyStatus(),
      updatedDate: _s.extractXmlDateTimeValue(elem, 'UpdatedDate'),
      vpcSecurityGroupIds: _s
          .extractXmlChild(elem, 'VpcSecurityGroupIds')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      vpcSubnetIds: _s
          .extractXmlChild(elem, 'VpcSubnetIds')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }
}

enum DBProxyStatus {
  available,
  modifying,
  incompatibleNetwork,
  insufficientResourceLimits,
  creating,
  deleting,
  suspended,
  suspending,
  reactivating,
}

extension on DBProxyStatus {
  String toValue() {
    switch (this) {
      case DBProxyStatus.available:
        return 'available';
      case DBProxyStatus.modifying:
        return 'modifying';
      case DBProxyStatus.incompatibleNetwork:
        return 'incompatible-network';
      case DBProxyStatus.insufficientResourceLimits:
        return 'insufficient-resource-limits';
      case DBProxyStatus.creating:
        return 'creating';
      case DBProxyStatus.deleting:
        return 'deleting';
      case DBProxyStatus.suspended:
        return 'suspended';
      case DBProxyStatus.suspending:
        return 'suspending';
      case DBProxyStatus.reactivating:
        return 'reactivating';
    }
  }
}

extension on String {
  DBProxyStatus toDBProxyStatus() {
    switch (this) {
      case 'available':
        return DBProxyStatus.available;
      case 'modifying':
        return DBProxyStatus.modifying;
      case 'incompatible-network':
        return DBProxyStatus.incompatibleNetwork;
      case 'insufficient-resource-limits':
        return DBProxyStatus.insufficientResourceLimits;
      case 'creating':
        return DBProxyStatus.creating;
      case 'deleting':
        return DBProxyStatus.deleting;
      case 'suspended':
        return DBProxyStatus.suspended;
      case 'suspending':
        return DBProxyStatus.suspending;
      case 'reactivating':
        return DBProxyStatus.reactivating;
    }
    throw Exception('$this is not known in enum DBProxyStatus');
  }
}

/// Contains the details for an RDS Proxy target. It represents an RDS DB
/// instance or Aurora DB cluster that the proxy can connect to. One or more
/// targets are associated with an RDS Proxy target group.
///
/// This data type is used as a response element in the
/// <code>DescribeDBProxyTargets</code> action.
class DBProxyTarget {
  /// The writer endpoint for the RDS DB instance or Aurora DB cluster.
  final String? endpoint;

  /// The port that the RDS Proxy uses to connect to the target RDS DB instance or
  /// Aurora DB cluster.
  final int? port;

  /// The identifier representing the target. It can be the instance identifier
  /// for an RDS DB instance, or the cluster identifier for an Aurora DB cluster.
  final String? rdsResourceId;

  /// The Amazon Resource Name (ARN) for the RDS DB instance or Aurora DB cluster.
  final String? targetArn;

  /// Information about the connection health of the RDS Proxy target.
  final TargetHealth? targetHealth;

  /// The DB cluster identifier when the target represents an Aurora DB cluster.
  /// This field is blank when the target represents an RDS DB instance.
  final String? trackedClusterId;

  /// Specifies the kind of database, such as an RDS DB instance or an Aurora DB
  /// cluster, that the target represents.
  final TargetType? type;

  DBProxyTarget({
    this.endpoint,
    this.port,
    this.rdsResourceId,
    this.targetArn,
    this.targetHealth,
    this.trackedClusterId,
    this.type,
  });
  factory DBProxyTarget.fromXml(_s.XmlElement elem) {
    return DBProxyTarget(
      endpoint: _s.extractXmlStringValue(elem, 'Endpoint'),
      port: _s.extractXmlIntValue(elem, 'Port'),
      rdsResourceId: _s.extractXmlStringValue(elem, 'RdsResourceId'),
      targetArn: _s.extractXmlStringValue(elem, 'TargetArn'),
      targetHealth: _s
          .extractXmlChild(elem, 'TargetHealth')
          ?.let((e) => TargetHealth.fromXml(e)),
      trackedClusterId: _s.extractXmlStringValue(elem, 'TrackedClusterId'),
      type: _s.extractXmlStringValue(elem, 'Type')?.toTargetType(),
    );
  }
}

/// Represents a set of RDS DB instances, Aurora DB clusters, or both that a
/// proxy can connect to. Currently, each target group is associated with
/// exactly one RDS DB instance or Aurora DB cluster.
///
/// This data type is used as a response element in the
/// <code>DescribeDBProxyTargetGroups</code> action.
class DBProxyTargetGroup {
  /// The settings that determine the size and behavior of the connection pool for
  /// the target group.
  final ConnectionPoolConfigurationInfo? connectionPoolConfig;

  /// The date and time when the target group was first created.
  final DateTime? createdDate;

  /// The identifier for the RDS proxy associated with this target group.
  final String? dBProxyName;

  /// Whether this target group is the first one used for connection requests by
  /// the associated proxy. Because each proxy is currently associated with a
  /// single target group, currently this setting is always <code>true</code>.
  final bool? isDefault;

  /// The current status of this target group. A status of <code>available</code>
  /// means the target group is correctly associated with a database. Other values
  /// indicate that you must wait for the target group to be ready, or take some
  /// action to resolve an issue.
  final String? status;

  /// The Amazon Resource Name (ARN) representing the target group.
  final String? targetGroupArn;

  /// The identifier for the target group. This name must be unique for all target
  /// groups owned by your AWS account in the specified AWS Region.
  final String? targetGroupName;

  /// The date and time when the target group was last updated.
  final DateTime? updatedDate;

  DBProxyTargetGroup({
    this.connectionPoolConfig,
    this.createdDate,
    this.dBProxyName,
    this.isDefault,
    this.status,
    this.targetGroupArn,
    this.targetGroupName,
    this.updatedDate,
  });
  factory DBProxyTargetGroup.fromXml(_s.XmlElement elem) {
    return DBProxyTargetGroup(
      connectionPoolConfig: _s
          .extractXmlChild(elem, 'ConnectionPoolConfig')
          ?.let((e) => ConnectionPoolConfigurationInfo.fromXml(e)),
      createdDate: _s.extractXmlDateTimeValue(elem, 'CreatedDate'),
      dBProxyName: _s.extractXmlStringValue(elem, 'DBProxyName'),
      isDefault: _s.extractXmlBoolValue(elem, 'IsDefault'),
      status: _s.extractXmlStringValue(elem, 'Status'),
      targetGroupArn: _s.extractXmlStringValue(elem, 'TargetGroupArn'),
      targetGroupName: _s.extractXmlStringValue(elem, 'TargetGroupName'),
      updatedDate: _s.extractXmlDateTimeValue(elem, 'UpdatedDate'),
    );
  }
}

/// Contains the details for an Amazon RDS DB security group.
///
/// This data type is used as a response element in the
/// <code>DescribeDBSecurityGroups</code> action.
class DBSecurityGroup {
  /// The Amazon Resource Name (ARN) for the DB security group.
  final String? dBSecurityGroupArn;

  /// Provides the description of the DB security group.
  final String? dBSecurityGroupDescription;

  /// Specifies the name of the DB security group.
  final String? dBSecurityGroupName;

  /// Contains a list of <code>EC2SecurityGroup</code> elements.
  final List<EC2SecurityGroup>? eC2SecurityGroups;

  /// Contains a list of <code>IPRange</code> elements.
  final List<IPRange>? iPRanges;

  /// Provides the AWS ID of the owner of a specific DB security group.
  final String? ownerId;

  /// Provides the VpcId of the DB security group.
  final String? vpcId;

  DBSecurityGroup({
    this.dBSecurityGroupArn,
    this.dBSecurityGroupDescription,
    this.dBSecurityGroupName,
    this.eC2SecurityGroups,
    this.iPRanges,
    this.ownerId,
    this.vpcId,
  });
  factory DBSecurityGroup.fromXml(_s.XmlElement elem) {
    return DBSecurityGroup(
      dBSecurityGroupArn: _s.extractXmlStringValue(elem, 'DBSecurityGroupArn'),
      dBSecurityGroupDescription:
          _s.extractXmlStringValue(elem, 'DBSecurityGroupDescription'),
      dBSecurityGroupName:
          _s.extractXmlStringValue(elem, 'DBSecurityGroupName'),
      eC2SecurityGroups: _s.extractXmlChild(elem, 'EC2SecurityGroups')?.let(
          (elem) => elem
              .findElements('EC2SecurityGroup')
              .map((c) => EC2SecurityGroup.fromXml(c))
              .toList()),
      iPRanges: _s.extractXmlChild(elem, 'IPRanges')?.let((elem) =>
          elem.findElements('IPRange').map((c) => IPRange.fromXml(c)).toList()),
      ownerId: _s.extractXmlStringValue(elem, 'OwnerId'),
      vpcId: _s.extractXmlStringValue(elem, 'VpcId'),
    );
  }
}

/// This data type is used as a response element in the following actions:
///
/// <ul>
/// <li>
/// <code>ModifyDBInstance</code>
/// </li>
/// <li>
/// <code>RebootDBInstance</code>
/// </li>
/// <li>
/// <code>RestoreDBInstanceFromDBSnapshot</code>
/// </li>
/// <li>
/// <code>RestoreDBInstanceToPointInTime</code>
/// </li>
/// </ul>
class DBSecurityGroupMembership {
  /// The name of the DB security group.
  final String? dBSecurityGroupName;

  /// The status of the DB security group.
  final String? status;

  DBSecurityGroupMembership({
    this.dBSecurityGroupName,
    this.status,
  });
  factory DBSecurityGroupMembership.fromXml(_s.XmlElement elem) {
    return DBSecurityGroupMembership(
      dBSecurityGroupName:
          _s.extractXmlStringValue(elem, 'DBSecurityGroupName'),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }
}

/// Contains the result of a successful invocation of the
/// <code>DescribeDBSecurityGroups</code> action.
class DBSecurityGroupMessage {
  /// A list of <code>DBSecurityGroup</code> instances.
  final List<DBSecurityGroup>? dBSecurityGroups;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String? marker;

  DBSecurityGroupMessage({
    this.dBSecurityGroups,
    this.marker,
  });
  factory DBSecurityGroupMessage.fromXml(_s.XmlElement elem) {
    return DBSecurityGroupMessage(
      dBSecurityGroups: _s.extractXmlChild(elem, 'DBSecurityGroups')?.let(
          (elem) => elem
              .findElements('DBSecurityGroup')
              .map((c) => DBSecurityGroup.fromXml(c))
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// Contains the details of an Amazon RDS DB snapshot.
///
/// This data type is used as a response element in the
/// <code>DescribeDBSnapshots</code> action.
class DBSnapshot {
  /// Specifies the allocated storage size in gibibytes (GiB).
  final int? allocatedStorage;

  /// Specifies the name of the Availability Zone the DB instance was located in
  /// at the time of the DB snapshot.
  final String? availabilityZone;

  /// Specifies the DB instance identifier of the DB instance this DB snapshot was
  /// created from.
  final String? dBInstanceIdentifier;

  /// The Amazon Resource Name (ARN) for the DB snapshot.
  final String? dBSnapshotArn;

  /// Specifies the identifier for the DB snapshot.
  final String? dBSnapshotIdentifier;

  /// The identifier for the source DB instance, which can't be changed and which
  /// is unique to an AWS Region.
  final String? dbiResourceId;

  /// Specifies whether the DB snapshot is encrypted.
  final bool? encrypted;

  /// Specifies the name of the database engine.
  final String? engine;

  /// Specifies the version of the database engine.
  final String? engineVersion;

  /// True if mapping of AWS Identity and Access Management (IAM) accounts to
  /// database accounts is enabled, and otherwise false.
  final bool? iAMDatabaseAuthenticationEnabled;

  /// Specifies the time in Coordinated Universal Time (UTC) when the DB instance,
  /// from which the snapshot was taken, was created.
  final DateTime? instanceCreateTime;

  /// Specifies the Provisioned IOPS (I/O operations per second) value of the DB
  /// instance at the time of the snapshot.
  final int? iops;

  /// If <code>Encrypted</code> is true, the AWS KMS key identifier for the
  /// encrypted DB snapshot.
  ///
  /// The AWS KMS key identifier is the key ARN, key ID, alias ARN, or alias name
  /// for the AWS KMS customer master key (CMK).
  final String? kmsKeyId;

  /// License model information for the restored DB instance.
  final String? licenseModel;

  /// Provides the master username for the DB snapshot.
  final String? masterUsername;

  /// Provides the option group name for the DB snapshot.
  final String? optionGroupName;

  /// The percentage of the estimated data that has been transferred.
  final int? percentProgress;

  /// Specifies the port that the database engine was listening on at the time of
  /// the snapshot.
  final int? port;

  /// The number of CPU cores and the number of threads per core for the DB
  /// instance class of the DB instance when the DB snapshot was created.
  final List<ProcessorFeature>? processorFeatures;

  /// Specifies when the snapshot was taken in Coordinated Universal Time (UTC).
  final DateTime? snapshotCreateTime;

  /// Provides the type of the DB snapshot.
  final String? snapshotType;

  /// The DB snapshot Amazon Resource Name (ARN) that the DB snapshot was copied
  /// from. It only has value in case of cross-customer or cross-region copy.
  final String? sourceDBSnapshotIdentifier;

  /// The AWS Region that the DB snapshot was created in or copied from.
  final String? sourceRegion;

  /// Specifies the status of this DB snapshot.
  final String? status;

  /// Specifies the storage type associated with DB snapshot.
  final String? storageType;
  final List<Tag>? tagList;

  /// The ARN from the key store with which to associate the instance for TDE
  /// encryption.
  final String? tdeCredentialArn;

  /// The time zone of the DB snapshot. In most cases, the <code>Timezone</code>
  /// element is empty. <code>Timezone</code> content appears only for snapshots
  /// taken from Microsoft SQL Server DB instances that were created with a time
  /// zone specified.
  final String? timezone;

  /// Provides the VPC ID associated with the DB snapshot.
  final String? vpcId;

  DBSnapshot({
    this.allocatedStorage,
    this.availabilityZone,
    this.dBInstanceIdentifier,
    this.dBSnapshotArn,
    this.dBSnapshotIdentifier,
    this.dbiResourceId,
    this.encrypted,
    this.engine,
    this.engineVersion,
    this.iAMDatabaseAuthenticationEnabled,
    this.instanceCreateTime,
    this.iops,
    this.kmsKeyId,
    this.licenseModel,
    this.masterUsername,
    this.optionGroupName,
    this.percentProgress,
    this.port,
    this.processorFeatures,
    this.snapshotCreateTime,
    this.snapshotType,
    this.sourceDBSnapshotIdentifier,
    this.sourceRegion,
    this.status,
    this.storageType,
    this.tagList,
    this.tdeCredentialArn,
    this.timezone,
    this.vpcId,
  });
  factory DBSnapshot.fromXml(_s.XmlElement elem) {
    return DBSnapshot(
      allocatedStorage: _s.extractXmlIntValue(elem, 'AllocatedStorage'),
      availabilityZone: _s.extractXmlStringValue(elem, 'AvailabilityZone'),
      dBInstanceIdentifier:
          _s.extractXmlStringValue(elem, 'DBInstanceIdentifier'),
      dBSnapshotArn: _s.extractXmlStringValue(elem, 'DBSnapshotArn'),
      dBSnapshotIdentifier:
          _s.extractXmlStringValue(elem, 'DBSnapshotIdentifier'),
      dbiResourceId: _s.extractXmlStringValue(elem, 'DbiResourceId'),
      encrypted: _s.extractXmlBoolValue(elem, 'Encrypted'),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      iAMDatabaseAuthenticationEnabled:
          _s.extractXmlBoolValue(elem, 'IAMDatabaseAuthenticationEnabled'),
      instanceCreateTime:
          _s.extractXmlDateTimeValue(elem, 'InstanceCreateTime'),
      iops: _s.extractXmlIntValue(elem, 'Iops'),
      kmsKeyId: _s.extractXmlStringValue(elem, 'KmsKeyId'),
      licenseModel: _s.extractXmlStringValue(elem, 'LicenseModel'),
      masterUsername: _s.extractXmlStringValue(elem, 'MasterUsername'),
      optionGroupName: _s.extractXmlStringValue(elem, 'OptionGroupName'),
      percentProgress: _s.extractXmlIntValue(elem, 'PercentProgress'),
      port: _s.extractXmlIntValue(elem, 'Port'),
      processorFeatures: _s.extractXmlChild(elem, 'ProcessorFeatures')?.let(
          (elem) => elem
              .findElements('ProcessorFeature')
              .map((c) => ProcessorFeature.fromXml(c))
              .toList()),
      snapshotCreateTime:
          _s.extractXmlDateTimeValue(elem, 'SnapshotCreateTime'),
      snapshotType: _s.extractXmlStringValue(elem, 'SnapshotType'),
      sourceDBSnapshotIdentifier:
          _s.extractXmlStringValue(elem, 'SourceDBSnapshotIdentifier'),
      sourceRegion: _s.extractXmlStringValue(elem, 'SourceRegion'),
      status: _s.extractXmlStringValue(elem, 'Status'),
      storageType: _s.extractXmlStringValue(elem, 'StorageType'),
      tagList: _s.extractXmlChild(elem, 'TagList')?.let((elem) =>
          elem.findElements('Tag').map((c) => Tag.fromXml(c)).toList()),
      tdeCredentialArn: _s.extractXmlStringValue(elem, 'TdeCredentialArn'),
      timezone: _s.extractXmlStringValue(elem, 'Timezone'),
      vpcId: _s.extractXmlStringValue(elem, 'VpcId'),
    );
  }
}

/// Contains the name and values of a manual DB snapshot attribute
///
/// Manual DB snapshot attributes are used to authorize other AWS accounts to
/// restore a manual DB snapshot. For more information, see the
/// <code>ModifyDBSnapshotAttribute</code> API.
class DBSnapshotAttribute {
  /// The name of the manual DB snapshot attribute.
  ///
  /// The attribute named <code>restore</code> refers to the list of AWS accounts
  /// that have permission to copy or restore the manual DB cluster snapshot. For
  /// more information, see the <code>ModifyDBSnapshotAttribute</code> API action.
  final String? attributeName;

  /// The value or values for the manual DB snapshot attribute.
  ///
  /// If the <code>AttributeName</code> field is set to <code>restore</code>, then
  /// this element returns a list of IDs of the AWS accounts that are authorized
  /// to copy or restore the manual DB snapshot. If a value of <code>all</code> is
  /// in the list, then the manual DB snapshot is public and available for any AWS
  /// account to copy or restore.
  final List<String>? attributeValues;

  DBSnapshotAttribute({
    this.attributeName,
    this.attributeValues,
  });
  factory DBSnapshotAttribute.fromXml(_s.XmlElement elem) {
    return DBSnapshotAttribute(
      attributeName: _s.extractXmlStringValue(elem, 'AttributeName'),
      attributeValues: _s.extractXmlChild(elem, 'AttributeValues')?.let(
          (elem) => _s.extractXmlStringListValues(elem, 'AttributeValue')),
    );
  }
}

/// Contains the results of a successful call to the
/// <code>DescribeDBSnapshotAttributes</code> API action.
///
/// Manual DB snapshot attributes are used to authorize other AWS accounts to
/// copy or restore a manual DB snapshot. For more information, see the
/// <code>ModifyDBSnapshotAttribute</code> API action.
class DBSnapshotAttributesResult {
  /// The list of attributes and values for the manual DB snapshot.
  final List<DBSnapshotAttribute>? dBSnapshotAttributes;

  /// The identifier of the manual DB snapshot that the attributes apply to.
  final String? dBSnapshotIdentifier;

  DBSnapshotAttributesResult({
    this.dBSnapshotAttributes,
    this.dBSnapshotIdentifier,
  });
  factory DBSnapshotAttributesResult.fromXml(_s.XmlElement elem) {
    return DBSnapshotAttributesResult(
      dBSnapshotAttributes: _s
          .extractXmlChild(elem, 'DBSnapshotAttributes')
          ?.let((elem) => elem
              .findElements('DBSnapshotAttribute')
              .map((c) => DBSnapshotAttribute.fromXml(c))
              .toList()),
      dBSnapshotIdentifier:
          _s.extractXmlStringValue(elem, 'DBSnapshotIdentifier'),
    );
  }
}

/// Contains the result of a successful invocation of the
/// <code>DescribeDBSnapshots</code> action.
class DBSnapshotMessage {
  /// A list of <code>DBSnapshot</code> instances.
  final List<DBSnapshot>? dBSnapshots;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String? marker;

  DBSnapshotMessage({
    this.dBSnapshots,
    this.marker,
  });
  factory DBSnapshotMessage.fromXml(_s.XmlElement elem) {
    return DBSnapshotMessage(
      dBSnapshots: _s.extractXmlChild(elem, 'DBSnapshots')?.let((elem) => elem
          .findElements('DBSnapshot')
          .map((c) => DBSnapshot.fromXml(c))
          .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// Contains the details of an Amazon RDS DB subnet group.
///
/// This data type is used as a response element in the
/// <code>DescribeDBSubnetGroups</code> action.
class DBSubnetGroup {
  /// The Amazon Resource Name (ARN) for the DB subnet group.
  final String? dBSubnetGroupArn;

  /// Provides the description of the DB subnet group.
  final String? dBSubnetGroupDescription;

  /// The name of the DB subnet group.
  final String? dBSubnetGroupName;

  /// Provides the status of the DB subnet group.
  final String? subnetGroupStatus;

  /// Contains a list of <code>Subnet</code> elements.
  final List<Subnet>? subnets;

  /// Provides the VpcId of the DB subnet group.
  final String? vpcId;

  DBSubnetGroup({
    this.dBSubnetGroupArn,
    this.dBSubnetGroupDescription,
    this.dBSubnetGroupName,
    this.subnetGroupStatus,
    this.subnets,
    this.vpcId,
  });
  factory DBSubnetGroup.fromXml(_s.XmlElement elem) {
    return DBSubnetGroup(
      dBSubnetGroupArn: _s.extractXmlStringValue(elem, 'DBSubnetGroupArn'),
      dBSubnetGroupDescription:
          _s.extractXmlStringValue(elem, 'DBSubnetGroupDescription'),
      dBSubnetGroupName: _s.extractXmlStringValue(elem, 'DBSubnetGroupName'),
      subnetGroupStatus: _s.extractXmlStringValue(elem, 'SubnetGroupStatus'),
      subnets: _s.extractXmlChild(elem, 'Subnets')?.let((elem) =>
          elem.findElements('Subnet').map((c) => Subnet.fromXml(c)).toList()),
      vpcId: _s.extractXmlStringValue(elem, 'VpcId'),
    );
  }
}

/// Contains the result of a successful invocation of the
/// <code>DescribeDBSubnetGroups</code> action.
class DBSubnetGroupMessage {
  /// A list of <code>DBSubnetGroup</code> instances.
  final List<DBSubnetGroup>? dBSubnetGroups;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String? marker;

  DBSubnetGroupMessage({
    this.dBSubnetGroups,
    this.marker,
  });
  factory DBSubnetGroupMessage.fromXml(_s.XmlElement elem) {
    return DBSubnetGroupMessage(
      dBSubnetGroups: _s.extractXmlChild(elem, 'DBSubnetGroups')?.let((elem) =>
          elem
              .findElements('DBSubnetGroup')
              .map((c) => DBSubnetGroup.fromXml(c))
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

class DeleteCustomAvailabilityZoneResult {
  final CustomAvailabilityZone? customAvailabilityZone;

  DeleteCustomAvailabilityZoneResult({
    this.customAvailabilityZone,
  });
  factory DeleteCustomAvailabilityZoneResult.fromXml(_s.XmlElement elem) {
    return DeleteCustomAvailabilityZoneResult(
      customAvailabilityZone: _s
          .extractXmlChild(elem, 'CustomAvailabilityZone')
          ?.let((e) => CustomAvailabilityZone.fromXml(e)),
    );
  }
}

class DeleteDBClusterResult {
  final DBCluster? dBCluster;

  DeleteDBClusterResult({
    this.dBCluster,
  });
  factory DeleteDBClusterResult.fromXml(_s.XmlElement elem) {
    return DeleteDBClusterResult(
      dBCluster: _s
          .extractXmlChild(elem, 'DBCluster')
          ?.let((e) => DBCluster.fromXml(e)),
    );
  }
}

class DeleteDBClusterSnapshotResult {
  final DBClusterSnapshot? dBClusterSnapshot;

  DeleteDBClusterSnapshotResult({
    this.dBClusterSnapshot,
  });
  factory DeleteDBClusterSnapshotResult.fromXml(_s.XmlElement elem) {
    return DeleteDBClusterSnapshotResult(
      dBClusterSnapshot: _s
          .extractXmlChild(elem, 'DBClusterSnapshot')
          ?.let((e) => DBClusterSnapshot.fromXml(e)),
    );
  }
}

class DeleteDBInstanceAutomatedBackupResult {
  final DBInstanceAutomatedBackup? dBInstanceAutomatedBackup;

  DeleteDBInstanceAutomatedBackupResult({
    this.dBInstanceAutomatedBackup,
  });
  factory DeleteDBInstanceAutomatedBackupResult.fromXml(_s.XmlElement elem) {
    return DeleteDBInstanceAutomatedBackupResult(
      dBInstanceAutomatedBackup: _s
          .extractXmlChild(elem, 'DBInstanceAutomatedBackup')
          ?.let((e) => DBInstanceAutomatedBackup.fromXml(e)),
    );
  }
}

class DeleteDBInstanceResult {
  final DBInstance? dBInstance;

  DeleteDBInstanceResult({
    this.dBInstance,
  });
  factory DeleteDBInstanceResult.fromXml(_s.XmlElement elem) {
    return DeleteDBInstanceResult(
      dBInstance: _s
          .extractXmlChild(elem, 'DBInstance')
          ?.let((e) => DBInstance.fromXml(e)),
    );
  }
}

class DeleteDBProxyResponse {
  /// The data structure representing the details of the DB proxy that you delete.
  final DBProxy? dBProxy;

  DeleteDBProxyResponse({
    this.dBProxy,
  });
  factory DeleteDBProxyResponse.fromXml(_s.XmlElement elem) {
    return DeleteDBProxyResponse(
      dBProxy:
          _s.extractXmlChild(elem, 'DBProxy')?.let((e) => DBProxy.fromXml(e)),
    );
  }
}

class DeleteDBSnapshotResult {
  final DBSnapshot? dBSnapshot;

  DeleteDBSnapshotResult({
    this.dBSnapshot,
  });
  factory DeleteDBSnapshotResult.fromXml(_s.XmlElement elem) {
    return DeleteDBSnapshotResult(
      dBSnapshot: _s
          .extractXmlChild(elem, 'DBSnapshot')
          ?.let((e) => DBSnapshot.fromXml(e)),
    );
  }
}

class DeleteEventSubscriptionResult {
  final EventSubscription? eventSubscription;

  DeleteEventSubscriptionResult({
    this.eventSubscription,
  });
  factory DeleteEventSubscriptionResult.fromXml(_s.XmlElement elem) {
    return DeleteEventSubscriptionResult(
      eventSubscription: _s
          .extractXmlChild(elem, 'EventSubscription')
          ?.let((e) => EventSubscription.fromXml(e)),
    );
  }
}

class DeleteGlobalClusterResult {
  final GlobalCluster? globalCluster;

  DeleteGlobalClusterResult({
    this.globalCluster,
  });
  factory DeleteGlobalClusterResult.fromXml(_s.XmlElement elem) {
    return DeleteGlobalClusterResult(
      globalCluster: _s
          .extractXmlChild(elem, 'GlobalCluster')
          ?.let((e) => GlobalCluster.fromXml(e)),
    );
  }
}

class DeregisterDBProxyTargetsResponse {
  DeregisterDBProxyTargetsResponse();
  factory DeregisterDBProxyTargetsResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeregisterDBProxyTargetsResponse();
  }
}

class DescribeDBClusterSnapshotAttributesResult {
  final DBClusterSnapshotAttributesResult? dBClusterSnapshotAttributesResult;

  DescribeDBClusterSnapshotAttributesResult({
    this.dBClusterSnapshotAttributesResult,
  });
  factory DescribeDBClusterSnapshotAttributesResult.fromXml(
      _s.XmlElement elem) {
    return DescribeDBClusterSnapshotAttributesResult(
      dBClusterSnapshotAttributesResult: _s
          .extractXmlChild(elem, 'DBClusterSnapshotAttributesResult')
          ?.let((e) => DBClusterSnapshotAttributesResult.fromXml(e)),
    );
  }
}

/// This data type is used as a response element to
/// <code>DescribeDBLogFiles</code>.
class DescribeDBLogFilesDetails {
  /// A POSIX timestamp when the last log entry was written.
  final int? lastWritten;

  /// The name of the log file for the specified DB instance.
  final String? logFileName;

  /// The size, in bytes, of the log file for the specified DB instance.
  final int? size;

  DescribeDBLogFilesDetails({
    this.lastWritten,
    this.logFileName,
    this.size,
  });
  factory DescribeDBLogFilesDetails.fromXml(_s.XmlElement elem) {
    return DescribeDBLogFilesDetails(
      lastWritten: _s.extractXmlIntValue(elem, 'LastWritten'),
      logFileName: _s.extractXmlStringValue(elem, 'LogFileName'),
      size: _s.extractXmlIntValue(elem, 'Size'),
    );
  }
}

/// The response from a call to <code>DescribeDBLogFiles</code>.
class DescribeDBLogFilesResponse {
  /// The DB log files returned.
  final List<DescribeDBLogFilesDetails>? describeDBLogFiles;

  /// A pagination token that can be used in a later DescribeDBLogFiles request.
  final String? marker;

  DescribeDBLogFilesResponse({
    this.describeDBLogFiles,
    this.marker,
  });
  factory DescribeDBLogFilesResponse.fromXml(_s.XmlElement elem) {
    return DescribeDBLogFilesResponse(
      describeDBLogFiles: _s.extractXmlChild(elem, 'DescribeDBLogFiles')?.let(
          (elem) => elem
              .findElements('DescribeDBLogFilesDetails')
              .map((c) => DescribeDBLogFilesDetails.fromXml(c))
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

class DescribeDBProxiesResponse {
  /// A return value representing an arbitrary number of <code>DBProxy</code> data
  /// structures.
  final List<DBProxy>? dBProxies;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String? marker;

  DescribeDBProxiesResponse({
    this.dBProxies,
    this.marker,
  });
  factory DescribeDBProxiesResponse.fromXml(_s.XmlElement elem) {
    return DescribeDBProxiesResponse(
      dBProxies: _s.extractXmlChild(elem, 'DBProxies')?.let((elem) =>
          elem.findElements('member').map((c) => DBProxy.fromXml(c)).toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

class DescribeDBProxyTargetGroupsResponse {
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String? marker;

  /// An arbitrary number of <code>DBProxyTargetGroup</code> objects, containing
  /// details of the corresponding target groups.
  final List<DBProxyTargetGroup>? targetGroups;

  DescribeDBProxyTargetGroupsResponse({
    this.marker,
    this.targetGroups,
  });
  factory DescribeDBProxyTargetGroupsResponse.fromXml(_s.XmlElement elem) {
    return DescribeDBProxyTargetGroupsResponse(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      targetGroups: _s.extractXmlChild(elem, 'TargetGroups')?.let((elem) => elem
          .findElements('member')
          .map((c) => DBProxyTargetGroup.fromXml(c))
          .toList()),
    );
  }
}

class DescribeDBProxyTargetsResponse {
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String? marker;

  /// An arbitrary number of <code>DBProxyTarget</code> objects, containing
  /// details of the corresponding targets.
  final List<DBProxyTarget>? targets;

  DescribeDBProxyTargetsResponse({
    this.marker,
    this.targets,
  });
  factory DescribeDBProxyTargetsResponse.fromXml(_s.XmlElement elem) {
    return DescribeDBProxyTargetsResponse(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      targets: _s.extractXmlChild(elem, 'Targets')?.let((elem) => elem
          .findElements('member')
          .map((c) => DBProxyTarget.fromXml(c))
          .toList()),
    );
  }
}

class DescribeDBSnapshotAttributesResult {
  final DBSnapshotAttributesResult? dBSnapshotAttributesResult;

  DescribeDBSnapshotAttributesResult({
    this.dBSnapshotAttributesResult,
  });
  factory DescribeDBSnapshotAttributesResult.fromXml(_s.XmlElement elem) {
    return DescribeDBSnapshotAttributesResult(
      dBSnapshotAttributesResult: _s
          .extractXmlChild(elem, 'DBSnapshotAttributesResult')
          ?.let((e) => DBSnapshotAttributesResult.fromXml(e)),
    );
  }
}

class DescribeEngineDefaultClusterParametersResult {
  final EngineDefaults? engineDefaults;

  DescribeEngineDefaultClusterParametersResult({
    this.engineDefaults,
  });
  factory DescribeEngineDefaultClusterParametersResult.fromXml(
      _s.XmlElement elem) {
    return DescribeEngineDefaultClusterParametersResult(
      engineDefaults: _s
          .extractXmlChild(elem, 'EngineDefaults')
          ?.let((e) => EngineDefaults.fromXml(e)),
    );
  }
}

class DescribeEngineDefaultParametersResult {
  final EngineDefaults? engineDefaults;

  DescribeEngineDefaultParametersResult({
    this.engineDefaults,
  });
  factory DescribeEngineDefaultParametersResult.fromXml(_s.XmlElement elem) {
    return DescribeEngineDefaultParametersResult(
      engineDefaults: _s
          .extractXmlChild(elem, 'EngineDefaults')
          ?.let((e) => EngineDefaults.fromXml(e)),
    );
  }
}

class DescribeValidDBInstanceModificationsResult {
  final ValidDBInstanceModificationsMessage?
      validDBInstanceModificationsMessage;

  DescribeValidDBInstanceModificationsResult({
    this.validDBInstanceModificationsMessage,
  });
  factory DescribeValidDBInstanceModificationsResult.fromXml(
      _s.XmlElement elem) {
    return DescribeValidDBInstanceModificationsResult(
      validDBInstanceModificationsMessage: _s
          .extractXmlChild(elem, 'ValidDBInstanceModificationsMessage')
          ?.let((e) => ValidDBInstanceModificationsMessage.fromXml(e)),
    );
  }
}

/// An Active Directory Domain membership record associated with the DB instance
/// or cluster.
class DomainMembership {
  /// The identifier of the Active Directory Domain.
  final String? domain;

  /// The fully qualified domain name of the Active Directory Domain.
  final String? fqdn;

  /// The name of the IAM role to be used when making API calls to the Directory
  /// Service.
  final String? iAMRoleName;

  /// The status of the Active Directory Domain membership for the DB instance or
  /// cluster. Values include joined, pending-join, failed, and so on.
  final String? status;

  DomainMembership({
    this.domain,
    this.fqdn,
    this.iAMRoleName,
    this.status,
  });
  factory DomainMembership.fromXml(_s.XmlElement elem) {
    return DomainMembership(
      domain: _s.extractXmlStringValue(elem, 'Domain'),
      fqdn: _s.extractXmlStringValue(elem, 'FQDN'),
      iAMRoleName: _s.extractXmlStringValue(elem, 'IAMRoleName'),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }
}

/// A range of double values.
class DoubleRange {
  /// The minimum value in the range.
  final double? from;

  /// The maximum value in the range.
  final double? to;

  DoubleRange({
    this.from,
    this.to,
  });
  factory DoubleRange.fromXml(_s.XmlElement elem) {
    return DoubleRange(
      from: _s.extractXmlDoubleValue(elem, 'From'),
      to: _s.extractXmlDoubleValue(elem, 'To'),
    );
  }
}

/// This data type is used as a response element to
/// <code>DownloadDBLogFilePortion</code>.
class DownloadDBLogFilePortionDetails {
  /// Boolean value that if true, indicates there is more data to be downloaded.
  final bool? additionalDataPending;

  /// Entries from the specified log file.
  final String? logFileData;

  /// A pagination token that can be used in a later DownloadDBLogFilePortion
  /// request.
  final String? marker;

  DownloadDBLogFilePortionDetails({
    this.additionalDataPending,
    this.logFileData,
    this.marker,
  });
  factory DownloadDBLogFilePortionDetails.fromXml(_s.XmlElement elem) {
    return DownloadDBLogFilePortionDetails(
      additionalDataPending:
          _s.extractXmlBoolValue(elem, 'AdditionalDataPending'),
      logFileData: _s.extractXmlStringValue(elem, 'LogFileData'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// This data type is used as a response element in the following actions:
///
/// <ul>
/// <li>
/// <code>AuthorizeDBSecurityGroupIngress</code>
/// </li>
/// <li>
/// <code>DescribeDBSecurityGroups</code>
/// </li>
/// <li>
/// <code>RevokeDBSecurityGroupIngress</code>
/// </li>
/// </ul>
class EC2SecurityGroup {
  /// Specifies the id of the EC2 security group.
  final String? eC2SecurityGroupId;

  /// Specifies the name of the EC2 security group.
  final String? eC2SecurityGroupName;

  /// Specifies the AWS ID of the owner of the EC2 security group specified in the
  /// <code>EC2SecurityGroupName</code> field.
  final String? eC2SecurityGroupOwnerId;

  /// Provides the status of the EC2 security group. Status can be "authorizing",
  /// "authorized", "revoking", and "revoked".
  final String? status;

  EC2SecurityGroup({
    this.eC2SecurityGroupId,
    this.eC2SecurityGroupName,
    this.eC2SecurityGroupOwnerId,
    this.status,
  });
  factory EC2SecurityGroup.fromXml(_s.XmlElement elem) {
    return EC2SecurityGroup(
      eC2SecurityGroupId: _s.extractXmlStringValue(elem, 'EC2SecurityGroupId'),
      eC2SecurityGroupName:
          _s.extractXmlStringValue(elem, 'EC2SecurityGroupName'),
      eC2SecurityGroupOwnerId:
          _s.extractXmlStringValue(elem, 'EC2SecurityGroupOwnerId'),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }
}

/// This data type represents the information you need to connect to an Amazon
/// RDS DB instance. This data type is used as a response element in the
/// following actions:
///
/// <ul>
/// <li>
/// <code>CreateDBInstance</code>
/// </li>
/// <li>
/// <code>DescribeDBInstances</code>
/// </li>
/// <li>
/// <code>DeleteDBInstance</code>
/// </li>
/// </ul>
/// For the data structure that represents Amazon Aurora DB cluster endpoints,
/// see <code>DBClusterEndpoint</code>.
class Endpoint {
  /// Specifies the DNS address of the DB instance.
  final String? address;

  /// Specifies the ID that Amazon Route 53 assigns when you create a hosted zone.
  final String? hostedZoneId;

  /// Specifies the port that the database engine is listening on.
  final int? port;

  Endpoint({
    this.address,
    this.hostedZoneId,
    this.port,
  });
  factory Endpoint.fromXml(_s.XmlElement elem) {
    return Endpoint(
      address: _s.extractXmlStringValue(elem, 'Address'),
      hostedZoneId: _s.extractXmlStringValue(elem, 'HostedZoneId'),
      port: _s.extractXmlIntValue(elem, 'Port'),
    );
  }
}

/// Contains the result of a successful invocation of the
/// <code>DescribeEngineDefaultParameters</code> action.
class EngineDefaults {
  /// Specifies the name of the DB parameter group family that the engine default
  /// parameters apply to.
  final String? dBParameterGroupFamily;

  /// An optional pagination token provided by a previous EngineDefaults request.
  /// If this parameter is specified, the response includes only records beyond
  /// the marker, up to the value specified by <code>MaxRecords</code> .
  final String? marker;

  /// Contains a list of engine default parameters.
  final List<Parameter>? parameters;

  EngineDefaults({
    this.dBParameterGroupFamily,
    this.marker,
    this.parameters,
  });
  factory EngineDefaults.fromXml(_s.XmlElement elem) {
    return EngineDefaults(
      dBParameterGroupFamily:
          _s.extractXmlStringValue(elem, 'DBParameterGroupFamily'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      parameters: _s.extractXmlChild(elem, 'Parameters')?.let((elem) => elem
          .findElements('Parameter')
          .map((c) => Parameter.fromXml(c))
          .toList()),
    );
  }
}

enum EngineFamily {
  mysql,
  postgresql,
}

extension on EngineFamily {
  String toValue() {
    switch (this) {
      case EngineFamily.mysql:
        return 'MYSQL';
      case EngineFamily.postgresql:
        return 'POSTGRESQL';
    }
  }
}

extension on String {
  EngineFamily toEngineFamily() {
    switch (this) {
      case 'MYSQL':
        return EngineFamily.mysql;
      case 'POSTGRESQL':
        return EngineFamily.postgresql;
    }
    throw Exception('$this is not known in enum EngineFamily');
  }
}

/// This data type is used as a response element in the
/// <code>DescribeEvents</code> action.
class Event {
  /// Specifies the date and time of the event.
  final DateTime? date;

  /// Specifies the category for the event.
  final List<String>? eventCategories;

  /// Provides the text of this event.
  final String? message;

  /// The Amazon Resource Name (ARN) for the event.
  final String? sourceArn;

  /// Provides the identifier for the source of the event.
  final String? sourceIdentifier;

  /// Specifies the source type for this event.
  final SourceType? sourceType;

  Event({
    this.date,
    this.eventCategories,
    this.message,
    this.sourceArn,
    this.sourceIdentifier,
    this.sourceType,
  });
  factory Event.fromXml(_s.XmlElement elem) {
    return Event(
      date: _s.extractXmlDateTimeValue(elem, 'Date'),
      eventCategories: _s
          .extractXmlChild(elem, 'EventCategories')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'EventCategory')),
      message: _s.extractXmlStringValue(elem, 'Message'),
      sourceArn: _s.extractXmlStringValue(elem, 'SourceArn'),
      sourceIdentifier: _s.extractXmlStringValue(elem, 'SourceIdentifier'),
      sourceType: _s.extractXmlStringValue(elem, 'SourceType')?.toSourceType(),
    );
  }
}

/// Contains the results of a successful invocation of the
/// <code>DescribeEventCategories</code> operation.
class EventCategoriesMap {
  /// The event categories for the specified source type
  final List<String>? eventCategories;

  /// The source type that the returned categories belong to
  final String? sourceType;

  EventCategoriesMap({
    this.eventCategories,
    this.sourceType,
  });
  factory EventCategoriesMap.fromXml(_s.XmlElement elem) {
    return EventCategoriesMap(
      eventCategories: _s
          .extractXmlChild(elem, 'EventCategories')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'EventCategory')),
      sourceType: _s.extractXmlStringValue(elem, 'SourceType'),
    );
  }
}

/// Data returned from the <code>DescribeEventCategories</code> operation.
class EventCategoriesMessage {
  /// A list of EventCategoriesMap data types.
  final List<EventCategoriesMap>? eventCategoriesMapList;

  EventCategoriesMessage({
    this.eventCategoriesMapList,
  });
  factory EventCategoriesMessage.fromXml(_s.XmlElement elem) {
    return EventCategoriesMessage(
      eventCategoriesMapList: _s
          .extractXmlChild(elem, 'EventCategoriesMapList')
          ?.let((elem) => elem
              .findElements('EventCategoriesMap')
              .map((c) => EventCategoriesMap.fromXml(c))
              .toList()),
    );
  }
}

/// Contains the results of a successful invocation of the
/// <code>DescribeEventSubscriptions</code> action.
class EventSubscription {
  /// The RDS event notification subscription Id.
  final String? custSubscriptionId;

  /// The AWS customer account associated with the RDS event notification
  /// subscription.
  final String? customerAwsId;

  /// A Boolean value indicating if the subscription is enabled. True indicates
  /// the subscription is enabled.
  final bool? enabled;

  /// A list of event categories for the RDS event notification subscription.
  final List<String>? eventCategoriesList;

  /// The Amazon Resource Name (ARN) for the event subscription.
  final String? eventSubscriptionArn;

  /// The topic ARN of the RDS event notification subscription.
  final String? snsTopicArn;

  /// A list of source IDs for the RDS event notification subscription.
  final List<String>? sourceIdsList;

  /// The source type for the RDS event notification subscription.
  final String? sourceType;

  /// The status of the RDS event notification subscription.
  ///
  /// Constraints:
  ///
  /// Can be one of the following: creating | modifying | deleting | active |
  /// no-permission | topic-not-exist
  ///
  /// The status "no-permission" indicates that RDS no longer has permission to
  /// post to the SNS topic. The status "topic-not-exist" indicates that the topic
  /// was deleted after the subscription was created.
  final String? status;

  /// The time the RDS event notification subscription was created.
  final String? subscriptionCreationTime;

  EventSubscription({
    this.custSubscriptionId,
    this.customerAwsId,
    this.enabled,
    this.eventCategoriesList,
    this.eventSubscriptionArn,
    this.snsTopicArn,
    this.sourceIdsList,
    this.sourceType,
    this.status,
    this.subscriptionCreationTime,
  });
  factory EventSubscription.fromXml(_s.XmlElement elem) {
    return EventSubscription(
      custSubscriptionId: _s.extractXmlStringValue(elem, 'CustSubscriptionId'),
      customerAwsId: _s.extractXmlStringValue(elem, 'CustomerAwsId'),
      enabled: _s.extractXmlBoolValue(elem, 'Enabled'),
      eventCategoriesList: _s
          .extractXmlChild(elem, 'EventCategoriesList')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'EventCategory')),
      eventSubscriptionArn:
          _s.extractXmlStringValue(elem, 'EventSubscriptionArn'),
      snsTopicArn: _s.extractXmlStringValue(elem, 'SnsTopicArn'),
      sourceIdsList: _s
          .extractXmlChild(elem, 'SourceIdsList')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'SourceId')),
      sourceType: _s.extractXmlStringValue(elem, 'SourceType'),
      status: _s.extractXmlStringValue(elem, 'Status'),
      subscriptionCreationTime:
          _s.extractXmlStringValue(elem, 'SubscriptionCreationTime'),
    );
  }
}

/// Data returned by the <b>DescribeEventSubscriptions</b> action.
class EventSubscriptionsMessage {
  /// A list of EventSubscriptions data types.
  final List<EventSubscription>? eventSubscriptionsList;

  /// An optional pagination token provided by a previous
  /// DescribeOrderableDBInstanceOptions request. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by <code>MaxRecords</code>.
  final String? marker;

  EventSubscriptionsMessage({
    this.eventSubscriptionsList,
    this.marker,
  });
  factory EventSubscriptionsMessage.fromXml(_s.XmlElement elem) {
    return EventSubscriptionsMessage(
      eventSubscriptionsList: _s
          .extractXmlChild(elem, 'EventSubscriptionsList')
          ?.let((elem) => elem
              .findElements('EventSubscription')
              .map((c) => EventSubscription.fromXml(c))
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// Contains the result of a successful invocation of the
/// <code>DescribeEvents</code> action.
class EventsMessage {
  /// A list of <code>Event</code> instances.
  final List<Event>? events;

  /// An optional pagination token provided by a previous Events request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code> .
  final String? marker;

  EventsMessage({
    this.events,
    this.marker,
  });
  factory EventsMessage.fromXml(_s.XmlElement elem) {
    return EventsMessage(
      events: _s.extractXmlChild(elem, 'Events')?.let((elem) =>
          elem.findElements('Event').map((c) => Event.fromXml(c)).toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// Contains the details of a snapshot export to Amazon S3.
///
/// This data type is used as a response element in the
/// <code>DescribeExportTasks</code> action.
class ExportTask {
  /// The data exported from the snapshot. Valid values are the following:
  ///
  /// <ul>
  /// <li>
  /// <code>database</code> - Export all the data from a specified database.
  /// </li>
  /// <li>
  /// <code>database.table</code> <i>table-name</i> - Export a table of the
  /// snapshot. This format is valid only for RDS for MySQL, RDS for MariaDB, and
  /// Aurora MySQL.
  /// </li>
  /// <li>
  /// <code>database.schema</code> <i>schema-name</i> - Export a database schema
  /// of the snapshot. This format is valid only for RDS for PostgreSQL and Aurora
  /// PostgreSQL.
  /// </li>
  /// <li>
  /// <code>database.schema.table</code> <i>table-name</i> - Export a table of the
  /// database schema. This format is valid only for RDS for PostgreSQL and Aurora
  /// PostgreSQL.
  /// </li>
  /// </ul>
  final List<String>? exportOnly;

  /// A unique identifier for the snapshot export task. This ID isn't an
  /// identifier for the Amazon S3 bucket where the snapshot is exported to.
  final String? exportTaskIdentifier;

  /// The reason the export failed, if it failed.
  final String? failureCause;

  /// The name of the IAM role that is used to write to Amazon S3 when exporting a
  /// snapshot.
  final String? iamRoleArn;

  /// The key identifier of the AWS KMS customer master key (CMK) that is used to
  /// encrypt the snapshot when it's exported to Amazon S3. The AWS KMS CMK
  /// identifier is its key ARN, key ID, alias ARN, or alias name. The IAM role
  /// used for the snapshot export must have encryption and decryption permissions
  /// to use this AWS KMS CMK.
  final String? kmsKeyId;

  /// The progress of the snapshot export task as a percentage.
  final int? percentProgress;

  /// The Amazon S3 bucket that the snapshot is exported to.
  final String? s3Bucket;

  /// The Amazon S3 bucket prefix that is the file name and path of the exported
  /// snapshot.
  final String? s3Prefix;

  /// The time that the snapshot was created.
  final DateTime? snapshotTime;

  /// The Amazon Resource Name (ARN) of the snapshot exported to Amazon S3.
  final String? sourceArn;

  /// The progress status of the export task.
  final String? status;

  /// The time that the snapshot export task completed.
  final DateTime? taskEndTime;

  /// The time that the snapshot export task started.
  final DateTime? taskStartTime;

  /// The total amount of data exported, in gigabytes.
  final int? totalExtractedDataInGB;

  /// A warning about the snapshot export task.
  final String? warningMessage;

  ExportTask({
    this.exportOnly,
    this.exportTaskIdentifier,
    this.failureCause,
    this.iamRoleArn,
    this.kmsKeyId,
    this.percentProgress,
    this.s3Bucket,
    this.s3Prefix,
    this.snapshotTime,
    this.sourceArn,
    this.status,
    this.taskEndTime,
    this.taskStartTime,
    this.totalExtractedDataInGB,
    this.warningMessage,
  });
  factory ExportTask.fromXml(_s.XmlElement elem) {
    return ExportTask(
      exportOnly: _s
          .extractXmlChild(elem, 'ExportOnly')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      exportTaskIdentifier:
          _s.extractXmlStringValue(elem, 'ExportTaskIdentifier'),
      failureCause: _s.extractXmlStringValue(elem, 'FailureCause'),
      iamRoleArn: _s.extractXmlStringValue(elem, 'IamRoleArn'),
      kmsKeyId: _s.extractXmlStringValue(elem, 'KmsKeyId'),
      percentProgress: _s.extractXmlIntValue(elem, 'PercentProgress'),
      s3Bucket: _s.extractXmlStringValue(elem, 'S3Bucket'),
      s3Prefix: _s.extractXmlStringValue(elem, 'S3Prefix'),
      snapshotTime: _s.extractXmlDateTimeValue(elem, 'SnapshotTime'),
      sourceArn: _s.extractXmlStringValue(elem, 'SourceArn'),
      status: _s.extractXmlStringValue(elem, 'Status'),
      taskEndTime: _s.extractXmlDateTimeValue(elem, 'TaskEndTime'),
      taskStartTime: _s.extractXmlDateTimeValue(elem, 'TaskStartTime'),
      totalExtractedDataInGB:
          _s.extractXmlIntValue(elem, 'TotalExtractedDataInGB'),
      warningMessage: _s.extractXmlStringValue(elem, 'WarningMessage'),
    );
  }
}

class ExportTasksMessage {
  /// Information about an export of a snapshot to Amazon S3.
  final List<ExportTask>? exportTasks;

  /// A pagination token that can be used in a later
  /// <code>DescribeExportTasks</code> request. A marker is used for pagination to
  /// identify the location to begin output for the next response of
  /// <code>DescribeExportTasks</code>.
  final String? marker;

  ExportTasksMessage({
    this.exportTasks,
    this.marker,
  });
  factory ExportTasksMessage.fromXml(_s.XmlElement elem) {
    return ExportTasksMessage(
      exportTasks: _s.extractXmlChild(elem, 'ExportTasks')?.let((elem) => elem
          .findElements('ExportTask')
          .map((c) => ExportTask.fromXml(c))
          .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

class FailoverDBClusterResult {
  final DBCluster? dBCluster;

  FailoverDBClusterResult({
    this.dBCluster,
  });
  factory FailoverDBClusterResult.fromXml(_s.XmlElement elem) {
    return FailoverDBClusterResult(
      dBCluster: _s
          .extractXmlChild(elem, 'DBCluster')
          ?.let((e) => DBCluster.fromXml(e)),
    );
  }
}

/// A filter name and value pair that is used to return a more specific list of
/// results from a describe operation. Filters can be used to match a set of
/// resources by specific criteria, such as IDs. The filters supported by a
/// describe operation are documented with the describe operation.
/// <note>
/// Currently, wildcards are not supported in filters.
/// </note>
/// The following actions can be filtered:
///
/// <ul>
/// <li>
/// <code>DescribeDBClusterBacktracks</code>
/// </li>
/// <li>
/// <code>DescribeDBClusterEndpoints</code>
/// </li>
/// <li>
/// <code>DescribeDBClusters</code>
/// </li>
/// <li>
/// <code>DescribeDBInstances</code>
/// </li>
/// <li>
/// <code>DescribePendingMaintenanceActions</code>
/// </li>
/// </ul>
class Filter {
  /// The name of the filter. Filter names are case-sensitive.
  final String name;

  /// One or more filter values. Filter values are case-sensitive.
  final List<String> values;

  Filter({
    required this.name,
    required this.values,
  });
  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name,
      'Values': values,
    };
  }
}

/// A data type representing an Aurora global database.
class GlobalCluster {
  /// The default database name within the new global database cluster.
  final String? databaseName;

  /// The deletion protection setting for the new global database cluster.
  final bool? deletionProtection;

  /// The Aurora database engine used by the global database cluster.
  final String? engine;

  /// Indicates the database engine version.
  final String? engineVersion;

  /// The Amazon Resource Name (ARN) for the global database cluster.
  final String? globalClusterArn;

  /// Contains a user-supplied global database cluster identifier. This identifier
  /// is the unique key that identifies a global database cluster.
  final String? globalClusterIdentifier;

  /// The list of cluster IDs for secondary clusters within the global database
  /// cluster. Currently limited to 1 item.
  final List<GlobalClusterMember>? globalClusterMembers;

  /// The AWS Region-unique, immutable identifier for the global database cluster.
  /// This identifier is found in AWS CloudTrail log entries whenever the AWS KMS
  /// customer master key (CMK) for the DB cluster is accessed.
  final String? globalClusterResourceId;

  /// Specifies the current state of this global database cluster.
  final String? status;

  /// The storage encryption setting for the global database cluster.
  final bool? storageEncrypted;

  GlobalCluster({
    this.databaseName,
    this.deletionProtection,
    this.engine,
    this.engineVersion,
    this.globalClusterArn,
    this.globalClusterIdentifier,
    this.globalClusterMembers,
    this.globalClusterResourceId,
    this.status,
    this.storageEncrypted,
  });
  factory GlobalCluster.fromXml(_s.XmlElement elem) {
    return GlobalCluster(
      databaseName: _s.extractXmlStringValue(elem, 'DatabaseName'),
      deletionProtection: _s.extractXmlBoolValue(elem, 'DeletionProtection'),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      globalClusterArn: _s.extractXmlStringValue(elem, 'GlobalClusterArn'),
      globalClusterIdentifier:
          _s.extractXmlStringValue(elem, 'GlobalClusterIdentifier'),
      globalClusterMembers: _s
          .extractXmlChild(elem, 'GlobalClusterMembers')
          ?.let((elem) => elem
              .findElements('GlobalClusterMember')
              .map((c) => GlobalClusterMember.fromXml(c))
              .toList()),
      globalClusterResourceId:
          _s.extractXmlStringValue(elem, 'GlobalClusterResourceId'),
      status: _s.extractXmlStringValue(elem, 'Status'),
      storageEncrypted: _s.extractXmlBoolValue(elem, 'StorageEncrypted'),
    );
  }
}

/// A data structure with information about any primary and secondary clusters
/// associated with an Aurora global database.
class GlobalClusterMember {
  /// The Amazon Resource Name (ARN) for each Aurora cluster.
  final String? dBClusterArn;

  /// Specifies whether a secondary cluster in an Aurora global database has write
  /// forwarding enabled, not enabled, or is in the process of enabling it.
  final WriteForwardingStatus? globalWriteForwardingStatus;

  /// Specifies whether the Aurora cluster is the primary cluster (that is, has
  /// read-write capability) for the Aurora global database with which it is
  /// associated.
  final bool? isWriter;

  /// The Amazon Resource Name (ARN) for each read-only secondary cluster
  /// associated with the Aurora global database.
  final List<String>? readers;

  GlobalClusterMember({
    this.dBClusterArn,
    this.globalWriteForwardingStatus,
    this.isWriter,
    this.readers,
  });
  factory GlobalClusterMember.fromXml(_s.XmlElement elem) {
    return GlobalClusterMember(
      dBClusterArn: _s.extractXmlStringValue(elem, 'DBClusterArn'),
      globalWriteForwardingStatus: _s
          .extractXmlStringValue(elem, 'GlobalWriteForwardingStatus')
          ?.toWriteForwardingStatus(),
      isWriter: _s.extractXmlBoolValue(elem, 'IsWriter'),
      readers: _s
          .extractXmlChild(elem, 'Readers')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }
}

class GlobalClustersMessage {
  /// The list of global clusters returned by this request.
  final List<GlobalCluster>? globalClusters;

  /// An optional pagination token provided by a previous
  /// <code>DescribeGlobalClusters</code> request. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by <code>MaxRecords</code>.
  final String? marker;

  GlobalClustersMessage({
    this.globalClusters,
    this.marker,
  });
  factory GlobalClustersMessage.fromXml(_s.XmlElement elem) {
    return GlobalClustersMessage(
      globalClusters: _s.extractXmlChild(elem, 'GlobalClusters')?.let((elem) =>
          elem
              .findElements('GlobalClusterMember')
              .map((c) => GlobalCluster.fromXml(c))
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

enum IAMAuthMode {
  disabled,
  required,
}

extension on IAMAuthMode {
  String toValue() {
    switch (this) {
      case IAMAuthMode.disabled:
        return 'DISABLED';
      case IAMAuthMode.required:
        return 'REQUIRED';
    }
  }
}

extension on String {
  IAMAuthMode toIAMAuthMode() {
    switch (this) {
      case 'DISABLED':
        return IAMAuthMode.disabled;
      case 'REQUIRED':
        return IAMAuthMode.required;
    }
    throw Exception('$this is not known in enum IAMAuthMode');
  }
}

/// This data type is used as a response element in the
/// <code>DescribeDBSecurityGroups</code> action.
class IPRange {
  /// Specifies the IP range.
  final String? cidrip;

  /// Specifies the status of the IP range. Status can be "authorizing",
  /// "authorized", "revoking", and "revoked".
  final String? status;

  IPRange({
    this.cidrip,
    this.status,
  });
  factory IPRange.fromXml(_s.XmlElement elem) {
    return IPRange(
      cidrip: _s.extractXmlStringValue(elem, 'CIDRIP'),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }
}

/// Contains the installation media for a DB engine that requires an on-premises
/// customer provided license, such as Microsoft SQL Server.
class InstallationMedia {
  /// The custom Availability Zone (AZ) that contains the installation media.
  final String? customAvailabilityZoneId;

  /// The DB engine.
  final String? engine;

  /// The path to the installation medium for the DB engine.
  final String? engineInstallationMediaPath;

  /// The engine version of the DB engine.
  final String? engineVersion;

  /// If an installation media failure occurred, the cause of the failure.
  final InstallationMediaFailureCause? failureCause;

  /// The installation medium ID.
  final String? installationMediaId;

  /// The path to the installation medium for the operating system associated with
  /// the DB engine.
  final String? oSInstallationMediaPath;

  /// The status of the installation medium.
  final String? status;

  InstallationMedia({
    this.customAvailabilityZoneId,
    this.engine,
    this.engineInstallationMediaPath,
    this.engineVersion,
    this.failureCause,
    this.installationMediaId,
    this.oSInstallationMediaPath,
    this.status,
  });
  factory InstallationMedia.fromXml(_s.XmlElement elem) {
    return InstallationMedia(
      customAvailabilityZoneId:
          _s.extractXmlStringValue(elem, 'CustomAvailabilityZoneId'),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      engineInstallationMediaPath:
          _s.extractXmlStringValue(elem, 'EngineInstallationMediaPath'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      failureCause: _s
          .extractXmlChild(elem, 'FailureCause')
          ?.let((e) => InstallationMediaFailureCause.fromXml(e)),
      installationMediaId:
          _s.extractXmlStringValue(elem, 'InstallationMediaId'),
      oSInstallationMediaPath:
          _s.extractXmlStringValue(elem, 'OSInstallationMediaPath'),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }
}

/// Contains the cause of an installation media failure. Installation media is
/// used for a DB engine that requires an on-premises customer provided license,
/// such as Microsoft SQL Server.
class InstallationMediaFailureCause {
  /// The reason that an installation media import failed.
  final String? message;

  InstallationMediaFailureCause({
    this.message,
  });
  factory InstallationMediaFailureCause.fromXml(_s.XmlElement elem) {
    return InstallationMediaFailureCause(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }
}

class InstallationMediaMessage {
  /// The list of <a>InstallationMedia</a> objects for the AWS account.
  final List<InstallationMedia>? installationMedia;

  /// An optional pagination token provided by a previous
  /// <a>DescribeInstallationMedia</a> request. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by <code>MaxRecords</code>.
  final String? marker;

  InstallationMediaMessage({
    this.installationMedia,
    this.marker,
  });
  factory InstallationMediaMessage.fromXml(_s.XmlElement elem) {
    return InstallationMediaMessage(
      installationMedia: _s.extractXmlChild(elem, 'InstallationMedia')?.let(
          (elem) => elem
              .findElements('InstallationMedia')
              .map((c) => InstallationMedia.fromXml(c))
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// The minimum DB engine version required for each corresponding allowed value
/// for an option setting.
class MinimumEngineVersionPerAllowedValue {
  /// The allowed value for an option setting.
  final String? allowedValue;

  /// The minimum DB engine version required for the allowed value.
  final String? minimumEngineVersion;

  MinimumEngineVersionPerAllowedValue({
    this.allowedValue,
    this.minimumEngineVersion,
  });
  factory MinimumEngineVersionPerAllowedValue.fromXml(_s.XmlElement elem) {
    return MinimumEngineVersionPerAllowedValue(
      allowedValue: _s.extractXmlStringValue(elem, 'AllowedValue'),
      minimumEngineVersion:
          _s.extractXmlStringValue(elem, 'MinimumEngineVersion'),
    );
  }
}

class ModifyCertificatesResult {
  final Certificate? certificate;

  ModifyCertificatesResult({
    this.certificate,
  });
  factory ModifyCertificatesResult.fromXml(_s.XmlElement elem) {
    return ModifyCertificatesResult(
      certificate: _s
          .extractXmlChild(elem, 'Certificate')
          ?.let((e) => Certificate.fromXml(e)),
    );
  }
}

class ModifyDBClusterResult {
  final DBCluster? dBCluster;

  ModifyDBClusterResult({
    this.dBCluster,
  });
  factory ModifyDBClusterResult.fromXml(_s.XmlElement elem) {
    return ModifyDBClusterResult(
      dBCluster: _s
          .extractXmlChild(elem, 'DBCluster')
          ?.let((e) => DBCluster.fromXml(e)),
    );
  }
}

class ModifyDBClusterSnapshotAttributeResult {
  final DBClusterSnapshotAttributesResult? dBClusterSnapshotAttributesResult;

  ModifyDBClusterSnapshotAttributeResult({
    this.dBClusterSnapshotAttributesResult,
  });
  factory ModifyDBClusterSnapshotAttributeResult.fromXml(_s.XmlElement elem) {
    return ModifyDBClusterSnapshotAttributeResult(
      dBClusterSnapshotAttributesResult: _s
          .extractXmlChild(elem, 'DBClusterSnapshotAttributesResult')
          ?.let((e) => DBClusterSnapshotAttributesResult.fromXml(e)),
    );
  }
}

class ModifyDBInstanceResult {
  final DBInstance? dBInstance;

  ModifyDBInstanceResult({
    this.dBInstance,
  });
  factory ModifyDBInstanceResult.fromXml(_s.XmlElement elem) {
    return ModifyDBInstanceResult(
      dBInstance: _s
          .extractXmlChild(elem, 'DBInstance')
          ?.let((e) => DBInstance.fromXml(e)),
    );
  }
}

class ModifyDBProxyResponse {
  /// The <code>DBProxy</code> object representing the new settings for the proxy.
  final DBProxy? dBProxy;

  ModifyDBProxyResponse({
    this.dBProxy,
  });
  factory ModifyDBProxyResponse.fromXml(_s.XmlElement elem) {
    return ModifyDBProxyResponse(
      dBProxy:
          _s.extractXmlChild(elem, 'DBProxy')?.let((e) => DBProxy.fromXml(e)),
    );
  }
}

class ModifyDBProxyTargetGroupResponse {
  /// The settings of the modified <code>DBProxyTarget</code>.
  final DBProxyTargetGroup? dBProxyTargetGroup;

  ModifyDBProxyTargetGroupResponse({
    this.dBProxyTargetGroup,
  });
  factory ModifyDBProxyTargetGroupResponse.fromXml(_s.XmlElement elem) {
    return ModifyDBProxyTargetGroupResponse(
      dBProxyTargetGroup: _s
          .extractXmlChild(elem, 'DBProxyTargetGroup')
          ?.let((e) => DBProxyTargetGroup.fromXml(e)),
    );
  }
}

class ModifyDBSnapshotAttributeResult {
  final DBSnapshotAttributesResult? dBSnapshotAttributesResult;

  ModifyDBSnapshotAttributeResult({
    this.dBSnapshotAttributesResult,
  });
  factory ModifyDBSnapshotAttributeResult.fromXml(_s.XmlElement elem) {
    return ModifyDBSnapshotAttributeResult(
      dBSnapshotAttributesResult: _s
          .extractXmlChild(elem, 'DBSnapshotAttributesResult')
          ?.let((e) => DBSnapshotAttributesResult.fromXml(e)),
    );
  }
}

class ModifyDBSnapshotResult {
  final DBSnapshot? dBSnapshot;

  ModifyDBSnapshotResult({
    this.dBSnapshot,
  });
  factory ModifyDBSnapshotResult.fromXml(_s.XmlElement elem) {
    return ModifyDBSnapshotResult(
      dBSnapshot: _s
          .extractXmlChild(elem, 'DBSnapshot')
          ?.let((e) => DBSnapshot.fromXml(e)),
    );
  }
}

class ModifyDBSubnetGroupResult {
  final DBSubnetGroup? dBSubnetGroup;

  ModifyDBSubnetGroupResult({
    this.dBSubnetGroup,
  });
  factory ModifyDBSubnetGroupResult.fromXml(_s.XmlElement elem) {
    return ModifyDBSubnetGroupResult(
      dBSubnetGroup: _s
          .extractXmlChild(elem, 'DBSubnetGroup')
          ?.let((e) => DBSubnetGroup.fromXml(e)),
    );
  }
}

class ModifyEventSubscriptionResult {
  final EventSubscription? eventSubscription;

  ModifyEventSubscriptionResult({
    this.eventSubscription,
  });
  factory ModifyEventSubscriptionResult.fromXml(_s.XmlElement elem) {
    return ModifyEventSubscriptionResult(
      eventSubscription: _s
          .extractXmlChild(elem, 'EventSubscription')
          ?.let((e) => EventSubscription.fromXml(e)),
    );
  }
}

class ModifyGlobalClusterResult {
  final GlobalCluster? globalCluster;

  ModifyGlobalClusterResult({
    this.globalCluster,
  });
  factory ModifyGlobalClusterResult.fromXml(_s.XmlElement elem) {
    return ModifyGlobalClusterResult(
      globalCluster: _s
          .extractXmlChild(elem, 'GlobalCluster')
          ?.let((e) => GlobalCluster.fromXml(e)),
    );
  }
}

class ModifyOptionGroupResult {
  final OptionGroup? optionGroup;

  ModifyOptionGroupResult({
    this.optionGroup,
  });
  factory ModifyOptionGroupResult.fromXml(_s.XmlElement elem) {
    return ModifyOptionGroupResult(
      optionGroup: _s
          .extractXmlChild(elem, 'OptionGroup')
          ?.let((e) => OptionGroup.fromXml(e)),
    );
  }
}

/// Option details.
class Option {
  /// If the option requires access to a port, then this DB security group allows
  /// access to the port.
  final List<DBSecurityGroupMembership>? dBSecurityGroupMemberships;

  /// The description of the option.
  final String? optionDescription;

  /// The name of the option.
  final String? optionName;

  /// The option settings for this option.
  final List<OptionSetting>? optionSettings;

  /// The version of the option.
  final String? optionVersion;

  /// Indicate if this option is permanent.
  final bool? permanent;

  /// Indicate if this option is persistent.
  final bool? persistent;

  /// If required, the port configured for this option to use.
  final int? port;

  /// If the option requires access to a port, then this VPC security group allows
  /// access to the port.
  final List<VpcSecurityGroupMembership>? vpcSecurityGroupMemberships;

  Option({
    this.dBSecurityGroupMemberships,
    this.optionDescription,
    this.optionName,
    this.optionSettings,
    this.optionVersion,
    this.permanent,
    this.persistent,
    this.port,
    this.vpcSecurityGroupMemberships,
  });
  factory Option.fromXml(_s.XmlElement elem) {
    return Option(
      dBSecurityGroupMemberships: _s
          .extractXmlChild(elem, 'DBSecurityGroupMemberships')
          ?.let((elem) => elem
              .findElements('DBSecurityGroup')
              .map((c) => DBSecurityGroupMembership.fromXml(c))
              .toList()),
      optionDescription: _s.extractXmlStringValue(elem, 'OptionDescription'),
      optionName: _s.extractXmlStringValue(elem, 'OptionName'),
      optionSettings: _s.extractXmlChild(elem, 'OptionSettings')?.let((elem) =>
          elem
              .findElements('OptionSetting')
              .map((c) => OptionSetting.fromXml(c))
              .toList()),
      optionVersion: _s.extractXmlStringValue(elem, 'OptionVersion'),
      permanent: _s.extractXmlBoolValue(elem, 'Permanent'),
      persistent: _s.extractXmlBoolValue(elem, 'Persistent'),
      port: _s.extractXmlIntValue(elem, 'Port'),
      vpcSecurityGroupMemberships: _s
          .extractXmlChild(elem, 'VpcSecurityGroupMemberships')
          ?.let((elem) => elem
              .findElements('VpcSecurityGroupMembership')
              .map((c) => VpcSecurityGroupMembership.fromXml(c))
              .toList()),
    );
  }
}

/// A list of all available options
class OptionConfiguration {
  /// The configuration of options to include in a group.
  final String optionName;

  /// A list of DBSecurityGroupMembership name strings used for this option.
  final List<String>? dBSecurityGroupMemberships;

  /// The option settings to include in an option group.
  final List<OptionSetting>? optionSettings;

  /// The version for the option.
  final String? optionVersion;

  /// The optional port for the option.
  final int? port;

  /// A list of VpcSecurityGroupMembership name strings used for this option.
  final List<String>? vpcSecurityGroupMemberships;

  OptionConfiguration({
    required this.optionName,
    this.dBSecurityGroupMemberships,
    this.optionSettings,
    this.optionVersion,
    this.port,
    this.vpcSecurityGroupMemberships,
  });
  Map<String, dynamic> toJson() {
    final optionName = this.optionName;
    final dBSecurityGroupMemberships = this.dBSecurityGroupMemberships;
    final optionSettings = this.optionSettings;
    final optionVersion = this.optionVersion;
    final port = this.port;
    final vpcSecurityGroupMemberships = this.vpcSecurityGroupMemberships;
    return {
      'OptionName': optionName,
      if (dBSecurityGroupMemberships != null)
        'DBSecurityGroupMemberships': dBSecurityGroupMemberships,
      if (optionSettings != null) 'OptionSettings': optionSettings,
      if (optionVersion != null) 'OptionVersion': optionVersion,
      if (port != null) 'Port': port,
      if (vpcSecurityGroupMemberships != null)
        'VpcSecurityGroupMemberships': vpcSecurityGroupMemberships,
    };
  }
}

/// <p/>
class OptionGroup {
  /// Indicates whether this option group can be applied to both VPC and non-VPC
  /// instances. The value <code>true</code> indicates the option group can be
  /// applied to both VPC and non-VPC instances.
  final bool? allowsVpcAndNonVpcInstanceMemberships;

  /// Indicates the name of the engine that this option group can be applied to.
  final String? engineName;

  /// Indicates the major engine version associated with this option group.
  final String? majorEngineVersion;

  /// The Amazon Resource Name (ARN) for the option group.
  final String? optionGroupArn;

  /// Provides a description of the option group.
  final String? optionGroupDescription;

  /// Specifies the name of the option group.
  final String? optionGroupName;

  /// Indicates what options are available in the option group.
  final List<Option>? options;

  /// If <b>AllowsVpcAndNonVpcInstanceMemberships</b> is <code>false</code>, this
  /// field is blank. If <b>AllowsVpcAndNonVpcInstanceMemberships</b> is
  /// <code>true</code> and this field is blank, then this option group can be
  /// applied to both VPC and non-VPC instances. If this field contains a value,
  /// then this option group can only be applied to instances that are in the VPC
  /// indicated by this field.
  final String? vpcId;

  OptionGroup({
    this.allowsVpcAndNonVpcInstanceMemberships,
    this.engineName,
    this.majorEngineVersion,
    this.optionGroupArn,
    this.optionGroupDescription,
    this.optionGroupName,
    this.options,
    this.vpcId,
  });
  factory OptionGroup.fromXml(_s.XmlElement elem) {
    return OptionGroup(
      allowsVpcAndNonVpcInstanceMemberships:
          _s.extractXmlBoolValue(elem, 'AllowsVpcAndNonVpcInstanceMemberships'),
      engineName: _s.extractXmlStringValue(elem, 'EngineName'),
      majorEngineVersion: _s.extractXmlStringValue(elem, 'MajorEngineVersion'),
      optionGroupArn: _s.extractXmlStringValue(elem, 'OptionGroupArn'),
      optionGroupDescription:
          _s.extractXmlStringValue(elem, 'OptionGroupDescription'),
      optionGroupName: _s.extractXmlStringValue(elem, 'OptionGroupName'),
      options: _s.extractXmlChild(elem, 'Options')?.let((elem) =>
          elem.findElements('Option').map((c) => Option.fromXml(c)).toList()),
      vpcId: _s.extractXmlStringValue(elem, 'VpcId'),
    );
  }
}

/// Provides information on the option groups the DB instance is a member of.
class OptionGroupMembership {
  /// The name of the option group that the instance belongs to.
  final String? optionGroupName;

  /// The status of the DB instance's option group membership. Valid values are:
  /// <code>in-sync</code>, <code>pending-apply</code>,
  /// <code>pending-removal</code>, <code>pending-maintenance-apply</code>,
  /// <code>pending-maintenance-removal</code>, <code>applying</code>,
  /// <code>removing</code>, and <code>failed</code>.
  final String? status;

  OptionGroupMembership({
    this.optionGroupName,
    this.status,
  });
  factory OptionGroupMembership.fromXml(_s.XmlElement elem) {
    return OptionGroupMembership(
      optionGroupName: _s.extractXmlStringValue(elem, 'OptionGroupName'),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }
}

/// Available option.
class OptionGroupOption {
  /// If the option requires a port, specifies the default port for the option.
  final int? defaultPort;

  /// The description of the option.
  final String? description;

  /// The name of the engine that this option can be applied to.
  final String? engineName;

  /// Indicates the major engine version that the option is available for.
  final String? majorEngineVersion;

  /// The minimum required engine version for the option to be applied.
  final String? minimumRequiredMinorEngineVersion;

  /// The name of the option.
  final String? name;

  /// The option settings that are available (and the default value) for each
  /// option in an option group.
  final List<OptionGroupOptionSetting>? optionGroupOptionSettings;

  /// The versions that are available for the option.
  final List<OptionVersion>? optionGroupOptionVersions;

  /// The options that conflict with this option.
  final List<String>? optionsConflictsWith;

  /// The options that are prerequisites for this option.
  final List<String>? optionsDependedOn;

  /// Permanent options can never be removed from an option group. An option group
  /// containing a permanent option can't be removed from a DB instance.
  final bool? permanent;

  /// Persistent options can't be removed from an option group while DB instances
  /// are associated with the option group. If you disassociate all DB instances
  /// from the option group, your can remove the persistent option from the option
  /// group.
  final bool? persistent;

  /// Specifies whether the option requires a port.
  final bool? portRequired;

  /// If true, you must enable the Auto Minor Version Upgrade setting for your DB
  /// instance before you can use this option. You can enable Auto Minor Version
  /// Upgrade when you first create your DB instance, or by modifying your DB
  /// instance later.
  final bool? requiresAutoMinorEngineVersionUpgrade;

  /// If true, you can change the option to an earlier version of the option. This
  /// only applies to options that have different versions available.
  final bool? supportsOptionVersionDowngrade;

  /// If true, you can only use this option with a DB instance that is in a VPC.
  final bool? vpcOnly;

  OptionGroupOption({
    this.defaultPort,
    this.description,
    this.engineName,
    this.majorEngineVersion,
    this.minimumRequiredMinorEngineVersion,
    this.name,
    this.optionGroupOptionSettings,
    this.optionGroupOptionVersions,
    this.optionsConflictsWith,
    this.optionsDependedOn,
    this.permanent,
    this.persistent,
    this.portRequired,
    this.requiresAutoMinorEngineVersionUpgrade,
    this.supportsOptionVersionDowngrade,
    this.vpcOnly,
  });
  factory OptionGroupOption.fromXml(_s.XmlElement elem) {
    return OptionGroupOption(
      defaultPort: _s.extractXmlIntValue(elem, 'DefaultPort'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      engineName: _s.extractXmlStringValue(elem, 'EngineName'),
      majorEngineVersion: _s.extractXmlStringValue(elem, 'MajorEngineVersion'),
      minimumRequiredMinorEngineVersion:
          _s.extractXmlStringValue(elem, 'MinimumRequiredMinorEngineVersion'),
      name: _s.extractXmlStringValue(elem, 'Name'),
      optionGroupOptionSettings: _s
          .extractXmlChild(elem, 'OptionGroupOptionSettings')
          ?.let((elem) => elem
              .findElements('OptionGroupOptionSetting')
              .map((c) => OptionGroupOptionSetting.fromXml(c))
              .toList()),
      optionGroupOptionVersions: _s
          .extractXmlChild(elem, 'OptionGroupOptionVersions')
          ?.let((elem) => elem
              .findElements('OptionVersion')
              .map((c) => OptionVersion.fromXml(c))
              .toList()),
      optionsConflictsWith: _s
          .extractXmlChild(elem, 'OptionsConflictsWith')
          ?.let((elem) =>
              _s.extractXmlStringListValues(elem, 'OptionConflictName')),
      optionsDependedOn: _s
          .extractXmlChild(elem, 'OptionsDependedOn')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'OptionName')),
      permanent: _s.extractXmlBoolValue(elem, 'Permanent'),
      persistent: _s.extractXmlBoolValue(elem, 'Persistent'),
      portRequired: _s.extractXmlBoolValue(elem, 'PortRequired'),
      requiresAutoMinorEngineVersionUpgrade:
          _s.extractXmlBoolValue(elem, 'RequiresAutoMinorEngineVersionUpgrade'),
      supportsOptionVersionDowngrade:
          _s.extractXmlBoolValue(elem, 'SupportsOptionVersionDowngrade'),
      vpcOnly: _s.extractXmlBoolValue(elem, 'VpcOnly'),
    );
  }
}

/// Option group option settings are used to display settings available for each
/// option with their default values and other information. These values are
/// used with the DescribeOptionGroupOptions action.
class OptionGroupOptionSetting {
  /// Indicates the acceptable values for the option group option.
  final String? allowedValues;

  /// The DB engine specific parameter type for the option group option.
  final String? applyType;

  /// The default value for the option group option.
  final String? defaultValue;

  /// Boolean value where true indicates that this option group option can be
  /// changed from the default value.
  final bool? isModifiable;

  /// Boolean value where true indicates that a value must be specified for this
  /// option setting of the option group option.
  final bool? isRequired;

  /// The minimum DB engine version required for the corresponding allowed value
  /// for this option setting.
  final List<MinimumEngineVersionPerAllowedValue>?
      minimumEngineVersionPerAllowedValue;

  /// The description of the option group option.
  final String? settingDescription;

  /// The name of the option group option.
  final String? settingName;

  OptionGroupOptionSetting({
    this.allowedValues,
    this.applyType,
    this.defaultValue,
    this.isModifiable,
    this.isRequired,
    this.minimumEngineVersionPerAllowedValue,
    this.settingDescription,
    this.settingName,
  });
  factory OptionGroupOptionSetting.fromXml(_s.XmlElement elem) {
    return OptionGroupOptionSetting(
      allowedValues: _s.extractXmlStringValue(elem, 'AllowedValues'),
      applyType: _s.extractXmlStringValue(elem, 'ApplyType'),
      defaultValue: _s.extractXmlStringValue(elem, 'DefaultValue'),
      isModifiable: _s.extractXmlBoolValue(elem, 'IsModifiable'),
      isRequired: _s.extractXmlBoolValue(elem, 'IsRequired'),
      minimumEngineVersionPerAllowedValue: _s
          .extractXmlChild(elem, 'MinimumEngineVersionPerAllowedValue')
          ?.let((elem) => elem
              .findElements('MinimumEngineVersionPerAllowedValue')
              .map((c) => MinimumEngineVersionPerAllowedValue.fromXml(c))
              .toList()),
      settingDescription: _s.extractXmlStringValue(elem, 'SettingDescription'),
      settingName: _s.extractXmlStringValue(elem, 'SettingName'),
    );
  }
}

/// <p/>
class OptionGroupOptionsMessage {
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String? marker;
  final List<OptionGroupOption>? optionGroupOptions;

  OptionGroupOptionsMessage({
    this.marker,
    this.optionGroupOptions,
  });
  factory OptionGroupOptionsMessage.fromXml(_s.XmlElement elem) {
    return OptionGroupOptionsMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      optionGroupOptions: _s.extractXmlChild(elem, 'OptionGroupOptions')?.let(
          (elem) => elem
              .findElements('OptionGroupOption')
              .map((c) => OptionGroupOption.fromXml(c))
              .toList()),
    );
  }
}

/// List of option groups.
class OptionGroups {
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String? marker;

  /// List of option groups.
  final List<OptionGroup>? optionGroupsList;

  OptionGroups({
    this.marker,
    this.optionGroupsList,
  });
  factory OptionGroups.fromXml(_s.XmlElement elem) {
    return OptionGroups(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      optionGroupsList: _s.extractXmlChild(elem, 'OptionGroupsList')?.let(
          (elem) => elem
              .findElements('OptionGroup')
              .map((c) => OptionGroup.fromXml(c))
              .toList()),
    );
  }
}

/// Option settings are the actual settings being applied or configured for that
/// option. It is used when you modify an option group or describe option
/// groups. For example, the NATIVE_NETWORK_ENCRYPTION option has a setting
/// called SQLNET.ENCRYPTION_SERVER that can have several different values.
class OptionSetting {
  /// The allowed values of the option setting.
  final String? allowedValues;

  /// The DB engine specific parameter type.
  final String? applyType;

  /// The data type of the option setting.
  final String? dataType;

  /// The default value of the option setting.
  final String? defaultValue;

  /// The description of the option setting.
  final String? description;

  /// Indicates if the option setting is part of a collection.
  final bool? isCollection;

  /// A Boolean value that, when true, indicates the option setting can be
  /// modified from the default.
  final bool? isModifiable;

  /// The name of the option that has settings that you can set.
  final String? name;

  /// The current value of the option setting.
  final String? value;

  OptionSetting({
    this.allowedValues,
    this.applyType,
    this.dataType,
    this.defaultValue,
    this.description,
    this.isCollection,
    this.isModifiable,
    this.name,
    this.value,
  });
  factory OptionSetting.fromXml(_s.XmlElement elem) {
    return OptionSetting(
      allowedValues: _s.extractXmlStringValue(elem, 'AllowedValues'),
      applyType: _s.extractXmlStringValue(elem, 'ApplyType'),
      dataType: _s.extractXmlStringValue(elem, 'DataType'),
      defaultValue: _s.extractXmlStringValue(elem, 'DefaultValue'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      isCollection: _s.extractXmlBoolValue(elem, 'IsCollection'),
      isModifiable: _s.extractXmlBoolValue(elem, 'IsModifiable'),
      name: _s.extractXmlStringValue(elem, 'Name'),
      value: _s.extractXmlStringValue(elem, 'Value'),
    );
  }

  Map<String, dynamic> toJson() {
    final allowedValues = this.allowedValues;
    final applyType = this.applyType;
    final dataType = this.dataType;
    final defaultValue = this.defaultValue;
    final description = this.description;
    final isCollection = this.isCollection;
    final isModifiable = this.isModifiable;
    final name = this.name;
    final value = this.value;
    return {
      if (allowedValues != null) 'AllowedValues': allowedValues,
      if (applyType != null) 'ApplyType': applyType,
      if (dataType != null) 'DataType': dataType,
      if (defaultValue != null) 'DefaultValue': defaultValue,
      if (description != null) 'Description': description,
      if (isCollection != null) 'IsCollection': isCollection,
      if (isModifiable != null) 'IsModifiable': isModifiable,
      if (name != null) 'Name': name,
      if (value != null) 'Value': value,
    };
  }
}

/// The version for an option. Option group option versions are returned by the
/// <code>DescribeOptionGroupOptions</code> action.
class OptionVersion {
  /// True if the version is the default version of the option, and otherwise
  /// false.
  final bool? isDefault;

  /// The version of the option.
  final String? version;

  OptionVersion({
    this.isDefault,
    this.version,
  });
  factory OptionVersion.fromXml(_s.XmlElement elem) {
    return OptionVersion(
      isDefault: _s.extractXmlBoolValue(elem, 'IsDefault'),
      version: _s.extractXmlStringValue(elem, 'Version'),
    );
  }
}

/// Contains a list of available options for a DB instance.
///
/// This data type is used as a response element in the
/// <code>DescribeOrderableDBInstanceOptions</code> action.
class OrderableDBInstanceOption {
  /// The Availability Zone group for a DB instance.
  final String? availabilityZoneGroup;

  /// A list of Availability Zones for a DB instance.
  final List<AvailabilityZone>? availabilityZones;

  /// A list of the available processor features for the DB instance class of a DB
  /// instance.
  final List<AvailableProcessorFeature>? availableProcessorFeatures;

  /// The DB instance class for a DB instance.
  final String? dBInstanceClass;

  /// The engine type of a DB instance.
  final String? engine;

  /// The engine version of a DB instance.
  final String? engineVersion;

  /// The license model for a DB instance.
  final String? licenseModel;

  /// Maximum total provisioned IOPS for a DB instance.
  final int? maxIopsPerDbInstance;

  /// Maximum provisioned IOPS per GiB for a DB instance.
  final double? maxIopsPerGib;

  /// Maximum storage size for a DB instance.
  final int? maxStorageSize;

  /// Minimum total provisioned IOPS for a DB instance.
  final int? minIopsPerDbInstance;

  /// Minimum provisioned IOPS per GiB for a DB instance.
  final double? minIopsPerGib;

  /// Minimum storage size for a DB instance.
  final int? minStorageSize;

  /// Indicates whether a DB instance is Multi-AZ capable.
  final bool? multiAZCapable;

  /// Whether a DB instance supports RDS on Outposts.
  ///
  /// For more information about RDS on Outposts, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/rds-on-outposts.html">Amazon
  /// RDS on AWS Outposts</a> in the <i>Amazon RDS User Guide.</i>
  final bool? outpostCapable;

  /// Indicates whether a DB instance can have a read replica.
  final bool? readReplicaCapable;

  /// Indicates the storage type for a DB instance.
  final String? storageType;

  /// A list of the supported DB engine modes.
  final List<String>? supportedEngineModes;

  /// Indicates whether a DB instance supports Enhanced Monitoring at intervals
  /// from 1 to 60 seconds.
  final bool? supportsEnhancedMonitoring;

  /// A value that indicates whether you can use Aurora global databases with a
  /// specific combination of other DB engine attributes.
  final bool? supportsGlobalDatabases;

  /// Indicates whether a DB instance supports IAM database authentication.
  final bool? supportsIAMDatabaseAuthentication;

  /// Indicates whether a DB instance supports provisioned IOPS.
  final bool? supportsIops;

  /// Whether a DB instance supports Kerberos Authentication.
  final bool? supportsKerberosAuthentication;

  /// True if a DB instance supports Performance Insights, otherwise false.
  final bool? supportsPerformanceInsights;

  /// Whether Amazon RDS can automatically scale storage for DB instances that use
  /// the specified DB instance class.
  final bool? supportsStorageAutoscaling;

  /// Indicates whether a DB instance supports encrypted storage.
  final bool? supportsStorageEncryption;

  /// Indicates whether a DB instance is in a VPC.
  final bool? vpc;

  OrderableDBInstanceOption({
    this.availabilityZoneGroup,
    this.availabilityZones,
    this.availableProcessorFeatures,
    this.dBInstanceClass,
    this.engine,
    this.engineVersion,
    this.licenseModel,
    this.maxIopsPerDbInstance,
    this.maxIopsPerGib,
    this.maxStorageSize,
    this.minIopsPerDbInstance,
    this.minIopsPerGib,
    this.minStorageSize,
    this.multiAZCapable,
    this.outpostCapable,
    this.readReplicaCapable,
    this.storageType,
    this.supportedEngineModes,
    this.supportsEnhancedMonitoring,
    this.supportsGlobalDatabases,
    this.supportsIAMDatabaseAuthentication,
    this.supportsIops,
    this.supportsKerberosAuthentication,
    this.supportsPerformanceInsights,
    this.supportsStorageAutoscaling,
    this.supportsStorageEncryption,
    this.vpc,
  });
  factory OrderableDBInstanceOption.fromXml(_s.XmlElement elem) {
    return OrderableDBInstanceOption(
      availabilityZoneGroup:
          _s.extractXmlStringValue(elem, 'AvailabilityZoneGroup'),
      availabilityZones: _s.extractXmlChild(elem, 'AvailabilityZones')?.let(
          (elem) => elem
              .findElements('AvailabilityZone')
              .map((c) => AvailabilityZone.fromXml(c))
              .toList()),
      availableProcessorFeatures: _s
          .extractXmlChild(elem, 'AvailableProcessorFeatures')
          ?.let((elem) => elem
              .findElements('AvailableProcessorFeature')
              .map((c) => AvailableProcessorFeature.fromXml(c))
              .toList()),
      dBInstanceClass: _s.extractXmlStringValue(elem, 'DBInstanceClass'),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      licenseModel: _s.extractXmlStringValue(elem, 'LicenseModel'),
      maxIopsPerDbInstance: _s.extractXmlIntValue(elem, 'MaxIopsPerDbInstance'),
      maxIopsPerGib: _s.extractXmlDoubleValue(elem, 'MaxIopsPerGib'),
      maxStorageSize: _s.extractXmlIntValue(elem, 'MaxStorageSize'),
      minIopsPerDbInstance: _s.extractXmlIntValue(elem, 'MinIopsPerDbInstance'),
      minIopsPerGib: _s.extractXmlDoubleValue(elem, 'MinIopsPerGib'),
      minStorageSize: _s.extractXmlIntValue(elem, 'MinStorageSize'),
      multiAZCapable: _s.extractXmlBoolValue(elem, 'MultiAZCapable'),
      outpostCapable: _s.extractXmlBoolValue(elem, 'OutpostCapable'),
      readReplicaCapable: _s.extractXmlBoolValue(elem, 'ReadReplicaCapable'),
      storageType: _s.extractXmlStringValue(elem, 'StorageType'),
      supportedEngineModes: _s
          .extractXmlChild(elem, 'SupportedEngineModes')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      supportsEnhancedMonitoring:
          _s.extractXmlBoolValue(elem, 'SupportsEnhancedMonitoring'),
      supportsGlobalDatabases:
          _s.extractXmlBoolValue(elem, 'SupportsGlobalDatabases'),
      supportsIAMDatabaseAuthentication:
          _s.extractXmlBoolValue(elem, 'SupportsIAMDatabaseAuthentication'),
      supportsIops: _s.extractXmlBoolValue(elem, 'SupportsIops'),
      supportsKerberosAuthentication:
          _s.extractXmlBoolValue(elem, 'SupportsKerberosAuthentication'),
      supportsPerformanceInsights:
          _s.extractXmlBoolValue(elem, 'SupportsPerformanceInsights'),
      supportsStorageAutoscaling:
          _s.extractXmlBoolValue(elem, 'SupportsStorageAutoscaling'),
      supportsStorageEncryption:
          _s.extractXmlBoolValue(elem, 'SupportsStorageEncryption'),
      vpc: _s.extractXmlBoolValue(elem, 'Vpc'),
    );
  }
}

/// Contains the result of a successful invocation of the
/// <code>DescribeOrderableDBInstanceOptions</code> action.
class OrderableDBInstanceOptionsMessage {
  /// An optional pagination token provided by a previous
  /// OrderableDBInstanceOptions request. If this parameter is specified, the
  /// response includes only records beyond the marker, up to the value specified
  /// by <code>MaxRecords</code> .
  final String? marker;

  /// An <code>OrderableDBInstanceOption</code> structure containing information
  /// about orderable options for the DB instance.
  final List<OrderableDBInstanceOption>? orderableDBInstanceOptions;

  OrderableDBInstanceOptionsMessage({
    this.marker,
    this.orderableDBInstanceOptions,
  });
  factory OrderableDBInstanceOptionsMessage.fromXml(_s.XmlElement elem) {
    return OrderableDBInstanceOptionsMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      orderableDBInstanceOptions: _s
          .extractXmlChild(elem, 'OrderableDBInstanceOptions')
          ?.let((elem) => elem
              .findElements('OrderableDBInstanceOption')
              .map((c) => OrderableDBInstanceOption.fromXml(c))
              .toList()),
    );
  }
}

/// A data type that represents an Outpost.
///
/// For more information about RDS on Outposts, see <a
/// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/rds-on-outposts.html">Amazon
/// RDS on AWS Outposts</a> in the <i>Amazon RDS User Guide.</i>
class Outpost {
  /// The Amazon Resource Name (ARN) of the Outpost.
  final String? arn;

  Outpost({
    this.arn,
  });
  factory Outpost.fromXml(_s.XmlElement elem) {
    return Outpost(
      arn: _s.extractXmlStringValue(elem, 'Arn'),
    );
  }
}

/// This data type is used as a request parameter in the
/// <code>ModifyDBParameterGroup</code> and <code>ResetDBParameterGroup</code>
/// actions.
///
/// This data type is used as a response element in the
/// <code>DescribeEngineDefaultParameters</code> and
/// <code>DescribeDBParameters</code> actions.
class Parameter {
  /// Specifies the valid range of values for the parameter.
  final String? allowedValues;

  /// Indicates when to apply parameter updates.
  final ApplyMethod? applyMethod;

  /// Specifies the engine specific parameters type.
  final String? applyType;

  /// Specifies the valid data type for the parameter.
  final String? dataType;

  /// Provides a description of the parameter.
  final String? description;

  /// Indicates whether (<code>true</code>) or not (<code>false</code>) the
  /// parameter can be modified. Some parameters have security or operational
  /// implications that prevent them from being changed.
  final bool? isModifiable;

  /// The earliest engine version to which the parameter can apply.
  final String? minimumEngineVersion;

  /// Specifies the name of the parameter.
  final String? parameterName;

  /// Specifies the value of the parameter.
  final String? parameterValue;

  /// Indicates the source of the parameter value.
  final String? source;

  /// The valid DB engine modes.
  final List<String>? supportedEngineModes;

  Parameter({
    this.allowedValues,
    this.applyMethod,
    this.applyType,
    this.dataType,
    this.description,
    this.isModifiable,
    this.minimumEngineVersion,
    this.parameterName,
    this.parameterValue,
    this.source,
    this.supportedEngineModes,
  });
  factory Parameter.fromXml(_s.XmlElement elem) {
    return Parameter(
      allowedValues: _s.extractXmlStringValue(elem, 'AllowedValues'),
      applyMethod:
          _s.extractXmlStringValue(elem, 'ApplyMethod')?.toApplyMethod(),
      applyType: _s.extractXmlStringValue(elem, 'ApplyType'),
      dataType: _s.extractXmlStringValue(elem, 'DataType'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      isModifiable: _s.extractXmlBoolValue(elem, 'IsModifiable'),
      minimumEngineVersion:
          _s.extractXmlStringValue(elem, 'MinimumEngineVersion'),
      parameterName: _s.extractXmlStringValue(elem, 'ParameterName'),
      parameterValue: _s.extractXmlStringValue(elem, 'ParameterValue'),
      source: _s.extractXmlStringValue(elem, 'Source'),
      supportedEngineModes: _s
          .extractXmlChild(elem, 'SupportedEngineModes')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final allowedValues = this.allowedValues;
    final applyMethod = this.applyMethod;
    final applyType = this.applyType;
    final dataType = this.dataType;
    final description = this.description;
    final isModifiable = this.isModifiable;
    final minimumEngineVersion = this.minimumEngineVersion;
    final parameterName = this.parameterName;
    final parameterValue = this.parameterValue;
    final source = this.source;
    final supportedEngineModes = this.supportedEngineModes;
    return {
      if (allowedValues != null) 'AllowedValues': allowedValues,
      if (applyMethod != null) 'ApplyMethod': applyMethod.toValue(),
      if (applyType != null) 'ApplyType': applyType,
      if (dataType != null) 'DataType': dataType,
      if (description != null) 'Description': description,
      if (isModifiable != null) 'IsModifiable': isModifiable,
      if (minimumEngineVersion != null)
        'MinimumEngineVersion': minimumEngineVersion,
      if (parameterName != null) 'ParameterName': parameterName,
      if (parameterValue != null) 'ParameterValue': parameterValue,
      if (source != null) 'Source': source,
      if (supportedEngineModes != null)
        'SupportedEngineModes': supportedEngineModes,
    };
  }
}

/// A list of the log types whose configuration is still pending. In other
/// words, these log types are in the process of being activated or deactivated.
class PendingCloudwatchLogsExports {
  /// Log types that are in the process of being enabled. After they are enabled,
  /// these log types are exported to CloudWatch Logs.
  final List<String>? logTypesToDisable;

  /// Log types that are in the process of being deactivated. After they are
  /// deactivated, these log types aren't exported to CloudWatch Logs.
  final List<String>? logTypesToEnable;

  PendingCloudwatchLogsExports({
    this.logTypesToDisable,
    this.logTypesToEnable,
  });
  factory PendingCloudwatchLogsExports.fromXml(_s.XmlElement elem) {
    return PendingCloudwatchLogsExports(
      logTypesToDisable: _s
          .extractXmlChild(elem, 'LogTypesToDisable')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      logTypesToEnable: _s
          .extractXmlChild(elem, 'LogTypesToEnable')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }
}

/// Provides information about a pending maintenance action for a resource.
class PendingMaintenanceAction {
  /// The type of pending maintenance action that is available for the resource.
  /// Valid actions are <code>system-update</code>, <code>db-upgrade</code>,
  /// <code>hardware-maintenance</code>, and <code>ca-certificate-rotation</code>.
  final String? action;

  /// The date of the maintenance window when the action is applied. The
  /// maintenance action is applied to the resource during its first maintenance
  /// window after this date.
  final DateTime? autoAppliedAfterDate;

  /// The effective date when the pending maintenance action is applied to the
  /// resource. This date takes into account opt-in requests received from the
  /// <code>ApplyPendingMaintenanceAction</code> API, the
  /// <code>AutoAppliedAfterDate</code>, and the <code>ForcedApplyDate</code>.
  /// This value is blank if an opt-in request has not been received and nothing
  /// has been specified as <code>AutoAppliedAfterDate</code> or
  /// <code>ForcedApplyDate</code>.
  final DateTime? currentApplyDate;

  /// A description providing more detail about the maintenance action.
  final String? description;

  /// The date when the maintenance action is automatically applied.
  ///
  /// On this date, the maintenance action is applied to the resource as soon as
  /// possible, regardless of the maintenance window for the resource. There might
  /// be a delay of one or more days from this date before the maintenance action
  /// is applied.
  final DateTime? forcedApplyDate;

  /// Indicates the type of opt-in request that has been received for the
  /// resource.
  final String? optInStatus;

  PendingMaintenanceAction({
    this.action,
    this.autoAppliedAfterDate,
    this.currentApplyDate,
    this.description,
    this.forcedApplyDate,
    this.optInStatus,
  });
  factory PendingMaintenanceAction.fromXml(_s.XmlElement elem) {
    return PendingMaintenanceAction(
      action: _s.extractXmlStringValue(elem, 'Action'),
      autoAppliedAfterDate:
          _s.extractXmlDateTimeValue(elem, 'AutoAppliedAfterDate'),
      currentApplyDate: _s.extractXmlDateTimeValue(elem, 'CurrentApplyDate'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      forcedApplyDate: _s.extractXmlDateTimeValue(elem, 'ForcedApplyDate'),
      optInStatus: _s.extractXmlStringValue(elem, 'OptInStatus'),
    );
  }
}

/// Data returned from the <b>DescribePendingMaintenanceActions</b> action.
class PendingMaintenanceActionsMessage {
  /// An optional pagination token provided by a previous
  /// <code>DescribePendingMaintenanceActions</code> request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to a
  /// number of records specified by <code>MaxRecords</code>.
  final String? marker;

  /// A list of the pending maintenance actions for the resource.
  final List<ResourcePendingMaintenanceActions>? pendingMaintenanceActions;

  PendingMaintenanceActionsMessage({
    this.marker,
    this.pendingMaintenanceActions,
  });
  factory PendingMaintenanceActionsMessage.fromXml(_s.XmlElement elem) {
    return PendingMaintenanceActionsMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      pendingMaintenanceActions: _s
          .extractXmlChild(elem, 'PendingMaintenanceActions')
          ?.let((elem) => elem
              .findElements('ResourcePendingMaintenanceActions')
              .map((c) => ResourcePendingMaintenanceActions.fromXml(c))
              .toList()),
    );
  }
}

/// This data type is used as a response element in the
/// <code>ModifyDBInstance</code> action and contains changes that will be
/// applied during the next maintenance window.
class PendingModifiedValues {
  /// The allocated storage size for the DB instance specified in gibibytes .
  final int? allocatedStorage;

  /// The number of days for which automated backups are retained.
  final int? backupRetentionPeriod;

  /// The identifier of the CA certificate for the DB instance.
  final String? cACertificateIdentifier;

  /// The name of the compute and memory capacity class for the DB instance.
  final String? dBInstanceClass;

  /// The database identifier for the DB instance.
  final String? dBInstanceIdentifier;

  /// The DB subnet group for the DB instance.
  final String? dBSubnetGroupName;

  /// The database engine version.
  final String? engineVersion;

  /// Whether mapping of AWS Identity and Access Management (IAM) accounts to
  /// database accounts is enabled.
  final bool? iAMDatabaseAuthenticationEnabled;

  /// The Provisioned IOPS value for the DB instance.
  final int? iops;

  /// The license model for the DB instance.
  ///
  /// Valid values: <code>license-included</code> |
  /// <code>bring-your-own-license</code> | <code>general-public-license</code>
  final String? licenseModel;

  /// The master credentials for the DB instance.
  final String? masterUserPassword;

  /// Indicates that the Single-AZ DB instance will change to a Multi-AZ
  /// deployment.
  final bool? multiAZ;
  final PendingCloudwatchLogsExports? pendingCloudwatchLogsExports;

  /// The port for the DB instance.
  final int? port;

  /// The number of CPU cores and the number of threads per core for the DB
  /// instance class of the DB instance.
  final List<ProcessorFeature>? processorFeatures;

  /// The storage type of the DB instance.
  final String? storageType;

  PendingModifiedValues({
    this.allocatedStorage,
    this.backupRetentionPeriod,
    this.cACertificateIdentifier,
    this.dBInstanceClass,
    this.dBInstanceIdentifier,
    this.dBSubnetGroupName,
    this.engineVersion,
    this.iAMDatabaseAuthenticationEnabled,
    this.iops,
    this.licenseModel,
    this.masterUserPassword,
    this.multiAZ,
    this.pendingCloudwatchLogsExports,
    this.port,
    this.processorFeatures,
    this.storageType,
  });
  factory PendingModifiedValues.fromXml(_s.XmlElement elem) {
    return PendingModifiedValues(
      allocatedStorage: _s.extractXmlIntValue(elem, 'AllocatedStorage'),
      backupRetentionPeriod:
          _s.extractXmlIntValue(elem, 'BackupRetentionPeriod'),
      cACertificateIdentifier:
          _s.extractXmlStringValue(elem, 'CACertificateIdentifier'),
      dBInstanceClass: _s.extractXmlStringValue(elem, 'DBInstanceClass'),
      dBInstanceIdentifier:
          _s.extractXmlStringValue(elem, 'DBInstanceIdentifier'),
      dBSubnetGroupName: _s.extractXmlStringValue(elem, 'DBSubnetGroupName'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      iAMDatabaseAuthenticationEnabled:
          _s.extractXmlBoolValue(elem, 'IAMDatabaseAuthenticationEnabled'),
      iops: _s.extractXmlIntValue(elem, 'Iops'),
      licenseModel: _s.extractXmlStringValue(elem, 'LicenseModel'),
      masterUserPassword: _s.extractXmlStringValue(elem, 'MasterUserPassword'),
      multiAZ: _s.extractXmlBoolValue(elem, 'MultiAZ'),
      pendingCloudwatchLogsExports: _s
          .extractXmlChild(elem, 'PendingCloudwatchLogsExports')
          ?.let((e) => PendingCloudwatchLogsExports.fromXml(e)),
      port: _s.extractXmlIntValue(elem, 'Port'),
      processorFeatures: _s.extractXmlChild(elem, 'ProcessorFeatures')?.let(
          (elem) => elem
              .findElements('ProcessorFeature')
              .map((c) => ProcessorFeature.fromXml(c))
              .toList()),
      storageType: _s.extractXmlStringValue(elem, 'StorageType'),
    );
  }
}

/// Contains the processor features of a DB instance class.
///
/// To specify the number of CPU cores, use the <code>coreCount</code> feature
/// name for the <code>Name</code> parameter. To specify the number of threads
/// per core, use the <code>threadsPerCore</code> feature name for the
/// <code>Name</code> parameter.
///
/// You can set the processor features of the DB instance class for a DB
/// instance when you call one of the following actions:
///
/// <ul>
/// <li>
/// <code>CreateDBInstance</code>
/// </li>
/// <li>
/// <code>ModifyDBInstance</code>
/// </li>
/// <li>
/// <code>RestoreDBInstanceFromDBSnapshot</code>
/// </li>
/// <li>
/// <code>RestoreDBInstanceFromS3</code>
/// </li>
/// <li>
/// <code>RestoreDBInstanceToPointInTime</code>
/// </li>
/// </ul>
/// You can view the valid processor values for a particular instance class by
/// calling the <code>DescribeOrderableDBInstanceOptions</code> action and
/// specifying the instance class for the <code>DBInstanceClass</code>
/// parameter.
///
/// In addition, you can use the following actions for DB instance class
/// processor information:
///
/// <ul>
/// <li>
/// <code>DescribeDBInstances</code>
/// </li>
/// <li>
/// <code>DescribeDBSnapshots</code>
/// </li>
/// <li>
/// <code>DescribeValidDBInstanceModifications</code>
/// </li>
/// </ul>
/// If you call <code>DescribeDBInstances</code>, <code>ProcessorFeature</code>
/// returns non-null values only if the following conditions are met:
///
/// <ul>
/// <li>
/// You are accessing an Oracle DB instance.
/// </li>
/// <li>
/// Your Oracle DB instance class supports configuring the number of CPU cores
/// and threads per core.
/// </li>
/// <li>
/// The current number CPU cores and threads is set to a non-default value.
/// </li>
/// </ul>
/// For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.DBInstanceClass.html#USER_ConfigureProcessor">Configuring
/// the Processor of the DB Instance Class</a> in the <i>Amazon RDS User Guide.
/// </i>
class ProcessorFeature {
  /// The name of the processor feature. Valid names are <code>coreCount</code>
  /// and <code>threadsPerCore</code>.
  final String? name;

  /// The value of a processor feature name.
  final String? value;

  ProcessorFeature({
    this.name,
    this.value,
  });
  factory ProcessorFeature.fromXml(_s.XmlElement elem) {
    return ProcessorFeature(
      name: _s.extractXmlStringValue(elem, 'Name'),
      value: _s.extractXmlStringValue(elem, 'Value'),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'Name': name,
      if (value != null) 'Value': value,
    };
  }
}

class PromoteReadReplicaDBClusterResult {
  final DBCluster? dBCluster;

  PromoteReadReplicaDBClusterResult({
    this.dBCluster,
  });
  factory PromoteReadReplicaDBClusterResult.fromXml(_s.XmlElement elem) {
    return PromoteReadReplicaDBClusterResult(
      dBCluster: _s
          .extractXmlChild(elem, 'DBCluster')
          ?.let((e) => DBCluster.fromXml(e)),
    );
  }
}

class PromoteReadReplicaResult {
  final DBInstance? dBInstance;

  PromoteReadReplicaResult({
    this.dBInstance,
  });
  factory PromoteReadReplicaResult.fromXml(_s.XmlElement elem) {
    return PromoteReadReplicaResult(
      dBInstance: _s
          .extractXmlChild(elem, 'DBInstance')
          ?.let((e) => DBInstance.fromXml(e)),
    );
  }
}

class PurchaseReservedDBInstancesOfferingResult {
  final ReservedDBInstance? reservedDBInstance;

  PurchaseReservedDBInstancesOfferingResult({
    this.reservedDBInstance,
  });
  factory PurchaseReservedDBInstancesOfferingResult.fromXml(
      _s.XmlElement elem) {
    return PurchaseReservedDBInstancesOfferingResult(
      reservedDBInstance: _s
          .extractXmlChild(elem, 'ReservedDBInstance')
          ?.let((e) => ReservedDBInstance.fromXml(e)),
    );
  }
}

/// A range of integer values.
class Range {
  /// The minimum value in the range.
  final int? from;

  /// The step value for the range. For example, if you have a range of 5,000 to
  /// 10,000, with a step value of 1,000, the valid values start at 5,000 and step
  /// up by 1,000. Even though 7,500 is within the range, it isn't a valid value
  /// for the range. The valid values are 5,000, 6,000, 7,000, 8,000...
  final int? step;

  /// The maximum value in the range.
  final int? to;

  Range({
    this.from,
    this.step,
    this.to,
  });
  factory Range.fromXml(_s.XmlElement elem) {
    return Range(
      from: _s.extractXmlIntValue(elem, 'From'),
      step: _s.extractXmlIntValue(elem, 'Step'),
      to: _s.extractXmlIntValue(elem, 'To'),
    );
  }
}

class RebootDBInstanceResult {
  final DBInstance? dBInstance;

  RebootDBInstanceResult({
    this.dBInstance,
  });
  factory RebootDBInstanceResult.fromXml(_s.XmlElement elem) {
    return RebootDBInstanceResult(
      dBInstance: _s
          .extractXmlChild(elem, 'DBInstance')
          ?.let((e) => DBInstance.fromXml(e)),
    );
  }
}

/// This data type is used as a response element in the
/// <code>DescribeReservedDBInstances</code> and
/// <code>DescribeReservedDBInstancesOfferings</code> actions.
class RecurringCharge {
  /// The amount of the recurring charge.
  final double? recurringChargeAmount;

  /// The frequency of the recurring charge.
  final String? recurringChargeFrequency;

  RecurringCharge({
    this.recurringChargeAmount,
    this.recurringChargeFrequency,
  });
  factory RecurringCharge.fromXml(_s.XmlElement elem) {
    return RecurringCharge(
      recurringChargeAmount:
          _s.extractXmlDoubleValue(elem, 'RecurringChargeAmount'),
      recurringChargeFrequency:
          _s.extractXmlStringValue(elem, 'RecurringChargeFrequency'),
    );
  }
}

class RegisterDBProxyTargetsResponse {
  /// One or more <code>DBProxyTarget</code> objects that are created when you
  /// register targets with a target group.
  final List<DBProxyTarget>? dBProxyTargets;

  RegisterDBProxyTargetsResponse({
    this.dBProxyTargets,
  });
  factory RegisterDBProxyTargetsResponse.fromXml(_s.XmlElement elem) {
    return RegisterDBProxyTargetsResponse(
      dBProxyTargets: _s.extractXmlChild(elem, 'DBProxyTargets')?.let((elem) =>
          elem
              .findElements('member')
              .map((c) => DBProxyTarget.fromXml(c))
              .toList()),
    );
  }
}

class RemoveFromGlobalClusterResult {
  final GlobalCluster? globalCluster;

  RemoveFromGlobalClusterResult({
    this.globalCluster,
  });
  factory RemoveFromGlobalClusterResult.fromXml(_s.XmlElement elem) {
    return RemoveFromGlobalClusterResult(
      globalCluster: _s
          .extractXmlChild(elem, 'GlobalCluster')
          ?.let((e) => GlobalCluster.fromXml(e)),
    );
  }
}

class RemoveSourceIdentifierFromSubscriptionResult {
  final EventSubscription? eventSubscription;

  RemoveSourceIdentifierFromSubscriptionResult({
    this.eventSubscription,
  });
  factory RemoveSourceIdentifierFromSubscriptionResult.fromXml(
      _s.XmlElement elem) {
    return RemoveSourceIdentifierFromSubscriptionResult(
      eventSubscription: _s
          .extractXmlChild(elem, 'EventSubscription')
          ?.let((e) => EventSubscription.fromXml(e)),
    );
  }
}

enum ReplicaMode {
  openReadOnly,
  mounted,
}

extension on ReplicaMode {
  String toValue() {
    switch (this) {
      case ReplicaMode.openReadOnly:
        return 'open-read-only';
      case ReplicaMode.mounted:
        return 'mounted';
    }
  }
}

extension on String {
  ReplicaMode toReplicaMode() {
    switch (this) {
      case 'open-read-only':
        return ReplicaMode.openReadOnly;
      case 'mounted':
        return ReplicaMode.mounted;
    }
    throw Exception('$this is not known in enum ReplicaMode');
  }
}

/// This data type is used as a response element in the
/// <code>DescribeReservedDBInstances</code> and
/// <code>PurchaseReservedDBInstancesOffering</code> actions.
class ReservedDBInstance {
  /// The currency code for the reserved DB instance.
  final String? currencyCode;

  /// The DB instance class for the reserved DB instance.
  final String? dBInstanceClass;

  /// The number of reserved DB instances.
  final int? dBInstanceCount;

  /// The duration of the reservation in seconds.
  final int? duration;

  /// The fixed price charged for this reserved DB instance.
  final double? fixedPrice;

  /// The unique identifier for the lease associated with the reserved DB
  /// instance.
  /// <note>
  /// AWS Support might request the lease ID for an issue related to a reserved DB
  /// instance.
  /// </note>
  final String? leaseId;

  /// Indicates if the reservation applies to Multi-AZ deployments.
  final bool? multiAZ;

  /// The offering type of this reserved DB instance.
  final String? offeringType;

  /// The description of the reserved DB instance.
  final String? productDescription;

  /// The recurring price charged to run this reserved DB instance.
  final List<RecurringCharge>? recurringCharges;

  /// The Amazon Resource Name (ARN) for the reserved DB instance.
  final String? reservedDBInstanceArn;

  /// The unique identifier for the reservation.
  final String? reservedDBInstanceId;

  /// The offering identifier.
  final String? reservedDBInstancesOfferingId;

  /// The time the reservation started.
  final DateTime? startTime;

  /// The state of the reserved DB instance.
  final String? state;

  /// The hourly price charged for this reserved DB instance.
  final double? usagePrice;

  ReservedDBInstance({
    this.currencyCode,
    this.dBInstanceClass,
    this.dBInstanceCount,
    this.duration,
    this.fixedPrice,
    this.leaseId,
    this.multiAZ,
    this.offeringType,
    this.productDescription,
    this.recurringCharges,
    this.reservedDBInstanceArn,
    this.reservedDBInstanceId,
    this.reservedDBInstancesOfferingId,
    this.startTime,
    this.state,
    this.usagePrice,
  });
  factory ReservedDBInstance.fromXml(_s.XmlElement elem) {
    return ReservedDBInstance(
      currencyCode: _s.extractXmlStringValue(elem, 'CurrencyCode'),
      dBInstanceClass: _s.extractXmlStringValue(elem, 'DBInstanceClass'),
      dBInstanceCount: _s.extractXmlIntValue(elem, 'DBInstanceCount'),
      duration: _s.extractXmlIntValue(elem, 'Duration'),
      fixedPrice: _s.extractXmlDoubleValue(elem, 'FixedPrice'),
      leaseId: _s.extractXmlStringValue(elem, 'LeaseId'),
      multiAZ: _s.extractXmlBoolValue(elem, 'MultiAZ'),
      offeringType: _s.extractXmlStringValue(elem, 'OfferingType'),
      productDescription: _s.extractXmlStringValue(elem, 'ProductDescription'),
      recurringCharges: _s.extractXmlChild(elem, 'RecurringCharges')?.let(
          (elem) => elem
              .findElements('RecurringCharge')
              .map((c) => RecurringCharge.fromXml(c))
              .toList()),
      reservedDBInstanceArn:
          _s.extractXmlStringValue(elem, 'ReservedDBInstanceArn'),
      reservedDBInstanceId:
          _s.extractXmlStringValue(elem, 'ReservedDBInstanceId'),
      reservedDBInstancesOfferingId:
          _s.extractXmlStringValue(elem, 'ReservedDBInstancesOfferingId'),
      startTime: _s.extractXmlDateTimeValue(elem, 'StartTime'),
      state: _s.extractXmlStringValue(elem, 'State'),
      usagePrice: _s.extractXmlDoubleValue(elem, 'UsagePrice'),
    );
  }
}

/// Contains the result of a successful invocation of the
/// <code>DescribeReservedDBInstances</code> action.
class ReservedDBInstanceMessage {
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String? marker;

  /// A list of reserved DB instances.
  final List<ReservedDBInstance>? reservedDBInstances;

  ReservedDBInstanceMessage({
    this.marker,
    this.reservedDBInstances,
  });
  factory ReservedDBInstanceMessage.fromXml(_s.XmlElement elem) {
    return ReservedDBInstanceMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      reservedDBInstances: _s.extractXmlChild(elem, 'ReservedDBInstances')?.let(
          (elem) => elem
              .findElements('ReservedDBInstance')
              .map((c) => ReservedDBInstance.fromXml(c))
              .toList()),
    );
  }
}

/// This data type is used as a response element in the
/// <code>DescribeReservedDBInstancesOfferings</code> action.
class ReservedDBInstancesOffering {
  /// The currency code for the reserved DB instance offering.
  final String? currencyCode;

  /// The DB instance class for the reserved DB instance.
  final String? dBInstanceClass;

  /// The duration of the offering in seconds.
  final int? duration;

  /// The fixed price charged for this offering.
  final double? fixedPrice;

  /// Indicates if the offering applies to Multi-AZ deployments.
  final bool? multiAZ;

  /// The offering type.
  final String? offeringType;

  /// The database engine used by the offering.
  final String? productDescription;

  /// The recurring price charged to run this reserved DB instance.
  final List<RecurringCharge>? recurringCharges;

  /// The offering identifier.
  final String? reservedDBInstancesOfferingId;

  /// The hourly price charged for this offering.
  final double? usagePrice;

  ReservedDBInstancesOffering({
    this.currencyCode,
    this.dBInstanceClass,
    this.duration,
    this.fixedPrice,
    this.multiAZ,
    this.offeringType,
    this.productDescription,
    this.recurringCharges,
    this.reservedDBInstancesOfferingId,
    this.usagePrice,
  });
  factory ReservedDBInstancesOffering.fromXml(_s.XmlElement elem) {
    return ReservedDBInstancesOffering(
      currencyCode: _s.extractXmlStringValue(elem, 'CurrencyCode'),
      dBInstanceClass: _s.extractXmlStringValue(elem, 'DBInstanceClass'),
      duration: _s.extractXmlIntValue(elem, 'Duration'),
      fixedPrice: _s.extractXmlDoubleValue(elem, 'FixedPrice'),
      multiAZ: _s.extractXmlBoolValue(elem, 'MultiAZ'),
      offeringType: _s.extractXmlStringValue(elem, 'OfferingType'),
      productDescription: _s.extractXmlStringValue(elem, 'ProductDescription'),
      recurringCharges: _s.extractXmlChild(elem, 'RecurringCharges')?.let(
          (elem) => elem
              .findElements('RecurringCharge')
              .map((c) => RecurringCharge.fromXml(c))
              .toList()),
      reservedDBInstancesOfferingId:
          _s.extractXmlStringValue(elem, 'ReservedDBInstancesOfferingId'),
      usagePrice: _s.extractXmlDoubleValue(elem, 'UsagePrice'),
    );
  }
}

/// Contains the result of a successful invocation of the
/// <code>DescribeReservedDBInstancesOfferings</code> action.
class ReservedDBInstancesOfferingMessage {
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String? marker;

  /// A list of reserved DB instance offerings.
  final List<ReservedDBInstancesOffering>? reservedDBInstancesOfferings;

  ReservedDBInstancesOfferingMessage({
    this.marker,
    this.reservedDBInstancesOfferings,
  });
  factory ReservedDBInstancesOfferingMessage.fromXml(_s.XmlElement elem) {
    return ReservedDBInstancesOfferingMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      reservedDBInstancesOfferings: _s
          .extractXmlChild(elem, 'ReservedDBInstancesOfferings')
          ?.let((elem) => elem
              .findElements('ReservedDBInstancesOffering')
              .map((c) => ReservedDBInstancesOffering.fromXml(c))
              .toList()),
    );
  }
}

/// Describes the pending maintenance actions for a resource.
class ResourcePendingMaintenanceActions {
  /// A list that provides details about the pending maintenance actions for the
  /// resource.
  final List<PendingMaintenanceAction>? pendingMaintenanceActionDetails;

  /// The ARN of the resource that has pending maintenance actions.
  final String? resourceIdentifier;

  ResourcePendingMaintenanceActions({
    this.pendingMaintenanceActionDetails,
    this.resourceIdentifier,
  });
  factory ResourcePendingMaintenanceActions.fromXml(_s.XmlElement elem) {
    return ResourcePendingMaintenanceActions(
      pendingMaintenanceActionDetails: _s
          .extractXmlChild(elem, 'PendingMaintenanceActionDetails')
          ?.let((elem) => elem
              .findElements('PendingMaintenanceAction')
              .map((c) => PendingMaintenanceAction.fromXml(c))
              .toList()),
      resourceIdentifier: _s.extractXmlStringValue(elem, 'ResourceIdentifier'),
    );
  }
}

class RestoreDBClusterFromS3Result {
  final DBCluster? dBCluster;

  RestoreDBClusterFromS3Result({
    this.dBCluster,
  });
  factory RestoreDBClusterFromS3Result.fromXml(_s.XmlElement elem) {
    return RestoreDBClusterFromS3Result(
      dBCluster: _s
          .extractXmlChild(elem, 'DBCluster')
          ?.let((e) => DBCluster.fromXml(e)),
    );
  }
}

class RestoreDBClusterFromSnapshotResult {
  final DBCluster? dBCluster;

  RestoreDBClusterFromSnapshotResult({
    this.dBCluster,
  });
  factory RestoreDBClusterFromSnapshotResult.fromXml(_s.XmlElement elem) {
    return RestoreDBClusterFromSnapshotResult(
      dBCluster: _s
          .extractXmlChild(elem, 'DBCluster')
          ?.let((e) => DBCluster.fromXml(e)),
    );
  }
}

class RestoreDBClusterToPointInTimeResult {
  final DBCluster? dBCluster;

  RestoreDBClusterToPointInTimeResult({
    this.dBCluster,
  });
  factory RestoreDBClusterToPointInTimeResult.fromXml(_s.XmlElement elem) {
    return RestoreDBClusterToPointInTimeResult(
      dBCluster: _s
          .extractXmlChild(elem, 'DBCluster')
          ?.let((e) => DBCluster.fromXml(e)),
    );
  }
}

class RestoreDBInstanceFromDBSnapshotResult {
  final DBInstance? dBInstance;

  RestoreDBInstanceFromDBSnapshotResult({
    this.dBInstance,
  });
  factory RestoreDBInstanceFromDBSnapshotResult.fromXml(_s.XmlElement elem) {
    return RestoreDBInstanceFromDBSnapshotResult(
      dBInstance: _s
          .extractXmlChild(elem, 'DBInstance')
          ?.let((e) => DBInstance.fromXml(e)),
    );
  }
}

class RestoreDBInstanceFromS3Result {
  final DBInstance? dBInstance;

  RestoreDBInstanceFromS3Result({
    this.dBInstance,
  });
  factory RestoreDBInstanceFromS3Result.fromXml(_s.XmlElement elem) {
    return RestoreDBInstanceFromS3Result(
      dBInstance: _s
          .extractXmlChild(elem, 'DBInstance')
          ?.let((e) => DBInstance.fromXml(e)),
    );
  }
}

class RestoreDBInstanceToPointInTimeResult {
  final DBInstance? dBInstance;

  RestoreDBInstanceToPointInTimeResult({
    this.dBInstance,
  });
  factory RestoreDBInstanceToPointInTimeResult.fromXml(_s.XmlElement elem) {
    return RestoreDBInstanceToPointInTimeResult(
      dBInstance: _s
          .extractXmlChild(elem, 'DBInstance')
          ?.let((e) => DBInstance.fromXml(e)),
    );
  }
}

/// Earliest and latest time an instance can be restored to:
class RestoreWindow {
  /// The earliest time you can restore an instance to.
  final DateTime? earliestTime;

  /// The latest time you can restore an instance to.
  final DateTime? latestTime;

  RestoreWindow({
    this.earliestTime,
    this.latestTime,
  });
  factory RestoreWindow.fromXml(_s.XmlElement elem) {
    return RestoreWindow(
      earliestTime: _s.extractXmlDateTimeValue(elem, 'EarliestTime'),
      latestTime: _s.extractXmlDateTimeValue(elem, 'LatestTime'),
    );
  }
}

class RevokeDBSecurityGroupIngressResult {
  final DBSecurityGroup? dBSecurityGroup;

  RevokeDBSecurityGroupIngressResult({
    this.dBSecurityGroup,
  });
  factory RevokeDBSecurityGroupIngressResult.fromXml(_s.XmlElement elem) {
    return RevokeDBSecurityGroupIngressResult(
      dBSecurityGroup: _s
          .extractXmlChild(elem, 'DBSecurityGroup')
          ?.let((e) => DBSecurityGroup.fromXml(e)),
    );
  }
}

/// Contains the scaling configuration of an Aurora Serverless DB cluster.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.html">Using
/// Amazon Aurora Serverless</a> in the <i>Amazon Aurora User Guide</i>.
class ScalingConfiguration {
  /// A value that indicates whether to allow or disallow automatic pause for an
  /// Aurora DB cluster in <code>serverless</code> DB engine mode. A DB cluster
  /// can be paused only when it's idle (it has no connections).
  /// <note>
  /// If a DB cluster is paused for more than seven days, the DB cluster might be
  /// backed up with a snapshot. In this case, the DB cluster is restored when
  /// there is a request to connect to it.
  /// </note>
  final bool? autoPause;

  /// The maximum capacity for an Aurora DB cluster in <code>serverless</code> DB
  /// engine mode.
  ///
  /// For Aurora MySQL, valid capacity values are <code>1</code>, <code>2</code>,
  /// <code>4</code>, <code>8</code>, <code>16</code>, <code>32</code>,
  /// <code>64</code>, <code>128</code>, and <code>256</code>.
  ///
  /// For Aurora PostgreSQL, valid capacity values are <code>2</code>,
  /// <code>4</code>, <code>8</code>, <code>16</code>, <code>32</code>,
  /// <code>64</code>, <code>192</code>, and <code>384</code>.
  ///
  /// The maximum capacity must be greater than or equal to the minimum capacity.
  final int? maxCapacity;

  /// The minimum capacity for an Aurora DB cluster in <code>serverless</code> DB
  /// engine mode.
  ///
  /// For Aurora MySQL, valid capacity values are <code>1</code>, <code>2</code>,
  /// <code>4</code>, <code>8</code>, <code>16</code>, <code>32</code>,
  /// <code>64</code>, <code>128</code>, and <code>256</code>.
  ///
  /// For Aurora PostgreSQL, valid capacity values are <code>2</code>,
  /// <code>4</code>, <code>8</code>, <code>16</code>, <code>32</code>,
  /// <code>64</code>, <code>192</code>, and <code>384</code>.
  ///
  /// The minimum capacity must be less than or equal to the maximum capacity.
  final int? minCapacity;

  /// The time, in seconds, before an Aurora DB cluster in <code>serverless</code>
  /// mode is paused.
  final int? secondsUntilAutoPause;

  /// The action to take when the timeout is reached, either
  /// <code>ForceApplyCapacityChange</code> or
  /// <code>RollbackCapacityChange</code>.
  ///
  /// <code>ForceApplyCapacityChange</code> sets the capacity to the specified
  /// value as soon as possible.
  ///
  /// <code>RollbackCapacityChange</code>, the default, ignores the capacity
  /// change if a scaling point isn't found in the timeout period.
  /// <important>
  /// If you specify <code>ForceApplyCapacityChange</code>, connections that
  /// prevent Aurora Serverless from finding a scaling point might be dropped.
  /// </important>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.how-it-works.html#aurora-serverless.how-it-works.auto-scaling">
  /// Autoscaling for Aurora Serverless</a> in the <i>Amazon Aurora User
  /// Guide</i>.
  final String? timeoutAction;

  ScalingConfiguration({
    this.autoPause,
    this.maxCapacity,
    this.minCapacity,
    this.secondsUntilAutoPause,
    this.timeoutAction,
  });
  Map<String, dynamic> toJson() {
    final autoPause = this.autoPause;
    final maxCapacity = this.maxCapacity;
    final minCapacity = this.minCapacity;
    final secondsUntilAutoPause = this.secondsUntilAutoPause;
    final timeoutAction = this.timeoutAction;
    return {
      if (autoPause != null) 'AutoPause': autoPause,
      if (maxCapacity != null) 'MaxCapacity': maxCapacity,
      if (minCapacity != null) 'MinCapacity': minCapacity,
      if (secondsUntilAutoPause != null)
        'SecondsUntilAutoPause': secondsUntilAutoPause,
      if (timeoutAction != null) 'TimeoutAction': timeoutAction,
    };
  }
}

/// Shows the scaling configuration for an Aurora DB cluster in
/// <code>serverless</code> DB engine mode.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.html">Using
/// Amazon Aurora Serverless</a> in the <i>Amazon Aurora User Guide</i>.
class ScalingConfigurationInfo {
  /// A value that indicates whether automatic pause is allowed for the Aurora DB
  /// cluster in <code>serverless</code> DB engine mode.
  ///
  /// When the value is set to false for an Aurora Serverless DB cluster, the DB
  /// cluster automatically resumes.
  final bool? autoPause;

  /// The maximum capacity for an Aurora DB cluster in <code>serverless</code> DB
  /// engine mode.
  final int? maxCapacity;

  /// The maximum capacity for the Aurora DB cluster in <code>serverless</code> DB
  /// engine mode.
  final int? minCapacity;

  /// The remaining amount of time, in seconds, before the Aurora DB cluster in
  /// <code>serverless</code> mode is paused. A DB cluster can be paused only when
  /// it's idle (it has no connections).
  final int? secondsUntilAutoPause;

  /// The timeout action of a call to <code>ModifyCurrentDBClusterCapacity</code>,
  /// either <code>ForceApplyCapacityChange</code> or
  /// <code>RollbackCapacityChange</code>.
  final String? timeoutAction;

  ScalingConfigurationInfo({
    this.autoPause,
    this.maxCapacity,
    this.minCapacity,
    this.secondsUntilAutoPause,
    this.timeoutAction,
  });
  factory ScalingConfigurationInfo.fromXml(_s.XmlElement elem) {
    return ScalingConfigurationInfo(
      autoPause: _s.extractXmlBoolValue(elem, 'AutoPause'),
      maxCapacity: _s.extractXmlIntValue(elem, 'MaxCapacity'),
      minCapacity: _s.extractXmlIntValue(elem, 'MinCapacity'),
      secondsUntilAutoPause:
          _s.extractXmlIntValue(elem, 'SecondsUntilAutoPause'),
      timeoutAction: _s.extractXmlStringValue(elem, 'TimeoutAction'),
    );
  }
}

/// Contains an AWS Region name as the result of a successful call to the
/// <code>DescribeSourceRegions</code> action.
class SourceRegion {
  /// The endpoint for the source AWS Region endpoint.
  final String? endpoint;

  /// The name of the source AWS Region.
  final String? regionName;

  /// The status of the source AWS Region.
  final String? status;

  /// Whether the source AWS Region supports replicating automated backups to the
  /// current AWS Region.
  final bool? supportsDBInstanceAutomatedBackupsReplication;

  SourceRegion({
    this.endpoint,
    this.regionName,
    this.status,
    this.supportsDBInstanceAutomatedBackupsReplication,
  });
  factory SourceRegion.fromXml(_s.XmlElement elem) {
    return SourceRegion(
      endpoint: _s.extractXmlStringValue(elem, 'Endpoint'),
      regionName: _s.extractXmlStringValue(elem, 'RegionName'),
      status: _s.extractXmlStringValue(elem, 'Status'),
      supportsDBInstanceAutomatedBackupsReplication: _s.extractXmlBoolValue(
          elem, 'SupportsDBInstanceAutomatedBackupsReplication'),
    );
  }
}

/// Contains the result of a successful invocation of the
/// <code>DescribeSourceRegions</code> action.
class SourceRegionMessage {
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String? marker;

  /// A list of SourceRegion instances that contains each source AWS Region that
  /// the current AWS Region can get a read replica or a DB snapshot from.
  final List<SourceRegion>? sourceRegions;

  SourceRegionMessage({
    this.marker,
    this.sourceRegions,
  });
  factory SourceRegionMessage.fromXml(_s.XmlElement elem) {
    return SourceRegionMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      sourceRegions: _s.extractXmlChild(elem, 'SourceRegions')?.let((elem) =>
          elem
              .findElements('SourceRegion')
              .map((c) => SourceRegion.fromXml(c))
              .toList()),
    );
  }
}

enum SourceType {
  dbInstance,
  dbParameterGroup,
  dbSecurityGroup,
  dbSnapshot,
  dbCluster,
  dbClusterSnapshot,
}

extension on SourceType {
  String toValue() {
    switch (this) {
      case SourceType.dbInstance:
        return 'db-instance';
      case SourceType.dbParameterGroup:
        return 'db-parameter-group';
      case SourceType.dbSecurityGroup:
        return 'db-security-group';
      case SourceType.dbSnapshot:
        return 'db-snapshot';
      case SourceType.dbCluster:
        return 'db-cluster';
      case SourceType.dbClusterSnapshot:
        return 'db-cluster-snapshot';
    }
  }
}

extension on String {
  SourceType toSourceType() {
    switch (this) {
      case 'db-instance':
        return SourceType.dbInstance;
      case 'db-parameter-group':
        return SourceType.dbParameterGroup;
      case 'db-security-group':
        return SourceType.dbSecurityGroup;
      case 'db-snapshot':
        return SourceType.dbSnapshot;
      case 'db-cluster':
        return SourceType.dbCluster;
      case 'db-cluster-snapshot':
        return SourceType.dbClusterSnapshot;
    }
    throw Exception('$this is not known in enum SourceType');
  }
}

class StartActivityStreamResponse {
  /// Indicates whether or not the database activity stream will start as soon as
  /// possible, regardless of the maintenance window for the database.
  final bool? applyImmediately;

  /// The name of the Amazon Kinesis data stream to be used for the database
  /// activity stream.
  final String? kinesisStreamName;

  /// The AWS KMS key identifier for encryption of messages in the database
  /// activity stream.
  final String? kmsKeyId;

  /// The mode of the database activity stream.
  final ActivityStreamMode? mode;

  /// The status of the database activity stream.
  final ActivityStreamStatus? status;

  StartActivityStreamResponse({
    this.applyImmediately,
    this.kinesisStreamName,
    this.kmsKeyId,
    this.mode,
    this.status,
  });
  factory StartActivityStreamResponse.fromXml(_s.XmlElement elem) {
    return StartActivityStreamResponse(
      applyImmediately: _s.extractXmlBoolValue(elem, 'ApplyImmediately'),
      kinesisStreamName: _s.extractXmlStringValue(elem, 'KinesisStreamName'),
      kmsKeyId: _s.extractXmlStringValue(elem, 'KmsKeyId'),
      mode: _s.extractXmlStringValue(elem, 'Mode')?.toActivityStreamMode(),
      status:
          _s.extractXmlStringValue(elem, 'Status')?.toActivityStreamStatus(),
    );
  }
}

class StartDBClusterResult {
  final DBCluster? dBCluster;

  StartDBClusterResult({
    this.dBCluster,
  });
  factory StartDBClusterResult.fromXml(_s.XmlElement elem) {
    return StartDBClusterResult(
      dBCluster: _s
          .extractXmlChild(elem, 'DBCluster')
          ?.let((e) => DBCluster.fromXml(e)),
    );
  }
}

class StartDBInstanceAutomatedBackupsReplicationResult {
  final DBInstanceAutomatedBackup? dBInstanceAutomatedBackup;

  StartDBInstanceAutomatedBackupsReplicationResult({
    this.dBInstanceAutomatedBackup,
  });
  factory StartDBInstanceAutomatedBackupsReplicationResult.fromXml(
      _s.XmlElement elem) {
    return StartDBInstanceAutomatedBackupsReplicationResult(
      dBInstanceAutomatedBackup: _s
          .extractXmlChild(elem, 'DBInstanceAutomatedBackup')
          ?.let((e) => DBInstanceAutomatedBackup.fromXml(e)),
    );
  }
}

class StartDBInstanceResult {
  final DBInstance? dBInstance;

  StartDBInstanceResult({
    this.dBInstance,
  });
  factory StartDBInstanceResult.fromXml(_s.XmlElement elem) {
    return StartDBInstanceResult(
      dBInstance: _s
          .extractXmlChild(elem, 'DBInstance')
          ?.let((e) => DBInstance.fromXml(e)),
    );
  }
}

class StopActivityStreamResponse {
  /// The name of the Amazon Kinesis data stream used for the database activity
  /// stream.
  final String? kinesisStreamName;

  /// The AWS KMS key identifier used for encrypting messages in the database
  /// activity stream.
  ///
  /// The AWS KMS key identifier is the key ARN, key ID, alias ARN, or alias name
  /// for the AWS KMS customer master key (CMK).
  final String? kmsKeyId;

  /// The status of the database activity stream.
  final ActivityStreamStatus? status;

  StopActivityStreamResponse({
    this.kinesisStreamName,
    this.kmsKeyId,
    this.status,
  });
  factory StopActivityStreamResponse.fromXml(_s.XmlElement elem) {
    return StopActivityStreamResponse(
      kinesisStreamName: _s.extractXmlStringValue(elem, 'KinesisStreamName'),
      kmsKeyId: _s.extractXmlStringValue(elem, 'KmsKeyId'),
      status:
          _s.extractXmlStringValue(elem, 'Status')?.toActivityStreamStatus(),
    );
  }
}

class StopDBClusterResult {
  final DBCluster? dBCluster;

  StopDBClusterResult({
    this.dBCluster,
  });
  factory StopDBClusterResult.fromXml(_s.XmlElement elem) {
    return StopDBClusterResult(
      dBCluster: _s
          .extractXmlChild(elem, 'DBCluster')
          ?.let((e) => DBCluster.fromXml(e)),
    );
  }
}

class StopDBInstanceAutomatedBackupsReplicationResult {
  final DBInstanceAutomatedBackup? dBInstanceAutomatedBackup;

  StopDBInstanceAutomatedBackupsReplicationResult({
    this.dBInstanceAutomatedBackup,
  });
  factory StopDBInstanceAutomatedBackupsReplicationResult.fromXml(
      _s.XmlElement elem) {
    return StopDBInstanceAutomatedBackupsReplicationResult(
      dBInstanceAutomatedBackup: _s
          .extractXmlChild(elem, 'DBInstanceAutomatedBackup')
          ?.let((e) => DBInstanceAutomatedBackup.fromXml(e)),
    );
  }
}

class StopDBInstanceResult {
  final DBInstance? dBInstance;

  StopDBInstanceResult({
    this.dBInstance,
  });
  factory StopDBInstanceResult.fromXml(_s.XmlElement elem) {
    return StopDBInstanceResult(
      dBInstance: _s
          .extractXmlChild(elem, 'DBInstance')
          ?.let((e) => DBInstance.fromXml(e)),
    );
  }
}

/// This data type is used as a response element for the
/// <code>DescribeDBSubnetGroups</code> operation.
class Subnet {
  final AvailabilityZone? subnetAvailabilityZone;

  /// The identifier of the subnet.
  final String? subnetIdentifier;

  /// If the subnet is associated with an Outpost, this value specifies the
  /// Outpost.
  ///
  /// For more information about RDS on Outposts, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/rds-on-outposts.html">Amazon
  /// RDS on AWS Outposts</a> in the <i>Amazon RDS User Guide.</i>
  final Outpost? subnetOutpost;

  /// The status of the subnet.
  final String? subnetStatus;

  Subnet({
    this.subnetAvailabilityZone,
    this.subnetIdentifier,
    this.subnetOutpost,
    this.subnetStatus,
  });
  factory Subnet.fromXml(_s.XmlElement elem) {
    return Subnet(
      subnetAvailabilityZone: _s
          .extractXmlChild(elem, 'SubnetAvailabilityZone')
          ?.let((e) => AvailabilityZone.fromXml(e)),
      subnetIdentifier: _s.extractXmlStringValue(elem, 'SubnetIdentifier'),
      subnetOutpost: _s
          .extractXmlChild(elem, 'SubnetOutpost')
          ?.let((e) => Outpost.fromXml(e)),
      subnetStatus: _s.extractXmlStringValue(elem, 'SubnetStatus'),
    );
  }
}

/// Metadata assigned to an Amazon RDS resource consisting of a key-value pair.
class Tag {
  /// A key is the required name of the tag. The string value can be from 1 to 128
  /// Unicode characters in length and can't be prefixed with "aws:" or "rds:".
  /// The string can only contain only the set of Unicode letters, digits,
  /// white-space, '_', '.', ':', '/', '=', '+', '-', '@' (Java regex:
  /// "^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-@]*)$").
  final String? key;

  /// A value is the optional value of the tag. The string value can be from 1 to
  /// 256 Unicode characters in length and can't be prefixed with "aws:" or
  /// "rds:". The string can only contain only the set of Unicode letters, digits,
  /// white-space, '_', '.', ':', '/', '=', '+', '-', '@' (Java regex:
  /// "^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-@]*)$").
  final String? value;

  Tag({
    this.key,
    this.value,
  });
  factory Tag.fromXml(_s.XmlElement elem) {
    return Tag(
      key: _s.extractXmlStringValue(elem, 'Key'),
      value: _s.extractXmlStringValue(elem, 'Value'),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'Key': key,
      if (value != null) 'Value': value,
    };
  }
}

/// <p/>
class TagListMessage {
  /// List of tags returned by the ListTagsForResource operation.
  final List<Tag>? tagList;

  TagListMessage({
    this.tagList,
  });
  factory TagListMessage.fromXml(_s.XmlElement elem) {
    return TagListMessage(
      tagList: _s.extractXmlChild(elem, 'TagList')?.let((elem) =>
          elem.findElements('Tag').map((c) => Tag.fromXml(c)).toList()),
    );
  }
}

/// Information about the connection health of an RDS Proxy target.
class TargetHealth {
  /// A description of the health of the RDS Proxy target. If the
  /// <code>State</code> is <code>AVAILABLE</code>, a description is not included.
  final String? description;

  /// The reason for the current health <code>State</code> of the RDS Proxy
  /// target.
  final TargetHealthReason? reason;

  /// The current state of the connection health lifecycle for the RDS Proxy
  /// target. The following is a typical lifecycle example for the states of an
  /// RDS Proxy target:
  ///
  /// <code>registering</code> &gt; <code>unavailable</code> &gt;
  /// <code>available</code> &gt; <code>unavailable</code> &gt;
  /// <code>available</code>
  final TargetState? state;

  TargetHealth({
    this.description,
    this.reason,
    this.state,
  });
  factory TargetHealth.fromXml(_s.XmlElement elem) {
    return TargetHealth(
      description: _s.extractXmlStringValue(elem, 'Description'),
      reason: _s.extractXmlStringValue(elem, 'Reason')?.toTargetHealthReason(),
      state: _s.extractXmlStringValue(elem, 'State')?.toTargetState(),
    );
  }
}

enum TargetHealthReason {
  unreachable,
  connectionFailed,
  authFailure,
  pendingProxyCapacity,
}

extension on TargetHealthReason {
  String toValue() {
    switch (this) {
      case TargetHealthReason.unreachable:
        return 'UNREACHABLE';
      case TargetHealthReason.connectionFailed:
        return 'CONNECTION_FAILED';
      case TargetHealthReason.authFailure:
        return 'AUTH_FAILURE';
      case TargetHealthReason.pendingProxyCapacity:
        return 'PENDING_PROXY_CAPACITY';
    }
  }
}

extension on String {
  TargetHealthReason toTargetHealthReason() {
    switch (this) {
      case 'UNREACHABLE':
        return TargetHealthReason.unreachable;
      case 'CONNECTION_FAILED':
        return TargetHealthReason.connectionFailed;
      case 'AUTH_FAILURE':
        return TargetHealthReason.authFailure;
      case 'PENDING_PROXY_CAPACITY':
        return TargetHealthReason.pendingProxyCapacity;
    }
    throw Exception('$this is not known in enum TargetHealthReason');
  }
}

enum TargetState {
  registering,
  available,
  unavailable,
}

extension on TargetState {
  String toValue() {
    switch (this) {
      case TargetState.registering:
        return 'REGISTERING';
      case TargetState.available:
        return 'AVAILABLE';
      case TargetState.unavailable:
        return 'UNAVAILABLE';
    }
  }
}

extension on String {
  TargetState toTargetState() {
    switch (this) {
      case 'REGISTERING':
        return TargetState.registering;
      case 'AVAILABLE':
        return TargetState.available;
      case 'UNAVAILABLE':
        return TargetState.unavailable;
    }
    throw Exception('$this is not known in enum TargetState');
  }
}

enum TargetType {
  rdsInstance,
  rdsServerlessEndpoint,
  trackedCluster,
}

extension on TargetType {
  String toValue() {
    switch (this) {
      case TargetType.rdsInstance:
        return 'RDS_INSTANCE';
      case TargetType.rdsServerlessEndpoint:
        return 'RDS_SERVERLESS_ENDPOINT';
      case TargetType.trackedCluster:
        return 'TRACKED_CLUSTER';
    }
  }
}

extension on String {
  TargetType toTargetType() {
    switch (this) {
      case 'RDS_INSTANCE':
        return TargetType.rdsInstance;
      case 'RDS_SERVERLESS_ENDPOINT':
        return TargetType.rdsServerlessEndpoint;
      case 'TRACKED_CLUSTER':
        return TargetType.trackedCluster;
    }
    throw Exception('$this is not known in enum TargetType');
  }
}

/// A time zone associated with a <code>DBInstance</code> or a
/// <code>DBSnapshot</code>. This data type is an element in the response to the
/// <code>DescribeDBInstances</code>, the <code>DescribeDBSnapshots</code>, and
/// the <code>DescribeDBEngineVersions</code> actions.
class Timezone {
  /// The name of the time zone.
  final String? timezoneName;

  Timezone({
    this.timezoneName,
  });
  factory Timezone.fromXml(_s.XmlElement elem) {
    return Timezone(
      timezoneName: _s.extractXmlStringValue(elem, 'TimezoneName'),
    );
  }
}

/// The version of the database engine that a DB instance can be upgraded to.
class UpgradeTarget {
  /// A value that indicates whether the target version is applied to any source
  /// DB instances that have <code>AutoMinorVersionUpgrade</code> set to true.
  final bool? autoUpgrade;

  /// The version of the database engine that a DB instance can be upgraded to.
  final String? description;

  /// The name of the upgrade target database engine.
  final String? engine;

  /// The version number of the upgrade target database engine.
  final String? engineVersion;

  /// A value that indicates whether a database engine is upgraded to a major
  /// version.
  final bool? isMajorVersionUpgrade;

  UpgradeTarget({
    this.autoUpgrade,
    this.description,
    this.engine,
    this.engineVersion,
    this.isMajorVersionUpgrade,
  });
  factory UpgradeTarget.fromXml(_s.XmlElement elem) {
    return UpgradeTarget(
      autoUpgrade: _s.extractXmlBoolValue(elem, 'AutoUpgrade'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      isMajorVersionUpgrade:
          _s.extractXmlBoolValue(elem, 'IsMajorVersionUpgrade'),
    );
  }
}

/// Specifies the details of authentication used by a proxy to log in as a
/// specific database user.
class UserAuthConfig {
  /// The type of authentication that the proxy uses for connections from the
  /// proxy to the underlying database.
  final AuthScheme? authScheme;

  /// A user-specified description about the authentication used by a proxy to log
  /// in as a specific database user.
  final String? description;

  /// Whether to require or disallow AWS Identity and Access Management (IAM)
  /// authentication for connections to the proxy.
  final IAMAuthMode? iAMAuth;

  /// The Amazon Resource Name (ARN) representing the secret that the proxy uses
  /// to authenticate to the RDS DB instance or Aurora DB cluster. These secrets
  /// are stored within Amazon Secrets Manager.
  final String? secretArn;

  /// The name of the database user to which the proxy connects.
  final String? userName;

  UserAuthConfig({
    this.authScheme,
    this.description,
    this.iAMAuth,
    this.secretArn,
    this.userName,
  });
  Map<String, dynamic> toJson() {
    final authScheme = this.authScheme;
    final description = this.description;
    final iAMAuth = this.iAMAuth;
    final secretArn = this.secretArn;
    final userName = this.userName;
    return {
      if (authScheme != null) 'AuthScheme': authScheme.toValue(),
      if (description != null) 'Description': description,
      if (iAMAuth != null) 'IAMAuth': iAMAuth.toValue(),
      if (secretArn != null) 'SecretArn': secretArn,
      if (userName != null) 'UserName': userName,
    };
  }
}

/// Returns the details of authentication used by a proxy to log in as a
/// specific database user.
class UserAuthConfigInfo {
  /// The type of authentication that the proxy uses for connections from the
  /// proxy to the underlying database.
  final AuthScheme? authScheme;

  /// A user-specified description about the authentication used by a proxy to log
  /// in as a specific database user.
  final String? description;

  /// Whether to require or disallow AWS Identity and Access Management (IAM)
  /// authentication for connections to the proxy.
  final IAMAuthMode? iAMAuth;

  /// The Amazon Resource Name (ARN) representing the secret that the proxy uses
  /// to authenticate to the RDS DB instance or Aurora DB cluster. These secrets
  /// are stored within Amazon Secrets Manager.
  final String? secretArn;

  /// The name of the database user to which the proxy connects.
  final String? userName;

  UserAuthConfigInfo({
    this.authScheme,
    this.description,
    this.iAMAuth,
    this.secretArn,
    this.userName,
  });
  factory UserAuthConfigInfo.fromXml(_s.XmlElement elem) {
    return UserAuthConfigInfo(
      authScheme: _s.extractXmlStringValue(elem, 'AuthScheme')?.toAuthScheme(),
      description: _s.extractXmlStringValue(elem, 'Description'),
      iAMAuth: _s.extractXmlStringValue(elem, 'IAMAuth')?.toIAMAuthMode(),
      secretArn: _s.extractXmlStringValue(elem, 'SecretArn'),
      userName: _s.extractXmlStringValue(elem, 'UserName'),
    );
  }
}

/// Information about valid modifications that you can make to your DB instance.
/// Contains the result of a successful call to the
/// <code>DescribeValidDBInstanceModifications</code> action. You can use this
/// information when you call <code>ModifyDBInstance</code>.
class ValidDBInstanceModificationsMessage {
  /// Valid storage options for your DB instance.
  final List<ValidStorageOptions>? storage;

  /// Valid processor features for your DB instance.
  final List<AvailableProcessorFeature>? validProcessorFeatures;

  ValidDBInstanceModificationsMessage({
    this.storage,
    this.validProcessorFeatures,
  });
  factory ValidDBInstanceModificationsMessage.fromXml(_s.XmlElement elem) {
    return ValidDBInstanceModificationsMessage(
      storage: _s.extractXmlChild(elem, 'Storage')?.let((elem) => elem
          .findElements('ValidStorageOptions')
          .map((c) => ValidStorageOptions.fromXml(c))
          .toList()),
      validProcessorFeatures: _s
          .extractXmlChild(elem, 'ValidProcessorFeatures')
          ?.let((elem) => elem
              .findElements('AvailableProcessorFeature')
              .map((c) => AvailableProcessorFeature.fromXml(c))
              .toList()),
    );
  }
}

/// Information about valid modifications that you can make to your DB instance.
/// Contains the result of a successful call to the
/// <code>DescribeValidDBInstanceModifications</code> action.
class ValidStorageOptions {
  /// The valid range of Provisioned IOPS to gibibytes of storage multiplier. For
  /// example, 3-10, which means that provisioned IOPS can be between 3 and 10
  /// times storage.
  final List<DoubleRange>? iopsToStorageRatio;

  /// The valid range of provisioned IOPS. For example, 1000-20000.
  final List<Range>? provisionedIops;

  /// The valid range of storage in gibibytes. For example, 100 to 16384.
  final List<Range>? storageSize;

  /// The valid storage types for your DB instance. For example, gp2, io1.
  final String? storageType;

  /// Whether or not Amazon RDS can automatically scale storage for DB instances
  /// that use the new instance class.
  final bool? supportsStorageAutoscaling;

  ValidStorageOptions({
    this.iopsToStorageRatio,
    this.provisionedIops,
    this.storageSize,
    this.storageType,
    this.supportsStorageAutoscaling,
  });
  factory ValidStorageOptions.fromXml(_s.XmlElement elem) {
    return ValidStorageOptions(
      iopsToStorageRatio: _s.extractXmlChild(elem, 'IopsToStorageRatio')?.let(
          (elem) => elem
              .findElements('DoubleRange')
              .map((c) => DoubleRange.fromXml(c))
              .toList()),
      provisionedIops: _s.extractXmlChild(elem, 'ProvisionedIops')?.let(
          (elem) =>
              elem.findElements('Range').map((c) => Range.fromXml(c)).toList()),
      storageSize: _s.extractXmlChild(elem, 'StorageSize')?.let((elem) =>
          elem.findElements('Range').map((c) => Range.fromXml(c)).toList()),
      storageType: _s.extractXmlStringValue(elem, 'StorageType'),
      supportsStorageAutoscaling:
          _s.extractXmlBoolValue(elem, 'SupportsStorageAutoscaling'),
    );
  }
}

/// This data type is used as a response element for queries on VPC security
/// group membership.
class VpcSecurityGroupMembership {
  /// The status of the VPC security group.
  final String? status;

  /// The name of the VPC security group.
  final String? vpcSecurityGroupId;

  VpcSecurityGroupMembership({
    this.status,
    this.vpcSecurityGroupId,
  });
  factory VpcSecurityGroupMembership.fromXml(_s.XmlElement elem) {
    return VpcSecurityGroupMembership(
      status: _s.extractXmlStringValue(elem, 'Status'),
      vpcSecurityGroupId: _s.extractXmlStringValue(elem, 'VpcSecurityGroupId'),
    );
  }
}

/// Information about the virtual private network (VPN) between the VMware
/// vSphere cluster and the AWS website.
///
/// For more information about RDS on VMware, see the <a
/// href="https://docs.aws.amazon.com/AmazonRDS/latest/RDSonVMwareUserGuide/rds-on-vmware.html">
/// RDS on VMware User Guide.</a>
class VpnDetails {
  /// The IP address of network traffic from AWS to your on-premises data center.
  final String? vpnGatewayIp;

  /// The ID of the VPN.
  final String? vpnId;

  /// The name of the VPN.
  final String? vpnName;

  /// The preshared key (PSK) for the VPN.
  final String? vpnPSK;

  /// The state of the VPN.
  final String? vpnState;

  /// The IP address of network traffic from your on-premises data center. A
  /// custom AZ receives the network traffic.
  final String? vpnTunnelOriginatorIP;

  VpnDetails({
    this.vpnGatewayIp,
    this.vpnId,
    this.vpnName,
    this.vpnPSK,
    this.vpnState,
    this.vpnTunnelOriginatorIP,
  });
  factory VpnDetails.fromXml(_s.XmlElement elem) {
    return VpnDetails(
      vpnGatewayIp: _s.extractXmlStringValue(elem, 'VpnGatewayIp'),
      vpnId: _s.extractXmlStringValue(elem, 'VpnId'),
      vpnName: _s.extractXmlStringValue(elem, 'VpnName'),
      vpnPSK: _s.extractXmlStringValue(elem, 'VpnPSK'),
      vpnState: _s.extractXmlStringValue(elem, 'VpnState'),
      vpnTunnelOriginatorIP:
          _s.extractXmlStringValue(elem, 'VpnTunnelOriginatorIP'),
    );
  }
}

enum WriteForwardingStatus {
  enabled,
  disabled,
  enabling,
  disabling,
  unknown,
}

extension on WriteForwardingStatus {
  String toValue() {
    switch (this) {
      case WriteForwardingStatus.enabled:
        return 'enabled';
      case WriteForwardingStatus.disabled:
        return 'disabled';
      case WriteForwardingStatus.enabling:
        return 'enabling';
      case WriteForwardingStatus.disabling:
        return 'disabling';
      case WriteForwardingStatus.unknown:
        return 'unknown';
    }
  }
}

extension on String {
  WriteForwardingStatus toWriteForwardingStatus() {
    switch (this) {
      case 'enabled':
        return WriteForwardingStatus.enabled;
      case 'disabled':
        return WriteForwardingStatus.disabled;
      case 'enabling':
        return WriteForwardingStatus.enabling;
      case 'disabling':
        return WriteForwardingStatus.disabling;
      case 'unknown':
        return WriteForwardingStatus.unknown;
    }
    throw Exception('$this is not known in enum WriteForwardingStatus');
  }
}

class AuthorizationAlreadyExistsFault extends _s.GenericAwsException {
  AuthorizationAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'AuthorizationAlreadyExistsFault',
            message: message);
}

class AuthorizationNotFoundFault extends _s.GenericAwsException {
  AuthorizationNotFoundFault({String? type, String? message})
      : super(type: type, code: 'AuthorizationNotFoundFault', message: message);
}

class AuthorizationQuotaExceededFault extends _s.GenericAwsException {
  AuthorizationQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'AuthorizationQuotaExceededFault',
            message: message);
}

class BackupPolicyNotFoundFault extends _s.GenericAwsException {
  BackupPolicyNotFoundFault({String? type, String? message})
      : super(type: type, code: 'BackupPolicyNotFoundFault', message: message);
}

class CertificateNotFoundFault extends _s.GenericAwsException {
  CertificateNotFoundFault({String? type, String? message})
      : super(type: type, code: 'CertificateNotFoundFault', message: message);
}

class CustomAvailabilityZoneAlreadyExistsFault extends _s.GenericAwsException {
  CustomAvailabilityZoneAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'CustomAvailabilityZoneAlreadyExistsFault',
            message: message);
}

class CustomAvailabilityZoneNotFoundFault extends _s.GenericAwsException {
  CustomAvailabilityZoneNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'CustomAvailabilityZoneNotFoundFault',
            message: message);
}

class CustomAvailabilityZoneQuotaExceededFault extends _s.GenericAwsException {
  CustomAvailabilityZoneQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'CustomAvailabilityZoneQuotaExceededFault',
            message: message);
}

class DBClusterAlreadyExistsFault extends _s.GenericAwsException {
  DBClusterAlreadyExistsFault({String? type, String? message})
      : super(
            type: type, code: 'DBClusterAlreadyExistsFault', message: message);
}

class DBClusterBacktrackNotFoundFault extends _s.GenericAwsException {
  DBClusterBacktrackNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBClusterBacktrackNotFoundFault',
            message: message);
}

class DBClusterEndpointAlreadyExistsFault extends _s.GenericAwsException {
  DBClusterEndpointAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBClusterEndpointAlreadyExistsFault',
            message: message);
}

class DBClusterEndpointNotFoundFault extends _s.GenericAwsException {
  DBClusterEndpointNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBClusterEndpointNotFoundFault',
            message: message);
}

class DBClusterEndpointQuotaExceededFault extends _s.GenericAwsException {
  DBClusterEndpointQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBClusterEndpointQuotaExceededFault',
            message: message);
}

class DBClusterNotFoundFault extends _s.GenericAwsException {
  DBClusterNotFoundFault({String? type, String? message})
      : super(type: type, code: 'DBClusterNotFoundFault', message: message);
}

class DBClusterParameterGroupNotFoundFault extends _s.GenericAwsException {
  DBClusterParameterGroupNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBClusterParameterGroupNotFoundFault',
            message: message);
}

class DBClusterQuotaExceededFault extends _s.GenericAwsException {
  DBClusterQuotaExceededFault({String? type, String? message})
      : super(
            type: type, code: 'DBClusterQuotaExceededFault', message: message);
}

class DBClusterRoleAlreadyExistsFault extends _s.GenericAwsException {
  DBClusterRoleAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBClusterRoleAlreadyExistsFault',
            message: message);
}

class DBClusterRoleNotFoundFault extends _s.GenericAwsException {
  DBClusterRoleNotFoundFault({String? type, String? message})
      : super(type: type, code: 'DBClusterRoleNotFoundFault', message: message);
}

class DBClusterRoleQuotaExceededFault extends _s.GenericAwsException {
  DBClusterRoleQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBClusterRoleQuotaExceededFault',
            message: message);
}

class DBClusterSnapshotAlreadyExistsFault extends _s.GenericAwsException {
  DBClusterSnapshotAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBClusterSnapshotAlreadyExistsFault',
            message: message);
}

class DBClusterSnapshotNotFoundFault extends _s.GenericAwsException {
  DBClusterSnapshotNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBClusterSnapshotNotFoundFault',
            message: message);
}

class DBInstanceAlreadyExistsFault extends _s.GenericAwsException {
  DBInstanceAlreadyExistsFault({String? type, String? message})
      : super(
            type: type, code: 'DBInstanceAlreadyExistsFault', message: message);
}

class DBInstanceAutomatedBackupNotFoundFault extends _s.GenericAwsException {
  DBInstanceAutomatedBackupNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBInstanceAutomatedBackupNotFoundFault',
            message: message);
}

class DBInstanceAutomatedBackupQuotaExceededFault
    extends _s.GenericAwsException {
  DBInstanceAutomatedBackupQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBInstanceAutomatedBackupQuotaExceededFault',
            message: message);
}

class DBInstanceNotFoundFault extends _s.GenericAwsException {
  DBInstanceNotFoundFault({String? type, String? message})
      : super(type: type, code: 'DBInstanceNotFoundFault', message: message);
}

class DBInstanceRoleAlreadyExistsFault extends _s.GenericAwsException {
  DBInstanceRoleAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBInstanceRoleAlreadyExistsFault',
            message: message);
}

class DBInstanceRoleNotFoundFault extends _s.GenericAwsException {
  DBInstanceRoleNotFoundFault({String? type, String? message})
      : super(
            type: type, code: 'DBInstanceRoleNotFoundFault', message: message);
}

class DBInstanceRoleQuotaExceededFault extends _s.GenericAwsException {
  DBInstanceRoleQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBInstanceRoleQuotaExceededFault',
            message: message);
}

class DBLogFileNotFoundFault extends _s.GenericAwsException {
  DBLogFileNotFoundFault({String? type, String? message})
      : super(type: type, code: 'DBLogFileNotFoundFault', message: message);
}

class DBParameterGroupAlreadyExistsFault extends _s.GenericAwsException {
  DBParameterGroupAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBParameterGroupAlreadyExistsFault',
            message: message);
}

class DBParameterGroupNotFoundFault extends _s.GenericAwsException {
  DBParameterGroupNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBParameterGroupNotFoundFault',
            message: message);
}

class DBParameterGroupQuotaExceededFault extends _s.GenericAwsException {
  DBParameterGroupQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBParameterGroupQuotaExceededFault',
            message: message);
}

class DBProxyAlreadyExistsFault extends _s.GenericAwsException {
  DBProxyAlreadyExistsFault({String? type, String? message})
      : super(type: type, code: 'DBProxyAlreadyExistsFault', message: message);
}

class DBProxyNotFoundFault extends _s.GenericAwsException {
  DBProxyNotFoundFault({String? type, String? message})
      : super(type: type, code: 'DBProxyNotFoundFault', message: message);
}

class DBProxyQuotaExceededFault extends _s.GenericAwsException {
  DBProxyQuotaExceededFault({String? type, String? message})
      : super(type: type, code: 'DBProxyQuotaExceededFault', message: message);
}

class DBProxyTargetAlreadyRegisteredFault extends _s.GenericAwsException {
  DBProxyTargetAlreadyRegisteredFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBProxyTargetAlreadyRegisteredFault',
            message: message);
}

class DBProxyTargetGroupNotFoundFault extends _s.GenericAwsException {
  DBProxyTargetGroupNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBProxyTargetGroupNotFoundFault',
            message: message);
}

class DBProxyTargetNotFoundFault extends _s.GenericAwsException {
  DBProxyTargetNotFoundFault({String? type, String? message})
      : super(type: type, code: 'DBProxyTargetNotFoundFault', message: message);
}

class DBSecurityGroupAlreadyExistsFault extends _s.GenericAwsException {
  DBSecurityGroupAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBSecurityGroupAlreadyExistsFault',
            message: message);
}

class DBSecurityGroupNotFoundFault extends _s.GenericAwsException {
  DBSecurityGroupNotFoundFault({String? type, String? message})
      : super(
            type: type, code: 'DBSecurityGroupNotFoundFault', message: message);
}

class DBSecurityGroupNotSupportedFault extends _s.GenericAwsException {
  DBSecurityGroupNotSupportedFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBSecurityGroupNotSupportedFault',
            message: message);
}

class DBSecurityGroupQuotaExceededFault extends _s.GenericAwsException {
  DBSecurityGroupQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBSecurityGroupQuotaExceededFault',
            message: message);
}

class DBSnapshotAlreadyExistsFault extends _s.GenericAwsException {
  DBSnapshotAlreadyExistsFault({String? type, String? message})
      : super(
            type: type, code: 'DBSnapshotAlreadyExistsFault', message: message);
}

class DBSnapshotNotFoundFault extends _s.GenericAwsException {
  DBSnapshotNotFoundFault({String? type, String? message})
      : super(type: type, code: 'DBSnapshotNotFoundFault', message: message);
}

class DBSubnetGroupAlreadyExistsFault extends _s.GenericAwsException {
  DBSubnetGroupAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBSubnetGroupAlreadyExistsFault',
            message: message);
}

class DBSubnetGroupDoesNotCoverEnoughAZs extends _s.GenericAwsException {
  DBSubnetGroupDoesNotCoverEnoughAZs({String? type, String? message})
      : super(
            type: type,
            code: 'DBSubnetGroupDoesNotCoverEnoughAZs',
            message: message);
}

class DBSubnetGroupNotAllowedFault extends _s.GenericAwsException {
  DBSubnetGroupNotAllowedFault({String? type, String? message})
      : super(
            type: type, code: 'DBSubnetGroupNotAllowedFault', message: message);
}

class DBSubnetGroupNotFoundFault extends _s.GenericAwsException {
  DBSubnetGroupNotFoundFault({String? type, String? message})
      : super(type: type, code: 'DBSubnetGroupNotFoundFault', message: message);
}

class DBSubnetGroupQuotaExceededFault extends _s.GenericAwsException {
  DBSubnetGroupQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBSubnetGroupQuotaExceededFault',
            message: message);
}

class DBSubnetQuotaExceededFault extends _s.GenericAwsException {
  DBSubnetQuotaExceededFault({String? type, String? message})
      : super(type: type, code: 'DBSubnetQuotaExceededFault', message: message);
}

class DBUpgradeDependencyFailureFault extends _s.GenericAwsException {
  DBUpgradeDependencyFailureFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBUpgradeDependencyFailureFault',
            message: message);
}

class DomainNotFoundFault extends _s.GenericAwsException {
  DomainNotFoundFault({String? type, String? message})
      : super(type: type, code: 'DomainNotFoundFault', message: message);
}

class EventSubscriptionQuotaExceededFault extends _s.GenericAwsException {
  EventSubscriptionQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'EventSubscriptionQuotaExceededFault',
            message: message);
}

class ExportTaskAlreadyExistsFault extends _s.GenericAwsException {
  ExportTaskAlreadyExistsFault({String? type, String? message})
      : super(
            type: type, code: 'ExportTaskAlreadyExistsFault', message: message);
}

class ExportTaskNotFoundFault extends _s.GenericAwsException {
  ExportTaskNotFoundFault({String? type, String? message})
      : super(type: type, code: 'ExportTaskNotFoundFault', message: message);
}

class GlobalClusterAlreadyExistsFault extends _s.GenericAwsException {
  GlobalClusterAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'GlobalClusterAlreadyExistsFault',
            message: message);
}

class GlobalClusterNotFoundFault extends _s.GenericAwsException {
  GlobalClusterNotFoundFault({String? type, String? message})
      : super(type: type, code: 'GlobalClusterNotFoundFault', message: message);
}

class GlobalClusterQuotaExceededFault extends _s.GenericAwsException {
  GlobalClusterQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'GlobalClusterQuotaExceededFault',
            message: message);
}

class IamRoleMissingPermissionsFault extends _s.GenericAwsException {
  IamRoleMissingPermissionsFault({String? type, String? message})
      : super(
            type: type,
            code: 'IamRoleMissingPermissionsFault',
            message: message);
}

class IamRoleNotFoundFault extends _s.GenericAwsException {
  IamRoleNotFoundFault({String? type, String? message})
      : super(type: type, code: 'IamRoleNotFoundFault', message: message);
}

class InstallationMediaAlreadyExistsFault extends _s.GenericAwsException {
  InstallationMediaAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'InstallationMediaAlreadyExistsFault',
            message: message);
}

class InstallationMediaNotFoundFault extends _s.GenericAwsException {
  InstallationMediaNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'InstallationMediaNotFoundFault',
            message: message);
}

class InstanceQuotaExceededFault extends _s.GenericAwsException {
  InstanceQuotaExceededFault({String? type, String? message})
      : super(type: type, code: 'InstanceQuotaExceededFault', message: message);
}

class InsufficientAvailableIPsInSubnetFault extends _s.GenericAwsException {
  InsufficientAvailableIPsInSubnetFault({String? type, String? message})
      : super(
            type: type,
            code: 'InsufficientAvailableIPsInSubnetFault',
            message: message);
}

class InsufficientDBClusterCapacityFault extends _s.GenericAwsException {
  InsufficientDBClusterCapacityFault({String? type, String? message})
      : super(
            type: type,
            code: 'InsufficientDBClusterCapacityFault',
            message: message);
}

class InsufficientDBInstanceCapacityFault extends _s.GenericAwsException {
  InsufficientDBInstanceCapacityFault({String? type, String? message})
      : super(
            type: type,
            code: 'InsufficientDBInstanceCapacityFault',
            message: message);
}

class InsufficientStorageClusterCapacityFault extends _s.GenericAwsException {
  InsufficientStorageClusterCapacityFault({String? type, String? message})
      : super(
            type: type,
            code: 'InsufficientStorageClusterCapacityFault',
            message: message);
}

class InvalidDBClusterCapacityFault extends _s.GenericAwsException {
  InvalidDBClusterCapacityFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidDBClusterCapacityFault',
            message: message);
}

class InvalidDBClusterEndpointStateFault extends _s.GenericAwsException {
  InvalidDBClusterEndpointStateFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidDBClusterEndpointStateFault',
            message: message);
}

class InvalidDBClusterSnapshotStateFault extends _s.GenericAwsException {
  InvalidDBClusterSnapshotStateFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidDBClusterSnapshotStateFault',
            message: message);
}

class InvalidDBClusterStateFault extends _s.GenericAwsException {
  InvalidDBClusterStateFault({String? type, String? message})
      : super(type: type, code: 'InvalidDBClusterStateFault', message: message);
}

class InvalidDBInstanceAutomatedBackupStateFault
    extends _s.GenericAwsException {
  InvalidDBInstanceAutomatedBackupStateFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidDBInstanceAutomatedBackupStateFault',
            message: message);
}

class InvalidDBInstanceStateFault extends _s.GenericAwsException {
  InvalidDBInstanceStateFault({String? type, String? message})
      : super(
            type: type, code: 'InvalidDBInstanceStateFault', message: message);
}

class InvalidDBParameterGroupStateFault extends _s.GenericAwsException {
  InvalidDBParameterGroupStateFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidDBParameterGroupStateFault',
            message: message);
}

class InvalidDBProxyStateFault extends _s.GenericAwsException {
  InvalidDBProxyStateFault({String? type, String? message})
      : super(type: type, code: 'InvalidDBProxyStateFault', message: message);
}

class InvalidDBSecurityGroupStateFault extends _s.GenericAwsException {
  InvalidDBSecurityGroupStateFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidDBSecurityGroupStateFault',
            message: message);
}

class InvalidDBSnapshotStateFault extends _s.GenericAwsException {
  InvalidDBSnapshotStateFault({String? type, String? message})
      : super(
            type: type, code: 'InvalidDBSnapshotStateFault', message: message);
}

class InvalidDBSubnetGroupFault extends _s.GenericAwsException {
  InvalidDBSubnetGroupFault({String? type, String? message})
      : super(type: type, code: 'InvalidDBSubnetGroupFault', message: message);
}

class InvalidDBSubnetGroupStateFault extends _s.GenericAwsException {
  InvalidDBSubnetGroupStateFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidDBSubnetGroupStateFault',
            message: message);
}

class InvalidDBSubnetStateFault extends _s.GenericAwsException {
  InvalidDBSubnetStateFault({String? type, String? message})
      : super(type: type, code: 'InvalidDBSubnetStateFault', message: message);
}

class InvalidEventSubscriptionStateFault extends _s.GenericAwsException {
  InvalidEventSubscriptionStateFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidEventSubscriptionStateFault',
            message: message);
}

class InvalidExportOnlyFault extends _s.GenericAwsException {
  InvalidExportOnlyFault({String? type, String? message})
      : super(type: type, code: 'InvalidExportOnlyFault', message: message);
}

class InvalidExportSourceStateFault extends _s.GenericAwsException {
  InvalidExportSourceStateFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidExportSourceStateFault',
            message: message);
}

class InvalidExportTaskStateFault extends _s.GenericAwsException {
  InvalidExportTaskStateFault({String? type, String? message})
      : super(
            type: type, code: 'InvalidExportTaskStateFault', message: message);
}

class InvalidGlobalClusterStateFault extends _s.GenericAwsException {
  InvalidGlobalClusterStateFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidGlobalClusterStateFault',
            message: message);
}

class InvalidOptionGroupStateFault extends _s.GenericAwsException {
  InvalidOptionGroupStateFault({String? type, String? message})
      : super(
            type: type, code: 'InvalidOptionGroupStateFault', message: message);
}

class InvalidRestoreFault extends _s.GenericAwsException {
  InvalidRestoreFault({String? type, String? message})
      : super(type: type, code: 'InvalidRestoreFault', message: message);
}

class InvalidS3BucketFault extends _s.GenericAwsException {
  InvalidS3BucketFault({String? type, String? message})
      : super(type: type, code: 'InvalidS3BucketFault', message: message);
}

class InvalidSubnet extends _s.GenericAwsException {
  InvalidSubnet({String? type, String? message})
      : super(type: type, code: 'InvalidSubnet', message: message);
}

class InvalidVPCNetworkStateFault extends _s.GenericAwsException {
  InvalidVPCNetworkStateFault({String? type, String? message})
      : super(
            type: type, code: 'InvalidVPCNetworkStateFault', message: message);
}

class KMSKeyNotAccessibleFault extends _s.GenericAwsException {
  KMSKeyNotAccessibleFault({String? type, String? message})
      : super(type: type, code: 'KMSKeyNotAccessibleFault', message: message);
}

class OptionGroupAlreadyExistsFault extends _s.GenericAwsException {
  OptionGroupAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'OptionGroupAlreadyExistsFault',
            message: message);
}

class OptionGroupNotFoundFault extends _s.GenericAwsException {
  OptionGroupNotFoundFault({String? type, String? message})
      : super(type: type, code: 'OptionGroupNotFoundFault', message: message);
}

class OptionGroupQuotaExceededFault extends _s.GenericAwsException {
  OptionGroupQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'OptionGroupQuotaExceededFault',
            message: message);
}

class PointInTimeRestoreNotEnabledFault extends _s.GenericAwsException {
  PointInTimeRestoreNotEnabledFault({String? type, String? message})
      : super(
            type: type,
            code: 'PointInTimeRestoreNotEnabledFault',
            message: message);
}

class ProvisionedIopsNotAvailableInAZFault extends _s.GenericAwsException {
  ProvisionedIopsNotAvailableInAZFault({String? type, String? message})
      : super(
            type: type,
            code: 'ProvisionedIopsNotAvailableInAZFault',
            message: message);
}

class ReservedDBInstanceAlreadyExistsFault extends _s.GenericAwsException {
  ReservedDBInstanceAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'ReservedDBInstanceAlreadyExistsFault',
            message: message);
}

class ReservedDBInstanceNotFoundFault extends _s.GenericAwsException {
  ReservedDBInstanceNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'ReservedDBInstanceNotFoundFault',
            message: message);
}

class ReservedDBInstanceQuotaExceededFault extends _s.GenericAwsException {
  ReservedDBInstanceQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'ReservedDBInstanceQuotaExceededFault',
            message: message);
}

class ReservedDBInstancesOfferingNotFoundFault extends _s.GenericAwsException {
  ReservedDBInstancesOfferingNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'ReservedDBInstancesOfferingNotFoundFault',
            message: message);
}

class ResourceNotFoundFault extends _s.GenericAwsException {
  ResourceNotFoundFault({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundFault', message: message);
}

class SNSInvalidTopicFault extends _s.GenericAwsException {
  SNSInvalidTopicFault({String? type, String? message})
      : super(type: type, code: 'SNSInvalidTopicFault', message: message);
}

class SNSNoAuthorizationFault extends _s.GenericAwsException {
  SNSNoAuthorizationFault({String? type, String? message})
      : super(type: type, code: 'SNSNoAuthorizationFault', message: message);
}

class SNSTopicArnNotFoundFault extends _s.GenericAwsException {
  SNSTopicArnNotFoundFault({String? type, String? message})
      : super(type: type, code: 'SNSTopicArnNotFoundFault', message: message);
}

class SharedSnapshotQuotaExceededFault extends _s.GenericAwsException {
  SharedSnapshotQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'SharedSnapshotQuotaExceededFault',
            message: message);
}

class SnapshotQuotaExceededFault extends _s.GenericAwsException {
  SnapshotQuotaExceededFault({String? type, String? message})
      : super(type: type, code: 'SnapshotQuotaExceededFault', message: message);
}

class SourceNotFoundFault extends _s.GenericAwsException {
  SourceNotFoundFault({String? type, String? message})
      : super(type: type, code: 'SourceNotFoundFault', message: message);
}

class StorageQuotaExceededFault extends _s.GenericAwsException {
  StorageQuotaExceededFault({String? type, String? message})
      : super(type: type, code: 'StorageQuotaExceededFault', message: message);
}

class StorageTypeNotSupportedFault extends _s.GenericAwsException {
  StorageTypeNotSupportedFault({String? type, String? message})
      : super(
            type: type, code: 'StorageTypeNotSupportedFault', message: message);
}

class SubnetAlreadyInUse extends _s.GenericAwsException {
  SubnetAlreadyInUse({String? type, String? message})
      : super(type: type, code: 'SubnetAlreadyInUse', message: message);
}

class SubscriptionAlreadyExistFault extends _s.GenericAwsException {
  SubscriptionAlreadyExistFault({String? type, String? message})
      : super(
            type: type,
            code: 'SubscriptionAlreadyExistFault',
            message: message);
}

class SubscriptionCategoryNotFoundFault extends _s.GenericAwsException {
  SubscriptionCategoryNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'SubscriptionCategoryNotFoundFault',
            message: message);
}

class SubscriptionNotFoundFault extends _s.GenericAwsException {
  SubscriptionNotFoundFault({String? type, String? message})
      : super(type: type, code: 'SubscriptionNotFoundFault', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AuthorizationAlreadyExistsFault': (type, message) =>
      AuthorizationAlreadyExistsFault(type: type, message: message),
  'AuthorizationNotFoundFault': (type, message) =>
      AuthorizationNotFoundFault(type: type, message: message),
  'AuthorizationQuotaExceededFault': (type, message) =>
      AuthorizationQuotaExceededFault(type: type, message: message),
  'BackupPolicyNotFoundFault': (type, message) =>
      BackupPolicyNotFoundFault(type: type, message: message),
  'CertificateNotFoundFault': (type, message) =>
      CertificateNotFoundFault(type: type, message: message),
  'CustomAvailabilityZoneAlreadyExistsFault': (type, message) =>
      CustomAvailabilityZoneAlreadyExistsFault(type: type, message: message),
  'CustomAvailabilityZoneNotFoundFault': (type, message) =>
      CustomAvailabilityZoneNotFoundFault(type: type, message: message),
  'CustomAvailabilityZoneQuotaExceededFault': (type, message) =>
      CustomAvailabilityZoneQuotaExceededFault(type: type, message: message),
  'DBClusterAlreadyExistsFault': (type, message) =>
      DBClusterAlreadyExistsFault(type: type, message: message),
  'DBClusterBacktrackNotFoundFault': (type, message) =>
      DBClusterBacktrackNotFoundFault(type: type, message: message),
  'DBClusterEndpointAlreadyExistsFault': (type, message) =>
      DBClusterEndpointAlreadyExistsFault(type: type, message: message),
  'DBClusterEndpointNotFoundFault': (type, message) =>
      DBClusterEndpointNotFoundFault(type: type, message: message),
  'DBClusterEndpointQuotaExceededFault': (type, message) =>
      DBClusterEndpointQuotaExceededFault(type: type, message: message),
  'DBClusterNotFoundFault': (type, message) =>
      DBClusterNotFoundFault(type: type, message: message),
  'DBClusterParameterGroupNotFoundFault': (type, message) =>
      DBClusterParameterGroupNotFoundFault(type: type, message: message),
  'DBClusterQuotaExceededFault': (type, message) =>
      DBClusterQuotaExceededFault(type: type, message: message),
  'DBClusterRoleAlreadyExistsFault': (type, message) =>
      DBClusterRoleAlreadyExistsFault(type: type, message: message),
  'DBClusterRoleNotFoundFault': (type, message) =>
      DBClusterRoleNotFoundFault(type: type, message: message),
  'DBClusterRoleQuotaExceededFault': (type, message) =>
      DBClusterRoleQuotaExceededFault(type: type, message: message),
  'DBClusterSnapshotAlreadyExistsFault': (type, message) =>
      DBClusterSnapshotAlreadyExistsFault(type: type, message: message),
  'DBClusterSnapshotNotFoundFault': (type, message) =>
      DBClusterSnapshotNotFoundFault(type: type, message: message),
  'DBInstanceAlreadyExistsFault': (type, message) =>
      DBInstanceAlreadyExistsFault(type: type, message: message),
  'DBInstanceAutomatedBackupNotFoundFault': (type, message) =>
      DBInstanceAutomatedBackupNotFoundFault(type: type, message: message),
  'DBInstanceAutomatedBackupQuotaExceededFault': (type, message) =>
      DBInstanceAutomatedBackupQuotaExceededFault(type: type, message: message),
  'DBInstanceNotFoundFault': (type, message) =>
      DBInstanceNotFoundFault(type: type, message: message),
  'DBInstanceRoleAlreadyExistsFault': (type, message) =>
      DBInstanceRoleAlreadyExistsFault(type: type, message: message),
  'DBInstanceRoleNotFoundFault': (type, message) =>
      DBInstanceRoleNotFoundFault(type: type, message: message),
  'DBInstanceRoleQuotaExceededFault': (type, message) =>
      DBInstanceRoleQuotaExceededFault(type: type, message: message),
  'DBLogFileNotFoundFault': (type, message) =>
      DBLogFileNotFoundFault(type: type, message: message),
  'DBParameterGroupAlreadyExistsFault': (type, message) =>
      DBParameterGroupAlreadyExistsFault(type: type, message: message),
  'DBParameterGroupNotFoundFault': (type, message) =>
      DBParameterGroupNotFoundFault(type: type, message: message),
  'DBParameterGroupQuotaExceededFault': (type, message) =>
      DBParameterGroupQuotaExceededFault(type: type, message: message),
  'DBProxyAlreadyExistsFault': (type, message) =>
      DBProxyAlreadyExistsFault(type: type, message: message),
  'DBProxyNotFoundFault': (type, message) =>
      DBProxyNotFoundFault(type: type, message: message),
  'DBProxyQuotaExceededFault': (type, message) =>
      DBProxyQuotaExceededFault(type: type, message: message),
  'DBProxyTargetAlreadyRegisteredFault': (type, message) =>
      DBProxyTargetAlreadyRegisteredFault(type: type, message: message),
  'DBProxyTargetGroupNotFoundFault': (type, message) =>
      DBProxyTargetGroupNotFoundFault(type: type, message: message),
  'DBProxyTargetNotFoundFault': (type, message) =>
      DBProxyTargetNotFoundFault(type: type, message: message),
  'DBSecurityGroupAlreadyExistsFault': (type, message) =>
      DBSecurityGroupAlreadyExistsFault(type: type, message: message),
  'DBSecurityGroupNotFoundFault': (type, message) =>
      DBSecurityGroupNotFoundFault(type: type, message: message),
  'DBSecurityGroupNotSupportedFault': (type, message) =>
      DBSecurityGroupNotSupportedFault(type: type, message: message),
  'DBSecurityGroupQuotaExceededFault': (type, message) =>
      DBSecurityGroupQuotaExceededFault(type: type, message: message),
  'DBSnapshotAlreadyExistsFault': (type, message) =>
      DBSnapshotAlreadyExistsFault(type: type, message: message),
  'DBSnapshotNotFoundFault': (type, message) =>
      DBSnapshotNotFoundFault(type: type, message: message),
  'DBSubnetGroupAlreadyExistsFault': (type, message) =>
      DBSubnetGroupAlreadyExistsFault(type: type, message: message),
  'DBSubnetGroupDoesNotCoverEnoughAZs': (type, message) =>
      DBSubnetGroupDoesNotCoverEnoughAZs(type: type, message: message),
  'DBSubnetGroupNotAllowedFault': (type, message) =>
      DBSubnetGroupNotAllowedFault(type: type, message: message),
  'DBSubnetGroupNotFoundFault': (type, message) =>
      DBSubnetGroupNotFoundFault(type: type, message: message),
  'DBSubnetGroupQuotaExceededFault': (type, message) =>
      DBSubnetGroupQuotaExceededFault(type: type, message: message),
  'DBSubnetQuotaExceededFault': (type, message) =>
      DBSubnetQuotaExceededFault(type: type, message: message),
  'DBUpgradeDependencyFailureFault': (type, message) =>
      DBUpgradeDependencyFailureFault(type: type, message: message),
  'DomainNotFoundFault': (type, message) =>
      DomainNotFoundFault(type: type, message: message),
  'EventSubscriptionQuotaExceededFault': (type, message) =>
      EventSubscriptionQuotaExceededFault(type: type, message: message),
  'ExportTaskAlreadyExistsFault': (type, message) =>
      ExportTaskAlreadyExistsFault(type: type, message: message),
  'ExportTaskNotFoundFault': (type, message) =>
      ExportTaskNotFoundFault(type: type, message: message),
  'GlobalClusterAlreadyExistsFault': (type, message) =>
      GlobalClusterAlreadyExistsFault(type: type, message: message),
  'GlobalClusterNotFoundFault': (type, message) =>
      GlobalClusterNotFoundFault(type: type, message: message),
  'GlobalClusterQuotaExceededFault': (type, message) =>
      GlobalClusterQuotaExceededFault(type: type, message: message),
  'IamRoleMissingPermissionsFault': (type, message) =>
      IamRoleMissingPermissionsFault(type: type, message: message),
  'IamRoleNotFoundFault': (type, message) =>
      IamRoleNotFoundFault(type: type, message: message),
  'InstallationMediaAlreadyExistsFault': (type, message) =>
      InstallationMediaAlreadyExistsFault(type: type, message: message),
  'InstallationMediaNotFoundFault': (type, message) =>
      InstallationMediaNotFoundFault(type: type, message: message),
  'InstanceQuotaExceededFault': (type, message) =>
      InstanceQuotaExceededFault(type: type, message: message),
  'InsufficientAvailableIPsInSubnetFault': (type, message) =>
      InsufficientAvailableIPsInSubnetFault(type: type, message: message),
  'InsufficientDBClusterCapacityFault': (type, message) =>
      InsufficientDBClusterCapacityFault(type: type, message: message),
  'InsufficientDBInstanceCapacityFault': (type, message) =>
      InsufficientDBInstanceCapacityFault(type: type, message: message),
  'InsufficientStorageClusterCapacityFault': (type, message) =>
      InsufficientStorageClusterCapacityFault(type: type, message: message),
  'InvalidDBClusterCapacityFault': (type, message) =>
      InvalidDBClusterCapacityFault(type: type, message: message),
  'InvalidDBClusterEndpointStateFault': (type, message) =>
      InvalidDBClusterEndpointStateFault(type: type, message: message),
  'InvalidDBClusterSnapshotStateFault': (type, message) =>
      InvalidDBClusterSnapshotStateFault(type: type, message: message),
  'InvalidDBClusterStateFault': (type, message) =>
      InvalidDBClusterStateFault(type: type, message: message),
  'InvalidDBInstanceAutomatedBackupStateFault': (type, message) =>
      InvalidDBInstanceAutomatedBackupStateFault(type: type, message: message),
  'InvalidDBInstanceStateFault': (type, message) =>
      InvalidDBInstanceStateFault(type: type, message: message),
  'InvalidDBParameterGroupStateFault': (type, message) =>
      InvalidDBParameterGroupStateFault(type: type, message: message),
  'InvalidDBProxyStateFault': (type, message) =>
      InvalidDBProxyStateFault(type: type, message: message),
  'InvalidDBSecurityGroupStateFault': (type, message) =>
      InvalidDBSecurityGroupStateFault(type: type, message: message),
  'InvalidDBSnapshotStateFault': (type, message) =>
      InvalidDBSnapshotStateFault(type: type, message: message),
  'InvalidDBSubnetGroupFault': (type, message) =>
      InvalidDBSubnetGroupFault(type: type, message: message),
  'InvalidDBSubnetGroupStateFault': (type, message) =>
      InvalidDBSubnetGroupStateFault(type: type, message: message),
  'InvalidDBSubnetStateFault': (type, message) =>
      InvalidDBSubnetStateFault(type: type, message: message),
  'InvalidEventSubscriptionStateFault': (type, message) =>
      InvalidEventSubscriptionStateFault(type: type, message: message),
  'InvalidExportOnlyFault': (type, message) =>
      InvalidExportOnlyFault(type: type, message: message),
  'InvalidExportSourceStateFault': (type, message) =>
      InvalidExportSourceStateFault(type: type, message: message),
  'InvalidExportTaskStateFault': (type, message) =>
      InvalidExportTaskStateFault(type: type, message: message),
  'InvalidGlobalClusterStateFault': (type, message) =>
      InvalidGlobalClusterStateFault(type: type, message: message),
  'InvalidOptionGroupStateFault': (type, message) =>
      InvalidOptionGroupStateFault(type: type, message: message),
  'InvalidRestoreFault': (type, message) =>
      InvalidRestoreFault(type: type, message: message),
  'InvalidS3BucketFault': (type, message) =>
      InvalidS3BucketFault(type: type, message: message),
  'InvalidSubnet': (type, message) =>
      InvalidSubnet(type: type, message: message),
  'InvalidVPCNetworkStateFault': (type, message) =>
      InvalidVPCNetworkStateFault(type: type, message: message),
  'KMSKeyNotAccessibleFault': (type, message) =>
      KMSKeyNotAccessibleFault(type: type, message: message),
  'OptionGroupAlreadyExistsFault': (type, message) =>
      OptionGroupAlreadyExistsFault(type: type, message: message),
  'OptionGroupNotFoundFault': (type, message) =>
      OptionGroupNotFoundFault(type: type, message: message),
  'OptionGroupQuotaExceededFault': (type, message) =>
      OptionGroupQuotaExceededFault(type: type, message: message),
  'PointInTimeRestoreNotEnabledFault': (type, message) =>
      PointInTimeRestoreNotEnabledFault(type: type, message: message),
  'ProvisionedIopsNotAvailableInAZFault': (type, message) =>
      ProvisionedIopsNotAvailableInAZFault(type: type, message: message),
  'ReservedDBInstanceAlreadyExistsFault': (type, message) =>
      ReservedDBInstanceAlreadyExistsFault(type: type, message: message),
  'ReservedDBInstanceNotFoundFault': (type, message) =>
      ReservedDBInstanceNotFoundFault(type: type, message: message),
  'ReservedDBInstanceQuotaExceededFault': (type, message) =>
      ReservedDBInstanceQuotaExceededFault(type: type, message: message),
  'ReservedDBInstancesOfferingNotFoundFault': (type, message) =>
      ReservedDBInstancesOfferingNotFoundFault(type: type, message: message),
  'ResourceNotFoundFault': (type, message) =>
      ResourceNotFoundFault(type: type, message: message),
  'SNSInvalidTopicFault': (type, message) =>
      SNSInvalidTopicFault(type: type, message: message),
  'SNSNoAuthorizationFault': (type, message) =>
      SNSNoAuthorizationFault(type: type, message: message),
  'SNSTopicArnNotFoundFault': (type, message) =>
      SNSTopicArnNotFoundFault(type: type, message: message),
  'SharedSnapshotQuotaExceededFault': (type, message) =>
      SharedSnapshotQuotaExceededFault(type: type, message: message),
  'SnapshotQuotaExceededFault': (type, message) =>
      SnapshotQuotaExceededFault(type: type, message: message),
  'SourceNotFoundFault': (type, message) =>
      SourceNotFoundFault(type: type, message: message),
  'StorageQuotaExceededFault': (type, message) =>
      StorageQuotaExceededFault(type: type, message: message),
  'StorageTypeNotSupportedFault': (type, message) =>
      StorageTypeNotSupportedFault(type: type, message: message),
  'SubnetAlreadyInUse': (type, message) =>
      SubnetAlreadyInUse(type: type, message: message),
  'SubscriptionAlreadyExistFault': (type, message) =>
      SubscriptionAlreadyExistFault(type: type, message: message),
  'SubscriptionCategoryNotFoundFault': (type, message) =>
      SubscriptionCategoryNotFoundFault(type: type, message: message),
  'SubscriptionNotFoundFault': (type, message) =>
      SubscriptionNotFoundFault(type: type, message: message),
};
