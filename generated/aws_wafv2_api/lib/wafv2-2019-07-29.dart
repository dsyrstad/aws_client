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

/// <note>
/// This is the latest version of the <b>AWS WAF</b> API, released in November,
/// 2019. The names of the entities that you use to access this API, like
/// endpoints and namespaces, all have the versioning information added, like
/// "V2" or "v2", to distinguish from the prior version. We recommend migrating
/// your resources to this version, because it has a number of significant
/// improvements.
///
/// If you used AWS WAF prior to this release, you can't use this AWS WAFV2 API
/// to access any AWS WAF resources that you created before. You can access your
/// old rules, web ACLs, and other AWS WAF resources only through the AWS WAF
/// Classic APIs. The AWS WAF Classic APIs have retained the prior names,
/// endpoints, and namespaces.
///
/// For information, including how to migrate your AWS WAF resources to this
/// version, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// AWS WAF is a web application firewall that lets you monitor the HTTP and
/// HTTPS requests that are forwarded to Amazon CloudFront, an Amazon API
/// Gateway REST API, an Application Load Balancer, or an AWS AppSync GraphQL
/// API. AWS WAF also lets you control access to your content. Based on
/// conditions that you specify, such as the IP addresses that requests
/// originate from or the values of query strings, the API Gateway REST API,
/// CloudFront distribution, the Application Load Balancer, or the AWS AppSync
/// GraphQL API responds to requests either with the requested content or with
/// an HTTP 403 status code (Forbidden). You also can configure CloudFront to
/// return a custom error page when a request is blocked.
///
/// This API guide is for developers who need detailed information about AWS WAF
/// API actions, data types, and errors. For detailed information about AWS WAF
/// features and an overview of how to use AWS WAF, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF
/// Developer Guide</a>.
///
/// You can make calls using the endpoints listed in <a
/// href="https://docs.aws.amazon.com/general/latest/gr/rande.html#waf_region">AWS
/// Service Endpoints for AWS WAF</a>.
///
/// <ul>
/// <li>
/// For regional applications, you can use any of the endpoints in the list. A
/// regional application can be an Application Load Balancer (ALB), an API
/// Gateway REST API, or an AppSync GraphQL API.
/// </li>
/// <li>
/// For AWS CloudFront applications, you must use the API endpoint listed for US
/// East (N. Virginia): us-east-1.
/// </li>
/// </ul>
/// Alternatively, you can use one of the AWS SDKs to access an API that's
/// tailored to the programming language or platform that you're using. For more
/// information, see <a href="http://aws.amazon.com/tools/#SDKs">AWS SDKs</a>.
///
/// We currently provide two versions of the AWS WAF API: this API and the prior
/// versions, the classic AWS WAF APIs. This new API provides the same
/// functionality as the older versions, with the following major improvements:
///
/// <ul>
/// <li>
/// You use one API for both global and regional applications. Where you need to
/// distinguish the scope, you specify a <code>Scope</code> parameter and set it
/// to <code>CLOUDFRONT</code> or <code>REGIONAL</code>.
/// </li>
/// <li>
/// You can define a Web ACL or rule group with a single call, and update it
/// with a single call. You define all rule specifications in JSON format, and
/// pass them to your rule group or Web ACL calls.
/// </li>
/// <li>
/// The limits AWS WAF places on the use of rules more closely reflects the cost
/// of running each type of rule. Rule groups include capacity settings, so you
/// know the maximum cost of a rule group when you use it.
/// </li>
/// </ul>
class WAFV2 {
  final _s.JsonProtocol _protocol;
  WAFV2({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'wafv2',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        );

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Associates a Web ACL with a regional application resource, to protect the
  /// resource. A regional application can be an Application Load Balancer
  /// (ALB), an API Gateway REST API, or an AppSync GraphQL API.
  ///
  /// For AWS CloudFront, don't use this call. Instead, use your CloudFront
  /// distribution configuration. To associate a Web ACL, in the CloudFront call
  /// <code>UpdateDistribution</code>, set the web ACL ID to the Amazon Resource
  /// Name (ARN) of the Web ACL. For information, see <a
  /// href="https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_UpdateDistribution.html">UpdateDistribution</a>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFUnavailableEntityException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to associate with the web
  /// ACL.
  ///
  /// The ARN must be in one of the following formats:
  ///
  /// <ul>
  /// <li>
  /// For an Application Load Balancer:
  /// <code>arn:aws:elasticloadbalancing:<i>region</i>:<i>account-id</i>:loadbalancer/app/<i>load-balancer-name</i>/<i>load-balancer-id</i>
  /// </code>
  /// </li>
  /// <li>
  /// For an API Gateway REST API:
  /// <code>arn:aws:apigateway:<i>region</i>::/restapis/<i>api-id</i>/stages/<i>stage-name</i>
  /// </code>
  /// </li>
  /// <li>
  /// For an AppSync GraphQL API:
  /// <code>arn:aws:appsync:<i>region</i>:<i>account-id</i>:apis/<i>GraphQLApiId</i>
  /// </code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [webACLArn] :
  /// The Amazon Resource Name (ARN) of the Web ACL that you want to associate
  /// with the resource.
  Future<void> associateWebACL({
    required String resourceArn,
    required String webACLArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(webACLArn, 'webACLArn');
    _s.validateStringLength(
      'webACLArn',
      webACLArn,
      20,
      2048,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.AssociateWebACL'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'WebACLArn': webACLArn,
      },
    );
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Returns the web ACL capacity unit (WCU) requirements for a specified scope
  /// and set of rules. You can use this to check the capacity requirements for
  /// the rules you want to use in a <a>RuleGroup</a> or <a>WebACL</a>.
  ///
  /// AWS WAF uses WCUs to calculate and control the operating resources that
  /// are used to run your rules, rule groups, and web ACLs. AWS WAF calculates
  /// capacity differently for each rule type, to reflect the relative cost of
  /// each rule. Simple rules that cost little to run use fewer WCUs than more
  /// complex rules that use more processing power. Rule group capacity is fixed
  /// at creation, which helps users plan their web ACL WCU usage when they use
  /// a rule group. The WCU limit for web ACLs is 1,500.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFInvalidResourceException].
  /// May throw [WAFUnavailableEntityException].
  /// May throw [WAFSubscriptionNotFoundException].
  ///
  /// Parameter [rules] :
  /// An array of <a>Rule</a> that you're configuring to use in a rule group or
  /// web ACL.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  Future<CheckCapacityResponse> checkCapacity({
    required List<Rule> rules,
    required Scope scope,
  }) async {
    ArgumentError.checkNotNull(rules, 'rules');
    ArgumentError.checkNotNull(scope, 'scope');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.CheckCapacity'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Rules': rules,
        'Scope': scope.toValue(),
      },
    );

    return CheckCapacityResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Creates an <a>IPSet</a>, which you use to identify web requests that
  /// originate from specific IP addresses or ranges of IP addresses. For
  /// example, if you're receiving a lot of requests from a ranges of IP
  /// addresses, you can configure AWS WAF to block them using an IPSet that
  /// lists those IP addresses.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFDuplicateItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [addresses] :
  /// Contains an array of strings that specify one or more IP addresses or
  /// blocks of IP addresses in Classless Inter-Domain Routing (CIDR) notation.
  /// AWS WAF supports all address ranges for IP versions IPv4 and IPv6.
  ///
  /// Examples:
  ///
  /// <ul>
  /// <li>
  /// To configure AWS WAF to allow, block, or count requests that originated
  /// from the IP address 192.0.2.44, specify <code>192.0.2.44/32</code>.
  /// </li>
  /// <li>
  /// To configure AWS WAF to allow, block, or count requests that originated
  /// from IP addresses from 192.0.2.0 to 192.0.2.255, specify
  /// <code>192.0.2.0/24</code>.
  /// </li>
  /// <li>
  /// To configure AWS WAF to allow, block, or count requests that originated
  /// from the IP address 1111:0000:0000:0000:0000:0000:0000:0111, specify
  /// <code>1111:0000:0000:0000:0000:0000:0000:0111/128</code>.
  /// </li>
  /// <li>
  /// To configure AWS WAF to allow, block, or count requests that originated
  /// from IP addresses 1111:0000:0000:0000:0000:0000:0000:0000 to
  /// 1111:0000:0000:0000:ffff:ffff:ffff:ffff, specify
  /// <code>1111:0000:0000:0000:0000:0000:0000:0000/64</code>.
  /// </li>
  /// </ul>
  /// For more information about CIDR notation, see the Wikipedia entry <a
  /// href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Classless
  /// Inter-Domain Routing</a>.
  ///
  /// Parameter [iPAddressVersion] :
  /// Specify IPV4 or IPV6.
  ///
  /// Parameter [name] :
  /// The name of the IP set. You cannot change the name of an
  /// <code>IPSet</code> after you create it.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [description] :
  /// A description of the IP set that helps with identification. You cannot
  /// change the description of an IP set after you create it.
  ///
  /// Parameter [tags] :
  /// An array of key:value pairs to associate with the resource.
  Future<CreateIPSetResponse> createIPSet({
    required List<String> addresses,
    required IPAddressVersion iPAddressVersion,
    required String name,
    required Scope scope,
    String? description,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(addresses, 'addresses');
    ArgumentError.checkNotNull(iPAddressVersion, 'iPAddressVersion');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(scope, 'scope');
    _s.validateStringLength(
      'description',
      description,
      1,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.CreateIPSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Addresses': addresses,
        'IPAddressVersion': iPAddressVersion.toValue(),
        'Name': name,
        'Scope': scope.toValue(),
        if (description != null) 'Description': description,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateIPSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Creates a <a>RegexPatternSet</a>, which you reference in a
  /// <a>RegexPatternSetReferenceStatement</a>, to have AWS WAF inspect a web
  /// request component for the specified patterns.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFDuplicateItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [name] :
  /// The name of the set. You cannot change the name after you create the set.
  ///
  /// Parameter [regularExpressionList] :
  /// Array of regular expression strings.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [description] :
  /// A description of the set that helps with identification. You cannot change
  /// the description of a set after you create it.
  ///
  /// Parameter [tags] :
  /// An array of key:value pairs to associate with the resource.
  Future<CreateRegexPatternSetResponse> createRegexPatternSet({
    required String name,
    required List<Regex> regularExpressionList,
    required Scope scope,
    String? description,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(regularExpressionList, 'regularExpressionList');
    ArgumentError.checkNotNull(scope, 'scope');
    _s.validateStringLength(
      'description',
      description,
      1,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.CreateRegexPatternSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'RegularExpressionList': regularExpressionList,
        'Scope': scope.toValue(),
        if (description != null) 'Description': description,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateRegexPatternSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Creates a <a>RuleGroup</a> per the specifications provided.
  ///
  /// A rule group defines a collection of rules to inspect and control web
  /// requests that you can use in a <a>WebACL</a>. When you create a rule
  /// group, you define an immutable capacity limit. If you update a rule group,
  /// you must stay within the capacity. This allows others to reuse the rule
  /// group with confidence in its capacity requirements.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFDuplicateItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFUnavailableEntityException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  /// May throw [WAFSubscriptionNotFoundException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [capacity] :
  /// The web ACL capacity units (WCUs) required for this rule group.
  ///
  /// When you create your own rule group, you define this, and you cannot
  /// change it after creation. When you add or modify the rules in a rule
  /// group, AWS WAF enforces this limit. You can check the capacity for a set
  /// of rules using <a>CheckCapacity</a>.
  ///
  /// AWS WAF uses WCUs to calculate and control the operating resources that
  /// are used to run your rules, rule groups, and web ACLs. AWS WAF calculates
  /// capacity differently for each rule type, to reflect the relative cost of
  /// each rule. Simple rules that cost little to run use fewer WCUs than more
  /// complex rules that use more processing power. Rule group capacity is fixed
  /// at creation, which helps users plan their web ACL WCU usage when they use
  /// a rule group. The WCU limit for web ACLs is 1,500.
  ///
  /// Parameter [name] :
  /// The name of the rule group. You cannot change the name of a rule group
  /// after you create it.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [visibilityConfig] :
  /// Defines and enables Amazon CloudWatch metrics and web request sample
  /// collection.
  ///
  /// Parameter [description] :
  /// A description of the rule group that helps with identification. You cannot
  /// change the description of a rule group after you create it.
  ///
  /// Parameter [rules] :
  /// The <a>Rule</a> statements used to identify the web requests that you want
  /// to allow, block, or count. Each rule includes one top-level statement that
  /// AWS WAF uses to identify matching web requests, and parameters that govern
  /// how AWS WAF handles them.
  ///
  /// Parameter [tags] :
  /// An array of key:value pairs to associate with the resource.
  Future<CreateRuleGroupResponse> createRuleGroup({
    required int capacity,
    required String name,
    required Scope scope,
    required VisibilityConfig visibilityConfig,
    String? description,
    List<Rule>? rules,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(capacity, 'capacity');
    _s.validateNumRange(
      'capacity',
      capacity,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(scope, 'scope');
    ArgumentError.checkNotNull(visibilityConfig, 'visibilityConfig');
    _s.validateStringLength(
      'description',
      description,
      1,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.CreateRuleGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Capacity': capacity,
        'Name': name,
        'Scope': scope.toValue(),
        'VisibilityConfig': visibilityConfig,
        if (description != null) 'Description': description,
        if (rules != null) 'Rules': rules,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateRuleGroupResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Creates a <a>WebACL</a> per the specifications provided.
  ///
  /// A Web ACL defines a collection of rules to use to inspect and control web
  /// requests. Each rule has an action defined (allow, block, or count) for
  /// requests that match the statement of the rule. In the Web ACL, you assign
  /// a default action to take (allow, block) for any request that does not
  /// match any of the rules. The rules in a Web ACL can be a combination of the
  /// types <a>Rule</a>, <a>RuleGroup</a>, and managed rule group. You can
  /// associate a Web ACL with one or more AWS resources to protect. The
  /// resources can be Amazon CloudFront, an Amazon API Gateway REST API, an
  /// Application Load Balancer, or an AWS AppSync GraphQL API.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFDuplicateItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFInvalidResourceException].
  /// May throw [WAFUnavailableEntityException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  /// May throw [WAFSubscriptionNotFoundException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [defaultAction] :
  /// The action to perform if none of the <code>Rules</code> contained in the
  /// <code>WebACL</code> match.
  ///
  /// Parameter [name] :
  /// The name of the Web ACL. You cannot change the name of a Web ACL after you
  /// create it.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [visibilityConfig] :
  /// Defines and enables Amazon CloudWatch metrics and web request sample
  /// collection.
  ///
  /// Parameter [description] :
  /// A description of the Web ACL that helps with identification. You cannot
  /// change the description of a Web ACL after you create it.
  ///
  /// Parameter [rules] :
  /// The <a>Rule</a> statements used to identify the web requests that you want
  /// to allow, block, or count. Each rule includes one top-level statement that
  /// AWS WAF uses to identify matching web requests, and parameters that govern
  /// how AWS WAF handles them.
  ///
  /// Parameter [tags] :
  /// An array of key:value pairs to associate with the resource.
  Future<CreateWebACLResponse> createWebACL({
    required DefaultAction defaultAction,
    required String name,
    required Scope scope,
    required VisibilityConfig visibilityConfig,
    String? description,
    List<Rule>? rules,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(defaultAction, 'defaultAction');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(scope, 'scope');
    ArgumentError.checkNotNull(visibilityConfig, 'visibilityConfig');
    _s.validateStringLength(
      'description',
      description,
      1,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.CreateWebACL'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DefaultAction': defaultAction,
        'Name': name,
        'Scope': scope.toValue(),
        'VisibilityConfig': visibilityConfig,
        if (description != null) 'Description': description,
        if (rules != null) 'Rules': rules,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateWebACLResponse.fromJson(jsonResponse.body);
  }

  /// Deletes all rule groups that are managed by AWS Firewall Manager for the
  /// specified web ACL.
  ///
  /// You can only use this if <code>ManagedByFirewallManager</code> is false in
  /// the specified <a>WebACL</a>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [webACLArn] :
  /// The Amazon Resource Name (ARN) of the web ACL.
  ///
  /// Parameter [webACLLockToken] :
  /// A token used for optimistic locking. AWS WAF returns a token to your get
  /// and list requests, to mark the state of the entity at the time of the
  /// request. To make changes to the entity associated with the token, you
  /// provide the token to operations like update and delete. AWS WAF uses the
  /// token to ensure that no changes have been made to the entity since you
  /// last retrieved it. If a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// get, and use the new token returned by that operation.
  Future<DeleteFirewallManagerRuleGroupsResponse>
      deleteFirewallManagerRuleGroups({
    required String webACLArn,
    required String webACLLockToken,
  }) async {
    ArgumentError.checkNotNull(webACLArn, 'webACLArn');
    _s.validateStringLength(
      'webACLArn',
      webACLArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(webACLLockToken, 'webACLLockToken');
    _s.validateStringLength(
      'webACLLockToken',
      webACLLockToken,
      1,
      36,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.DeleteFirewallManagerRuleGroups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WebACLArn': webACLArn,
        'WebACLLockToken': webACLLockToken,
      },
    );

    return DeleteFirewallManagerRuleGroupsResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Deletes the specified <a>IPSet</a>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFAssociatedItemException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [id] :
  /// A unique identifier for the set. This ID is returned in the responses to
  /// create and list commands. You provide it to operations like update and
  /// delete.
  ///
  /// Parameter [lockToken] :
  /// A token used for optimistic locking. AWS WAF returns a token to your get
  /// and list requests, to mark the state of the entity at the time of the
  /// request. To make changes to the entity associated with the token, you
  /// provide the token to operations like update and delete. AWS WAF uses the
  /// token to ensure that no changes have been made to the entity since you
  /// last retrieved it. If a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// get, and use the new token returned by that operation.
  ///
  /// Parameter [name] :
  /// The name of the IP set. You cannot change the name of an
  /// <code>IPSet</code> after you create it.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  Future<void> deleteIPSet({
    required String id,
    required String lockToken,
    required String name,
    required Scope scope,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(lockToken, 'lockToken');
    _s.validateStringLength(
      'lockToken',
      lockToken,
      1,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(scope, 'scope');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.DeleteIPSet'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        'LockToken': lockToken,
        'Name': name,
        'Scope': scope.toValue(),
      },
    );
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Deletes the <a>LoggingConfiguration</a> from the specified web ACL.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the web ACL from which you want to
  /// delete the <a>LoggingConfiguration</a>.
  Future<void> deleteLoggingConfiguration({
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.DeleteLoggingConfiguration'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );
  }

  /// Permanently deletes an IAM policy from the specified rule group.
  ///
  /// You must be the owner of the rule group to perform this operation.
  ///
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the rule group from which you want to
  /// delete the policy.
  ///
  /// You must be the owner of the rule group to perform this operation.
  Future<void> deletePermissionPolicy({
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.DeletePermissionPolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Deletes the specified <a>RegexPatternSet</a>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFAssociatedItemException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [id] :
  /// A unique identifier for the set. This ID is returned in the responses to
  /// create and list commands. You provide it to operations like update and
  /// delete.
  ///
  /// Parameter [lockToken] :
  /// A token used for optimistic locking. AWS WAF returns a token to your get
  /// and list requests, to mark the state of the entity at the time of the
  /// request. To make changes to the entity associated with the token, you
  /// provide the token to operations like update and delete. AWS WAF uses the
  /// token to ensure that no changes have been made to the entity since you
  /// last retrieved it. If a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// get, and use the new token returned by that operation.
  ///
  /// Parameter [name] :
  /// The name of the set. You cannot change the name after you create the set.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  Future<void> deleteRegexPatternSet({
    required String id,
    required String lockToken,
    required String name,
    required Scope scope,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(lockToken, 'lockToken');
    _s.validateStringLength(
      'lockToken',
      lockToken,
      1,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(scope, 'scope');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.DeleteRegexPatternSet'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        'LockToken': lockToken,
        'Name': name,
        'Scope': scope.toValue(),
      },
    );
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Deletes the specified <a>RuleGroup</a>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFAssociatedItemException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [id] :
  /// A unique identifier for the rule group. This ID is returned in the
  /// responses to create and list commands. You provide it to operations like
  /// update and delete.
  ///
  /// Parameter [lockToken] :
  /// A token used for optimistic locking. AWS WAF returns a token to your get
  /// and list requests, to mark the state of the entity at the time of the
  /// request. To make changes to the entity associated with the token, you
  /// provide the token to operations like update and delete. AWS WAF uses the
  /// token to ensure that no changes have been made to the entity since you
  /// last retrieved it. If a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// get, and use the new token returned by that operation.
  ///
  /// Parameter [name] :
  /// The name of the rule group. You cannot change the name of a rule group
  /// after you create it.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  Future<void> deleteRuleGroup({
    required String id,
    required String lockToken,
    required String name,
    required Scope scope,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(lockToken, 'lockToken');
    _s.validateStringLength(
      'lockToken',
      lockToken,
      1,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(scope, 'scope');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.DeleteRuleGroup'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        'LockToken': lockToken,
        'Name': name,
        'Scope': scope.toValue(),
      },
    );
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Deletes the specified <a>WebACL</a>.
  ///
  /// You can only use this if <code>ManagedByFirewallManager</code> is false in
  /// the specified <a>WebACL</a>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFAssociatedItemException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [id] :
  /// The unique identifier for the Web ACL. This ID is returned in the
  /// responses to create and list commands. You provide it to operations like
  /// update and delete.
  ///
  /// Parameter [lockToken] :
  /// A token used for optimistic locking. AWS WAF returns a token to your get
  /// and list requests, to mark the state of the entity at the time of the
  /// request. To make changes to the entity associated with the token, you
  /// provide the token to operations like update and delete. AWS WAF uses the
  /// token to ensure that no changes have been made to the entity since you
  /// last retrieved it. If a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// get, and use the new token returned by that operation.
  ///
  /// Parameter [name] :
  /// The name of the Web ACL. You cannot change the name of a Web ACL after you
  /// create it.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  Future<void> deleteWebACL({
    required String id,
    required String lockToken,
    required String name,
    required Scope scope,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(lockToken, 'lockToken');
    _s.validateStringLength(
      'lockToken',
      lockToken,
      1,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(scope, 'scope');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.DeleteWebACL'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        'LockToken': lockToken,
        'Name': name,
        'Scope': scope.toValue(),
      },
    );
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Provides high-level information for a managed rule group, including
  /// descriptions of the rules.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidResourceException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [name] :
  /// The name of the managed rule group. You use this, along with the vendor
  /// name, to identify the rule group.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [vendorName] :
  /// The name of the managed rule group vendor. You use this, along with the
  /// rule group name, to identify the rule group.
  Future<DescribeManagedRuleGroupResponse> describeManagedRuleGroup({
    required String name,
    required Scope scope,
    required String vendorName,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(scope, 'scope');
    ArgumentError.checkNotNull(vendorName, 'vendorName');
    _s.validateStringLength(
      'vendorName',
      vendorName,
      1,
      128,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.DescribeManagedRuleGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'Scope': scope.toValue(),
        'VendorName': vendorName,
      },
    );

    return DescribeManagedRuleGroupResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Disassociates a Web ACL from a regional application resource. A regional
  /// application can be an Application Load Balancer (ALB), an API Gateway REST
  /// API, or an AppSync GraphQL API.
  ///
  /// For AWS CloudFront, don't use this call. Instead, use your CloudFront
  /// distribution configuration. To disassociate a Web ACL, provide an empty
  /// web ACL ID in the CloudFront call <code>UpdateDistribution</code>. For
  /// information, see <a
  /// href="https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_UpdateDistribution.html">UpdateDistribution</a>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to disassociate from the
  /// web ACL.
  ///
  /// The ARN must be in one of the following formats:
  ///
  /// <ul>
  /// <li>
  /// For an Application Load Balancer:
  /// <code>arn:aws:elasticloadbalancing:<i>region</i>:<i>account-id</i>:loadbalancer/app/<i>load-balancer-name</i>/<i>load-balancer-id</i>
  /// </code>
  /// </li>
  /// <li>
  /// For an API Gateway REST API:
  /// <code>arn:aws:apigateway:<i>region</i>::/restapis/<i>api-id</i>/stages/<i>stage-name</i>
  /// </code>
  /// </li>
  /// <li>
  /// For an AppSync GraphQL API:
  /// <code>arn:aws:appsync:<i>region</i>:<i>account-id</i>:apis/<i>GraphQLApiId</i>
  /// </code>
  /// </li>
  /// </ul>
  Future<void> disassociateWebACL({
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.DisassociateWebACL'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Retrieves the specified <a>IPSet</a>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [id] :
  /// A unique identifier for the set. This ID is returned in the responses to
  /// create and list commands. You provide it to operations like update and
  /// delete.
  ///
  /// Parameter [name] :
  /// The name of the IP set. You cannot change the name of an
  /// <code>IPSet</code> after you create it.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  Future<GetIPSetResponse> getIPSet({
    required String id,
    required String name,
    required Scope scope,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(scope, 'scope');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.GetIPSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        'Name': name,
        'Scope': scope.toValue(),
      },
    );

    return GetIPSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Returns the <a>LoggingConfiguration</a> for the specified web ACL.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the web ACL for which you want to get
  /// the <a>LoggingConfiguration</a>.
  Future<GetLoggingConfigurationResponse> getLoggingConfiguration({
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.GetLoggingConfiguration'
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

    return GetLoggingConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Returns the IAM policy that is attached to the specified rule group.
  ///
  /// You must be the owner of the rule group to perform this operation.
  ///
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the rule group for which you want to get
  /// the policy.
  Future<GetPermissionPolicyResponse> getPermissionPolicy({
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.GetPermissionPolicy'
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

    return GetPermissionPolicyResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Retrieves the keys that are currently blocked by a rate-based rule. The
  /// maximum number of managed keys that can be blocked for a single rate-based
  /// rule is 10,000. If more than 10,000 addresses exceed the rate limit, those
  /// with the highest rates are blocked.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [ruleName] :
  /// The name of the rate-based rule to get the keys for.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [webACLId] :
  /// The unique identifier for the Web ACL. This ID is returned in the
  /// responses to create and list commands. You provide it to operations like
  /// update and delete.
  ///
  /// Parameter [webACLName] :
  /// The name of the Web ACL. You cannot change the name of a Web ACL after you
  /// create it.
  Future<GetRateBasedStatementManagedKeysResponse>
      getRateBasedStatementManagedKeys({
    required String ruleName,
    required Scope scope,
    required String webACLId,
    required String webACLName,
  }) async {
    ArgumentError.checkNotNull(ruleName, 'ruleName');
    _s.validateStringLength(
      'ruleName',
      ruleName,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(scope, 'scope');
    ArgumentError.checkNotNull(webACLId, 'webACLId');
    _s.validateStringLength(
      'webACLId',
      webACLId,
      1,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(webACLName, 'webACLName');
    _s.validateStringLength(
      'webACLName',
      webACLName,
      1,
      128,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.GetRateBasedStatementManagedKeys'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RuleName': ruleName,
        'Scope': scope.toValue(),
        'WebACLId': webACLId,
        'WebACLName': webACLName,
      },
    );

    return GetRateBasedStatementManagedKeysResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Retrieves the specified <a>RegexPatternSet</a>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [id] :
  /// A unique identifier for the set. This ID is returned in the responses to
  /// create and list commands. You provide it to operations like update and
  /// delete.
  ///
  /// Parameter [name] :
  /// The name of the set. You cannot change the name after you create the set.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  Future<GetRegexPatternSetResponse> getRegexPatternSet({
    required String id,
    required String name,
    required Scope scope,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(scope, 'scope');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.GetRegexPatternSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        'Name': name,
        'Scope': scope.toValue(),
      },
    );

    return GetRegexPatternSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Retrieves the specified <a>RuleGroup</a>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [id] :
  /// A unique identifier for the rule group. This ID is returned in the
  /// responses to create and list commands. You provide it to operations like
  /// update and delete.
  ///
  /// Parameter [name] :
  /// The name of the rule group. You cannot change the name of a rule group
  /// after you create it.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  Future<GetRuleGroupResponse> getRuleGroup({
    required String id,
    required String name,
    required Scope scope,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(scope, 'scope');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.GetRuleGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        'Name': name,
        'Scope': scope.toValue(),
      },
    );

    return GetRuleGroupResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Gets detailed information about a specified number of requests--a
  /// sample--that AWS WAF randomly selects from among the first 5,000 requests
  /// that your AWS resource received during a time range that you choose. You
  /// can specify a sample size of up to 500 requests, and you can specify any
  /// time range in the previous three hours.
  ///
  /// <code>GetSampledRequests</code> returns a time range, which is usually the
  /// time range that you specified. However, if your resource (such as a
  /// CloudFront distribution) received 5,000 requests before the specified time
  /// range elapsed, <code>GetSampledRequests</code> returns an updated time
  /// range. This new time range indicates the actual period during which AWS
  /// WAF selected the requests in the sample.
  ///
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  ///
  /// Parameter [maxItems] :
  /// The number of requests that you want AWS WAF to return from among the
  /// first 5,000 requests that your AWS resource received during the time
  /// range. If your resource received fewer requests than the value of
  /// <code>MaxItems</code>, <code>GetSampledRequests</code> returns information
  /// about all of them.
  ///
  /// Parameter [ruleMetricName] :
  /// The metric name assigned to the <code>Rule</code> or
  /// <code>RuleGroup</code> for which you want a sample of requests.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [timeWindow] :
  /// The start date and time and the end date and time of the range for which
  /// you want <code>GetSampledRequests</code> to return a sample of requests.
  /// You must specify the times in Coordinated Universal Time (UTC) format. UTC
  /// format includes the special designator, <code>Z</code>. For example,
  /// <code>"2016-09-27T14:50Z"</code>. You can specify any time range in the
  /// previous three hours.
  ///
  /// Parameter [webAclArn] :
  /// The Amazon resource name (ARN) of the <code>WebACL</code> for which you
  /// want a sample of requests.
  Future<GetSampledRequestsResponse> getSampledRequests({
    required int maxItems,
    required String ruleMetricName,
    required Scope scope,
    required TimeWindow timeWindow,
    required String webAclArn,
  }) async {
    ArgumentError.checkNotNull(maxItems, 'maxItems');
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      500,
      isRequired: true,
    );
    ArgumentError.checkNotNull(ruleMetricName, 'ruleMetricName');
    _s.validateStringLength(
      'ruleMetricName',
      ruleMetricName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(scope, 'scope');
    ArgumentError.checkNotNull(timeWindow, 'timeWindow');
    ArgumentError.checkNotNull(webAclArn, 'webAclArn');
    _s.validateStringLength(
      'webAclArn',
      webAclArn,
      20,
      2048,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.GetSampledRequests'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MaxItems': maxItems,
        'RuleMetricName': ruleMetricName,
        'Scope': scope.toValue(),
        'TimeWindow': timeWindow,
        'WebAclArn': webAclArn,
      },
    );

    return GetSampledRequestsResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Retrieves the specified <a>WebACL</a>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [id] :
  /// The unique identifier for the Web ACL. This ID is returned in the
  /// responses to create and list commands. You provide it to operations like
  /// update and delete.
  ///
  /// Parameter [name] :
  /// The name of the Web ACL. You cannot change the name of a Web ACL after you
  /// create it.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  Future<GetWebACLResponse> getWebACL({
    required String id,
    required String name,
    required Scope scope,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(scope, 'scope');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.GetWebACL'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        'Name': name,
        'Scope': scope.toValue(),
      },
    );

    return GetWebACLResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Retrieves the <a>WebACL</a> for the specified resource.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFUnavailableEntityException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN (Amazon Resource Name) of the resource.
  Future<GetWebACLForResourceResponse> getWebACLForResource({
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.GetWebACLForResource'
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

    return GetWebACLForResourceResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Retrieves an array of managed rule groups that are available for you to
  /// use. This list includes all AWS Managed Rules rule groups and the AWS
  /// Marketplace managed rule groups that you're subscribed to.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [limit] :
  /// The maximum number of objects that you want AWS WAF to return for this
  /// request. If more objects are available, in the response, AWS WAF provides
  /// a <code>NextMarker</code> value that you can use in a subsequent call to
  /// get the next batch of objects.
  ///
  /// Parameter [nextMarker] :
  /// When you request a list of objects with a <code>Limit</code> setting, if
  /// the number of objects that are still available for retrieval exceeds the
  /// limit, AWS WAF returns a <code>NextMarker</code> value in the response. To
  /// retrieve the next batch of objects, provide the marker from the prior call
  /// in your next request.
  Future<ListAvailableManagedRuleGroupsResponse>
      listAvailableManagedRuleGroups({
    required Scope scope,
    int? limit,
    String? nextMarker,
  }) async {
    ArgumentError.checkNotNull(scope, 'scope');
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    _s.validateStringLength(
      'nextMarker',
      nextMarker,
      1,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.ListAvailableManagedRuleGroups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Scope': scope.toValue(),
        if (limit != null) 'Limit': limit,
        if (nextMarker != null) 'NextMarker': nextMarker,
      },
    );

    return ListAvailableManagedRuleGroupsResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Retrieves an array of <a>IPSetSummary</a> objects for the IP sets that you
  /// manage.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [limit] :
  /// The maximum number of objects that you want AWS WAF to return for this
  /// request. If more objects are available, in the response, AWS WAF provides
  /// a <code>NextMarker</code> value that you can use in a subsequent call to
  /// get the next batch of objects.
  ///
  /// Parameter [nextMarker] :
  /// When you request a list of objects with a <code>Limit</code> setting, if
  /// the number of objects that are still available for retrieval exceeds the
  /// limit, AWS WAF returns a <code>NextMarker</code> value in the response. To
  /// retrieve the next batch of objects, provide the marker from the prior call
  /// in your next request.
  Future<ListIPSetsResponse> listIPSets({
    required Scope scope,
    int? limit,
    String? nextMarker,
  }) async {
    ArgumentError.checkNotNull(scope, 'scope');
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    _s.validateStringLength(
      'nextMarker',
      nextMarker,
      1,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.ListIPSets'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Scope': scope.toValue(),
        if (limit != null) 'Limit': limit,
        if (nextMarker != null) 'NextMarker': nextMarker,
      },
    );

    return ListIPSetsResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Retrieves an array of your <a>LoggingConfiguration</a> objects.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [limit] :
  /// The maximum number of objects that you want AWS WAF to return for this
  /// request. If more objects are available, in the response, AWS WAF provides
  /// a <code>NextMarker</code> value that you can use in a subsequent call to
  /// get the next batch of objects.
  ///
  /// Parameter [nextMarker] :
  /// When you request a list of objects with a <code>Limit</code> setting, if
  /// the number of objects that are still available for retrieval exceeds the
  /// limit, AWS WAF returns a <code>NextMarker</code> value in the response. To
  /// retrieve the next batch of objects, provide the marker from the prior call
  /// in your next request.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  Future<ListLoggingConfigurationsResponse> listLoggingConfigurations({
    int? limit,
    String? nextMarker,
    Scope? scope,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    _s.validateStringLength(
      'nextMarker',
      nextMarker,
      1,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.ListLoggingConfigurations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (limit != null) 'Limit': limit,
        if (nextMarker != null) 'NextMarker': nextMarker,
        if (scope != null) 'Scope': scope.toValue(),
      },
    );

    return ListLoggingConfigurationsResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Retrieves an array of <a>RegexPatternSetSummary</a> objects for the regex
  /// pattern sets that you manage.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [limit] :
  /// The maximum number of objects that you want AWS WAF to return for this
  /// request. If more objects are available, in the response, AWS WAF provides
  /// a <code>NextMarker</code> value that you can use in a subsequent call to
  /// get the next batch of objects.
  ///
  /// Parameter [nextMarker] :
  /// When you request a list of objects with a <code>Limit</code> setting, if
  /// the number of objects that are still available for retrieval exceeds the
  /// limit, AWS WAF returns a <code>NextMarker</code> value in the response. To
  /// retrieve the next batch of objects, provide the marker from the prior call
  /// in your next request.
  Future<ListRegexPatternSetsResponse> listRegexPatternSets({
    required Scope scope,
    int? limit,
    String? nextMarker,
  }) async {
    ArgumentError.checkNotNull(scope, 'scope');
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    _s.validateStringLength(
      'nextMarker',
      nextMarker,
      1,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.ListRegexPatternSets'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Scope': scope.toValue(),
        if (limit != null) 'Limit': limit,
        if (nextMarker != null) 'NextMarker': nextMarker,
      },
    );

    return ListRegexPatternSetsResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Retrieves an array of the Amazon Resource Names (ARNs) for the regional
  /// resources that are associated with the specified web ACL. If you want the
  /// list of AWS CloudFront resources, use the AWS CloudFront call
  /// <code>ListDistributionsByWebACLId</code>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [webACLArn] :
  /// The Amazon Resource Name (ARN) of the Web ACL.
  ///
  /// Parameter [resourceType] :
  /// Used for web ACLs that are scoped for regional applications. A regional
  /// application can be an Application Load Balancer (ALB), an API Gateway REST
  /// API, or an AppSync GraphQL API.
  Future<ListResourcesForWebACLResponse> listResourcesForWebACL({
    required String webACLArn,
    ResourceType? resourceType,
  }) async {
    ArgumentError.checkNotNull(webACLArn, 'webACLArn');
    _s.validateStringLength(
      'webACLArn',
      webACLArn,
      20,
      2048,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.ListResourcesForWebACL'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WebACLArn': webACLArn,
        if (resourceType != null) 'ResourceType': resourceType.toValue(),
      },
    );

    return ListResourcesForWebACLResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Retrieves an array of <a>RuleGroupSummary</a> objects for the rule groups
  /// that you manage.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [limit] :
  /// The maximum number of objects that you want AWS WAF to return for this
  /// request. If more objects are available, in the response, AWS WAF provides
  /// a <code>NextMarker</code> value that you can use in a subsequent call to
  /// get the next batch of objects.
  ///
  /// Parameter [nextMarker] :
  /// When you request a list of objects with a <code>Limit</code> setting, if
  /// the number of objects that are still available for retrieval exceeds the
  /// limit, AWS WAF returns a <code>NextMarker</code> value in the response. To
  /// retrieve the next batch of objects, provide the marker from the prior call
  /// in your next request.
  Future<ListRuleGroupsResponse> listRuleGroups({
    required Scope scope,
    int? limit,
    String? nextMarker,
  }) async {
    ArgumentError.checkNotNull(scope, 'scope');
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    _s.validateStringLength(
      'nextMarker',
      nextMarker,
      1,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.ListRuleGroups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Scope': scope.toValue(),
        if (limit != null) 'Limit': limit,
        if (nextMarker != null) 'NextMarker': nextMarker,
      },
    );

    return ListRuleGroupsResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Retrieves the <a>TagInfoForResource</a> for the specified resource. Tags
  /// are key:value pairs that you can use to categorize and manage your
  /// resources, for purposes like billing. For example, you might set the tag
  /// key to "customer" and the value to the customer name or ID. You can
  /// specify one or more tags to add to each AWS resource, up to 50 tags for a
  /// resource.
  ///
  /// You can tag the AWS resources that you manage through AWS WAF: web ACLs,
  /// rule groups, IP sets, and regex pattern sets. You can't manage or view
  /// tags through the AWS WAF console.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [limit] :
  /// The maximum number of objects that you want AWS WAF to return for this
  /// request. If more objects are available, in the response, AWS WAF provides
  /// a <code>NextMarker</code> value that you can use in a subsequent call to
  /// get the next batch of objects.
  ///
  /// Parameter [nextMarker] :
  /// When you request a list of objects with a <code>Limit</code> setting, if
  /// the number of objects that are still available for retrieval exceeds the
  /// limit, AWS WAF returns a <code>NextMarker</code> value in the response. To
  /// retrieve the next batch of objects, provide the marker from the prior call
  /// in your next request.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceARN,
    int? limit,
    String? nextMarker,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      20,
      2048,
      isRequired: true,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    _s.validateStringLength(
      'nextMarker',
      nextMarker,
      1,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        if (limit != null) 'Limit': limit,
        if (nextMarker != null) 'NextMarker': nextMarker,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Retrieves an array of <a>WebACLSummary</a> objects for the web ACLs that
  /// you manage.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [limit] :
  /// The maximum number of objects that you want AWS WAF to return for this
  /// request. If more objects are available, in the response, AWS WAF provides
  /// a <code>NextMarker</code> value that you can use in a subsequent call to
  /// get the next batch of objects.
  ///
  /// Parameter [nextMarker] :
  /// When you request a list of objects with a <code>Limit</code> setting, if
  /// the number of objects that are still available for retrieval exceeds the
  /// limit, AWS WAF returns a <code>NextMarker</code> value in the response. To
  /// retrieve the next batch of objects, provide the marker from the prior call
  /// in your next request.
  Future<ListWebACLsResponse> listWebACLs({
    required Scope scope,
    int? limit,
    String? nextMarker,
  }) async {
    ArgumentError.checkNotNull(scope, 'scope');
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    _s.validateStringLength(
      'nextMarker',
      nextMarker,
      1,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.ListWebACLs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Scope': scope.toValue(),
        if (limit != null) 'Limit': limit,
        if (nextMarker != null) 'NextMarker': nextMarker,
      },
    );

    return ListWebACLsResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Enables the specified <a>LoggingConfiguration</a>, to start logging from a
  /// web ACL, according to the configuration provided.
  ///
  /// You can access information about all traffic that AWS WAF inspects using
  /// the following steps:
  /// <ol>
  /// <li>
  /// Create an Amazon Kinesis Data Firehose.
  ///
  /// Create the data firehose with a PUT source and in the Region that you are
  /// operating. If you are capturing logs for Amazon CloudFront, always create
  /// the firehose in US East (N. Virginia).
  ///
  /// Give the data firehose a name that starts with the prefix
  /// <code>aws-waf-logs-</code>. For example,
  /// <code>aws-waf-logs-us-east-2-analytics</code>.
  /// <note>
  /// Do not create the data firehose using a <code>Kinesis stream</code> as
  /// your source.
  /// </note> </li>
  /// <li>
  /// Associate that firehose to your web ACL using a
  /// <code>PutLoggingConfiguration</code> request.
  /// </li> </ol>
  /// When you successfully enable logging using a
  /// <code>PutLoggingConfiguration</code> request, AWS WAF will create a
  /// service linked role with the necessary permissions to write logs to the
  /// Amazon Kinesis Data Firehose. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/logging.html">Logging
  /// Web ACL Traffic Information</a> in the <i>AWS WAF Developer Guide</i>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFServiceLinkedRoleErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFLimitsExceededException].
  ///
  /// Parameter [loggingConfiguration] :
  /// <p/>
  Future<PutLoggingConfigurationResponse> putLoggingConfiguration({
    required LoggingConfiguration loggingConfiguration,
  }) async {
    ArgumentError.checkNotNull(loggingConfiguration, 'loggingConfiguration');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.PutLoggingConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LoggingConfiguration': loggingConfiguration,
      },
    );

    return PutLoggingConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Attaches an IAM policy to the specified resource. Use this to share a rule
  /// group across accounts.
  ///
  /// You must be the owner of the rule group to perform this operation.
  ///
  /// This action is subject to the following restrictions:
  ///
  /// <ul>
  /// <li>
  /// You can attach only one policy with each <code>PutPermissionPolicy</code>
  /// request.
  /// </li>
  /// <li>
  /// The ARN in the request must be a valid WAF <a>RuleGroup</a> ARN and the
  /// rule group must exist in the same region.
  /// </li>
  /// <li>
  /// The user making the request must be the owner of the rule group.
  /// </li>
  /// </ul>
  ///
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidPermissionPolicyException].
  ///
  /// Parameter [policy] :
  /// The policy to attach to the specified rule group.
  ///
  /// The policy specifications must conform to the following:
  ///
  /// <ul>
  /// <li>
  /// The policy must be composed using IAM Policy version 2012-10-17 or version
  /// 2015-01-01.
  /// </li>
  /// <li>
  /// The policy must include specifications for <code>Effect</code>,
  /// <code>Action</code>, and <code>Principal</code>.
  /// </li>
  /// <li>
  /// <code>Effect</code> must specify <code>Allow</code>.
  /// </li>
  /// <li>
  /// <code>Action</code> must specify <code>wafv2:CreateWebACL</code>,
  /// <code>wafv2:UpdateWebACL</code>, and
  /// <code>wafv2:PutFirewallManagerRuleGroups</code>. AWS WAF rejects any extra
  /// actions or wildcard actions in the policy.
  /// </li>
  /// <li>
  /// The policy must not include a <code>Resource</code> parameter.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html">IAM
  /// Policies</a>.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the <a>RuleGroup</a> to which you want
  /// to attach the policy.
  Future<void> putPermissionPolicy({
    required String policy,
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(policy, 'policy');
    _s.validateStringLength(
      'policy',
      policy,
      1,
      395000,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.PutPermissionPolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Policy': policy,
        'ResourceArn': resourceArn,
      },
    );
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Associates tags with the specified AWS resource. Tags are key:value pairs
  /// that you can use to categorize and manage your resources, for purposes
  /// like billing. For example, you might set the tag key to "customer" and the
  /// value to the customer name or ID. You can specify one or more tags to add
  /// to each AWS resource, up to 50 tags for a resource.
  ///
  /// You can tag the AWS resources that you manage through AWS WAF: web ACLs,
  /// rule groups, IP sets, and regex pattern sets. You can't manage or view
  /// tags through the AWS WAF console.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tags] :
  /// An array of key:value pairs to associate with the resource.
  Future<void> tagResource({
    required String resourceARN,
    required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'Tags': tags,
      },
    );
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Disassociates tags from an AWS resource. Tags are key:value pairs that you
  /// can associate with AWS resources. For example, the tag key might be
  /// "customer" and the tag value might be "companyA." You can specify one or
  /// more tags to add to each container. You can add up to 50 tags to each AWS
  /// resource.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tagKeys] :
  /// An array of keys identifying the tags to disassociate from the resource.
  Future<void> untagResource({
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'TagKeys': tagKeys,
      },
    );
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Updates the specified <a>IPSet</a>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFDuplicateItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [addresses] :
  /// Contains an array of strings that specify one or more IP addresses or
  /// blocks of IP addresses in Classless Inter-Domain Routing (CIDR) notation.
  /// AWS WAF supports all address ranges for IP versions IPv4 and IPv6.
  ///
  /// Examples:
  ///
  /// <ul>
  /// <li>
  /// To configure AWS WAF to allow, block, or count requests that originated
  /// from the IP address 192.0.2.44, specify <code>192.0.2.44/32</code>.
  /// </li>
  /// <li>
  /// To configure AWS WAF to allow, block, or count requests that originated
  /// from IP addresses from 192.0.2.0 to 192.0.2.255, specify
  /// <code>192.0.2.0/24</code>.
  /// </li>
  /// <li>
  /// To configure AWS WAF to allow, block, or count requests that originated
  /// from the IP address 1111:0000:0000:0000:0000:0000:0000:0111, specify
  /// <code>1111:0000:0000:0000:0000:0000:0000:0111/128</code>.
  /// </li>
  /// <li>
  /// To configure AWS WAF to allow, block, or count requests that originated
  /// from IP addresses 1111:0000:0000:0000:0000:0000:0000:0000 to
  /// 1111:0000:0000:0000:ffff:ffff:ffff:ffff, specify
  /// <code>1111:0000:0000:0000:0000:0000:0000:0000/64</code>.
  /// </li>
  /// </ul>
  /// For more information about CIDR notation, see the Wikipedia entry <a
  /// href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Classless
  /// Inter-Domain Routing</a>.
  ///
  /// Parameter [id] :
  /// A unique identifier for the set. This ID is returned in the responses to
  /// create and list commands. You provide it to operations like update and
  /// delete.
  ///
  /// Parameter [lockToken] :
  /// A token used for optimistic locking. AWS WAF returns a token to your get
  /// and list requests, to mark the state of the entity at the time of the
  /// request. To make changes to the entity associated with the token, you
  /// provide the token to operations like update and delete. AWS WAF uses the
  /// token to ensure that no changes have been made to the entity since you
  /// last retrieved it. If a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// get, and use the new token returned by that operation.
  ///
  /// Parameter [name] :
  /// The name of the IP set. You cannot change the name of an
  /// <code>IPSet</code> after you create it.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [description] :
  /// A description of the IP set that helps with identification. You cannot
  /// change the description of an IP set after you create it.
  Future<UpdateIPSetResponse> updateIPSet({
    required List<String> addresses,
    required String id,
    required String lockToken,
    required String name,
    required Scope scope,
    String? description,
  }) async {
    ArgumentError.checkNotNull(addresses, 'addresses');
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(lockToken, 'lockToken');
    _s.validateStringLength(
      'lockToken',
      lockToken,
      1,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(scope, 'scope');
    _s.validateStringLength(
      'description',
      description,
      1,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.UpdateIPSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Addresses': addresses,
        'Id': id,
        'LockToken': lockToken,
        'Name': name,
        'Scope': scope.toValue(),
        if (description != null) 'Description': description,
      },
    );

    return UpdateIPSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Updates the specified <a>RegexPatternSet</a>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFDuplicateItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [id] :
  /// A unique identifier for the set. This ID is returned in the responses to
  /// create and list commands. You provide it to operations like update and
  /// delete.
  ///
  /// Parameter [lockToken] :
  /// A token used for optimistic locking. AWS WAF returns a token to your get
  /// and list requests, to mark the state of the entity at the time of the
  /// request. To make changes to the entity associated with the token, you
  /// provide the token to operations like update and delete. AWS WAF uses the
  /// token to ensure that no changes have been made to the entity since you
  /// last retrieved it. If a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// get, and use the new token returned by that operation.
  ///
  /// Parameter [name] :
  /// The name of the set. You cannot change the name after you create the set.
  ///
  /// Parameter [regularExpressionList] :
  /// <p/>
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [description] :
  /// A description of the set that helps with identification. You cannot change
  /// the description of a set after you create it.
  Future<UpdateRegexPatternSetResponse> updateRegexPatternSet({
    required String id,
    required String lockToken,
    required String name,
    required List<Regex> regularExpressionList,
    required Scope scope,
    String? description,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(lockToken, 'lockToken');
    _s.validateStringLength(
      'lockToken',
      lockToken,
      1,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(regularExpressionList, 'regularExpressionList');
    ArgumentError.checkNotNull(scope, 'scope');
    _s.validateStringLength(
      'description',
      description,
      1,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.UpdateRegexPatternSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        'LockToken': lockToken,
        'Name': name,
        'RegularExpressionList': regularExpressionList,
        'Scope': scope.toValue(),
        if (description != null) 'Description': description,
      },
    );

    return UpdateRegexPatternSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Updates the specified <a>RuleGroup</a>.
  ///
  /// A rule group defines a collection of rules to inspect and control web
  /// requests that you can use in a <a>WebACL</a>. When you create a rule
  /// group, you define an immutable capacity limit. If you update a rule group,
  /// you must stay within the capacity. This allows others to reuse the rule
  /// group with confidence in its capacity requirements.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFDuplicateItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFUnavailableEntityException].
  /// May throw [WAFSubscriptionNotFoundException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [id] :
  /// A unique identifier for the rule group. This ID is returned in the
  /// responses to create and list commands. You provide it to operations like
  /// update and delete.
  ///
  /// Parameter [lockToken] :
  /// A token used for optimistic locking. AWS WAF returns a token to your get
  /// and list requests, to mark the state of the entity at the time of the
  /// request. To make changes to the entity associated with the token, you
  /// provide the token to operations like update and delete. AWS WAF uses the
  /// token to ensure that no changes have been made to the entity since you
  /// last retrieved it. If a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// get, and use the new token returned by that operation.
  ///
  /// Parameter [name] :
  /// The name of the rule group. You cannot change the name of a rule group
  /// after you create it.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [visibilityConfig] :
  /// Defines and enables Amazon CloudWatch metrics and web request sample
  /// collection.
  ///
  /// Parameter [description] :
  /// A description of the rule group that helps with identification. You cannot
  /// change the description of a rule group after you create it.
  ///
  /// Parameter [rules] :
  /// The <a>Rule</a> statements used to identify the web requests that you want
  /// to allow, block, or count. Each rule includes one top-level statement that
  /// AWS WAF uses to identify matching web requests, and parameters that govern
  /// how AWS WAF handles them.
  Future<UpdateRuleGroupResponse> updateRuleGroup({
    required String id,
    required String lockToken,
    required String name,
    required Scope scope,
    required VisibilityConfig visibilityConfig,
    String? description,
    List<Rule>? rules,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(lockToken, 'lockToken');
    _s.validateStringLength(
      'lockToken',
      lockToken,
      1,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(scope, 'scope');
    ArgumentError.checkNotNull(visibilityConfig, 'visibilityConfig');
    _s.validateStringLength(
      'description',
      description,
      1,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.UpdateRuleGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        'LockToken': lockToken,
        'Name': name,
        'Scope': scope.toValue(),
        'VisibilityConfig': visibilityConfig,
        if (description != null) 'Description': description,
        if (rules != null) 'Rules': rules,
      },
    );

    return UpdateRuleGroupResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Updates the specified <a>WebACL</a>.
  ///
  /// A Web ACL defines a collection of rules to use to inspect and control web
  /// requests. Each rule has an action defined (allow, block, or count) for
  /// requests that match the statement of the rule. In the Web ACL, you assign
  /// a default action to take (allow, block) for any request that does not
  /// match any of the rules. The rules in a Web ACL can be a combination of the
  /// types <a>Rule</a>, <a>RuleGroup</a>, and managed rule group. You can
  /// associate a Web ACL with one or more AWS resources to protect. The
  /// resources can be Amazon CloudFront, an Amazon API Gateway REST API, an
  /// Application Load Balancer, or an AWS AppSync GraphQL API.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFDuplicateItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFInvalidResourceException].
  /// May throw [WAFUnavailableEntityException].
  /// May throw [WAFSubscriptionNotFoundException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [defaultAction] :
  /// The action to perform if none of the <code>Rules</code> contained in the
  /// <code>WebACL</code> match.
  ///
  /// Parameter [id] :
  /// The unique identifier for the Web ACL. This ID is returned in the
  /// responses to create and list commands. You provide it to operations like
  /// update and delete.
  ///
  /// Parameter [lockToken] :
  /// A token used for optimistic locking. AWS WAF returns a token to your get
  /// and list requests, to mark the state of the entity at the time of the
  /// request. To make changes to the entity associated with the token, you
  /// provide the token to operations like update and delete. AWS WAF uses the
  /// token to ensure that no changes have been made to the entity since you
  /// last retrieved it. If a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// get, and use the new token returned by that operation.
  ///
  /// Parameter [name] :
  /// The name of the Web ACL. You cannot change the name of a Web ACL after you
  /// create it.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [visibilityConfig] :
  /// Defines and enables Amazon CloudWatch metrics and web request sample
  /// collection.
  ///
  /// Parameter [description] :
  /// A description of the Web ACL that helps with identification. You cannot
  /// change the description of a Web ACL after you create it.
  ///
  /// Parameter [rules] :
  /// The <a>Rule</a> statements used to identify the web requests that you want
  /// to allow, block, or count. Each rule includes one top-level statement that
  /// AWS WAF uses to identify matching web requests, and parameters that govern
  /// how AWS WAF handles them.
  Future<UpdateWebACLResponse> updateWebACL({
    required DefaultAction defaultAction,
    required String id,
    required String lockToken,
    required String name,
    required Scope scope,
    required VisibilityConfig visibilityConfig,
    String? description,
    List<Rule>? rules,
  }) async {
    ArgumentError.checkNotNull(defaultAction, 'defaultAction');
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(lockToken, 'lockToken');
    _s.validateStringLength(
      'lockToken',
      lockToken,
      1,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(scope, 'scope');
    ArgumentError.checkNotNull(visibilityConfig, 'visibilityConfig');
    _s.validateStringLength(
      'description',
      description,
      1,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.UpdateWebACL'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DefaultAction': defaultAction,
        'Id': id,
        'LockToken': lockToken,
        'Name': name,
        'Scope': scope.toValue(),
        'VisibilityConfig': visibilityConfig,
        if (description != null) 'Description': description,
        if (rules != null) 'Rules': rules,
      },
    );

    return UpdateWebACLResponse.fromJson(jsonResponse.body);
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// All query arguments of a web request.
///
/// This is used only to indicate the web request component for AWS WAF to
/// inspect, in the <a>FieldToMatch</a> specification.
class AllQueryArguments {
  AllQueryArguments();
  factory AllQueryArguments.fromJson(Map<String, dynamic> _) {
    return AllQueryArguments();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// Specifies that AWS WAF should allow requests.
///
/// This is used only in the context of other settings, for example to specify
/// values for <a>RuleAction</a> and web ACL <a>DefaultAction</a>.
class AllowAction {
  AllowAction();
  factory AllowAction.fromJson(Map<String, dynamic> _) {
    return AllowAction();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// A logical rule statement used to combine other rule statements with AND
/// logic. You provide more than one <a>Statement</a> within the
/// <code>AndStatement</code>.
class AndStatement {
  /// The statements to combine with AND logic. You can use any statements that
  /// can be nested.
  final List<Statement> statements;

  AndStatement({
    required this.statements,
  });
  factory AndStatement.fromJson(Map<String, dynamic> json) {
    return AndStatement(
      statements: (json['Statements'] as List)
          .whereNotNull()
          .map((e) => Statement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final statements = this.statements;
    return {
      'Statements': statements,
    };
  }
}

class AssociateWebACLResponse {
  AssociateWebACLResponse();
  factory AssociateWebACLResponse.fromJson(Map<String, dynamic> _) {
    return AssociateWebACLResponse();
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// Specifies that AWS WAF should block requests.
///
/// This is used only in the context of other settings, for example to specify
/// values for <a>RuleAction</a> and web ACL <a>DefaultAction</a>.
class BlockAction {
  BlockAction();
  factory BlockAction.fromJson(Map<String, dynamic> _) {
    return BlockAction();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// The body of a web request. This immediately follows the request headers.
///
/// This is used only to indicate the web request component for AWS WAF to
/// inspect, in the <a>FieldToMatch</a> specification.
class Body {
  Body();
  factory Body.fromJson(Map<String, dynamic> _) {
    return Body();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// A rule statement that defines a string match search for AWS WAF to apply to
/// web requests. The byte match statement provides the bytes to search for, the
/// location in requests that you want AWS WAF to search, and other settings.
/// The bytes to search for are typically a string that corresponds with ASCII
/// characters. In the AWS WAF console and the developer guide, this is refered
/// to as a string match statement.
class ByteMatchStatement {
  /// The part of a web request that you want AWS WAF to inspect. For more
  /// information, see <a>FieldToMatch</a>.
  final FieldToMatch fieldToMatch;

  /// The area within the portion of a web request that you want AWS WAF to search
  /// for <code>SearchString</code>. Valid values include the following:
  ///
  /// <b>CONTAINS</b>
  ///
  /// The specified part of the web request must include the value of
  /// <code>SearchString</code>, but the location doesn't matter.
  ///
  /// <b>CONTAINS_WORD</b>
  ///
  /// The specified part of the web request must include the value of
  /// <code>SearchString</code>, and <code>SearchString</code> must contain only
  /// alphanumeric characters or underscore (A-Z, a-z, 0-9, or _). In addition,
  /// <code>SearchString</code> must be a word, which means that both of the
  /// following are true:
  ///
  /// <ul>
  /// <li>
  /// <code>SearchString</code> is at the beginning of the specified part of the
  /// web request or is preceded by a character other than an alphanumeric
  /// character or underscore (_). Examples include the value of a header and
  /// <code>;BadBot</code>.
  /// </li>
  /// <li>
  /// <code>SearchString</code> is at the end of the specified part of the web
  /// request or is followed by a character other than an alphanumeric character
  /// or underscore (_), for example, <code>BadBot;</code> and
  /// <code>-BadBot;</code>.
  /// </li>
  /// </ul>
  /// <b>EXACTLY</b>
  ///
  /// The value of the specified part of the web request must exactly match the
  /// value of <code>SearchString</code>.
  ///
  /// <b>STARTS_WITH</b>
  ///
  /// The value of <code>SearchString</code> must appear at the beginning of the
  /// specified part of the web request.
  ///
  /// <b>ENDS_WITH</b>
  ///
  /// The value of <code>SearchString</code> must appear at the end of the
  /// specified part of the web request.
  final PositionalConstraint positionalConstraint;

  /// A string value that you want AWS WAF to search for. AWS WAF searches only in
  /// the part of web requests that you designate for inspection in
  /// <a>FieldToMatch</a>. The maximum length of the value is 50 bytes.
  ///
  /// Valid values depend on the component that you specify for inspection in
  /// <code>FieldToMatch</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>Method</code>: The HTTP method that you want AWS WAF to search for.
  /// This indicates the type of operation specified in the request.
  /// </li>
  /// <li>
  /// <code>UriPath</code>: The value that you want AWS WAF to search for in the
  /// URI path, for example, <code>/images/daily-ad.jpg</code>.
  /// </li>
  /// </ul>
  /// If <code>SearchString</code> includes alphabetic characters A-Z and a-z,
  /// note that the value is case sensitive.
  ///
  /// <b>If you're using the AWS WAF API</b>
  ///
  /// Specify a base64-encoded version of the value. The maximum length of the
  /// value before you base64-encode it is 50 bytes.
  ///
  /// For example, suppose the value of <code>Type</code> is <code>HEADER</code>
  /// and the value of <code>Data</code> is <code>User-Agent</code>. If you want
  /// to search the <code>User-Agent</code> header for the value
  /// <code>BadBot</code>, you base64-encode <code>BadBot</code> using MIME
  /// base64-encoding and include the resulting value, <code>QmFkQm90</code>, in
  /// the value of <code>SearchString</code>.
  ///
  /// <b>If you're using the AWS CLI or one of the AWS SDKs</b>
  ///
  /// The value that you want AWS WAF to search for. The SDK automatically base64
  /// encodes the value.
  final Uint8List searchString;

  /// Text transformations eliminate some of the unusual formatting that attackers
  /// use in web requests in an effort to bypass detection. If you specify one or
  /// more transformations in a rule statement, AWS WAF performs all
  /// transformations on the content of the request component identified by
  /// <code>FieldToMatch</code>, starting from the lowest priority setting, before
  /// inspecting the content for a match.
  final List<TextTransformation> textTransformations;

  ByteMatchStatement({
    required this.fieldToMatch,
    required this.positionalConstraint,
    required this.searchString,
    required this.textTransformations,
  });
  factory ByteMatchStatement.fromJson(Map<String, dynamic> json) {
    return ByteMatchStatement(
      fieldToMatch:
          FieldToMatch.fromJson(json['FieldToMatch'] as Map<String, dynamic>),
      positionalConstraint:
          (json['PositionalConstraint'] as String).toPositionalConstraint(),
      searchString: _s.decodeUint8List(json['SearchString']! as String),
      textTransformations: (json['TextTransformations'] as List)
          .whereNotNull()
          .map((e) => TextTransformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final fieldToMatch = this.fieldToMatch;
    final positionalConstraint = this.positionalConstraint;
    final searchString = this.searchString;
    final textTransformations = this.textTransformations;
    return {
      'FieldToMatch': fieldToMatch,
      'PositionalConstraint': positionalConstraint.toValue(),
      'SearchString': base64Encode(searchString),
      'TextTransformations': textTransformations,
    };
  }
}

class CheckCapacityResponse {
  /// The capacity required by the rules and scope.
  final int? capacity;

  CheckCapacityResponse({
    this.capacity,
  });
  factory CheckCapacityResponse.fromJson(Map<String, dynamic> json) {
    return CheckCapacityResponse(
      capacity: json['Capacity'] as int?,
    );
  }
}

enum ComparisonOperator {
  eq,
  ne,
  le,
  lt,
  ge,
  gt,
}

extension on ComparisonOperator {
  String toValue() {
    switch (this) {
      case ComparisonOperator.eq:
        return 'EQ';
      case ComparisonOperator.ne:
        return 'NE';
      case ComparisonOperator.le:
        return 'LE';
      case ComparisonOperator.lt:
        return 'LT';
      case ComparisonOperator.ge:
        return 'GE';
      case ComparisonOperator.gt:
        return 'GT';
    }
  }
}

extension on String {
  ComparisonOperator toComparisonOperator() {
    switch (this) {
      case 'EQ':
        return ComparisonOperator.eq;
      case 'NE':
        return ComparisonOperator.ne;
      case 'LE':
        return ComparisonOperator.le;
      case 'LT':
        return ComparisonOperator.lt;
      case 'GE':
        return ComparisonOperator.ge;
      case 'GT':
        return ComparisonOperator.gt;
    }
    throw Exception('$this is not known in enum ComparisonOperator');
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// Specifies that AWS WAF should count requests.
///
/// This is used only in the context of other settings, for example to specify
/// values for <a>RuleAction</a> and web ACL <a>DefaultAction</a>.
class CountAction {
  CountAction();
  factory CountAction.fromJson(Map<String, dynamic> _) {
    return CountAction();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum CountryCode {
  af,
  ax,
  al,
  dz,
  as,
  ad,
  ao,
  ai,
  aq,
  ag,
  ar,
  am,
  aw,
  au,
  at,
  az,
  bs,
  bh,
  bd,
  bb,
  by,
  be,
  bz,
  bj,
  bm,
  bt,
  bo,
  bq,
  ba,
  bw,
  bv,
  br,
  io,
  bn,
  bg,
  bf,
  bi,
  kh,
  cm,
  ca,
  cv,
  ky,
  cf,
  td,
  cl,
  cn,
  cx,
  cc,
  co,
  km,
  cg,
  cd,
  ck,
  cr,
  ci,
  hr,
  cu,
  cw,
  cy,
  cz,
  dk,
  dj,
  dm,
  $do,
  ec,
  eg,
  sv,
  gq,
  er,
  ee,
  et,
  fk,
  fo,
  fj,
  fi,
  fr,
  gf,
  pf,
  tf,
  ga,
  gm,
  ge,
  de,
  gh,
  gi,
  gr,
  gl,
  gd,
  gp,
  gu,
  gt,
  gg,
  gn,
  gw,
  gy,
  ht,
  hm,
  va,
  hn,
  hk,
  hu,
  $is,
  $in,
  id,
  ir,
  iq,
  ie,
  im,
  il,
  it,
  jm,
  jp,
  je,
  jo,
  kz,
  ke,
  ki,
  kp,
  kr,
  kw,
  kg,
  la,
  lv,
  lb,
  ls,
  lr,
  ly,
  li,
  lt,
  lu,
  mo,
  mk,
  mg,
  mw,
  my,
  mv,
  ml,
  mt,
  mh,
  mq,
  mr,
  mu,
  yt,
  mx,
  fm,
  md,
  mc,
  mn,
  me,
  ms,
  ma,
  mz,
  mm,
  na,
  nr,
  np,
  nl,
  nc,
  nz,
  ni,
  ne,
  ng,
  nu,
  nf,
  mp,
  no,
  om,
  pk,
  pw,
  ps,
  pa,
  pg,
  py,
  pe,
  ph,
  pn,
  pl,
  pt,
  pr,
  qa,
  re,
  ro,
  ru,
  rw,
  bl,
  sh,
  kn,
  lc,
  mf,
  pm,
  vc,
  ws,
  sm,
  st,
  sa,
  sn,
  rs,
  sc,
  sl,
  sg,
  sx,
  sk,
  si,
  sb,
  so,
  za,
  gs,
  ss,
  es,
  lk,
  sd,
  sr,
  sj,
  sz,
  se,
  ch,
  sy,
  tw,
  tj,
  tz,
  th,
  tl,
  tg,
  tk,
  to,
  tt,
  tn,
  tr,
  tm,
  tc,
  tv,
  ug,
  ua,
  ae,
  gb,
  us,
  um,
  uy,
  uz,
  vu,
  ve,
  vn,
  vg,
  vi,
  wf,
  eh,
  ye,
  zm,
  zw,
}

extension on CountryCode {
  String toValue() {
    switch (this) {
      case CountryCode.af:
        return 'AF';
      case CountryCode.ax:
        return 'AX';
      case CountryCode.al:
        return 'AL';
      case CountryCode.dz:
        return 'DZ';
      case CountryCode.as:
        return 'AS';
      case CountryCode.ad:
        return 'AD';
      case CountryCode.ao:
        return 'AO';
      case CountryCode.ai:
        return 'AI';
      case CountryCode.aq:
        return 'AQ';
      case CountryCode.ag:
        return 'AG';
      case CountryCode.ar:
        return 'AR';
      case CountryCode.am:
        return 'AM';
      case CountryCode.aw:
        return 'AW';
      case CountryCode.au:
        return 'AU';
      case CountryCode.at:
        return 'AT';
      case CountryCode.az:
        return 'AZ';
      case CountryCode.bs:
        return 'BS';
      case CountryCode.bh:
        return 'BH';
      case CountryCode.bd:
        return 'BD';
      case CountryCode.bb:
        return 'BB';
      case CountryCode.by:
        return 'BY';
      case CountryCode.be:
        return 'BE';
      case CountryCode.bz:
        return 'BZ';
      case CountryCode.bj:
        return 'BJ';
      case CountryCode.bm:
        return 'BM';
      case CountryCode.bt:
        return 'BT';
      case CountryCode.bo:
        return 'BO';
      case CountryCode.bq:
        return 'BQ';
      case CountryCode.ba:
        return 'BA';
      case CountryCode.bw:
        return 'BW';
      case CountryCode.bv:
        return 'BV';
      case CountryCode.br:
        return 'BR';
      case CountryCode.io:
        return 'IO';
      case CountryCode.bn:
        return 'BN';
      case CountryCode.bg:
        return 'BG';
      case CountryCode.bf:
        return 'BF';
      case CountryCode.bi:
        return 'BI';
      case CountryCode.kh:
        return 'KH';
      case CountryCode.cm:
        return 'CM';
      case CountryCode.ca:
        return 'CA';
      case CountryCode.cv:
        return 'CV';
      case CountryCode.ky:
        return 'KY';
      case CountryCode.cf:
        return 'CF';
      case CountryCode.td:
        return 'TD';
      case CountryCode.cl:
        return 'CL';
      case CountryCode.cn:
        return 'CN';
      case CountryCode.cx:
        return 'CX';
      case CountryCode.cc:
        return 'CC';
      case CountryCode.co:
        return 'CO';
      case CountryCode.km:
        return 'KM';
      case CountryCode.cg:
        return 'CG';
      case CountryCode.cd:
        return 'CD';
      case CountryCode.ck:
        return 'CK';
      case CountryCode.cr:
        return 'CR';
      case CountryCode.ci:
        return 'CI';
      case CountryCode.hr:
        return 'HR';
      case CountryCode.cu:
        return 'CU';
      case CountryCode.cw:
        return 'CW';
      case CountryCode.cy:
        return 'CY';
      case CountryCode.cz:
        return 'CZ';
      case CountryCode.dk:
        return 'DK';
      case CountryCode.dj:
        return 'DJ';
      case CountryCode.dm:
        return 'DM';
      case CountryCode.$do:
        return 'DO';
      case CountryCode.ec:
        return 'EC';
      case CountryCode.eg:
        return 'EG';
      case CountryCode.sv:
        return 'SV';
      case CountryCode.gq:
        return 'GQ';
      case CountryCode.er:
        return 'ER';
      case CountryCode.ee:
        return 'EE';
      case CountryCode.et:
        return 'ET';
      case CountryCode.fk:
        return 'FK';
      case CountryCode.fo:
        return 'FO';
      case CountryCode.fj:
        return 'FJ';
      case CountryCode.fi:
        return 'FI';
      case CountryCode.fr:
        return 'FR';
      case CountryCode.gf:
        return 'GF';
      case CountryCode.pf:
        return 'PF';
      case CountryCode.tf:
        return 'TF';
      case CountryCode.ga:
        return 'GA';
      case CountryCode.gm:
        return 'GM';
      case CountryCode.ge:
        return 'GE';
      case CountryCode.de:
        return 'DE';
      case CountryCode.gh:
        return 'GH';
      case CountryCode.gi:
        return 'GI';
      case CountryCode.gr:
        return 'GR';
      case CountryCode.gl:
        return 'GL';
      case CountryCode.gd:
        return 'GD';
      case CountryCode.gp:
        return 'GP';
      case CountryCode.gu:
        return 'GU';
      case CountryCode.gt:
        return 'GT';
      case CountryCode.gg:
        return 'GG';
      case CountryCode.gn:
        return 'GN';
      case CountryCode.gw:
        return 'GW';
      case CountryCode.gy:
        return 'GY';
      case CountryCode.ht:
        return 'HT';
      case CountryCode.hm:
        return 'HM';
      case CountryCode.va:
        return 'VA';
      case CountryCode.hn:
        return 'HN';
      case CountryCode.hk:
        return 'HK';
      case CountryCode.hu:
        return 'HU';
      case CountryCode.$is:
        return 'IS';
      case CountryCode.$in:
        return 'IN';
      case CountryCode.id:
        return 'ID';
      case CountryCode.ir:
        return 'IR';
      case CountryCode.iq:
        return 'IQ';
      case CountryCode.ie:
        return 'IE';
      case CountryCode.im:
        return 'IM';
      case CountryCode.il:
        return 'IL';
      case CountryCode.it:
        return 'IT';
      case CountryCode.jm:
        return 'JM';
      case CountryCode.jp:
        return 'JP';
      case CountryCode.je:
        return 'JE';
      case CountryCode.jo:
        return 'JO';
      case CountryCode.kz:
        return 'KZ';
      case CountryCode.ke:
        return 'KE';
      case CountryCode.ki:
        return 'KI';
      case CountryCode.kp:
        return 'KP';
      case CountryCode.kr:
        return 'KR';
      case CountryCode.kw:
        return 'KW';
      case CountryCode.kg:
        return 'KG';
      case CountryCode.la:
        return 'LA';
      case CountryCode.lv:
        return 'LV';
      case CountryCode.lb:
        return 'LB';
      case CountryCode.ls:
        return 'LS';
      case CountryCode.lr:
        return 'LR';
      case CountryCode.ly:
        return 'LY';
      case CountryCode.li:
        return 'LI';
      case CountryCode.lt:
        return 'LT';
      case CountryCode.lu:
        return 'LU';
      case CountryCode.mo:
        return 'MO';
      case CountryCode.mk:
        return 'MK';
      case CountryCode.mg:
        return 'MG';
      case CountryCode.mw:
        return 'MW';
      case CountryCode.my:
        return 'MY';
      case CountryCode.mv:
        return 'MV';
      case CountryCode.ml:
        return 'ML';
      case CountryCode.mt:
        return 'MT';
      case CountryCode.mh:
        return 'MH';
      case CountryCode.mq:
        return 'MQ';
      case CountryCode.mr:
        return 'MR';
      case CountryCode.mu:
        return 'MU';
      case CountryCode.yt:
        return 'YT';
      case CountryCode.mx:
        return 'MX';
      case CountryCode.fm:
        return 'FM';
      case CountryCode.md:
        return 'MD';
      case CountryCode.mc:
        return 'MC';
      case CountryCode.mn:
        return 'MN';
      case CountryCode.me:
        return 'ME';
      case CountryCode.ms:
        return 'MS';
      case CountryCode.ma:
        return 'MA';
      case CountryCode.mz:
        return 'MZ';
      case CountryCode.mm:
        return 'MM';
      case CountryCode.na:
        return 'NA';
      case CountryCode.nr:
        return 'NR';
      case CountryCode.np:
        return 'NP';
      case CountryCode.nl:
        return 'NL';
      case CountryCode.nc:
        return 'NC';
      case CountryCode.nz:
        return 'NZ';
      case CountryCode.ni:
        return 'NI';
      case CountryCode.ne:
        return 'NE';
      case CountryCode.ng:
        return 'NG';
      case CountryCode.nu:
        return 'NU';
      case CountryCode.nf:
        return 'NF';
      case CountryCode.mp:
        return 'MP';
      case CountryCode.no:
        return 'NO';
      case CountryCode.om:
        return 'OM';
      case CountryCode.pk:
        return 'PK';
      case CountryCode.pw:
        return 'PW';
      case CountryCode.ps:
        return 'PS';
      case CountryCode.pa:
        return 'PA';
      case CountryCode.pg:
        return 'PG';
      case CountryCode.py:
        return 'PY';
      case CountryCode.pe:
        return 'PE';
      case CountryCode.ph:
        return 'PH';
      case CountryCode.pn:
        return 'PN';
      case CountryCode.pl:
        return 'PL';
      case CountryCode.pt:
        return 'PT';
      case CountryCode.pr:
        return 'PR';
      case CountryCode.qa:
        return 'QA';
      case CountryCode.re:
        return 'RE';
      case CountryCode.ro:
        return 'RO';
      case CountryCode.ru:
        return 'RU';
      case CountryCode.rw:
        return 'RW';
      case CountryCode.bl:
        return 'BL';
      case CountryCode.sh:
        return 'SH';
      case CountryCode.kn:
        return 'KN';
      case CountryCode.lc:
        return 'LC';
      case CountryCode.mf:
        return 'MF';
      case CountryCode.pm:
        return 'PM';
      case CountryCode.vc:
        return 'VC';
      case CountryCode.ws:
        return 'WS';
      case CountryCode.sm:
        return 'SM';
      case CountryCode.st:
        return 'ST';
      case CountryCode.sa:
        return 'SA';
      case CountryCode.sn:
        return 'SN';
      case CountryCode.rs:
        return 'RS';
      case CountryCode.sc:
        return 'SC';
      case CountryCode.sl:
        return 'SL';
      case CountryCode.sg:
        return 'SG';
      case CountryCode.sx:
        return 'SX';
      case CountryCode.sk:
        return 'SK';
      case CountryCode.si:
        return 'SI';
      case CountryCode.sb:
        return 'SB';
      case CountryCode.so:
        return 'SO';
      case CountryCode.za:
        return 'ZA';
      case CountryCode.gs:
        return 'GS';
      case CountryCode.ss:
        return 'SS';
      case CountryCode.es:
        return 'ES';
      case CountryCode.lk:
        return 'LK';
      case CountryCode.sd:
        return 'SD';
      case CountryCode.sr:
        return 'SR';
      case CountryCode.sj:
        return 'SJ';
      case CountryCode.sz:
        return 'SZ';
      case CountryCode.se:
        return 'SE';
      case CountryCode.ch:
        return 'CH';
      case CountryCode.sy:
        return 'SY';
      case CountryCode.tw:
        return 'TW';
      case CountryCode.tj:
        return 'TJ';
      case CountryCode.tz:
        return 'TZ';
      case CountryCode.th:
        return 'TH';
      case CountryCode.tl:
        return 'TL';
      case CountryCode.tg:
        return 'TG';
      case CountryCode.tk:
        return 'TK';
      case CountryCode.to:
        return 'TO';
      case CountryCode.tt:
        return 'TT';
      case CountryCode.tn:
        return 'TN';
      case CountryCode.tr:
        return 'TR';
      case CountryCode.tm:
        return 'TM';
      case CountryCode.tc:
        return 'TC';
      case CountryCode.tv:
        return 'TV';
      case CountryCode.ug:
        return 'UG';
      case CountryCode.ua:
        return 'UA';
      case CountryCode.ae:
        return 'AE';
      case CountryCode.gb:
        return 'GB';
      case CountryCode.us:
        return 'US';
      case CountryCode.um:
        return 'UM';
      case CountryCode.uy:
        return 'UY';
      case CountryCode.uz:
        return 'UZ';
      case CountryCode.vu:
        return 'VU';
      case CountryCode.ve:
        return 'VE';
      case CountryCode.vn:
        return 'VN';
      case CountryCode.vg:
        return 'VG';
      case CountryCode.vi:
        return 'VI';
      case CountryCode.wf:
        return 'WF';
      case CountryCode.eh:
        return 'EH';
      case CountryCode.ye:
        return 'YE';
      case CountryCode.zm:
        return 'ZM';
      case CountryCode.zw:
        return 'ZW';
    }
  }
}

extension on String {
  CountryCode toCountryCode() {
    switch (this) {
      case 'AF':
        return CountryCode.af;
      case 'AX':
        return CountryCode.ax;
      case 'AL':
        return CountryCode.al;
      case 'DZ':
        return CountryCode.dz;
      case 'AS':
        return CountryCode.as;
      case 'AD':
        return CountryCode.ad;
      case 'AO':
        return CountryCode.ao;
      case 'AI':
        return CountryCode.ai;
      case 'AQ':
        return CountryCode.aq;
      case 'AG':
        return CountryCode.ag;
      case 'AR':
        return CountryCode.ar;
      case 'AM':
        return CountryCode.am;
      case 'AW':
        return CountryCode.aw;
      case 'AU':
        return CountryCode.au;
      case 'AT':
        return CountryCode.at;
      case 'AZ':
        return CountryCode.az;
      case 'BS':
        return CountryCode.bs;
      case 'BH':
        return CountryCode.bh;
      case 'BD':
        return CountryCode.bd;
      case 'BB':
        return CountryCode.bb;
      case 'BY':
        return CountryCode.by;
      case 'BE':
        return CountryCode.be;
      case 'BZ':
        return CountryCode.bz;
      case 'BJ':
        return CountryCode.bj;
      case 'BM':
        return CountryCode.bm;
      case 'BT':
        return CountryCode.bt;
      case 'BO':
        return CountryCode.bo;
      case 'BQ':
        return CountryCode.bq;
      case 'BA':
        return CountryCode.ba;
      case 'BW':
        return CountryCode.bw;
      case 'BV':
        return CountryCode.bv;
      case 'BR':
        return CountryCode.br;
      case 'IO':
        return CountryCode.io;
      case 'BN':
        return CountryCode.bn;
      case 'BG':
        return CountryCode.bg;
      case 'BF':
        return CountryCode.bf;
      case 'BI':
        return CountryCode.bi;
      case 'KH':
        return CountryCode.kh;
      case 'CM':
        return CountryCode.cm;
      case 'CA':
        return CountryCode.ca;
      case 'CV':
        return CountryCode.cv;
      case 'KY':
        return CountryCode.ky;
      case 'CF':
        return CountryCode.cf;
      case 'TD':
        return CountryCode.td;
      case 'CL':
        return CountryCode.cl;
      case 'CN':
        return CountryCode.cn;
      case 'CX':
        return CountryCode.cx;
      case 'CC':
        return CountryCode.cc;
      case 'CO':
        return CountryCode.co;
      case 'KM':
        return CountryCode.km;
      case 'CG':
        return CountryCode.cg;
      case 'CD':
        return CountryCode.cd;
      case 'CK':
        return CountryCode.ck;
      case 'CR':
        return CountryCode.cr;
      case 'CI':
        return CountryCode.ci;
      case 'HR':
        return CountryCode.hr;
      case 'CU':
        return CountryCode.cu;
      case 'CW':
        return CountryCode.cw;
      case 'CY':
        return CountryCode.cy;
      case 'CZ':
        return CountryCode.cz;
      case 'DK':
        return CountryCode.dk;
      case 'DJ':
        return CountryCode.dj;
      case 'DM':
        return CountryCode.dm;
      case 'DO':
        return CountryCode.$do;
      case 'EC':
        return CountryCode.ec;
      case 'EG':
        return CountryCode.eg;
      case 'SV':
        return CountryCode.sv;
      case 'GQ':
        return CountryCode.gq;
      case 'ER':
        return CountryCode.er;
      case 'EE':
        return CountryCode.ee;
      case 'ET':
        return CountryCode.et;
      case 'FK':
        return CountryCode.fk;
      case 'FO':
        return CountryCode.fo;
      case 'FJ':
        return CountryCode.fj;
      case 'FI':
        return CountryCode.fi;
      case 'FR':
        return CountryCode.fr;
      case 'GF':
        return CountryCode.gf;
      case 'PF':
        return CountryCode.pf;
      case 'TF':
        return CountryCode.tf;
      case 'GA':
        return CountryCode.ga;
      case 'GM':
        return CountryCode.gm;
      case 'GE':
        return CountryCode.ge;
      case 'DE':
        return CountryCode.de;
      case 'GH':
        return CountryCode.gh;
      case 'GI':
        return CountryCode.gi;
      case 'GR':
        return CountryCode.gr;
      case 'GL':
        return CountryCode.gl;
      case 'GD':
        return CountryCode.gd;
      case 'GP':
        return CountryCode.gp;
      case 'GU':
        return CountryCode.gu;
      case 'GT':
        return CountryCode.gt;
      case 'GG':
        return CountryCode.gg;
      case 'GN':
        return CountryCode.gn;
      case 'GW':
        return CountryCode.gw;
      case 'GY':
        return CountryCode.gy;
      case 'HT':
        return CountryCode.ht;
      case 'HM':
        return CountryCode.hm;
      case 'VA':
        return CountryCode.va;
      case 'HN':
        return CountryCode.hn;
      case 'HK':
        return CountryCode.hk;
      case 'HU':
        return CountryCode.hu;
      case 'IS':
        return CountryCode.$is;
      case 'IN':
        return CountryCode.$in;
      case 'ID':
        return CountryCode.id;
      case 'IR':
        return CountryCode.ir;
      case 'IQ':
        return CountryCode.iq;
      case 'IE':
        return CountryCode.ie;
      case 'IM':
        return CountryCode.im;
      case 'IL':
        return CountryCode.il;
      case 'IT':
        return CountryCode.it;
      case 'JM':
        return CountryCode.jm;
      case 'JP':
        return CountryCode.jp;
      case 'JE':
        return CountryCode.je;
      case 'JO':
        return CountryCode.jo;
      case 'KZ':
        return CountryCode.kz;
      case 'KE':
        return CountryCode.ke;
      case 'KI':
        return CountryCode.ki;
      case 'KP':
        return CountryCode.kp;
      case 'KR':
        return CountryCode.kr;
      case 'KW':
        return CountryCode.kw;
      case 'KG':
        return CountryCode.kg;
      case 'LA':
        return CountryCode.la;
      case 'LV':
        return CountryCode.lv;
      case 'LB':
        return CountryCode.lb;
      case 'LS':
        return CountryCode.ls;
      case 'LR':
        return CountryCode.lr;
      case 'LY':
        return CountryCode.ly;
      case 'LI':
        return CountryCode.li;
      case 'LT':
        return CountryCode.lt;
      case 'LU':
        return CountryCode.lu;
      case 'MO':
        return CountryCode.mo;
      case 'MK':
        return CountryCode.mk;
      case 'MG':
        return CountryCode.mg;
      case 'MW':
        return CountryCode.mw;
      case 'MY':
        return CountryCode.my;
      case 'MV':
        return CountryCode.mv;
      case 'ML':
        return CountryCode.ml;
      case 'MT':
        return CountryCode.mt;
      case 'MH':
        return CountryCode.mh;
      case 'MQ':
        return CountryCode.mq;
      case 'MR':
        return CountryCode.mr;
      case 'MU':
        return CountryCode.mu;
      case 'YT':
        return CountryCode.yt;
      case 'MX':
        return CountryCode.mx;
      case 'FM':
        return CountryCode.fm;
      case 'MD':
        return CountryCode.md;
      case 'MC':
        return CountryCode.mc;
      case 'MN':
        return CountryCode.mn;
      case 'ME':
        return CountryCode.me;
      case 'MS':
        return CountryCode.ms;
      case 'MA':
        return CountryCode.ma;
      case 'MZ':
        return CountryCode.mz;
      case 'MM':
        return CountryCode.mm;
      case 'NA':
        return CountryCode.na;
      case 'NR':
        return CountryCode.nr;
      case 'NP':
        return CountryCode.np;
      case 'NL':
        return CountryCode.nl;
      case 'NC':
        return CountryCode.nc;
      case 'NZ':
        return CountryCode.nz;
      case 'NI':
        return CountryCode.ni;
      case 'NE':
        return CountryCode.ne;
      case 'NG':
        return CountryCode.ng;
      case 'NU':
        return CountryCode.nu;
      case 'NF':
        return CountryCode.nf;
      case 'MP':
        return CountryCode.mp;
      case 'NO':
        return CountryCode.no;
      case 'OM':
        return CountryCode.om;
      case 'PK':
        return CountryCode.pk;
      case 'PW':
        return CountryCode.pw;
      case 'PS':
        return CountryCode.ps;
      case 'PA':
        return CountryCode.pa;
      case 'PG':
        return CountryCode.pg;
      case 'PY':
        return CountryCode.py;
      case 'PE':
        return CountryCode.pe;
      case 'PH':
        return CountryCode.ph;
      case 'PN':
        return CountryCode.pn;
      case 'PL':
        return CountryCode.pl;
      case 'PT':
        return CountryCode.pt;
      case 'PR':
        return CountryCode.pr;
      case 'QA':
        return CountryCode.qa;
      case 'RE':
        return CountryCode.re;
      case 'RO':
        return CountryCode.ro;
      case 'RU':
        return CountryCode.ru;
      case 'RW':
        return CountryCode.rw;
      case 'BL':
        return CountryCode.bl;
      case 'SH':
        return CountryCode.sh;
      case 'KN':
        return CountryCode.kn;
      case 'LC':
        return CountryCode.lc;
      case 'MF':
        return CountryCode.mf;
      case 'PM':
        return CountryCode.pm;
      case 'VC':
        return CountryCode.vc;
      case 'WS':
        return CountryCode.ws;
      case 'SM':
        return CountryCode.sm;
      case 'ST':
        return CountryCode.st;
      case 'SA':
        return CountryCode.sa;
      case 'SN':
        return CountryCode.sn;
      case 'RS':
        return CountryCode.rs;
      case 'SC':
        return CountryCode.sc;
      case 'SL':
        return CountryCode.sl;
      case 'SG':
        return CountryCode.sg;
      case 'SX':
        return CountryCode.sx;
      case 'SK':
        return CountryCode.sk;
      case 'SI':
        return CountryCode.si;
      case 'SB':
        return CountryCode.sb;
      case 'SO':
        return CountryCode.so;
      case 'ZA':
        return CountryCode.za;
      case 'GS':
        return CountryCode.gs;
      case 'SS':
        return CountryCode.ss;
      case 'ES':
        return CountryCode.es;
      case 'LK':
        return CountryCode.lk;
      case 'SD':
        return CountryCode.sd;
      case 'SR':
        return CountryCode.sr;
      case 'SJ':
        return CountryCode.sj;
      case 'SZ':
        return CountryCode.sz;
      case 'SE':
        return CountryCode.se;
      case 'CH':
        return CountryCode.ch;
      case 'SY':
        return CountryCode.sy;
      case 'TW':
        return CountryCode.tw;
      case 'TJ':
        return CountryCode.tj;
      case 'TZ':
        return CountryCode.tz;
      case 'TH':
        return CountryCode.th;
      case 'TL':
        return CountryCode.tl;
      case 'TG':
        return CountryCode.tg;
      case 'TK':
        return CountryCode.tk;
      case 'TO':
        return CountryCode.to;
      case 'TT':
        return CountryCode.tt;
      case 'TN':
        return CountryCode.tn;
      case 'TR':
        return CountryCode.tr;
      case 'TM':
        return CountryCode.tm;
      case 'TC':
        return CountryCode.tc;
      case 'TV':
        return CountryCode.tv;
      case 'UG':
        return CountryCode.ug;
      case 'UA':
        return CountryCode.ua;
      case 'AE':
        return CountryCode.ae;
      case 'GB':
        return CountryCode.gb;
      case 'US':
        return CountryCode.us;
      case 'UM':
        return CountryCode.um;
      case 'UY':
        return CountryCode.uy;
      case 'UZ':
        return CountryCode.uz;
      case 'VU':
        return CountryCode.vu;
      case 'VE':
        return CountryCode.ve;
      case 'VN':
        return CountryCode.vn;
      case 'VG':
        return CountryCode.vg;
      case 'VI':
        return CountryCode.vi;
      case 'WF':
        return CountryCode.wf;
      case 'EH':
        return CountryCode.eh;
      case 'YE':
        return CountryCode.ye;
      case 'ZM':
        return CountryCode.zm;
      case 'ZW':
        return CountryCode.zw;
    }
    throw Exception('$this is not known in enum CountryCode');
  }
}

class CreateIPSetResponse {
  /// High-level information about an <a>IPSet</a>, returned by operations like
  /// create and list. This provides information like the ID, that you can use to
  /// retrieve and manage an <code>IPSet</code>, and the ARN, that you provide to
  /// the <a>IPSetReferenceStatement</a> to use the address set in a <a>Rule</a>.
  final IPSetSummary? summary;

  CreateIPSetResponse({
    this.summary,
  });
  factory CreateIPSetResponse.fromJson(Map<String, dynamic> json) {
    return CreateIPSetResponse(
      summary: json['Summary'] != null
          ? IPSetSummary.fromJson(json['Summary'] as Map<String, dynamic>)
          : null,
    );
  }
}

class CreateRegexPatternSetResponse {
  /// High-level information about a <a>RegexPatternSet</a>, returned by
  /// operations like create and list. This provides information like the ID, that
  /// you can use to retrieve and manage a <code>RegexPatternSet</code>, and the
  /// ARN, that you provide to the <a>RegexPatternSetReferenceStatement</a> to use
  /// the pattern set in a <a>Rule</a>.
  final RegexPatternSetSummary? summary;

  CreateRegexPatternSetResponse({
    this.summary,
  });
  factory CreateRegexPatternSetResponse.fromJson(Map<String, dynamic> json) {
    return CreateRegexPatternSetResponse(
      summary: json['Summary'] != null
          ? RegexPatternSetSummary.fromJson(
              json['Summary'] as Map<String, dynamic>)
          : null,
    );
  }
}

class CreateRuleGroupResponse {
  /// High-level information about a <a>RuleGroup</a>, returned by operations like
  /// create and list. This provides information like the ID, that you can use to
  /// retrieve and manage a <code>RuleGroup</code>, and the ARN, that you provide
  /// to the <a>RuleGroupReferenceStatement</a> to use the rule group in a
  /// <a>Rule</a>.
  final RuleGroupSummary? summary;

  CreateRuleGroupResponse({
    this.summary,
  });
  factory CreateRuleGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateRuleGroupResponse(
      summary: json['Summary'] != null
          ? RuleGroupSummary.fromJson(json['Summary'] as Map<String, dynamic>)
          : null,
    );
  }
}

class CreateWebACLResponse {
  /// High-level information about a <a>WebACL</a>, returned by operations like
  /// create and list. This provides information like the ID, that you can use to
  /// retrieve and manage a <code>WebACL</code>, and the ARN, that you provide to
  /// operations like <a>AssociateWebACL</a>.
  final WebACLSummary? summary;

  CreateWebACLResponse({
    this.summary,
  });
  factory CreateWebACLResponse.fromJson(Map<String, dynamic> json) {
    return CreateWebACLResponse(
      summary: json['Summary'] != null
          ? WebACLSummary.fromJson(json['Summary'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// In a <a>WebACL</a>, this is the action that you want AWS WAF to perform when
/// a web request doesn't match any of the rules in the <code>WebACL</code>. The
/// default action must be a terminating action, so count is not allowed.
class DefaultAction {
  /// Specifies that AWS WAF should allow requests by default.
  final AllowAction? allow;

  /// Specifies that AWS WAF should block requests by default.
  final BlockAction? block;

  DefaultAction({
    this.allow,
    this.block,
  });
  factory DefaultAction.fromJson(Map<String, dynamic> json) {
    return DefaultAction(
      allow: json['Allow'] != null
          ? AllowAction.fromJson(json['Allow'] as Map<String, dynamic>)
          : null,
      block: json['Block'] != null
          ? BlockAction.fromJson(json['Block'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final allow = this.allow;
    final block = this.block;
    return {
      if (allow != null) 'Allow': allow,
      if (block != null) 'Block': block,
    };
  }
}

class DeleteFirewallManagerRuleGroupsResponse {
  /// A token used for optimistic locking. AWS WAF returns a token to your get and
  /// list requests, to mark the state of the entity at the time of the request.
  /// To make changes to the entity associated with the token, you provide the
  /// token to operations like update and delete. AWS WAF uses the token to ensure
  /// that no changes have been made to the entity since you last retrieved it. If
  /// a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// get, and use the new token returned by that operation.
  final String? nextWebACLLockToken;

  DeleteFirewallManagerRuleGroupsResponse({
    this.nextWebACLLockToken,
  });
  factory DeleteFirewallManagerRuleGroupsResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteFirewallManagerRuleGroupsResponse(
      nextWebACLLockToken: json['NextWebACLLockToken'] as String?,
    );
  }
}

class DeleteIPSetResponse {
  DeleteIPSetResponse();
  factory DeleteIPSetResponse.fromJson(Map<String, dynamic> _) {
    return DeleteIPSetResponse();
  }
}

class DeleteLoggingConfigurationResponse {
  DeleteLoggingConfigurationResponse();
  factory DeleteLoggingConfigurationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteLoggingConfigurationResponse();
  }
}

class DeletePermissionPolicyResponse {
  DeletePermissionPolicyResponse();
  factory DeletePermissionPolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeletePermissionPolicyResponse();
  }
}

class DeleteRegexPatternSetResponse {
  DeleteRegexPatternSetResponse();
  factory DeleteRegexPatternSetResponse.fromJson(Map<String, dynamic> _) {
    return DeleteRegexPatternSetResponse();
  }
}

class DeleteRuleGroupResponse {
  DeleteRuleGroupResponse();
  factory DeleteRuleGroupResponse.fromJson(Map<String, dynamic> _) {
    return DeleteRuleGroupResponse();
  }
}

class DeleteWebACLResponse {
  DeleteWebACLResponse();
  factory DeleteWebACLResponse.fromJson(Map<String, dynamic> _) {
    return DeleteWebACLResponse();
  }
}

class DescribeManagedRuleGroupResponse {
  /// The web ACL capacity units (WCUs) required for this rule group. AWS WAF uses
  /// web ACL capacity units (WCU) to calculate and control the operating
  /// resources that are used to run your rules, rule groups, and web ACLs. AWS
  /// WAF calculates capacity differently for each rule type, to reflect each
  /// rule's relative cost. Rule group capacity is fixed at creation, so users can
  /// plan their web ACL WCU usage when they use a rule group. The WCU limit for
  /// web ACLs is 1,500.
  final int? capacity;

  /// <p/>
  final List<RuleSummary>? rules;

  DescribeManagedRuleGroupResponse({
    this.capacity,
    this.rules,
  });
  factory DescribeManagedRuleGroupResponse.fromJson(Map<String, dynamic> json) {
    return DescribeManagedRuleGroupResponse(
      capacity: json['Capacity'] as int?,
      rules: (json['Rules'] as List?)
          ?.whereNotNull()
          .map((e) => RuleSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class DisassociateWebACLResponse {
  DisassociateWebACLResponse();
  factory DisassociateWebACLResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateWebACLResponse();
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// Specifies a single rule to exclude from the rule group. Excluding a rule
/// overrides its action setting for the rule group in the web ACL, setting it
/// to <code>COUNT</code>. This effectively excludes the rule from acting on web
/// requests.
class ExcludedRule {
  /// The name of the rule to exclude.
  final String name;

  ExcludedRule({
    required this.name,
  });
  factory ExcludedRule.fromJson(Map<String, dynamic> json) {
    return ExcludedRule(
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'Name': name,
    };
  }
}

enum FallbackBehavior {
  match,
  noMatch,
}

extension on FallbackBehavior {
  String toValue() {
    switch (this) {
      case FallbackBehavior.match:
        return 'MATCH';
      case FallbackBehavior.noMatch:
        return 'NO_MATCH';
    }
  }
}

extension on String {
  FallbackBehavior toFallbackBehavior() {
    switch (this) {
      case 'MATCH':
        return FallbackBehavior.match;
      case 'NO_MATCH':
        return FallbackBehavior.noMatch;
    }
    throw Exception('$this is not known in enum FallbackBehavior');
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// The part of a web request that you want AWS WAF to inspect. Include the
/// single <code>FieldToMatch</code> type that you want to inspect, with
/// additional specifications as needed, according to the type. You specify a
/// single request component in <code>FieldToMatch</code> for each rule
/// statement that requires it. To inspect more than one component of a web
/// request, create a separate rule statement for each component.
class FieldToMatch {
  /// Inspect all query arguments.
  final AllQueryArguments? allQueryArguments;

  /// Inspect the request body, which immediately follows the request headers.
  /// This is the part of a request that contains any additional data that you
  /// want to send to your web server as the HTTP request body, such as data from
  /// a form.
  ///
  /// Note that only the first 8 KB (8192 bytes) of the request body are forwarded
  /// to AWS WAF for inspection by the underlying host service. If you don't need
  /// to inspect more than 8 KB, you can guarantee that you don't allow additional
  /// bytes in by combining a statement that inspects the body of the web request,
  /// such as <a>ByteMatchStatement</a> or
  /// <a>RegexPatternSetReferenceStatement</a>, with a
  /// <a>SizeConstraintStatement</a> that enforces an 8 KB size limit on the body
  /// of the request. AWS WAF doesn't support inspecting the entire contents of
  /// web requests whose bodies exceed the 8 KB limit.
  final Body? body;

  /// Inspect the HTTP method. The method indicates the type of operation that the
  /// request is asking the origin to perform.
  final Method? method;

  /// Inspect the query string. This is the part of a URL that appears after a
  /// <code>?</code> character, if any.
  final QueryString? queryString;

  /// Inspect a single header. Provide the name of the header to inspect, for
  /// example, <code>User-Agent</code> or <code>Referer</code>. This setting isn't
  /// case sensitive.
  final SingleHeader? singleHeader;

  /// Inspect a single query argument. Provide the name of the query argument to
  /// inspect, such as <i>UserName</i> or <i>SalesRegion</i>. The name can be up
  /// to 30 characters long and isn't case sensitive.
  ///
  /// This is used only to indicate the web request component for AWS WAF to
  /// inspect, in the <a>FieldToMatch</a> specification.
  final SingleQueryArgument? singleQueryArgument;

  /// Inspect the request URI path. This is the part of a web request that
  /// identifies a resource, for example, <code>/images/daily-ad.jpg</code>.
  final UriPath? uriPath;

  FieldToMatch({
    this.allQueryArguments,
    this.body,
    this.method,
    this.queryString,
    this.singleHeader,
    this.singleQueryArgument,
    this.uriPath,
  });
  factory FieldToMatch.fromJson(Map<String, dynamic> json) {
    return FieldToMatch(
      allQueryArguments: json['AllQueryArguments'] != null
          ? AllQueryArguments.fromJson(
              json['AllQueryArguments'] as Map<String, dynamic>)
          : null,
      body: json['Body'] != null
          ? Body.fromJson(json['Body'] as Map<String, dynamic>)
          : null,
      method: json['Method'] != null
          ? Method.fromJson(json['Method'] as Map<String, dynamic>)
          : null,
      queryString: json['QueryString'] != null
          ? QueryString.fromJson(json['QueryString'] as Map<String, dynamic>)
          : null,
      singleHeader: json['SingleHeader'] != null
          ? SingleHeader.fromJson(json['SingleHeader'] as Map<String, dynamic>)
          : null,
      singleQueryArgument: json['SingleQueryArgument'] != null
          ? SingleQueryArgument.fromJson(
              json['SingleQueryArgument'] as Map<String, dynamic>)
          : null,
      uriPath: json['UriPath'] != null
          ? UriPath.fromJson(json['UriPath'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final allQueryArguments = this.allQueryArguments;
    final body = this.body;
    final method = this.method;
    final queryString = this.queryString;
    final singleHeader = this.singleHeader;
    final singleQueryArgument = this.singleQueryArgument;
    final uriPath = this.uriPath;
    return {
      if (allQueryArguments != null) 'AllQueryArguments': allQueryArguments,
      if (body != null) 'Body': body,
      if (method != null) 'Method': method,
      if (queryString != null) 'QueryString': queryString,
      if (singleHeader != null) 'SingleHeader': singleHeader,
      if (singleQueryArgument != null)
        'SingleQueryArgument': singleQueryArgument,
      if (uriPath != null) 'UriPath': uriPath,
    };
  }
}

/// A rule group that's defined for an AWS Firewall Manager WAF policy.
class FirewallManagerRuleGroup {
  /// The processing guidance for an AWS Firewall Manager rule. This is like a
  /// regular rule <a>Statement</a>, but it can only contain a rule group
  /// reference.
  final FirewallManagerStatement firewallManagerStatement;

  /// The name of the rule group. You cannot change the name of a rule group after
  /// you create it.
  final String name;
  final OverrideAction overrideAction;

  /// If you define more than one rule group in the first or last Firewall Manager
  /// rule groups, AWS WAF evaluates each request against the rule groups in
  /// order, starting from the lowest priority setting. The priorities don't need
  /// to be consecutive, but they must all be different.
  final int priority;
  final VisibilityConfig visibilityConfig;

  FirewallManagerRuleGroup({
    required this.firewallManagerStatement,
    required this.name,
    required this.overrideAction,
    required this.priority,
    required this.visibilityConfig,
  });
  factory FirewallManagerRuleGroup.fromJson(Map<String, dynamic> json) {
    return FirewallManagerRuleGroup(
      firewallManagerStatement: FirewallManagerStatement.fromJson(
          json['FirewallManagerStatement'] as Map<String, dynamic>),
      name: json['Name'] as String,
      overrideAction: OverrideAction.fromJson(
          json['OverrideAction'] as Map<String, dynamic>),
      priority: json['Priority'] as int,
      visibilityConfig: VisibilityConfig.fromJson(
          json['VisibilityConfig'] as Map<String, dynamic>),
    );
  }
}

/// The processing guidance for an AWS Firewall Manager rule. This is like a
/// regular rule <a>Statement</a>, but it can only contain a rule group
/// reference.
class FirewallManagerStatement {
  final ManagedRuleGroupStatement? managedRuleGroupStatement;
  final RuleGroupReferenceStatement? ruleGroupReferenceStatement;

  FirewallManagerStatement({
    this.managedRuleGroupStatement,
    this.ruleGroupReferenceStatement,
  });
  factory FirewallManagerStatement.fromJson(Map<String, dynamic> json) {
    return FirewallManagerStatement(
      managedRuleGroupStatement: json['ManagedRuleGroupStatement'] != null
          ? ManagedRuleGroupStatement.fromJson(
              json['ManagedRuleGroupStatement'] as Map<String, dynamic>)
          : null,
      ruleGroupReferenceStatement: json['RuleGroupReferenceStatement'] != null
          ? RuleGroupReferenceStatement.fromJson(
              json['RuleGroupReferenceStatement'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// The configuration for inspecting IP addresses in an HTTP header that you
/// specify, instead of using the IP address that's reported by the web request
/// origin. Commonly, this is the X-Forwarded-For (XFF) header, but you can
/// specify any header name.
/// <note>
/// If the specified header isn't present in the request, AWS WAF doesn't apply
/// the rule to the web request at all.
/// </note>
/// This configuration is used for <a>GeoMatchStatement</a> and
/// <a>RateBasedStatement</a>. For <a>IPSetReferenceStatement</a>, use
/// <a>IPSetForwardedIPConfig</a> instead.
///
/// AWS WAF only evaluates the first IP address found in the specified HTTP
/// header.
class ForwardedIPConfig {
  /// The match status to assign to the web request if the request doesn't have a
  /// valid IP address in the specified position.
  /// <note>
  /// If the specified header isn't present in the request, AWS WAF doesn't apply
  /// the rule to the web request at all.
  /// </note>
  /// You can specify the following fallback behaviors:
  ///
  /// <ul>
  /// <li>
  /// MATCH - Treat the web request as matching the rule statement. AWS WAF
  /// applies the rule action to the request.
  /// </li>
  /// <li>
  /// NO_MATCH - Treat the web request as not matching the rule statement.
  /// </li>
  /// </ul>
  final FallbackBehavior fallbackBehavior;

  /// The name of the HTTP header to use for the IP address. For example, to use
  /// the X-Forwarded-For (XFF) header, set this to <code>X-Forwarded-For</code>.
  /// <note>
  /// If the specified header isn't present in the request, AWS WAF doesn't apply
  /// the rule to the web request at all.
  /// </note>
  final String headerName;

  ForwardedIPConfig({
    required this.fallbackBehavior,
    required this.headerName,
  });
  factory ForwardedIPConfig.fromJson(Map<String, dynamic> json) {
    return ForwardedIPConfig(
      fallbackBehavior:
          (json['FallbackBehavior'] as String).toFallbackBehavior(),
      headerName: json['HeaderName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final fallbackBehavior = this.fallbackBehavior;
    final headerName = this.headerName;
    return {
      'FallbackBehavior': fallbackBehavior.toValue(),
      'HeaderName': headerName,
    };
  }
}

enum ForwardedIPPosition {
  first,
  last,
  any,
}

extension on ForwardedIPPosition {
  String toValue() {
    switch (this) {
      case ForwardedIPPosition.first:
        return 'FIRST';
      case ForwardedIPPosition.last:
        return 'LAST';
      case ForwardedIPPosition.any:
        return 'ANY';
    }
  }
}

extension on String {
  ForwardedIPPosition toForwardedIPPosition() {
    switch (this) {
      case 'FIRST':
        return ForwardedIPPosition.first;
      case 'LAST':
        return ForwardedIPPosition.last;
      case 'ANY':
        return ForwardedIPPosition.any;
    }
    throw Exception('$this is not known in enum ForwardedIPPosition');
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// A rule statement used to identify web requests based on country of origin.
class GeoMatchStatement {
  /// An array of two-character country codes, for example, <code>[ "US", "CN"
  /// ]</code>, from the alpha-2 country ISO codes of the ISO 3166 international
  /// standard.
  final List<CountryCode>? countryCodes;

  /// The configuration for inspecting IP addresses in an HTTP header that you
  /// specify, instead of using the IP address that's reported by the web request
  /// origin. Commonly, this is the X-Forwarded-For (XFF) header, but you can
  /// specify any header name.
  /// <note>
  /// If the specified header isn't present in the request, AWS WAF doesn't apply
  /// the rule to the web request at all.
  /// </note>
  final ForwardedIPConfig? forwardedIPConfig;

  GeoMatchStatement({
    this.countryCodes,
    this.forwardedIPConfig,
  });
  factory GeoMatchStatement.fromJson(Map<String, dynamic> json) {
    return GeoMatchStatement(
      countryCodes: (json['CountryCodes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toCountryCode())
          .toList(),
      forwardedIPConfig: json['ForwardedIPConfig'] != null
          ? ForwardedIPConfig.fromJson(
              json['ForwardedIPConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final countryCodes = this.countryCodes;
    final forwardedIPConfig = this.forwardedIPConfig;
    return {
      if (countryCodes != null)
        'CountryCodes': countryCodes.map((e) => e.toValue()).toList(),
      if (forwardedIPConfig != null) 'ForwardedIPConfig': forwardedIPConfig,
    };
  }
}

class GetIPSetResponse {
  /// <p/>
  final IPSet? iPSet;

  /// A token used for optimistic locking. AWS WAF returns a token to your get and
  /// list requests, to mark the state of the entity at the time of the request.
  /// To make changes to the entity associated with the token, you provide the
  /// token to operations like update and delete. AWS WAF uses the token to ensure
  /// that no changes have been made to the entity since you last retrieved it. If
  /// a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// get, and use the new token returned by that operation.
  final String? lockToken;

  GetIPSetResponse({
    this.iPSet,
    this.lockToken,
  });
  factory GetIPSetResponse.fromJson(Map<String, dynamic> json) {
    return GetIPSetResponse(
      iPSet: json['IPSet'] != null
          ? IPSet.fromJson(json['IPSet'] as Map<String, dynamic>)
          : null,
      lockToken: json['LockToken'] as String?,
    );
  }
}

class GetLoggingConfigurationResponse {
  /// The <a>LoggingConfiguration</a> for the specified web ACL.
  final LoggingConfiguration? loggingConfiguration;

  GetLoggingConfigurationResponse({
    this.loggingConfiguration,
  });
  factory GetLoggingConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return GetLoggingConfigurationResponse(
      loggingConfiguration: json['LoggingConfiguration'] != null
          ? LoggingConfiguration.fromJson(
              json['LoggingConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }
}

class GetPermissionPolicyResponse {
  /// The IAM policy that is attached to the specified rule group.
  final String? policy;

  GetPermissionPolicyResponse({
    this.policy,
  });
  factory GetPermissionPolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetPermissionPolicyResponse(
      policy: json['Policy'] as String?,
    );
  }
}

class GetRateBasedStatementManagedKeysResponse {
  /// The keys that are of Internet Protocol version 4 (IPv4).
  final RateBasedStatementManagedKeysIPSet? managedKeysIPV4;

  /// The keys that are of Internet Protocol version 6 (IPv6).
  final RateBasedStatementManagedKeysIPSet? managedKeysIPV6;

  GetRateBasedStatementManagedKeysResponse({
    this.managedKeysIPV4,
    this.managedKeysIPV6,
  });
  factory GetRateBasedStatementManagedKeysResponse.fromJson(
      Map<String, dynamic> json) {
    return GetRateBasedStatementManagedKeysResponse(
      managedKeysIPV4: json['ManagedKeysIPV4'] != null
          ? RateBasedStatementManagedKeysIPSet.fromJson(
              json['ManagedKeysIPV4'] as Map<String, dynamic>)
          : null,
      managedKeysIPV6: json['ManagedKeysIPV6'] != null
          ? RateBasedStatementManagedKeysIPSet.fromJson(
              json['ManagedKeysIPV6'] as Map<String, dynamic>)
          : null,
    );
  }
}

class GetRegexPatternSetResponse {
  /// A token used for optimistic locking. AWS WAF returns a token to your get and
  /// list requests, to mark the state of the entity at the time of the request.
  /// To make changes to the entity associated with the token, you provide the
  /// token to operations like update and delete. AWS WAF uses the token to ensure
  /// that no changes have been made to the entity since you last retrieved it. If
  /// a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// get, and use the new token returned by that operation.
  final String? lockToken;

  /// <p/>
  final RegexPatternSet? regexPatternSet;

  GetRegexPatternSetResponse({
    this.lockToken,
    this.regexPatternSet,
  });
  factory GetRegexPatternSetResponse.fromJson(Map<String, dynamic> json) {
    return GetRegexPatternSetResponse(
      lockToken: json['LockToken'] as String?,
      regexPatternSet: json['RegexPatternSet'] != null
          ? RegexPatternSet.fromJson(
              json['RegexPatternSet'] as Map<String, dynamic>)
          : null,
    );
  }
}

class GetRuleGroupResponse {
  /// A token used for optimistic locking. AWS WAF returns a token to your get and
  /// list requests, to mark the state of the entity at the time of the request.
  /// To make changes to the entity associated with the token, you provide the
  /// token to operations like update and delete. AWS WAF uses the token to ensure
  /// that no changes have been made to the entity since you last retrieved it. If
  /// a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// get, and use the new token returned by that operation.
  final String? lockToken;

  /// <p/>
  final RuleGroup? ruleGroup;

  GetRuleGroupResponse({
    this.lockToken,
    this.ruleGroup,
  });
  factory GetRuleGroupResponse.fromJson(Map<String, dynamic> json) {
    return GetRuleGroupResponse(
      lockToken: json['LockToken'] as String?,
      ruleGroup: json['RuleGroup'] != null
          ? RuleGroup.fromJson(json['RuleGroup'] as Map<String, dynamic>)
          : null,
    );
  }
}

class GetSampledRequestsResponse {
  /// The total number of requests from which <code>GetSampledRequests</code> got
  /// a sample of <code>MaxItems</code> requests. If <code>PopulationSize</code>
  /// is less than <code>MaxItems</code>, the sample includes every request that
  /// your AWS resource received during the specified time range.
  final int? populationSize;

  /// A complex type that contains detailed information about each of the requests
  /// in the sample.
  final List<SampledHTTPRequest>? sampledRequests;

  /// Usually, <code>TimeWindow</code> is the time range that you specified in the
  /// <code>GetSampledRequests</code> request. However, if your AWS resource
  /// received more than 5,000 requests during the time range that you specified
  /// in the request, <code>GetSampledRequests</code> returns the time range for
  /// the first 5,000 requests. Times are in Coordinated Universal Time (UTC)
  /// format.
  final TimeWindow? timeWindow;

  GetSampledRequestsResponse({
    this.populationSize,
    this.sampledRequests,
    this.timeWindow,
  });
  factory GetSampledRequestsResponse.fromJson(Map<String, dynamic> json) {
    return GetSampledRequestsResponse(
      populationSize: json['PopulationSize'] as int?,
      sampledRequests: (json['SampledRequests'] as List?)
          ?.whereNotNull()
          .map((e) => SampledHTTPRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      timeWindow: json['TimeWindow'] != null
          ? TimeWindow.fromJson(json['TimeWindow'] as Map<String, dynamic>)
          : null,
    );
  }
}

class GetWebACLForResourceResponse {
  /// The Web ACL that is associated with the resource. If there is no associated
  /// resource, AWS WAF returns a null Web ACL.
  final WebACL? webACL;

  GetWebACLForResourceResponse({
    this.webACL,
  });
  factory GetWebACLForResourceResponse.fromJson(Map<String, dynamic> json) {
    return GetWebACLForResourceResponse(
      webACL: json['WebACL'] != null
          ? WebACL.fromJson(json['WebACL'] as Map<String, dynamic>)
          : null,
    );
  }
}

class GetWebACLResponse {
  /// A token used for optimistic locking. AWS WAF returns a token to your get and
  /// list requests, to mark the state of the entity at the time of the request.
  /// To make changes to the entity associated with the token, you provide the
  /// token to operations like update and delete. AWS WAF uses the token to ensure
  /// that no changes have been made to the entity since you last retrieved it. If
  /// a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// get, and use the new token returned by that operation.
  final String? lockToken;

  /// The Web ACL specification. You can modify the settings in this Web ACL and
  /// use it to update this Web ACL or create a new one.
  final WebACL? webACL;

  GetWebACLResponse({
    this.lockToken,
    this.webACL,
  });
  factory GetWebACLResponse.fromJson(Map<String, dynamic> json) {
    return GetWebACLResponse(
      lockToken: json['LockToken'] as String?,
      webACL: json['WebACL'] != null
          ? WebACL.fromJson(json['WebACL'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// Part of the response from <a>GetSampledRequests</a>. This is a complex type
/// that appears as <code>Headers</code> in the response syntax.
/// <code>HTTPHeader</code> contains the names and values of all of the headers
/// that appear in one of the web requests.
class HTTPHeader {
  /// The name of the HTTP header.
  final String? name;

  /// The value of the HTTP header.
  final String? value;

  HTTPHeader({
    this.name,
    this.value,
  });
  factory HTTPHeader.fromJson(Map<String, dynamic> json) {
    return HTTPHeader(
      name: json['Name'] as String?,
      value: json['Value'] as String?,
    );
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// Part of the response from <a>GetSampledRequests</a>. This is a complex type
/// that appears as <code>Request</code> in the response syntax.
/// <code>HTTPRequest</code> contains information about one of the web requests.
class HTTPRequest {
  /// The IP address that the request originated from. If the web ACL is
  /// associated with a CloudFront distribution, this is the value of one of the
  /// following fields in CloudFront access logs:
  ///
  /// <ul>
  /// <li>
  /// <code>c-ip</code>, if the viewer did not use an HTTP proxy or a load
  /// balancer to send the request
  /// </li>
  /// <li>
  /// <code>x-forwarded-for</code>, if the viewer did use an HTTP proxy or a load
  /// balancer to send the request
  /// </li>
  /// </ul>
  final String? clientIP;

  /// The two-letter country code for the country that the request originated
  /// from. For a current list of country codes, see the Wikipedia entry <a
  /// href="https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2">ISO 3166-1
  /// alpha-2</a>.
  final String? country;

  /// The HTTP version specified in the sampled web request, for example,
  /// <code>HTTP/1.1</code>.
  final String? hTTPVersion;

  /// A complex type that contains the name and value for each header in the
  /// sampled web request.
  final List<HTTPHeader>? headers;

  /// The HTTP method specified in the sampled web request.
  final String? method;

  /// The URI path of the request, which identifies the resource, for example,
  /// <code>/images/daily-ad.jpg</code>.
  final String? uri;

  HTTPRequest({
    this.clientIP,
    this.country,
    this.hTTPVersion,
    this.headers,
    this.method,
    this.uri,
  });
  factory HTTPRequest.fromJson(Map<String, dynamic> json) {
    return HTTPRequest(
      clientIP: json['ClientIP'] as String?,
      country: json['Country'] as String?,
      hTTPVersion: json['HTTPVersion'] as String?,
      headers: (json['Headers'] as List?)
          ?.whereNotNull()
          .map((e) => HTTPHeader.fromJson(e as Map<String, dynamic>))
          .toList(),
      method: json['Method'] as String?,
      uri: json['URI'] as String?,
    );
  }
}

enum IPAddressVersion {
  ipv4,
  ipv6,
}

extension on IPAddressVersion {
  String toValue() {
    switch (this) {
      case IPAddressVersion.ipv4:
        return 'IPV4';
      case IPAddressVersion.ipv6:
        return 'IPV6';
    }
  }
}

extension on String {
  IPAddressVersion toIPAddressVersion() {
    switch (this) {
      case 'IPV4':
        return IPAddressVersion.ipv4;
      case 'IPV6':
        return IPAddressVersion.ipv6;
    }
    throw Exception('$this is not known in enum IPAddressVersion');
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// Contains one or more IP addresses or blocks of IP addresses specified in
/// Classless Inter-Domain Routing (CIDR) notation. AWS WAF supports any CIDR
/// range. For information about CIDR notation, see the Wikipedia entry <a
/// href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Classless
/// Inter-Domain Routing</a>.
///
/// AWS WAF assigns an ARN to each <code>IPSet</code> that you create. To use an
/// IP set in a rule, you provide the ARN to the <a>Rule</a> statement
/// <a>IPSetReferenceStatement</a>.
class IPSet {
  /// The Amazon Resource Name (ARN) of the entity.
  final String arn;

  /// Contains an array of strings that specify one or more IP addresses or blocks
  /// of IP addresses in Classless Inter-Domain Routing (CIDR) notation. AWS WAF
  /// supports all address ranges for IP versions IPv4 and IPv6.
  ///
  /// Examples:
  ///
  /// <ul>
  /// <li>
  /// To configure AWS WAF to allow, block, or count requests that originated from
  /// the IP address 192.0.2.44, specify <code>192.0.2.44/32</code>.
  /// </li>
  /// <li>
  /// To configure AWS WAF to allow, block, or count requests that originated from
  /// IP addresses from 192.0.2.0 to 192.0.2.255, specify
  /// <code>192.0.2.0/24</code>.
  /// </li>
  /// <li>
  /// To configure AWS WAF to allow, block, or count requests that originated from
  /// the IP address 1111:0000:0000:0000:0000:0000:0000:0111, specify
  /// <code>1111:0000:0000:0000:0000:0000:0000:0111/128</code>.
  /// </li>
  /// <li>
  /// To configure AWS WAF to allow, block, or count requests that originated from
  /// IP addresses 1111:0000:0000:0000:0000:0000:0000:0000 to
  /// 1111:0000:0000:0000:ffff:ffff:ffff:ffff, specify
  /// <code>1111:0000:0000:0000:0000:0000:0000:0000/64</code>.
  /// </li>
  /// </ul>
  /// For more information about CIDR notation, see the Wikipedia entry <a
  /// href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Classless
  /// Inter-Domain Routing</a>.
  final List<String> addresses;

  /// Specify IPV4 or IPV6.
  final IPAddressVersion iPAddressVersion;

  /// A unique identifier for the set. This ID is returned in the responses to
  /// create and list commands. You provide it to operations like update and
  /// delete.
  final String id;

  /// The name of the IP set. You cannot change the name of an <code>IPSet</code>
  /// after you create it.
  final String name;

  /// A description of the IP set that helps with identification. You cannot
  /// change the description of an IP set after you create it.
  final String? description;

  IPSet({
    required this.arn,
    required this.addresses,
    required this.iPAddressVersion,
    required this.id,
    required this.name,
    this.description,
  });
  factory IPSet.fromJson(Map<String, dynamic> json) {
    return IPSet(
      arn: json['ARN'] as String,
      addresses: (json['Addresses'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      iPAddressVersion:
          (json['IPAddressVersion'] as String).toIPAddressVersion(),
      id: json['Id'] as String,
      name: json['Name'] as String,
      description: json['Description'] as String?,
    );
  }
}

/// The configuration for inspecting IP addresses in an HTTP header that you
/// specify, instead of using the IP address that's reported by the web request
/// origin. Commonly, this is the X-Forwarded-For (XFF) header, but you can
/// specify any header name.
/// <note>
/// If the specified header isn't present in the request, AWS WAF doesn't apply
/// the rule to the web request at all.
/// </note>
/// This configuration is used only for <a>IPSetReferenceStatement</a>. For
/// <a>GeoMatchStatement</a> and <a>RateBasedStatement</a>, use
/// <a>ForwardedIPConfig</a> instead.
class IPSetForwardedIPConfig {
  /// The match status to assign to the web request if the request doesn't have a
  /// valid IP address in the specified position.
  /// <note>
  /// If the specified header isn't present in the request, AWS WAF doesn't apply
  /// the rule to the web request at all.
  /// </note>
  /// You can specify the following fallback behaviors:
  ///
  /// <ul>
  /// <li>
  /// MATCH - Treat the web request as matching the rule statement. AWS WAF
  /// applies the rule action to the request.
  /// </li>
  /// <li>
  /// NO_MATCH - Treat the web request as not matching the rule statement.
  /// </li>
  /// </ul>
  final FallbackBehavior fallbackBehavior;

  /// The name of the HTTP header to use for the IP address. For example, to use
  /// the X-Forwarded-For (XFF) header, set this to <code>X-Forwarded-For</code>.
  /// <note>
  /// If the specified header isn't present in the request, AWS WAF doesn't apply
  /// the rule to the web request at all.
  /// </note>
  final String headerName;

  /// The position in the header to search for the IP address. The header can
  /// contain IP addresses of the original client and also of proxies. For
  /// example, the header value could be <code>10.1.1.1, 127.0.0.0,
  /// 10.10.10.10</code> where the first IP address identifies the original client
  /// and the rest identify proxies that the request went through.
  ///
  /// The options for this setting are the following:
  ///
  /// <ul>
  /// <li>
  /// FIRST - Inspect the first IP address in the list of IP addresses in the
  /// header. This is usually the client's original IP.
  /// </li>
  /// <li>
  /// LAST - Inspect the last IP address in the list of IP addresses in the
  /// header.
  /// </li>
  /// <li>
  /// ANY - Inspect all IP addresses in the header for a match. If the header
  /// contains more than 10 IP addresses, AWS WAF inspects the last 10.
  /// </li>
  /// </ul>
  final ForwardedIPPosition position;

  IPSetForwardedIPConfig({
    required this.fallbackBehavior,
    required this.headerName,
    required this.position,
  });
  factory IPSetForwardedIPConfig.fromJson(Map<String, dynamic> json) {
    return IPSetForwardedIPConfig(
      fallbackBehavior:
          (json['FallbackBehavior'] as String).toFallbackBehavior(),
      headerName: json['HeaderName'] as String,
      position: (json['Position'] as String).toForwardedIPPosition(),
    );
  }

  Map<String, dynamic> toJson() {
    final fallbackBehavior = this.fallbackBehavior;
    final headerName = this.headerName;
    final position = this.position;
    return {
      'FallbackBehavior': fallbackBehavior.toValue(),
      'HeaderName': headerName,
      'Position': position.toValue(),
    };
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// A rule statement used to detect web requests coming from particular IP
/// addresses or address ranges. To use this, create an <a>IPSet</a> that
/// specifies the addresses you want to detect, then use the ARN of that set in
/// this statement. To create an IP set, see <a>CreateIPSet</a>.
///
/// Each IP set rule statement references an IP set. You create and maintain the
/// set independent of your rules. This allows you to use the single set in
/// multiple rules. When you update the referenced set, AWS WAF automatically
/// updates all rules that reference it.
class IPSetReferenceStatement {
  /// The Amazon Resource Name (ARN) of the <a>IPSet</a> that this statement
  /// references.
  final String arn;

  /// The configuration for inspecting IP addresses in an HTTP header that you
  /// specify, instead of using the IP address that's reported by the web request
  /// origin. Commonly, this is the X-Forwarded-For (XFF) header, but you can
  /// specify any header name.
  /// <note>
  /// If the specified header isn't present in the request, AWS WAF doesn't apply
  /// the rule to the web request at all.
  /// </note>
  final IPSetForwardedIPConfig? iPSetForwardedIPConfig;

  IPSetReferenceStatement({
    required this.arn,
    this.iPSetForwardedIPConfig,
  });
  factory IPSetReferenceStatement.fromJson(Map<String, dynamic> json) {
    return IPSetReferenceStatement(
      arn: json['ARN'] as String,
      iPSetForwardedIPConfig: json['IPSetForwardedIPConfig'] != null
          ? IPSetForwardedIPConfig.fromJson(
              json['IPSetForwardedIPConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final iPSetForwardedIPConfig = this.iPSetForwardedIPConfig;
    return {
      'ARN': arn,
      if (iPSetForwardedIPConfig != null)
        'IPSetForwardedIPConfig': iPSetForwardedIPConfig,
    };
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// High-level information about an <a>IPSet</a>, returned by operations like
/// create and list. This provides information like the ID, that you can use to
/// retrieve and manage an <code>IPSet</code>, and the ARN, that you provide to
/// the <a>IPSetReferenceStatement</a> to use the address set in a <a>Rule</a>.
class IPSetSummary {
  /// The Amazon Resource Name (ARN) of the entity.
  final String? arn;

  /// A description of the IP set that helps with identification. You cannot
  /// change the description of an IP set after you create it.
  final String? description;

  /// A unique identifier for the set. This ID is returned in the responses to
  /// create and list commands. You provide it to operations like update and
  /// delete.
  final String? id;

  /// A token used for optimistic locking. AWS WAF returns a token to your get and
  /// list requests, to mark the state of the entity at the time of the request.
  /// To make changes to the entity associated with the token, you provide the
  /// token to operations like update and delete. AWS WAF uses the token to ensure
  /// that no changes have been made to the entity since you last retrieved it. If
  /// a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// get, and use the new token returned by that operation.
  final String? lockToken;

  /// The name of the IP set. You cannot change the name of an <code>IPSet</code>
  /// after you create it.
  final String? name;

  IPSetSummary({
    this.arn,
    this.description,
    this.id,
    this.lockToken,
    this.name,
  });
  factory IPSetSummary.fromJson(Map<String, dynamic> json) {
    return IPSetSummary(
      arn: json['ARN'] as String?,
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      lockToken: json['LockToken'] as String?,
      name: json['Name'] as String?,
    );
  }
}

class ListAvailableManagedRuleGroupsResponse {
  /// <p/>
  final List<ManagedRuleGroupSummary>? managedRuleGroups;

  /// When you request a list of objects with a <code>Limit</code> setting, if the
  /// number of objects that are still available for retrieval exceeds the limit,
  /// AWS WAF returns a <code>NextMarker</code> value in the response. To retrieve
  /// the next batch of objects, provide the marker from the prior call in your
  /// next request.
  final String? nextMarker;

  ListAvailableManagedRuleGroupsResponse({
    this.managedRuleGroups,
    this.nextMarker,
  });
  factory ListAvailableManagedRuleGroupsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAvailableManagedRuleGroupsResponse(
      managedRuleGroups: (json['ManagedRuleGroups'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ManagedRuleGroupSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }
}

class ListIPSetsResponse {
  /// Array of IPSets. This may not be the full list of IPSets that you have
  /// defined. See the <code>Limit</code> specification for this request.
  final List<IPSetSummary>? iPSets;

  /// When you request a list of objects with a <code>Limit</code> setting, if the
  /// number of objects that are still available for retrieval exceeds the limit,
  /// AWS WAF returns a <code>NextMarker</code> value in the response. To retrieve
  /// the next batch of objects, provide the marker from the prior call in your
  /// next request.
  final String? nextMarker;

  ListIPSetsResponse({
    this.iPSets,
    this.nextMarker,
  });
  factory ListIPSetsResponse.fromJson(Map<String, dynamic> json) {
    return ListIPSetsResponse(
      iPSets: (json['IPSets'] as List?)
          ?.whereNotNull()
          .map((e) => IPSetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }
}

class ListLoggingConfigurationsResponse {
  /// <p/>
  final List<LoggingConfiguration>? loggingConfigurations;

  /// When you request a list of objects with a <code>Limit</code> setting, if the
  /// number of objects that are still available for retrieval exceeds the limit,
  /// AWS WAF returns a <code>NextMarker</code> value in the response. To retrieve
  /// the next batch of objects, provide the marker from the prior call in your
  /// next request.
  final String? nextMarker;

  ListLoggingConfigurationsResponse({
    this.loggingConfigurations,
    this.nextMarker,
  });
  factory ListLoggingConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListLoggingConfigurationsResponse(
      loggingConfigurations: (json['LoggingConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) => LoggingConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }
}

class ListRegexPatternSetsResponse {
  /// When you request a list of objects with a <code>Limit</code> setting, if the
  /// number of objects that are still available for retrieval exceeds the limit,
  /// AWS WAF returns a <code>NextMarker</code> value in the response. To retrieve
  /// the next batch of objects, provide the marker from the prior call in your
  /// next request.
  final String? nextMarker;

  /// <p/>
  final List<RegexPatternSetSummary>? regexPatternSets;

  ListRegexPatternSetsResponse({
    this.nextMarker,
    this.regexPatternSets,
  });
  factory ListRegexPatternSetsResponse.fromJson(Map<String, dynamic> json) {
    return ListRegexPatternSetsResponse(
      nextMarker: json['NextMarker'] as String?,
      regexPatternSets: (json['RegexPatternSets'] as List?)
          ?.whereNotNull()
          .map(
              (e) => RegexPatternSetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListResourcesForWebACLResponse {
  /// The array of Amazon Resource Names (ARNs) of the associated resources.
  final List<String>? resourceArns;

  ListResourcesForWebACLResponse({
    this.resourceArns,
  });
  factory ListResourcesForWebACLResponse.fromJson(Map<String, dynamic> json) {
    return ListResourcesForWebACLResponse(
      resourceArns: (json['ResourceArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }
}

class ListRuleGroupsResponse {
  /// When you request a list of objects with a <code>Limit</code> setting, if the
  /// number of objects that are still available for retrieval exceeds the limit,
  /// AWS WAF returns a <code>NextMarker</code> value in the response. To retrieve
  /// the next batch of objects, provide the marker from the prior call in your
  /// next request.
  final String? nextMarker;

  /// <p/>
  final List<RuleGroupSummary>? ruleGroups;

  ListRuleGroupsResponse({
    this.nextMarker,
    this.ruleGroups,
  });
  factory ListRuleGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListRuleGroupsResponse(
      nextMarker: json['NextMarker'] as String?,
      ruleGroups: (json['RuleGroups'] as List?)
          ?.whereNotNull()
          .map((e) => RuleGroupSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListTagsForResourceResponse {
  /// When you request a list of objects with a <code>Limit</code> setting, if the
  /// number of objects that are still available for retrieval exceeds the limit,
  /// AWS WAF returns a <code>NextMarker</code> value in the response. To retrieve
  /// the next batch of objects, provide the marker from the prior call in your
  /// next request.
  final String? nextMarker;

  /// The collection of tagging definitions for the resource.
  final TagInfoForResource? tagInfoForResource;

  ListTagsForResourceResponse({
    this.nextMarker,
    this.tagInfoForResource,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      nextMarker: json['NextMarker'] as String?,
      tagInfoForResource: json['TagInfoForResource'] != null
          ? TagInfoForResource.fromJson(
              json['TagInfoForResource'] as Map<String, dynamic>)
          : null,
    );
  }
}

class ListWebACLsResponse {
  /// When you request a list of objects with a <code>Limit</code> setting, if the
  /// number of objects that are still available for retrieval exceeds the limit,
  /// AWS WAF returns a <code>NextMarker</code> value in the response. To retrieve
  /// the next batch of objects, provide the marker from the prior call in your
  /// next request.
  final String? nextMarker;

  /// <p/>
  final List<WebACLSummary>? webACLs;

  ListWebACLsResponse({
    this.nextMarker,
    this.webACLs,
  });
  factory ListWebACLsResponse.fromJson(Map<String, dynamic> json) {
    return ListWebACLsResponse(
      nextMarker: json['NextMarker'] as String?,
      webACLs: (json['WebACLs'] as List?)
          ?.whereNotNull()
          .map((e) => WebACLSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// Defines an association between Amazon Kinesis Data Firehose destinations and
/// a web ACL resource, for logging from AWS WAF. As part of the association,
/// you can specify parts of the standard logging fields to keep out of the
/// logs.
class LoggingConfiguration {
  /// The Amazon Kinesis Data Firehose Amazon Resource Name (ARNs) that you want
  /// to associate with the web ACL.
  final List<String> logDestinationConfigs;

  /// The Amazon Resource Name (ARN) of the web ACL that you want to associate
  /// with <code>LogDestinationConfigs</code>.
  final String resourceArn;

  /// Indicates whether the logging configuration was created by AWS Firewall
  /// Manager, as part of an AWS WAF policy configuration. If true, only Firewall
  /// Manager can modify or delete the configuration.
  final bool? managedByFirewallManager;

  /// The parts of the request that you want to keep out of the logs. For example,
  /// if you redact the <code>HEADER</code> field, the <code>HEADER</code> field
  /// in the firehose will be <code>xxx</code>.
  /// <note>
  /// You must use one of the following values: <code>URI</code>,
  /// <code>QUERY_STRING</code>, <code>HEADER</code>, or <code>METHOD</code>.
  /// </note>
  final List<FieldToMatch>? redactedFields;

  LoggingConfiguration({
    required this.logDestinationConfigs,
    required this.resourceArn,
    this.managedByFirewallManager,
    this.redactedFields,
  });
  factory LoggingConfiguration.fromJson(Map<String, dynamic> json) {
    return LoggingConfiguration(
      logDestinationConfigs: (json['LogDestinationConfigs'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      resourceArn: json['ResourceArn'] as String,
      managedByFirewallManager: json['ManagedByFirewallManager'] as bool?,
      redactedFields: (json['RedactedFields'] as List?)
          ?.whereNotNull()
          .map((e) => FieldToMatch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final logDestinationConfigs = this.logDestinationConfigs;
    final resourceArn = this.resourceArn;
    final managedByFirewallManager = this.managedByFirewallManager;
    final redactedFields = this.redactedFields;
    return {
      'LogDestinationConfigs': logDestinationConfigs,
      'ResourceArn': resourceArn,
      if (managedByFirewallManager != null)
        'ManagedByFirewallManager': managedByFirewallManager,
      if (redactedFields != null) 'RedactedFields': redactedFields,
    };
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// A rule statement used to run the rules that are defined in a managed rule
/// group. To use this, provide the vendor name and the name of the rule group
/// in this statement. You can retrieve the required names by calling
/// <a>ListAvailableManagedRuleGroups</a>.
///
/// You can't nest a <code>ManagedRuleGroupStatement</code>, for example for use
/// inside a <code>NotStatement</code> or <code>OrStatement</code>. It can only
/// be referenced as a top-level statement within a rule.
class ManagedRuleGroupStatement {
  /// The name of the managed rule group. You use this, along with the vendor
  /// name, to identify the rule group.
  final String name;

  /// The name of the managed rule group vendor. You use this, along with the rule
  /// group name, to identify the rule group.
  final String vendorName;

  /// The rules whose actions are set to <code>COUNT</code> by the web ACL,
  /// regardless of the action that is set on the rule. This effectively excludes
  /// the rule from acting on web requests.
  final List<ExcludedRule>? excludedRules;

  ManagedRuleGroupStatement({
    required this.name,
    required this.vendorName,
    this.excludedRules,
  });
  factory ManagedRuleGroupStatement.fromJson(Map<String, dynamic> json) {
    return ManagedRuleGroupStatement(
      name: json['Name'] as String,
      vendorName: json['VendorName'] as String,
      excludedRules: (json['ExcludedRules'] as List?)
          ?.whereNotNull()
          .map((e) => ExcludedRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final vendorName = this.vendorName;
    final excludedRules = this.excludedRules;
    return {
      'Name': name,
      'VendorName': vendorName,
      if (excludedRules != null) 'ExcludedRules': excludedRules,
    };
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// High-level information about a managed rule group, returned by
/// <a>ListAvailableManagedRuleGroups</a>. This provides information like the
/// name and vendor name, that you provide when you add a
/// <a>ManagedRuleGroupStatement</a> to a web ACL. Managed rule groups include
/// AWS Managed Rules rule groups, which are free of charge to AWS WAF
/// customers, and AWS Marketplace managed rule groups, which you can subscribe
/// to through AWS Marketplace.
class ManagedRuleGroupSummary {
  /// The description of the managed rule group, provided by AWS Managed Rules or
  /// the AWS Marketplace seller who manages it.
  final String? description;

  /// The name of the managed rule group. You use this, along with the vendor
  /// name, to identify the rule group.
  final String? name;

  /// The name of the managed rule group vendor. You use this, along with the rule
  /// group name, to identify the rule group.
  final String? vendorName;

  ManagedRuleGroupSummary({
    this.description,
    this.name,
    this.vendorName,
  });
  factory ManagedRuleGroupSummary.fromJson(Map<String, dynamic> json) {
    return ManagedRuleGroupSummary(
      description: json['Description'] as String?,
      name: json['Name'] as String?,
      vendorName: json['VendorName'] as String?,
    );
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// The HTTP method of a web request. The method indicates the type of operation
/// that the request is asking the origin to perform.
///
/// This is used only to indicate the web request component for AWS WAF to
/// inspect, in the <a>FieldToMatch</a> specification.
class Method {
  Method();
  factory Method.fromJson(Map<String, dynamic> _) {
    return Method();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// Specifies that AWS WAF should do nothing. This is generally used to try out
/// a rule without performing any actions. You set the
/// <code>OverrideAction</code> on the <a>Rule</a>.
///
/// This is used only in the context of other settings, for example to specify
/// values for <a>RuleAction</a> and web ACL <a>DefaultAction</a>.
class NoneAction {
  NoneAction();
  factory NoneAction.fromJson(Map<String, dynamic> _) {
    return NoneAction();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// A logical rule statement used to negate the results of another rule
/// statement. You provide one <a>Statement</a> within the
/// <code>NotStatement</code>.
class NotStatement {
  /// The statement to negate. You can use any statement that can be nested.
  final Statement statement;

  NotStatement({
    required this.statement,
  });
  factory NotStatement.fromJson(Map<String, dynamic> json) {
    return NotStatement(
      statement: Statement.fromJson(json['Statement'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final statement = this.statement;
    return {
      'Statement': statement,
    };
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// A logical rule statement used to combine other rule statements with OR
/// logic. You provide more than one <a>Statement</a> within the
/// <code>OrStatement</code>.
class OrStatement {
  /// The statements to combine with OR logic. You can use any statements that can
  /// be nested.
  final List<Statement> statements;

  OrStatement({
    required this.statements,
  });
  factory OrStatement.fromJson(Map<String, dynamic> json) {
    return OrStatement(
      statements: (json['Statements'] as List)
          .whereNotNull()
          .map((e) => Statement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final statements = this.statements;
    return {
      'Statements': statements,
    };
  }
}

/// The override action to apply to the rules in a rule group. Used only for
/// rule statements that reference a rule group, like
/// <code>RuleGroupReferenceStatement</code> and
/// <code>ManagedRuleGroupStatement</code>.
///
/// Set the override action to none to leave the rule actions in effect. Set it
/// to count to only count matches, regardless of the rule action settings.
///
/// In a <a>Rule</a>, you must specify either this <code>OverrideAction</code>
/// setting or the rule <code>Action</code> setting, but not both:
///
/// <ul>
/// <li>
/// If the rule statement references a rule group, use this override action
/// setting and not the action setting.
/// </li>
/// <li>
/// If the rule statement does not reference a rule group, use the rule action
/// setting and not this rule override action setting.
/// </li>
/// </ul>
class OverrideAction {
  /// Override the rule action setting to count.
  final CountAction? count;

  /// Don't override the rule action setting.
  final NoneAction? none;

  OverrideAction({
    this.count,
    this.none,
  });
  factory OverrideAction.fromJson(Map<String, dynamic> json) {
    return OverrideAction(
      count: json['Count'] != null
          ? CountAction.fromJson(json['Count'] as Map<String, dynamic>)
          : null,
      none: json['None'] != null
          ? NoneAction.fromJson(json['None'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final none = this.none;
    return {
      if (count != null) 'Count': count,
      if (none != null) 'None': none,
    };
  }
}

enum PositionalConstraint {
  exactly,
  startsWith,
  endsWith,
  contains,
  containsWord,
}

extension on PositionalConstraint {
  String toValue() {
    switch (this) {
      case PositionalConstraint.exactly:
        return 'EXACTLY';
      case PositionalConstraint.startsWith:
        return 'STARTS_WITH';
      case PositionalConstraint.endsWith:
        return 'ENDS_WITH';
      case PositionalConstraint.contains:
        return 'CONTAINS';
      case PositionalConstraint.containsWord:
        return 'CONTAINS_WORD';
    }
  }
}

extension on String {
  PositionalConstraint toPositionalConstraint() {
    switch (this) {
      case 'EXACTLY':
        return PositionalConstraint.exactly;
      case 'STARTS_WITH':
        return PositionalConstraint.startsWith;
      case 'ENDS_WITH':
        return PositionalConstraint.endsWith;
      case 'CONTAINS':
        return PositionalConstraint.contains;
      case 'CONTAINS_WORD':
        return PositionalConstraint.containsWord;
    }
    throw Exception('$this is not known in enum PositionalConstraint');
  }
}

class PutLoggingConfigurationResponse {
  /// <p/>
  final LoggingConfiguration? loggingConfiguration;

  PutLoggingConfigurationResponse({
    this.loggingConfiguration,
  });
  factory PutLoggingConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return PutLoggingConfigurationResponse(
      loggingConfiguration: json['LoggingConfiguration'] != null
          ? LoggingConfiguration.fromJson(
              json['LoggingConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }
}

class PutPermissionPolicyResponse {
  PutPermissionPolicyResponse();
  factory PutPermissionPolicyResponse.fromJson(Map<String, dynamic> _) {
    return PutPermissionPolicyResponse();
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// The query string of a web request. This is the part of a URL that appears
/// after a <code>?</code> character, if any.
///
/// This is used only to indicate the web request component for AWS WAF to
/// inspect, in the <a>FieldToMatch</a> specification.
class QueryString {
  QueryString();
  factory QueryString.fromJson(Map<String, dynamic> _) {
    return QueryString();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// A rate-based rule tracks the rate of requests for each originating IP
/// address, and triggers the rule action when the rate exceeds a limit that you
/// specify on the number of requests in any 5-minute time span. You can use
/// this to put a temporary block on requests from an IP address that is sending
/// excessive requests.
///
/// When the rule action triggers, AWS WAF blocks additional requests from the
/// IP address until the request rate falls below the limit.
///
/// You can optionally nest another statement inside the rate-based statement,
/// to narrow the scope of the rule so that it only counts requests that match
/// the nested statement. For example, based on recent requests that you have
/// seen from an attacker, you might create a rate-based rule with a nested AND
/// rule statement that contains the following nested statements:
///
/// <ul>
/// <li>
/// An IP match statement with an IP set that specified the address 192.0.2.44.
/// </li>
/// <li>
/// A string match statement that searches in the User-Agent header for the
/// string BadBot.
/// </li>
/// </ul>
/// In this rate-based rule, you also define a rate limit. For this example, the
/// rate limit is 1,000. Requests that meet both of the conditions in the
/// statements are counted. If the count exceeds 1,000 requests per five
/// minutes, the rule action triggers. Requests that do not meet both conditions
/// are not counted towards the rate limit and are not affected by this rule.
///
/// You cannot nest a <code>RateBasedStatement</code>, for example for use
/// inside a <code>NotStatement</code> or <code>OrStatement</code>. It can only
/// be referenced as a top-level statement within a rule.
class RateBasedStatement {
  /// Setting that indicates how to aggregate the request counts. The options are
  /// the following:
  ///
  /// <ul>
  /// <li>
  /// IP - Aggregate the request counts on the IP address from the web request
  /// origin.
  /// </li>
  /// <li>
  /// FORWARDED_IP - Aggregate the request counts on the first IP address in an
  /// HTTP header. If you use this, configure the <code>ForwardedIPConfig</code>,
  /// to specify the header to use.
  /// </li>
  /// </ul>
  final RateBasedStatementAggregateKeyType aggregateKeyType;

  /// The limit on requests per 5-minute period for a single originating IP
  /// address. If the statement includes a <code>ScopeDownStatement</code>, this
  /// limit is applied only to the requests that match the statement.
  final int limit;

  /// The configuration for inspecting IP addresses in an HTTP header that you
  /// specify, instead of using the IP address that's reported by the web request
  /// origin. Commonly, this is the X-Forwarded-For (XFF) header, but you can
  /// specify any header name.
  /// <note>
  /// If the specified header isn't present in the request, AWS WAF doesn't apply
  /// the rule to the web request at all.
  /// </note>
  /// This is required if <code>AggregateKeyType</code> is set to
  /// <code>FORWARDED_IP</code>.
  final ForwardedIPConfig? forwardedIPConfig;

  /// An optional nested statement that narrows the scope of the rate-based
  /// statement to matching web requests. This can be any nestable statement, and
  /// you can nest statements at any level below this scope-down statement.
  final Statement? scopeDownStatement;

  RateBasedStatement({
    required this.aggregateKeyType,
    required this.limit,
    this.forwardedIPConfig,
    this.scopeDownStatement,
  });
  factory RateBasedStatement.fromJson(Map<String, dynamic> json) {
    return RateBasedStatement(
      aggregateKeyType: (json['AggregateKeyType'] as String)
          .toRateBasedStatementAggregateKeyType(),
      limit: json['Limit'] as int,
      forwardedIPConfig: json['ForwardedIPConfig'] != null
          ? ForwardedIPConfig.fromJson(
              json['ForwardedIPConfig'] as Map<String, dynamic>)
          : null,
      scopeDownStatement: json['ScopeDownStatement'] != null
          ? Statement.fromJson(
              json['ScopeDownStatement'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final aggregateKeyType = this.aggregateKeyType;
    final limit = this.limit;
    final forwardedIPConfig = this.forwardedIPConfig;
    final scopeDownStatement = this.scopeDownStatement;
    return {
      'AggregateKeyType': aggregateKeyType.toValue(),
      'Limit': limit,
      if (forwardedIPConfig != null) 'ForwardedIPConfig': forwardedIPConfig,
      if (scopeDownStatement != null) 'ScopeDownStatement': scopeDownStatement,
    };
  }
}

enum RateBasedStatementAggregateKeyType {
  ip,
  forwardedIp,
}

extension on RateBasedStatementAggregateKeyType {
  String toValue() {
    switch (this) {
      case RateBasedStatementAggregateKeyType.ip:
        return 'IP';
      case RateBasedStatementAggregateKeyType.forwardedIp:
        return 'FORWARDED_IP';
    }
  }
}

extension on String {
  RateBasedStatementAggregateKeyType toRateBasedStatementAggregateKeyType() {
    switch (this) {
      case 'IP':
        return RateBasedStatementAggregateKeyType.ip;
      case 'FORWARDED_IP':
        return RateBasedStatementAggregateKeyType.forwardedIp;
    }
    throw Exception(
        '$this is not known in enum RateBasedStatementAggregateKeyType');
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// The set of IP addresses that are currently blocked for a rate-based
/// statement.
class RateBasedStatementManagedKeysIPSet {
  /// The IP addresses that are currently blocked.
  final List<String>? addresses;
  final IPAddressVersion? iPAddressVersion;

  RateBasedStatementManagedKeysIPSet({
    this.addresses,
    this.iPAddressVersion,
  });
  factory RateBasedStatementManagedKeysIPSet.fromJson(
      Map<String, dynamic> json) {
    return RateBasedStatementManagedKeysIPSet(
      addresses: (json['Addresses'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      iPAddressVersion:
          (json['IPAddressVersion'] as String?)?.toIPAddressVersion(),
    );
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// A single regular expression. This is used in a <a>RegexPatternSet</a>.
class Regex {
  /// The string representing the regular expression.
  final String? regexString;

  Regex({
    this.regexString,
  });
  factory Regex.fromJson(Map<String, dynamic> json) {
    return Regex(
      regexString: json['RegexString'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final regexString = this.regexString;
    return {
      if (regexString != null) 'RegexString': regexString,
    };
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// Contains one or more regular expressions.
///
/// AWS WAF assigns an ARN to each <code>RegexPatternSet</code> that you create.
/// To use a set in a rule, you provide the ARN to the <a>Rule</a> statement
/// <a>RegexPatternSetReferenceStatement</a>.
class RegexPatternSet {
  /// The Amazon Resource Name (ARN) of the entity.
  final String? arn;

  /// A description of the set that helps with identification. You cannot change
  /// the description of a set after you create it.
  final String? description;

  /// A unique identifier for the set. This ID is returned in the responses to
  /// create and list commands. You provide it to operations like update and
  /// delete.
  final String? id;

  /// The name of the set. You cannot change the name after you create the set.
  final String? name;

  /// The regular expression patterns in the set.
  final List<Regex>? regularExpressionList;

  RegexPatternSet({
    this.arn,
    this.description,
    this.id,
    this.name,
    this.regularExpressionList,
  });
  factory RegexPatternSet.fromJson(Map<String, dynamic> json) {
    return RegexPatternSet(
      arn: json['ARN'] as String?,
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      regularExpressionList: (json['RegularExpressionList'] as List?)
          ?.whereNotNull()
          .map((e) => Regex.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// A rule statement used to search web request components for matches with
/// regular expressions. To use this, create a <a>RegexPatternSet</a> that
/// specifies the expressions that you want to detect, then use the ARN of that
/// set in this statement. A web request matches the pattern set rule statement
/// if the request component matches any of the patterns in the set. To create a
/// regex pattern set, see <a>CreateRegexPatternSet</a>.
///
/// Each regex pattern set rule statement references a regex pattern set. You
/// create and maintain the set independent of your rules. This allows you to
/// use the single set in multiple rules. When you update the referenced set,
/// AWS WAF automatically updates all rules that reference it.
class RegexPatternSetReferenceStatement {
  /// The Amazon Resource Name (ARN) of the <a>RegexPatternSet</a> that this
  /// statement references.
  final String arn;

  /// The part of a web request that you want AWS WAF to inspect. For more
  /// information, see <a>FieldToMatch</a>.
  final FieldToMatch fieldToMatch;

  /// Text transformations eliminate some of the unusual formatting that attackers
  /// use in web requests in an effort to bypass detection. If you specify one or
  /// more transformations in a rule statement, AWS WAF performs all
  /// transformations on the content of the request component identified by
  /// <code>FieldToMatch</code>, starting from the lowest priority setting, before
  /// inspecting the content for a match.
  final List<TextTransformation> textTransformations;

  RegexPatternSetReferenceStatement({
    required this.arn,
    required this.fieldToMatch,
    required this.textTransformations,
  });
  factory RegexPatternSetReferenceStatement.fromJson(
      Map<String, dynamic> json) {
    return RegexPatternSetReferenceStatement(
      arn: json['ARN'] as String,
      fieldToMatch:
          FieldToMatch.fromJson(json['FieldToMatch'] as Map<String, dynamic>),
      textTransformations: (json['TextTransformations'] as List)
          .whereNotNull()
          .map((e) => TextTransformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final fieldToMatch = this.fieldToMatch;
    final textTransformations = this.textTransformations;
    return {
      'ARN': arn,
      'FieldToMatch': fieldToMatch,
      'TextTransformations': textTransformations,
    };
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// High-level information about a <a>RegexPatternSet</a>, returned by
/// operations like create and list. This provides information like the ID, that
/// you can use to retrieve and manage a <code>RegexPatternSet</code>, and the
/// ARN, that you provide to the <a>RegexPatternSetReferenceStatement</a> to use
/// the pattern set in a <a>Rule</a>.
class RegexPatternSetSummary {
  /// The Amazon Resource Name (ARN) of the entity.
  final String? arn;

  /// A description of the set that helps with identification. You cannot change
  /// the description of a set after you create it.
  final String? description;

  /// A unique identifier for the set. This ID is returned in the responses to
  /// create and list commands. You provide it to operations like update and
  /// delete.
  final String? id;

  /// A token used for optimistic locking. AWS WAF returns a token to your get and
  /// list requests, to mark the state of the entity at the time of the request.
  /// To make changes to the entity associated with the token, you provide the
  /// token to operations like update and delete. AWS WAF uses the token to ensure
  /// that no changes have been made to the entity since you last retrieved it. If
  /// a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// get, and use the new token returned by that operation.
  final String? lockToken;

  /// The name of the data type instance. You cannot change the name after you
  /// create the instance.
  final String? name;

  RegexPatternSetSummary({
    this.arn,
    this.description,
    this.id,
    this.lockToken,
    this.name,
  });
  factory RegexPatternSetSummary.fromJson(Map<String, dynamic> json) {
    return RegexPatternSetSummary(
      arn: json['ARN'] as String?,
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      lockToken: json['LockToken'] as String?,
      name: json['Name'] as String?,
    );
  }
}

enum ResourceType {
  applicationLoadBalancer,
  apiGateway,
  appsync,
}

extension on ResourceType {
  String toValue() {
    switch (this) {
      case ResourceType.applicationLoadBalancer:
        return 'APPLICATION_LOAD_BALANCER';
      case ResourceType.apiGateway:
        return 'API_GATEWAY';
      case ResourceType.appsync:
        return 'APPSYNC';
    }
  }
}

extension on String {
  ResourceType toResourceType() {
    switch (this) {
      case 'APPLICATION_LOAD_BALANCER':
        return ResourceType.applicationLoadBalancer;
      case 'API_GATEWAY':
        return ResourceType.apiGateway;
      case 'APPSYNC':
        return ResourceType.appsync;
    }
    throw Exception('$this is not known in enum ResourceType');
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// A single rule, which you can use in a <a>WebACL</a> or <a>RuleGroup</a> to
/// identify web requests that you want to allow, block, or count. Each rule
/// includes one top-level <a>Statement</a> that AWS WAF uses to identify
/// matching web requests, and parameters that govern how AWS WAF handles them.
class Rule {
  /// The name of the rule. You can't change the name of a <code>Rule</code> after
  /// you create it.
  final String name;

  /// If you define more than one <code>Rule</code> in a <code>WebACL</code>, AWS
  /// WAF evaluates each request against the <code>Rules</code> in order based on
  /// the value of <code>Priority</code>. AWS WAF processes rules with lower
  /// priority first. The priorities don't need to be consecutive, but they must
  /// all be different.
  final int priority;

  /// The AWS WAF processing statement for the rule, for example
  /// <a>ByteMatchStatement</a> or <a>SizeConstraintStatement</a>.
  final Statement statement;

  /// Defines and enables Amazon CloudWatch metrics and web request sample
  /// collection.
  final VisibilityConfig visibilityConfig;

  /// The action that AWS WAF should take on a web request when it matches the
  /// rule statement. Settings at the web ACL level can override the rule action
  /// setting.
  ///
  /// This is used only for rules whose statements do not reference a rule group.
  /// Rule statements that reference a rule group include
  /// <code>RuleGroupReferenceStatement</code> and
  /// <code>ManagedRuleGroupStatement</code>.
  ///
  /// You must specify either this <code>Action</code> setting or the rule
  /// <code>OverrideAction</code> setting, but not both:
  ///
  /// <ul>
  /// <li>
  /// If the rule statement does not reference a rule group, use this rule action
  /// setting and not the rule override action setting.
  /// </li>
  /// <li>
  /// If the rule statement references a rule group, use the override action
  /// setting and not this action setting.
  /// </li>
  /// </ul>
  final RuleAction? action;

  /// The override action to apply to the rules in a rule group. Used only for
  /// rule statements that reference a rule group, like
  /// <code>RuleGroupReferenceStatement</code> and
  /// <code>ManagedRuleGroupStatement</code>.
  ///
  /// Set the override action to none to leave the rule actions in effect. Set it
  /// to count to only count matches, regardless of the rule action settings.
  ///
  /// In a <a>Rule</a>, you must specify either this <code>OverrideAction</code>
  /// setting or the rule <code>Action</code> setting, but not both:
  ///
  /// <ul>
  /// <li>
  /// If the rule statement references a rule group, use this override action
  /// setting and not the action setting.
  /// </li>
  /// <li>
  /// If the rule statement does not reference a rule group, use the rule action
  /// setting and not this rule override action setting.
  /// </li>
  /// </ul>
  final OverrideAction? overrideAction;

  Rule({
    required this.name,
    required this.priority,
    required this.statement,
    required this.visibilityConfig,
    this.action,
    this.overrideAction,
  });
  factory Rule.fromJson(Map<String, dynamic> json) {
    return Rule(
      name: json['Name'] as String,
      priority: json['Priority'] as int,
      statement: Statement.fromJson(json['Statement'] as Map<String, dynamic>),
      visibilityConfig: VisibilityConfig.fromJson(
          json['VisibilityConfig'] as Map<String, dynamic>),
      action: json['Action'] != null
          ? RuleAction.fromJson(json['Action'] as Map<String, dynamic>)
          : null,
      overrideAction: json['OverrideAction'] != null
          ? OverrideAction.fromJson(
              json['OverrideAction'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final priority = this.priority;
    final statement = this.statement;
    final visibilityConfig = this.visibilityConfig;
    final action = this.action;
    final overrideAction = this.overrideAction;
    return {
      'Name': name,
      'Priority': priority,
      'Statement': statement,
      'VisibilityConfig': visibilityConfig,
      if (action != null) 'Action': action,
      if (overrideAction != null) 'OverrideAction': overrideAction,
    };
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// The action that AWS WAF should take on a web request when it matches a
/// rule's statement. Settings at the web ACL level can override the rule action
/// setting.
class RuleAction {
  /// Instructs AWS WAF to allow the web request.
  final AllowAction? allow;

  /// Instructs AWS WAF to block the web request.
  final BlockAction? block;

  /// Instructs AWS WAF to count the web request and allow it.
  final CountAction? count;

  RuleAction({
    this.allow,
    this.block,
    this.count,
  });
  factory RuleAction.fromJson(Map<String, dynamic> json) {
    return RuleAction(
      allow: json['Allow'] != null
          ? AllowAction.fromJson(json['Allow'] as Map<String, dynamic>)
          : null,
      block: json['Block'] != null
          ? BlockAction.fromJson(json['Block'] as Map<String, dynamic>)
          : null,
      count: json['Count'] != null
          ? CountAction.fromJson(json['Count'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final allow = this.allow;
    final block = this.block;
    final count = this.count;
    return {
      if (allow != null) 'Allow': allow,
      if (block != null) 'Block': block,
      if (count != null) 'Count': count,
    };
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// A rule group defines a collection of rules to inspect and control web
/// requests that you can use in a <a>WebACL</a>. When you create a rule group,
/// you define an immutable capacity limit. If you update a rule group, you must
/// stay within the capacity. This allows others to reuse the rule group with
/// confidence in its capacity requirements.
class RuleGroup {
  /// The Amazon Resource Name (ARN) of the entity.
  final String arn;

  /// The web ACL capacity units (WCUs) required for this rule group.
  ///
  /// When you create your own rule group, you define this, and you cannot change
  /// it after creation. When you add or modify the rules in a rule group, AWS WAF
  /// enforces this limit. You can check the capacity for a set of rules using
  /// <a>CheckCapacity</a>.
  ///
  /// AWS WAF uses WCUs to calculate and control the operating resources that are
  /// used to run your rules, rule groups, and web ACLs. AWS WAF calculates
  /// capacity differently for each rule type, to reflect the relative cost of
  /// each rule. Simple rules that cost little to run use fewer WCUs than more
  /// complex rules that use more processing power. Rule group capacity is fixed
  /// at creation, which helps users plan their web ACL WCU usage when they use a
  /// rule group. The WCU limit for web ACLs is 1,500.
  final int capacity;

  /// A unique identifier for the rule group. This ID is returned in the responses
  /// to create and list commands. You provide it to operations like update and
  /// delete.
  final String id;

  /// The name of the rule group. You cannot change the name of a rule group after
  /// you create it.
  final String name;

  /// Defines and enables Amazon CloudWatch metrics and web request sample
  /// collection.
  final VisibilityConfig visibilityConfig;

  /// A description of the rule group that helps with identification. You cannot
  /// change the description of a rule group after you create it.
  final String? description;

  /// The <a>Rule</a> statements used to identify the web requests that you want
  /// to allow, block, or count. Each rule includes one top-level statement that
  /// AWS WAF uses to identify matching web requests, and parameters that govern
  /// how AWS WAF handles them.
  final List<Rule>? rules;

  RuleGroup({
    required this.arn,
    required this.capacity,
    required this.id,
    required this.name,
    required this.visibilityConfig,
    this.description,
    this.rules,
  });
  factory RuleGroup.fromJson(Map<String, dynamic> json) {
    return RuleGroup(
      arn: json['ARN'] as String,
      capacity: json['Capacity'] as int,
      id: json['Id'] as String,
      name: json['Name'] as String,
      visibilityConfig: VisibilityConfig.fromJson(
          json['VisibilityConfig'] as Map<String, dynamic>),
      description: json['Description'] as String?,
      rules: (json['Rules'] as List?)
          ?.whereNotNull()
          .map((e) => Rule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// A rule statement used to run the rules that are defined in a
/// <a>RuleGroup</a>. To use this, create a rule group with your rules, then
/// provide the ARN of the rule group in this statement.
///
/// You cannot nest a <code>RuleGroupReferenceStatement</code>, for example for
/// use inside a <code>NotStatement</code> or <code>OrStatement</code>. It can
/// only be referenced as a top-level statement within a rule.
class RuleGroupReferenceStatement {
  /// The Amazon Resource Name (ARN) of the entity.
  final String arn;

  /// The names of rules that are in the referenced rule group, but that you want
  /// AWS WAF to exclude from processing for this rule statement.
  final List<ExcludedRule>? excludedRules;

  RuleGroupReferenceStatement({
    required this.arn,
    this.excludedRules,
  });
  factory RuleGroupReferenceStatement.fromJson(Map<String, dynamic> json) {
    return RuleGroupReferenceStatement(
      arn: json['ARN'] as String,
      excludedRules: (json['ExcludedRules'] as List?)
          ?.whereNotNull()
          .map((e) => ExcludedRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final excludedRules = this.excludedRules;
    return {
      'ARN': arn,
      if (excludedRules != null) 'ExcludedRules': excludedRules,
    };
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// High-level information about a <a>RuleGroup</a>, returned by operations like
/// create and list. This provides information like the ID, that you can use to
/// retrieve and manage a <code>RuleGroup</code>, and the ARN, that you provide
/// to the <a>RuleGroupReferenceStatement</a> to use the rule group in a
/// <a>Rule</a>.
class RuleGroupSummary {
  /// The Amazon Resource Name (ARN) of the entity.
  final String? arn;

  /// A description of the rule group that helps with identification. You cannot
  /// change the description of a rule group after you create it.
  final String? description;

  /// A unique identifier for the rule group. This ID is returned in the responses
  /// to create and list commands. You provide it to operations like update and
  /// delete.
  final String? id;

  /// A token used for optimistic locking. AWS WAF returns a token to your get and
  /// list requests, to mark the state of the entity at the time of the request.
  /// To make changes to the entity associated with the token, you provide the
  /// token to operations like update and delete. AWS WAF uses the token to ensure
  /// that no changes have been made to the entity since you last retrieved it. If
  /// a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// get, and use the new token returned by that operation.
  final String? lockToken;

  /// The name of the data type instance. You cannot change the name after you
  /// create the instance.
  final String? name;

  RuleGroupSummary({
    this.arn,
    this.description,
    this.id,
    this.lockToken,
    this.name,
  });
  factory RuleGroupSummary.fromJson(Map<String, dynamic> json) {
    return RuleGroupSummary(
      arn: json['ARN'] as String?,
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      lockToken: json['LockToken'] as String?,
      name: json['Name'] as String?,
    );
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// High-level information about a <a>Rule</a>, returned by operations like
/// <a>DescribeManagedRuleGroup</a>. This provides information like the ID, that
/// you can use to retrieve and manage a <code>RuleGroup</code>, and the ARN,
/// that you provide to the <a>RuleGroupReferenceStatement</a> to use the rule
/// group in a <a>Rule</a>.
class RuleSummary {
  final RuleAction? action;

  /// The name of the rule.
  final String? name;

  RuleSummary({
    this.action,
    this.name,
  });
  factory RuleSummary.fromJson(Map<String, dynamic> json) {
    return RuleSummary(
      action: json['Action'] != null
          ? RuleAction.fromJson(json['Action'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
    );
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// Represents a single sampled web request. The response from
/// <a>GetSampledRequests</a> includes a <code>SampledHTTPRequests</code>
/// complex type that appears as <code>SampledRequests</code> in the response
/// syntax. <code>SampledHTTPRequests</code> contains an array of
/// <code>SampledHTTPRequest</code> objects.
class SampledHTTPRequest {
  /// A complex type that contains detailed information about the request.
  final HTTPRequest request;

  /// A value that indicates how one result in the response relates proportionally
  /// to other results in the response. For example, a result that has a weight of
  /// <code>2</code> represents roughly twice as many web requests as a result
  /// that has a weight of <code>1</code>.
  final int weight;

  /// The action for the <code>Rule</code> that the request matched:
  /// <code>ALLOW</code>, <code>BLOCK</code>, or <code>COUNT</code>.
  final String? action;

  /// The name of the <code>Rule</code> that the request matched. For managed rule
  /// groups, the format for this name is <code>&lt;vendor name&gt;#&lt;managed
  /// rule group name&gt;#&lt;rule name&gt;</code>. For your own rule groups, the
  /// format for this name is <code>&lt;rule group name&gt;#&lt;rule
  /// name&gt;</code>. If the rule is not in a rule group, this field is absent.
  final String? ruleNameWithinRuleGroup;

  /// The time at which AWS WAF received the request from your AWS resource, in
  /// Unix time format (in seconds).
  final DateTime? timestamp;

  SampledHTTPRequest({
    required this.request,
    required this.weight,
    this.action,
    this.ruleNameWithinRuleGroup,
    this.timestamp,
  });
  factory SampledHTTPRequest.fromJson(Map<String, dynamic> json) {
    return SampledHTTPRequest(
      request: HTTPRequest.fromJson(json['Request'] as Map<String, dynamic>),
      weight: json['Weight'] as int,
      action: json['Action'] as String?,
      ruleNameWithinRuleGroup: json['RuleNameWithinRuleGroup'] as String?,
      timestamp: timeStampFromJson(json['Timestamp']),
    );
  }
}

enum Scope {
  cloudfront,
  regional,
}

extension on Scope {
  String toValue() {
    switch (this) {
      case Scope.cloudfront:
        return 'CLOUDFRONT';
      case Scope.regional:
        return 'REGIONAL';
    }
  }
}

extension on String {
  Scope toScope() {
    switch (this) {
      case 'CLOUDFRONT':
        return Scope.cloudfront;
      case 'REGIONAL':
        return Scope.regional;
    }
    throw Exception('$this is not known in enum Scope');
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// One of the headers in a web request, identified by name, for example,
/// <code>User-Agent</code> or <code>Referer</code>. This setting isn't case
/// sensitive.
///
/// This is used only to indicate the web request component for AWS WAF to
/// inspect, in the <a>FieldToMatch</a> specification.
class SingleHeader {
  /// The name of the query header to inspect.
  final String name;

  SingleHeader({
    required this.name,
  });
  factory SingleHeader.fromJson(Map<String, dynamic> json) {
    return SingleHeader(
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'Name': name,
    };
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// One query argument in a web request, identified by name, for example
/// <i>UserName</i> or <i>SalesRegion</i>. The name can be up to 30 characters
/// long and isn't case sensitive.
class SingleQueryArgument {
  /// The name of the query argument to inspect.
  final String name;

  SingleQueryArgument({
    required this.name,
  });
  factory SingleQueryArgument.fromJson(Map<String, dynamic> json) {
    return SingleQueryArgument(
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'Name': name,
    };
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// A rule statement that compares a number of bytes against the size of a
/// request component, using a comparison operator, such as greater than (&gt;)
/// or less than (&lt;). For example, you can use a size constraint statement to
/// look for query strings that are longer than 100 bytes.
///
/// If you configure AWS WAF to inspect the request body, AWS WAF inspects only
/// the first 8192 bytes (8 KB). If the request body for your web requests never
/// exceeds 8192 bytes, you can create a size constraint condition and block
/// requests that have a request body greater than 8192 bytes.
///
/// If you choose URI for the value of Part of the request to filter on, the
/// slash (/) in the URI counts as one character. For example, the URI
/// <code>/logo.jpg</code> is nine characters long.
class SizeConstraintStatement {
  /// The operator to use to compare the request part to the size setting.
  final ComparisonOperator comparisonOperator;

  /// The part of a web request that you want AWS WAF to inspect. For more
  /// information, see <a>FieldToMatch</a>.
  final FieldToMatch fieldToMatch;

  /// The size, in byte, to compare to the request part, after any
  /// transformations.
  final int size;

  /// Text transformations eliminate some of the unusual formatting that attackers
  /// use in web requests in an effort to bypass detection. If you specify one or
  /// more transformations in a rule statement, AWS WAF performs all
  /// transformations on the content of the request component identified by
  /// <code>FieldToMatch</code>, starting from the lowest priority setting, before
  /// inspecting the content for a match.
  final List<TextTransformation> textTransformations;

  SizeConstraintStatement({
    required this.comparisonOperator,
    required this.fieldToMatch,
    required this.size,
    required this.textTransformations,
  });
  factory SizeConstraintStatement.fromJson(Map<String, dynamic> json) {
    return SizeConstraintStatement(
      comparisonOperator:
          (json['ComparisonOperator'] as String).toComparisonOperator(),
      fieldToMatch:
          FieldToMatch.fromJson(json['FieldToMatch'] as Map<String, dynamic>),
      size: json['Size'] as int,
      textTransformations: (json['TextTransformations'] as List)
          .whereNotNull()
          .map((e) => TextTransformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final comparisonOperator = this.comparisonOperator;
    final fieldToMatch = this.fieldToMatch;
    final size = this.size;
    final textTransformations = this.textTransformations;
    return {
      'ComparisonOperator': comparisonOperator.toValue(),
      'FieldToMatch': fieldToMatch,
      'Size': size,
      'TextTransformations': textTransformations,
    };
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// Attackers sometimes insert malicious SQL code into web requests in an effort
/// to extract data from your database. To allow or block web requests that
/// appear to contain malicious SQL code, create one or more SQL injection match
/// conditions. An SQL injection match condition identifies the part of web
/// requests, such as the URI or the query string, that you want AWS WAF to
/// inspect. Later in the process, when you create a web ACL, you specify
/// whether to allow or block requests that appear to contain malicious SQL
/// code.
class SqliMatchStatement {
  /// The part of a web request that you want AWS WAF to inspect. For more
  /// information, see <a>FieldToMatch</a>.
  final FieldToMatch fieldToMatch;

  /// Text transformations eliminate some of the unusual formatting that attackers
  /// use in web requests in an effort to bypass detection. If you specify one or
  /// more transformations in a rule statement, AWS WAF performs all
  /// transformations on the content of the request component identified by
  /// <code>FieldToMatch</code>, starting from the lowest priority setting, before
  /// inspecting the content for a match.
  final List<TextTransformation> textTransformations;

  SqliMatchStatement({
    required this.fieldToMatch,
    required this.textTransformations,
  });
  factory SqliMatchStatement.fromJson(Map<String, dynamic> json) {
    return SqliMatchStatement(
      fieldToMatch:
          FieldToMatch.fromJson(json['FieldToMatch'] as Map<String, dynamic>),
      textTransformations: (json['TextTransformations'] as List)
          .whereNotNull()
          .map((e) => TextTransformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final fieldToMatch = this.fieldToMatch;
    final textTransformations = this.textTransformations;
    return {
      'FieldToMatch': fieldToMatch,
      'TextTransformations': textTransformations,
    };
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// The processing guidance for a <a>Rule</a>, used by AWS WAF to determine
/// whether a web request matches the rule.
class Statement {
  /// A logical rule statement used to combine other rule statements with AND
  /// logic. You provide more than one <a>Statement</a> within the
  /// <code>AndStatement</code>.
  final AndStatement? andStatement;

  /// A rule statement that defines a string match search for AWS WAF to apply to
  /// web requests. The byte match statement provides the bytes to search for, the
  /// location in requests that you want AWS WAF to search, and other settings.
  /// The bytes to search for are typically a string that corresponds with ASCII
  /// characters. In the AWS WAF console and the developer guide, this is refered
  /// to as a string match statement.
  final ByteMatchStatement? byteMatchStatement;

  /// A rule statement used to identify web requests based on country of origin.
  final GeoMatchStatement? geoMatchStatement;

  /// A rule statement used to detect web requests coming from particular IP
  /// addresses or address ranges. To use this, create an <a>IPSet</a> that
  /// specifies the addresses you want to detect, then use the ARN of that set in
  /// this statement. To create an IP set, see <a>CreateIPSet</a>.
  ///
  /// Each IP set rule statement references an IP set. You create and maintain the
  /// set independent of your rules. This allows you to use the single set in
  /// multiple rules. When you update the referenced set, AWS WAF automatically
  /// updates all rules that reference it.
  final IPSetReferenceStatement? iPSetReferenceStatement;

  /// A rule statement used to run the rules that are defined in a managed rule
  /// group. To use this, provide the vendor name and the name of the rule group
  /// in this statement. You can retrieve the required names by calling
  /// <a>ListAvailableManagedRuleGroups</a>.
  ///
  /// You can't nest a <code>ManagedRuleGroupStatement</code>, for example for use
  /// inside a <code>NotStatement</code> or <code>OrStatement</code>. It can only
  /// be referenced as a top-level statement within a rule.
  final ManagedRuleGroupStatement? managedRuleGroupStatement;

  /// A logical rule statement used to negate the results of another rule
  /// statement. You provide one <a>Statement</a> within the
  /// <code>NotStatement</code>.
  final NotStatement? notStatement;

  /// A logical rule statement used to combine other rule statements with OR
  /// logic. You provide more than one <a>Statement</a> within the
  /// <code>OrStatement</code>.
  final OrStatement? orStatement;

  /// A rate-based rule tracks the rate of requests for each originating IP
  /// address, and triggers the rule action when the rate exceeds a limit that you
  /// specify on the number of requests in any 5-minute time span. You can use
  /// this to put a temporary block on requests from an IP address that is sending
  /// excessive requests.
  ///
  /// When the rule action triggers, AWS WAF blocks additional requests from the
  /// IP address until the request rate falls below the limit.
  ///
  /// You can optionally nest another statement inside the rate-based statement,
  /// to narrow the scope of the rule so that it only counts requests that match
  /// the nested statement. For example, based on recent requests that you have
  /// seen from an attacker, you might create a rate-based rule with a nested AND
  /// rule statement that contains the following nested statements:
  ///
  /// <ul>
  /// <li>
  /// An IP match statement with an IP set that specified the address 192.0.2.44.
  /// </li>
  /// <li>
  /// A string match statement that searches in the User-Agent header for the
  /// string BadBot.
  /// </li>
  /// </ul>
  /// In this rate-based rule, you also define a rate limit. For this example, the
  /// rate limit is 1,000. Requests that meet both of the conditions in the
  /// statements are counted. If the count exceeds 1,000 requests per five
  /// minutes, the rule action triggers. Requests that do not meet both conditions
  /// are not counted towards the rate limit and are not affected by this rule.
  ///
  /// You cannot nest a <code>RateBasedStatement</code>, for example for use
  /// inside a <code>NotStatement</code> or <code>OrStatement</code>. It can only
  /// be referenced as a top-level statement within a rule.
  final RateBasedStatement? rateBasedStatement;

  /// A rule statement used to search web request components for matches with
  /// regular expressions. To use this, create a <a>RegexPatternSet</a> that
  /// specifies the expressions that you want to detect, then use the ARN of that
  /// set in this statement. A web request matches the pattern set rule statement
  /// if the request component matches any of the patterns in the set. To create a
  /// regex pattern set, see <a>CreateRegexPatternSet</a>.
  ///
  /// Each regex pattern set rule statement references a regex pattern set. You
  /// create and maintain the set independent of your rules. This allows you to
  /// use the single set in multiple rules. When you update the referenced set,
  /// AWS WAF automatically updates all rules that reference it.
  final RegexPatternSetReferenceStatement? regexPatternSetReferenceStatement;

  /// A rule statement used to run the rules that are defined in a
  /// <a>RuleGroup</a>. To use this, create a rule group with your rules, then
  /// provide the ARN of the rule group in this statement.
  ///
  /// You cannot nest a <code>RuleGroupReferenceStatement</code>, for example for
  /// use inside a <code>NotStatement</code> or <code>OrStatement</code>. It can
  /// only be referenced as a top-level statement within a rule.
  final RuleGroupReferenceStatement? ruleGroupReferenceStatement;

  /// A rule statement that compares a number of bytes against the size of a
  /// request component, using a comparison operator, such as greater than (&gt;)
  /// or less than (&lt;). For example, you can use a size constraint statement to
  /// look for query strings that are longer than 100 bytes.
  ///
  /// If you configure AWS WAF to inspect the request body, AWS WAF inspects only
  /// the first 8192 bytes (8 KB). If the request body for your web requests never
  /// exceeds 8192 bytes, you can create a size constraint condition and block
  /// requests that have a request body greater than 8192 bytes.
  ///
  /// If you choose URI for the value of Part of the request to filter on, the
  /// slash (/) in the URI counts as one character. For example, the URI
  /// <code>/logo.jpg</code> is nine characters long.
  final SizeConstraintStatement? sizeConstraintStatement;

  /// Attackers sometimes insert malicious SQL code into web requests in an effort
  /// to extract data from your database. To allow or block web requests that
  /// appear to contain malicious SQL code, create one or more SQL injection match
  /// conditions. An SQL injection match condition identifies the part of web
  /// requests, such as the URI or the query string, that you want AWS WAF to
  /// inspect. Later in the process, when you create a web ACL, you specify
  /// whether to allow or block requests that appear to contain malicious SQL
  /// code.
  final SqliMatchStatement? sqliMatchStatement;

  /// A rule statement that defines a cross-site scripting (XSS) match search for
  /// AWS WAF to apply to web requests. XSS attacks are those where the attacker
  /// uses vulnerabilities in a benign website as a vehicle to inject malicious
  /// client-site scripts into other legitimate web browsers. The XSS match
  /// statement provides the location in requests that you want AWS WAF to search
  /// and text transformations to use on the search area before AWS WAF searches
  /// for character sequences that are likely to be malicious strings.
  final XssMatchStatement? xssMatchStatement;

  Statement({
    this.andStatement,
    this.byteMatchStatement,
    this.geoMatchStatement,
    this.iPSetReferenceStatement,
    this.managedRuleGroupStatement,
    this.notStatement,
    this.orStatement,
    this.rateBasedStatement,
    this.regexPatternSetReferenceStatement,
    this.ruleGroupReferenceStatement,
    this.sizeConstraintStatement,
    this.sqliMatchStatement,
    this.xssMatchStatement,
  });
  factory Statement.fromJson(Map<String, dynamic> json) {
    return Statement(
      andStatement: json['AndStatement'] != null
          ? AndStatement.fromJson(json['AndStatement'] as Map<String, dynamic>)
          : null,
      byteMatchStatement: json['ByteMatchStatement'] != null
          ? ByteMatchStatement.fromJson(
              json['ByteMatchStatement'] as Map<String, dynamic>)
          : null,
      geoMatchStatement: json['GeoMatchStatement'] != null
          ? GeoMatchStatement.fromJson(
              json['GeoMatchStatement'] as Map<String, dynamic>)
          : null,
      iPSetReferenceStatement: json['IPSetReferenceStatement'] != null
          ? IPSetReferenceStatement.fromJson(
              json['IPSetReferenceStatement'] as Map<String, dynamic>)
          : null,
      managedRuleGroupStatement: json['ManagedRuleGroupStatement'] != null
          ? ManagedRuleGroupStatement.fromJson(
              json['ManagedRuleGroupStatement'] as Map<String, dynamic>)
          : null,
      notStatement: json['NotStatement'] != null
          ? NotStatement.fromJson(json['NotStatement'] as Map<String, dynamic>)
          : null,
      orStatement: json['OrStatement'] != null
          ? OrStatement.fromJson(json['OrStatement'] as Map<String, dynamic>)
          : null,
      rateBasedStatement: json['RateBasedStatement'] != null
          ? RateBasedStatement.fromJson(
              json['RateBasedStatement'] as Map<String, dynamic>)
          : null,
      regexPatternSetReferenceStatement:
          json['RegexPatternSetReferenceStatement'] != null
              ? RegexPatternSetReferenceStatement.fromJson(
                  json['RegexPatternSetReferenceStatement']
                      as Map<String, dynamic>)
              : null,
      ruleGroupReferenceStatement: json['RuleGroupReferenceStatement'] != null
          ? RuleGroupReferenceStatement.fromJson(
              json['RuleGroupReferenceStatement'] as Map<String, dynamic>)
          : null,
      sizeConstraintStatement: json['SizeConstraintStatement'] != null
          ? SizeConstraintStatement.fromJson(
              json['SizeConstraintStatement'] as Map<String, dynamic>)
          : null,
      sqliMatchStatement: json['SqliMatchStatement'] != null
          ? SqliMatchStatement.fromJson(
              json['SqliMatchStatement'] as Map<String, dynamic>)
          : null,
      xssMatchStatement: json['XssMatchStatement'] != null
          ? XssMatchStatement.fromJson(
              json['XssMatchStatement'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final andStatement = this.andStatement;
    final byteMatchStatement = this.byteMatchStatement;
    final geoMatchStatement = this.geoMatchStatement;
    final iPSetReferenceStatement = this.iPSetReferenceStatement;
    final managedRuleGroupStatement = this.managedRuleGroupStatement;
    final notStatement = this.notStatement;
    final orStatement = this.orStatement;
    final rateBasedStatement = this.rateBasedStatement;
    final regexPatternSetReferenceStatement =
        this.regexPatternSetReferenceStatement;
    final ruleGroupReferenceStatement = this.ruleGroupReferenceStatement;
    final sizeConstraintStatement = this.sizeConstraintStatement;
    final sqliMatchStatement = this.sqliMatchStatement;
    final xssMatchStatement = this.xssMatchStatement;
    return {
      if (andStatement != null) 'AndStatement': andStatement,
      if (byteMatchStatement != null) 'ByteMatchStatement': byteMatchStatement,
      if (geoMatchStatement != null) 'GeoMatchStatement': geoMatchStatement,
      if (iPSetReferenceStatement != null)
        'IPSetReferenceStatement': iPSetReferenceStatement,
      if (managedRuleGroupStatement != null)
        'ManagedRuleGroupStatement': managedRuleGroupStatement,
      if (notStatement != null) 'NotStatement': notStatement,
      if (orStatement != null) 'OrStatement': orStatement,
      if (rateBasedStatement != null) 'RateBasedStatement': rateBasedStatement,
      if (regexPatternSetReferenceStatement != null)
        'RegexPatternSetReferenceStatement': regexPatternSetReferenceStatement,
      if (ruleGroupReferenceStatement != null)
        'RuleGroupReferenceStatement': ruleGroupReferenceStatement,
      if (sizeConstraintStatement != null)
        'SizeConstraintStatement': sizeConstraintStatement,
      if (sqliMatchStatement != null) 'SqliMatchStatement': sqliMatchStatement,
      if (xssMatchStatement != null) 'XssMatchStatement': xssMatchStatement,
    };
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// A tag associated with an AWS resource. Tags are key:value pairs that you can
/// use to categorize and manage your resources, for purposes like billing or
/// other management. Typically, the tag key represents a category, such as
/// "environment", and the tag value represents a specific value within that
/// category, such as "test," "development," or "production". Or you might set
/// the tag key to "customer" and the value to the customer name or ID. You can
/// specify one or more tags to add to each AWS resource, up to 50 tags for a
/// resource.
///
/// You can tag the AWS resources that you manage through AWS WAF: web ACLs,
/// rule groups, IP sets, and regex pattern sets. You can't manage or view tags
/// through the AWS WAF console.
class Tag {
  /// Part of the key:value pair that defines a tag. You can use a tag key to
  /// describe a category of information, such as "customer." Tag keys are
  /// case-sensitive.
  final String key;

  /// Part of the key:value pair that defines a tag. You can use a tag value to
  /// describe a specific value within a category, such as "companyA" or
  /// "companyB." Tag values are case-sensitive.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String,
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value,
    };
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// The collection of tagging definitions for an AWS resource. Tags are
/// key:value pairs that you can use to categorize and manage your resources,
/// for purposes like billing or other management. Typically, the tag key
/// represents a category, such as "environment", and the tag value represents a
/// specific value within that category, such as "test," "development," or
/// "production". Or you might set the tag key to "customer" and the value to
/// the customer name or ID. You can specify one or more tags to add to each AWS
/// resource, up to 50 tags for a resource.
///
/// You can tag the AWS resources that you manage through AWS WAF: web ACLs,
/// rule groups, IP sets, and regex pattern sets. You can't manage or view tags
/// through the AWS WAF console.
class TagInfoForResource {
  /// The Amazon Resource Name (ARN) of the resource.
  final String? resourceARN;

  /// The array of <a>Tag</a> objects defined for the resource.
  final List<Tag>? tagList;

  TagInfoForResource({
    this.resourceARN,
    this.tagList,
  });
  factory TagInfoForResource.fromJson(Map<String, dynamic> json) {
    return TagInfoForResource(
      resourceARN: json['ResourceARN'] as String?,
      tagList: (json['TagList'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// Text transformations eliminate some of the unusual formatting that attackers
/// use in web requests in an effort to bypass detection.
class TextTransformation {
  /// Sets the relative processing order for multiple transformations that are
  /// defined for a rule statement. AWS WAF processes all transformations, from
  /// lowest priority to highest, before inspecting the transformed content. The
  /// priorities don't need to be consecutive, but they must all be different.
  final int priority;

  /// You can specify the following transformation types:
  ///
  /// <b>CMD_LINE</b>
  ///
  /// When you're concerned that attackers are injecting an operating system
  /// command line command and using unusual formatting to disguise some or all of
  /// the command, use this option to perform the following transformations:
  ///
  /// <ul>
  /// <li>
  /// Delete the following characters: \ " ' ^
  /// </li>
  /// <li>
  /// Delete spaces before the following characters: / (
  /// </li>
  /// <li>
  /// Replace the following characters with a space: , ;
  /// </li>
  /// <li>
  /// Replace multiple spaces with one space
  /// </li>
  /// <li>
  /// Convert uppercase letters (A-Z) to lowercase (a-z)
  /// </li>
  /// </ul>
  /// <b>COMPRESS_WHITE_SPACE</b>
  ///
  /// Use this option to replace the following characters with a space character
  /// (decimal 32):
  ///
  /// <ul>
  /// <li>
  /// \f, formfeed, decimal 12
  /// </li>
  /// <li>
  /// \t, tab, decimal 9
  /// </li>
  /// <li>
  /// \n, newline, decimal 10
  /// </li>
  /// <li>
  /// \r, carriage return, decimal 13
  /// </li>
  /// <li>
  /// \v, vertical tab, decimal 11
  /// </li>
  /// <li>
  /// non-breaking space, decimal 160
  /// </li>
  /// </ul>
  /// <code>COMPRESS_WHITE_SPACE</code> also replaces multiple spaces with one
  /// space.
  ///
  /// <b>HTML_ENTITY_DECODE</b>
  ///
  /// Use this option to replace HTML-encoded characters with unencoded
  /// characters. <code>HTML_ENTITY_DECODE</code> performs the following
  /// operations:
  ///
  /// <ul>
  /// <li>
  /// Replaces <code>(ampersand)quot;</code> with <code>"</code>
  /// </li>
  /// <li>
  /// Replaces <code>(ampersand)nbsp;</code> with a non-breaking space, decimal
  /// 160
  /// </li>
  /// <li>
  /// Replaces <code>(ampersand)lt;</code> with a "less than" symbol
  /// </li>
  /// <li>
  /// Replaces <code>(ampersand)gt;</code> with <code>&gt;</code>
  /// </li>
  /// <li>
  /// Replaces characters that are represented in hexadecimal format,
  /// <code>(ampersand)#xhhhh;</code>, with the corresponding characters
  /// </li>
  /// <li>
  /// Replaces characters that are represented in decimal format,
  /// <code>(ampersand)#nnnn;</code>, with the corresponding characters
  /// </li>
  /// </ul>
  /// <b>LOWERCASE</b>
  ///
  /// Use this option to convert uppercase letters (A-Z) to lowercase (a-z).
  ///
  /// <b>URL_DECODE</b>
  ///
  /// Use this option to decode a URL-encoded value.
  ///
  /// <b>NONE</b>
  ///
  /// Specify <code>NONE</code> if you don't want any text transformations.
  final TextTransformationType type;

  TextTransformation({
    required this.priority,
    required this.type,
  });
  factory TextTransformation.fromJson(Map<String, dynamic> json) {
    return TextTransformation(
      priority: json['Priority'] as int,
      type: (json['Type'] as String).toTextTransformationType(),
    );
  }

  Map<String, dynamic> toJson() {
    final priority = this.priority;
    final type = this.type;
    return {
      'Priority': priority,
      'Type': type.toValue(),
    };
  }
}

enum TextTransformationType {
  none,
  compressWhiteSpace,
  htmlEntityDecode,
  lowercase,
  cmdLine,
  urlDecode,
}

extension on TextTransformationType {
  String toValue() {
    switch (this) {
      case TextTransformationType.none:
        return 'NONE';
      case TextTransformationType.compressWhiteSpace:
        return 'COMPRESS_WHITE_SPACE';
      case TextTransformationType.htmlEntityDecode:
        return 'HTML_ENTITY_DECODE';
      case TextTransformationType.lowercase:
        return 'LOWERCASE';
      case TextTransformationType.cmdLine:
        return 'CMD_LINE';
      case TextTransformationType.urlDecode:
        return 'URL_DECODE';
    }
  }
}

extension on String {
  TextTransformationType toTextTransformationType() {
    switch (this) {
      case 'NONE':
        return TextTransformationType.none;
      case 'COMPRESS_WHITE_SPACE':
        return TextTransformationType.compressWhiteSpace;
      case 'HTML_ENTITY_DECODE':
        return TextTransformationType.htmlEntityDecode;
      case 'LOWERCASE':
        return TextTransformationType.lowercase;
      case 'CMD_LINE':
        return TextTransformationType.cmdLine;
      case 'URL_DECODE':
        return TextTransformationType.urlDecode;
    }
    throw Exception('$this is not known in enum TextTransformationType');
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// In a <a>GetSampledRequests</a> request, the <code>StartTime</code> and
/// <code>EndTime</code> objects specify the time range for which you want AWS
/// WAF to return a sample of web requests.
///
/// You must specify the times in Coordinated Universal Time (UTC) format. UTC
/// format includes the special designator, <code>Z</code>. For example,
/// <code>"2016-09-27T14:50Z"</code>. You can specify any time range in the
/// previous three hours.
///
/// In a <a>GetSampledRequests</a> response, the <code>StartTime</code> and
/// <code>EndTime</code> objects specify the time range for which AWS WAF
/// actually returned a sample of web requests. AWS WAF gets the specified
/// number of requests from among the first 5,000 requests that your AWS
/// resource receives during the specified time period. If your resource
/// receives more than 5,000 requests during that period, AWS WAF stops sampling
/// after the 5,000th request. In that case, <code>EndTime</code> is the time
/// that AWS WAF received the 5,000th request.
class TimeWindow {
  /// The end of the time range from which you want
  /// <code>GetSampledRequests</code> to return a sample of the requests that your
  /// AWS resource received. You must specify the times in Coordinated Universal
  /// Time (UTC) format. UTC format includes the special designator,
  /// <code>Z</code>. For example, <code>"2016-09-27T14:50Z"</code>. You can
  /// specify any time range in the previous three hours.
  final DateTime endTime;

  /// The beginning of the time range from which you want
  /// <code>GetSampledRequests</code> to return a sample of the requests that your
  /// AWS resource received. You must specify the times in Coordinated Universal
  /// Time (UTC) format. UTC format includes the special designator,
  /// <code>Z</code>. For example, <code>"2016-09-27T14:50Z"</code>. You can
  /// specify any time range in the previous three hours.
  final DateTime startTime;

  TimeWindow({
    required this.endTime,
    required this.startTime,
  });
  factory TimeWindow.fromJson(Map<String, dynamic> json) {
    return TimeWindow(
      endTime: nonNullableTimeStampFromJson(json['EndTime'] as Object),
      startTime: nonNullableTimeStampFromJson(json['StartTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final startTime = this.startTime;
    return {
      'EndTime': unixTimestampToJson(endTime),
      'StartTime': unixTimestampToJson(startTime),
    };
  }
}

class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }
}

class UpdateIPSetResponse {
  /// A token used for optimistic locking. AWS WAF returns this token to your
  /// update requests. You use <code>NextLockToken</code> in the same manner as
  /// you use <code>LockToken</code>.
  final String? nextLockToken;

  UpdateIPSetResponse({
    this.nextLockToken,
  });
  factory UpdateIPSetResponse.fromJson(Map<String, dynamic> json) {
    return UpdateIPSetResponse(
      nextLockToken: json['NextLockToken'] as String?,
    );
  }
}

class UpdateRegexPatternSetResponse {
  /// A token used for optimistic locking. AWS WAF returns this token to your
  /// update requests. You use <code>NextLockToken</code> in the same manner as
  /// you use <code>LockToken</code>.
  final String? nextLockToken;

  UpdateRegexPatternSetResponse({
    this.nextLockToken,
  });
  factory UpdateRegexPatternSetResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRegexPatternSetResponse(
      nextLockToken: json['NextLockToken'] as String?,
    );
  }
}

class UpdateRuleGroupResponse {
  /// A token used for optimistic locking. AWS WAF returns this token to your
  /// update requests. You use <code>NextLockToken</code> in the same manner as
  /// you use <code>LockToken</code>.
  final String? nextLockToken;

  UpdateRuleGroupResponse({
    this.nextLockToken,
  });
  factory UpdateRuleGroupResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRuleGroupResponse(
      nextLockToken: json['NextLockToken'] as String?,
    );
  }
}

class UpdateWebACLResponse {
  /// A token used for optimistic locking. AWS WAF returns this token to your
  /// update requests. You use <code>NextLockToken</code> in the same manner as
  /// you use <code>LockToken</code>.
  final String? nextLockToken;

  UpdateWebACLResponse({
    this.nextLockToken,
  });
  factory UpdateWebACLResponse.fromJson(Map<String, dynamic> json) {
    return UpdateWebACLResponse(
      nextLockToken: json['NextLockToken'] as String?,
    );
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// The path component of the URI of a web request. This is the part of a web
/// request that identifies a resource, for example,
/// <code>/images/daily-ad.jpg</code>.
///
/// This is used only to indicate the web request component for AWS WAF to
/// inspect, in the <a>FieldToMatch</a> specification.
class UriPath {
  UriPath();
  factory UriPath.fromJson(Map<String, dynamic> _) {
    return UriPath();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// Defines and enables Amazon CloudWatch metrics and web request sample
/// collection.
class VisibilityConfig {
  /// A boolean indicating whether the associated resource sends metrics to
  /// CloudWatch. For the list of available metrics, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/monitoring-cloudwatch.html#waf-metrics">AWS
  /// WAF Metrics</a>.
  final bool cloudWatchMetricsEnabled;

  /// A name of the CloudWatch metric. The name can contain only the characters:
  /// A-Z, a-z, 0-9, - (hyphen), and _ (underscore). The name can be from one to
  /// 128 characters long. It can't contain whitespace or metric names reserved
  /// for AWS WAF, for example "All" and "Default_Action."
  final String metricName;

  /// A boolean indicating whether AWS WAF should store a sampling of the web
  /// requests that match the rules. You can view the sampled requests through the
  /// AWS WAF console.
  final bool sampledRequestsEnabled;

  VisibilityConfig({
    required this.cloudWatchMetricsEnabled,
    required this.metricName,
    required this.sampledRequestsEnabled,
  });
  factory VisibilityConfig.fromJson(Map<String, dynamic> json) {
    return VisibilityConfig(
      cloudWatchMetricsEnabled: json['CloudWatchMetricsEnabled'] as bool,
      metricName: json['MetricName'] as String,
      sampledRequestsEnabled: json['SampledRequestsEnabled'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchMetricsEnabled = this.cloudWatchMetricsEnabled;
    final metricName = this.metricName;
    final sampledRequestsEnabled = this.sampledRequestsEnabled;
    return {
      'CloudWatchMetricsEnabled': cloudWatchMetricsEnabled,
      'MetricName': metricName,
      'SampledRequestsEnabled': sampledRequestsEnabled,
    };
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// A Web ACL defines a collection of rules to use to inspect and control web
/// requests. Each rule has an action defined (allow, block, or count) for
/// requests that match the statement of the rule. In the Web ACL, you assign a
/// default action to take (allow, block) for any request that does not match
/// any of the rules. The rules in a Web ACL can be a combination of the types
/// <a>Rule</a>, <a>RuleGroup</a>, and managed rule group. You can associate a
/// Web ACL with one or more AWS resources to protect. The resources can be
/// Amazon CloudFront, an Amazon API Gateway REST API, an Application Load
/// Balancer, or an AWS AppSync GraphQL API.
class WebACL {
  /// The Amazon Resource Name (ARN) of the Web ACL that you want to associate
  /// with the resource.
  final String arn;

  /// The action to perform if none of the <code>Rules</code> contained in the
  /// <code>WebACL</code> match.
  final DefaultAction defaultAction;

  /// A unique identifier for the <code>WebACL</code>. This ID is returned in the
  /// responses to create and list commands. You use this ID to do things like
  /// get, update, and delete a <code>WebACL</code>.
  final String id;

  /// The name of the Web ACL. You cannot change the name of a Web ACL after you
  /// create it.
  final String name;

  /// Defines and enables Amazon CloudWatch metrics and web request sample
  /// collection.
  final VisibilityConfig visibilityConfig;

  /// The web ACL capacity units (WCUs) currently being used by this web ACL.
  ///
  /// AWS WAF uses WCUs to calculate and control the operating resources that are
  /// used to run your rules, rule groups, and web ACLs. AWS WAF calculates
  /// capacity differently for each rule type, to reflect the relative cost of
  /// each rule. Simple rules that cost little to run use fewer WCUs than more
  /// complex rules that use more processing power. Rule group capacity is fixed
  /// at creation, which helps users plan their web ACL WCU usage when they use a
  /// rule group. The WCU limit for web ACLs is 1,500.
  final int? capacity;

  /// A description of the Web ACL that helps with identification. You cannot
  /// change the description of a Web ACL after you create it.
  final String? description;

  /// Indicates whether this web ACL is managed by AWS Firewall Manager. If true,
  /// then only AWS Firewall Manager can delete the web ACL or any Firewall
  /// Manager rule groups in the web ACL.
  final bool? managedByFirewallManager;

  /// The last set of rules for AWS WAF to process in the web ACL. This is defined
  /// in an AWS Firewall Manager WAF policy and contains only rule group
  /// references. You can't alter these. Any rules and rule groups that you define
  /// for the web ACL are prioritized before these.
  ///
  /// In the Firewall Manager WAF policy, the Firewall Manager administrator can
  /// define a set of rule groups to run first in the web ACL and a set of rule
  /// groups to run last. Within each set, the administrator prioritizes the rule
  /// groups, to determine their relative processing order.
  final List<FirewallManagerRuleGroup>? postProcessFirewallManagerRuleGroups;

  /// The first set of rules for AWS WAF to process in the web ACL. This is
  /// defined in an AWS Firewall Manager WAF policy and contains only rule group
  /// references. You can't alter these. Any rules and rule groups that you define
  /// for the web ACL are prioritized after these.
  ///
  /// In the Firewall Manager WAF policy, the Firewall Manager administrator can
  /// define a set of rule groups to run first in the web ACL and a set of rule
  /// groups to run last. Within each set, the administrator prioritizes the rule
  /// groups, to determine their relative processing order.
  final List<FirewallManagerRuleGroup>? preProcessFirewallManagerRuleGroups;

  /// The <a>Rule</a> statements used to identify the web requests that you want
  /// to allow, block, or count. Each rule includes one top-level statement that
  /// AWS WAF uses to identify matching web requests, and parameters that govern
  /// how AWS WAF handles them.
  final List<Rule>? rules;

  WebACL({
    required this.arn,
    required this.defaultAction,
    required this.id,
    required this.name,
    required this.visibilityConfig,
    this.capacity,
    this.description,
    this.managedByFirewallManager,
    this.postProcessFirewallManagerRuleGroups,
    this.preProcessFirewallManagerRuleGroups,
    this.rules,
  });
  factory WebACL.fromJson(Map<String, dynamic> json) {
    return WebACL(
      arn: json['ARN'] as String,
      defaultAction:
          DefaultAction.fromJson(json['DefaultAction'] as Map<String, dynamic>),
      id: json['Id'] as String,
      name: json['Name'] as String,
      visibilityConfig: VisibilityConfig.fromJson(
          json['VisibilityConfig'] as Map<String, dynamic>),
      capacity: json['Capacity'] as int?,
      description: json['Description'] as String?,
      managedByFirewallManager: json['ManagedByFirewallManager'] as bool?,
      postProcessFirewallManagerRuleGroups:
          (json['PostProcessFirewallManagerRuleGroups'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  FirewallManagerRuleGroup.fromJson(e as Map<String, dynamic>))
              .toList(),
      preProcessFirewallManagerRuleGroups:
          (json['PreProcessFirewallManagerRuleGroups'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  FirewallManagerRuleGroup.fromJson(e as Map<String, dynamic>))
              .toList(),
      rules: (json['Rules'] as List?)
          ?.whereNotNull()
          .map((e) => Rule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// High-level information about a <a>WebACL</a>, returned by operations like
/// create and list. This provides information like the ID, that you can use to
/// retrieve and manage a <code>WebACL</code>, and the ARN, that you provide to
/// operations like <a>AssociateWebACL</a>.
class WebACLSummary {
  /// The Amazon Resource Name (ARN) of the entity.
  final String? arn;

  /// A description of the Web ACL that helps with identification. You cannot
  /// change the description of a Web ACL after you create it.
  final String? description;

  /// The unique identifier for the Web ACL. This ID is returned in the responses
  /// to create and list commands. You provide it to operations like update and
  /// delete.
  final String? id;

  /// A token used for optimistic locking. AWS WAF returns a token to your get and
  /// list requests, to mark the state of the entity at the time of the request.
  /// To make changes to the entity associated with the token, you provide the
  /// token to operations like update and delete. AWS WAF uses the token to ensure
  /// that no changes have been made to the entity since you last retrieved it. If
  /// a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// get, and use the new token returned by that operation.
  final String? lockToken;

  /// The name of the Web ACL. You cannot change the name of a Web ACL after you
  /// create it.
  final String? name;

  WebACLSummary({
    this.arn,
    this.description,
    this.id,
    this.lockToken,
    this.name,
  });
  factory WebACLSummary.fromJson(Map<String, dynamic> json) {
    return WebACLSummary(
      arn: json['ARN'] as String?,
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      lockToken: json['LockToken'] as String?,
      name: json['Name'] as String?,
    );
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// A rule statement that defines a cross-site scripting (XSS) match search for
/// AWS WAF to apply to web requests. XSS attacks are those where the attacker
/// uses vulnerabilities in a benign website as a vehicle to inject malicious
/// client-site scripts into other legitimate web browsers. The XSS match
/// statement provides the location in requests that you want AWS WAF to search
/// and text transformations to use on the search area before AWS WAF searches
/// for character sequences that are likely to be malicious strings.
class XssMatchStatement {
  /// The part of a web request that you want AWS WAF to inspect. For more
  /// information, see <a>FieldToMatch</a>.
  final FieldToMatch fieldToMatch;

  /// Text transformations eliminate some of the unusual formatting that attackers
  /// use in web requests in an effort to bypass detection. If you specify one or
  /// more transformations in a rule statement, AWS WAF performs all
  /// transformations on the content of the request component identified by
  /// <code>FieldToMatch</code>, starting from the lowest priority setting, before
  /// inspecting the content for a match.
  final List<TextTransformation> textTransformations;

  XssMatchStatement({
    required this.fieldToMatch,
    required this.textTransformations,
  });
  factory XssMatchStatement.fromJson(Map<String, dynamic> json) {
    return XssMatchStatement(
      fieldToMatch:
          FieldToMatch.fromJson(json['FieldToMatch'] as Map<String, dynamic>),
      textTransformations: (json['TextTransformations'] as List)
          .whereNotNull()
          .map((e) => TextTransformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final fieldToMatch = this.fieldToMatch;
    final textTransformations = this.textTransformations;
    return {
      'FieldToMatch': fieldToMatch,
      'TextTransformations': textTransformations,
    };
  }
}

class WAFAssociatedItemException extends _s.GenericAwsException {
  WAFAssociatedItemException({String? type, String? message})
      : super(type: type, code: 'WAFAssociatedItemException', message: message);
}

class WAFDuplicateItemException extends _s.GenericAwsException {
  WAFDuplicateItemException({String? type, String? message})
      : super(type: type, code: 'WAFDuplicateItemException', message: message);
}

class WAFInternalErrorException extends _s.GenericAwsException {
  WAFInternalErrorException({String? type, String? message})
      : super(type: type, code: 'WAFInternalErrorException', message: message);
}

class WAFInvalidOperationException extends _s.GenericAwsException {
  WAFInvalidOperationException({String? type, String? message})
      : super(
            type: type, code: 'WAFInvalidOperationException', message: message);
}

class WAFInvalidParameterException extends _s.GenericAwsException {
  WAFInvalidParameterException({String? type, String? message})
      : super(
            type: type, code: 'WAFInvalidParameterException', message: message);
}

class WAFInvalidPermissionPolicyException extends _s.GenericAwsException {
  WAFInvalidPermissionPolicyException({String? type, String? message})
      : super(
            type: type,
            code: 'WAFInvalidPermissionPolicyException',
            message: message);
}

class WAFInvalidResourceException extends _s.GenericAwsException {
  WAFInvalidResourceException({String? type, String? message})
      : super(
            type: type, code: 'WAFInvalidResourceException', message: message);
}

class WAFLimitsExceededException extends _s.GenericAwsException {
  WAFLimitsExceededException({String? type, String? message})
      : super(type: type, code: 'WAFLimitsExceededException', message: message);
}

class WAFNonexistentItemException extends _s.GenericAwsException {
  WAFNonexistentItemException({String? type, String? message})
      : super(
            type: type, code: 'WAFNonexistentItemException', message: message);
}

class WAFOptimisticLockException extends _s.GenericAwsException {
  WAFOptimisticLockException({String? type, String? message})
      : super(type: type, code: 'WAFOptimisticLockException', message: message);
}

class WAFServiceLinkedRoleErrorException extends _s.GenericAwsException {
  WAFServiceLinkedRoleErrorException({String? type, String? message})
      : super(
            type: type,
            code: 'WAFServiceLinkedRoleErrorException',
            message: message);
}

class WAFSubscriptionNotFoundException extends _s.GenericAwsException {
  WAFSubscriptionNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'WAFSubscriptionNotFoundException',
            message: message);
}

class WAFTagOperationException extends _s.GenericAwsException {
  WAFTagOperationException({String? type, String? message})
      : super(type: type, code: 'WAFTagOperationException', message: message);
}

class WAFTagOperationInternalErrorException extends _s.GenericAwsException {
  WAFTagOperationInternalErrorException({String? type, String? message})
      : super(
            type: type,
            code: 'WAFTagOperationInternalErrorException',
            message: message);
}

class WAFUnavailableEntityException extends _s.GenericAwsException {
  WAFUnavailableEntityException({String? type, String? message})
      : super(
            type: type,
            code: 'WAFUnavailableEntityException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'WAFAssociatedItemException': (type, message) =>
      WAFAssociatedItemException(type: type, message: message),
  'WAFDuplicateItemException': (type, message) =>
      WAFDuplicateItemException(type: type, message: message),
  'WAFInternalErrorException': (type, message) =>
      WAFInternalErrorException(type: type, message: message),
  'WAFInvalidOperationException': (type, message) =>
      WAFInvalidOperationException(type: type, message: message),
  'WAFInvalidParameterException': (type, message) =>
      WAFInvalidParameterException(type: type, message: message),
  'WAFInvalidPermissionPolicyException': (type, message) =>
      WAFInvalidPermissionPolicyException(type: type, message: message),
  'WAFInvalidResourceException': (type, message) =>
      WAFInvalidResourceException(type: type, message: message),
  'WAFLimitsExceededException': (type, message) =>
      WAFLimitsExceededException(type: type, message: message),
  'WAFNonexistentItemException': (type, message) =>
      WAFNonexistentItemException(type: type, message: message),
  'WAFOptimisticLockException': (type, message) =>
      WAFOptimisticLockException(type: type, message: message),
  'WAFServiceLinkedRoleErrorException': (type, message) =>
      WAFServiceLinkedRoleErrorException(type: type, message: message),
  'WAFSubscriptionNotFoundException': (type, message) =>
      WAFSubscriptionNotFoundException(type: type, message: message),
  'WAFTagOperationException': (type, message) =>
      WAFTagOperationException(type: type, message: message),
  'WAFTagOperationInternalErrorException': (type, message) =>
      WAFTagOperationInternalErrorException(type: type, message: message),
  'WAFUnavailableEntityException': (type, message) =>
      WAFUnavailableEntityException(type: type, message: message),
};
