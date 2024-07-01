enum ApiURI {
  ACCOUNT_SIGNIN('auth/signin'),
  ACCOUNT_SIGNUP('auth/signup'),
  ACCOUNT_ME('auth/me'),
  ACCOUNT_DELETE('auth/delete'),
  ACCOUNT_REFRESH('auth/refresh'),

  MEMBER_CREATE('member/create'),
  MEMBER_DELETE('member/delete/'),
  MEMBER_DETAIL('member/detail/'),
  MEMBER_FILTER('member/filter'),
  MEMBER_LIST('member/list'),
  MEMBER_UPDATE('member/update'),

  MEMBER_PLAN_CREATE('member-plan/create'),
  MEMBER_PLAN_DELETE('member-plan/delete/'),
  MEMBER_PLAN_DETAIL('member-plan/detail/'),
  MEMBER_PLAN_FILTER('member-plan/filter'),
  MEMBER_PLAN_LIST('member-plan/list'),
  MEMBER_PLAN_UPDATE('member-plan/update'),

  MEMBER_SUBSCRIPTION_CREATE('member-subscription/create'),
  MEMBER_SUBSCRIPTION_DELETE('member-subscription/delete/'),
  MEMBER_SUBSCRIPTION_DETAIL('member-subscription/detail/'),
  MEMBER_SUBSCRIPTION_FILTER('member-subscription/filter'),
  MEMBER_SUBSCRIPTION_LIST('member-subscription/list'),
  MEMBER_SUBSCRIPTION_UPDATE('member-subscription/update');

  const ApiURI(this.url);

  final String url;

  static String getEndpoint(String entity, String operation) {
    switch (entity) {
      case 'ACCOUNT':
        switch (operation) {
          case 'SIGNIN':
            return ApiURI.ACCOUNT_SIGNIN.url;
          case 'SIGNUP':
            return ApiURI.ACCOUNT_SIGNUP.url;
          case 'ME':
            return ApiURI.ACCOUNT_ME.url;
          case 'DELETE':
            return ApiURI.ACCOUNT_DELETE.url;
          case 'REFRESH':
            return ApiURI.ACCOUNT_REFRESH.url;
          default:
            break;
        }
        break;
      case 'MEMBER':
        switch (operation) {
          case 'CREATE':
            return ApiURI.MEMBER_CREATE.url;
          case 'DELETE':
            return ApiURI.MEMBER_DELETE.url;
          case 'DETAIL':
            return ApiURI.MEMBER_DETAIL.url;
          case 'FILTER':
            return ApiURI.MEMBER_FILTER.url;
          case 'LIST':
            return ApiURI.MEMBER_LIST.url;
          case 'UPDATE':
            return ApiURI.MEMBER_UPDATE.url;
          default:
            break;
        }
        break;
      case 'MEMBER_PLAN':
        switch (operation) {
          case 'CREATE':
            return ApiURI.MEMBER_PLAN_CREATE.url;
          case 'DELETE':
            return ApiURI.MEMBER_PLAN_DELETE.url;
          case 'DETAIL':
            return ApiURI.MEMBER_PLAN_DETAIL.url;
          case 'FILTER':
            return ApiURI.MEMBER_PLAN_FILTER.url;
          case 'LIST':
            return ApiURI.MEMBER_PLAN_LIST.url;
          case 'UPDATE':
            return ApiURI.MEMBER_PLAN_UPDATE.url;
          default:
            break;
        }
        break;
      case 'MEMBER_SUBSCRIPTION':
        switch (operation) {
          case 'CREATE':
            return ApiURI.MEMBER_SUBSCRIPTION_CREATE.url;
          case 'DELETE':
            return ApiURI.MEMBER_SUBSCRIPTION_DELETE.url;
          case 'DETAIL':
            return ApiURI.MEMBER_SUBSCRIPTION_DETAIL.url;
          case 'FILTER':
            return ApiURI.MEMBER_SUBSCRIPTION_FILTER.url;
          case 'LIST':
            return ApiURI.MEMBER_SUBSCRIPTION_LIST.url;
          case 'UPDATE':
            return ApiURI.MEMBER_SUBSCRIPTION_UPDATE.url;
          default:
            break;
        }
        break;
    }
    throw Exception('ApiURI not found');
  }
}
