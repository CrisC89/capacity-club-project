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

  MEMBER_CARD_CREATE('member-card/create'),
  MEMBER_CARD_DELETE('member-card/delete/'),
  MEMBER_CARD_DETAIL('member-card/detail/'),
  MEMBER_CARD_FILTER('member-card/filter'),
  MEMBER_CARD_LIST('member-card/list'),
  MEMBER_CARD_UPDATE('member-card/update'),

  MEMBER_HOME_TRAINING_CREATE('member-home-training/create'),
  MEMBER_HOME_TRAINING_DELETE('member-home-training/delete/'),
  MEMBER_HOME_TRAINING_DETAIL('member-home-training/detail/'),
  MEMBER_HOME_TRAINING_FILTER('member-home-training/filter'),
  MEMBER_HOME_TRAINING_LIST('member-home-training/list'),
  MEMBER_HOME_TRAINING_UPDATE('member-home-training/update'),

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
  MEMBER_SUBSCRIPTION_UPDATE('member-subscription/update'),

  INDOOR_TRAINING_CREATE('indoor-training/create'),
  INDOOR_TRAINING_DELETE('indoor-training/delete/'),
  INDOOR_TRAINING_DETAIL('indoor-training/detail/'),
  INDOOR_TRAINING_FILTER('indoor-training/filter'),
  INDOOR_TRAINING_LIST('indoor-training/list'),
  INDOOR_TRAINING_UPDATE('indoor-training/update'),

  INDOOR_TRAINING_SUBSCRIPTION_CREATE('indoor-training-subscription/create'),
  INDOOR_TRAINING_SUBSCRIPTION_DELETE('indoor-training-subscription/delete/'),
  INDOOR_TRAINING_SUBSCRIPTION_DETAIL('indoor-training-subscription/detail/'),
  INDOOR_TRAINING_SUBSCRIPTION_FILTER('indoor-training-subscription/filter'),
  INDOOR_TRAINING_SUBSCRIPTION_LIST('indoor-training-subscription/list'),
  INDOOR_TRAINING_SUBSCRIPTION_UPDATE('indoor-training-subscription/update'),

  HOME_TRAINING_CREATE('home-training/create'),
  HOME_TRAINING_DELETE('home-training/delete/'),
  HOME_TRAINING_DETAIL('home-training/detail/'),
  HOME_TRAINING_FILTER('home-training/filter'),
  HOME_TRAINING_LIST('home-training/list'),
  HOME_TRAINING_UPDATE('home-training/update'),

  ADDRESS_CREATE('address/create'),
  ADDRESS_DELETE('address/delete/'),
  ADDRESS_DETAIL('address/detail/'),
  ADDRESS_FILTER('address/filter'),
  ADDRESS_LIST('address/list'),
  ADDRESS_UPDATE('address/update'),

  EXERCISE_DATA_CREATE('exercise-data/create'),
  EXERCISE_DATA_DELETE('exercise-data/delete/'),
  EXERCISE_DATA_DETAIL('exercise-data/detail/'),
  EXERCISE_DATA_FILTER('exercise-data/filter'),
  EXERCISE_DATA_LIST('exercise-data/list'),
  EXERCISE_DATA_UPDATE('exercise-data/update'),

  EXERCISE_TRAINING_CREATE('exercise-training/create'),
  EXERCISE_TRAINING_DELETE('exercise-training/delete/'),
  EXERCISE_TRAINING_DETAIL('exercise-training/detail/'),
  EXERCISE_TRAINING_FILTER('exercise-training/filter'),
  EXERCISE_TRAINING_LIST('exercise-training/list'),
  EXERCISE_TRAINING_UPDATE('exercise-training/update'),

  TRAINING_CIRCUIT_CREATE('training-circuit/create'),
  TRAINING_CIRCUIT_DELETE('training-circuit/delete/'),
  TRAINING_CIRCUIT_DETAIL('training-circuit/detail/'),
  TRAINING_CIRCUIT_FILTER('training-circuit/filter'),
  TRAINING_CIRCUIT_LIST('training-circuit/list'),
  TRAINING_CIRCUIT_UPDATE('training-circuit/update'),

  WORKOUT_CREATE('workout/create'),
  WORKOUT_DELETE('workout/delete/'),
  WORKOUT_DETAIL('workout/detail/'),
  WORKOUT_FILTER('workout/filter'),
  WORKOUT_LIST('workout/list'),
  WORKOUT_UPDATE('workout/update');

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
      case 'MEMBER_CARD':
        switch (operation) {
          case 'CREATE':
            return ApiURI.MEMBER_CARD_CREATE.url;
          case 'DELETE':
            return ApiURI.MEMBER_CARD_DELETE.url;
          case 'DETAIL':
            return ApiURI.MEMBER_CARD_DETAIL.url;
          case 'FILTER':
            return ApiURI.MEMBER_CARD_FILTER.url;
          case 'LIST':
            return ApiURI.MEMBER_CARD_LIST.url;
          case 'UPDATE':
            return ApiURI.MEMBER_CARD_UPDATE.url;
          default:
            break;
        }
        break;
      case 'MEMBER_HOME_TRAINING':
        switch (operation) {
          case 'DETAIL':
            return ApiURI.MEMBER_HOME_TRAINING_DETAIL.url;
          case 'FILTER':
            return ApiURI.MEMBER_HOME_TRAINING_FILTER.url;
          case 'UPDATE':
            return ApiURI.MEMBER_HOME_TRAINING_UPDATE.url;
          case 'DELETE':
            return ApiURI.MEMBER_HOME_TRAINING_DELETE.url;
          case 'LIST':
            return ApiURI.MEMBER_HOME_TRAINING_LIST.url;
          default:
            break;
        }
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
      case 'INDOOR_TRAINING':
        switch (operation) {
          case 'DETAIL':
            return ApiURI.INDOOR_TRAINING_DETAIL.url;
          case 'FILTER':
            return ApiURI.INDOOR_TRAINING_FILTER.url;
          case 'UPDATE':
            return ApiURI.INDOOR_TRAINING_UPDATE.url;
          case 'DELETE':
            return ApiURI.INDOOR_TRAINING_DELETE.url;
          case 'LIST':
            return ApiURI.INDOOR_TRAINING_LIST.url;
          default:
            break;
        }
        break;
      case 'INDOOR_TRAINING_SUBSCRIPTION':
        switch (operation) {
          case 'DETAIL':
            return ApiURI.INDOOR_TRAINING_SUBSCRIPTION_DETAIL.url;
          case 'FILTER':
            return ApiURI.INDOOR_TRAINING_SUBSCRIPTION_FILTER.url;
          case 'UPDATE':
            return ApiURI.INDOOR_TRAINING_SUBSCRIPTION_UPDATE.url;
          case 'DELETE':
            return ApiURI.INDOOR_TRAINING_SUBSCRIPTION_DELETE.url;
          case 'LIST':
            return ApiURI.INDOOR_TRAINING_SUBSCRIPTION_LIST.url;
          default:
            break;
        }
        break;
      case 'HOME_TRAINING':
        switch (operation) {
          case 'DETAIL':
            return ApiURI.HOME_TRAINING_DETAIL.url;
          case 'FILTER':
            return ApiURI.HOME_TRAINING_FILTER.url;
          case 'UPDATE':
            return ApiURI.HOME_TRAINING_UPDATE.url;
          case 'DELETE':
            return ApiURI.HOME_TRAINING_DELETE.url;
          case 'LIST':
            return ApiURI.HOME_TRAINING_LIST.url;
          default:
            break;
        }
        break;
      case 'ADDRESS':
        switch (operation) {
          case 'DETAIL':
            return ApiURI.ADDRESS_DETAIL.url;
          case 'FILTER':
            return ApiURI.ADDRESS_FILTER.url;
          case 'UPDATE':
            return ApiURI.ADDRESS_UPDATE.url;
          case 'DELETE':
            return ApiURI.ADDRESS_DELETE.url;
          case 'LIST':
            return ApiURI.ADDRESS_LIST.url;
          default:
            break;
        }
        break;
      case 'EXERCISE_DATA':
        switch (operation) {
          case 'DETAIL':
            return ApiURI.EXERCISE_DATA_DETAIL.url;
          case 'FILTER':
            return ApiURI.EXERCISE_DATA_FILTER.url;
          case 'UPDATE':
            return ApiURI.EXERCISE_DATA_UPDATE.url;
          case 'DELETE':
            return ApiURI.EXERCISE_DATA_DELETE.url;
          case 'LIST':
            return ApiURI.EXERCISE_DATA_LIST.url;
          default:
            break;
        }
        break;
      case 'EXERCISE_TRAINING':
        switch (operation) {
          case 'DETAIL':
            return ApiURI.EXERCISE_TRAINING_DETAIL.url;
          case 'FILTER':
            return ApiURI.EXERCISE_TRAINING_FILTER.url;
          case 'UPDATE':
            return ApiURI.EXERCISE_TRAINING_UPDATE.url;
          case 'DELETE':
            return ApiURI.EXERCISE_TRAINING_DELETE.url;
          case 'LIST':
            return ApiURI.EXERCISE_TRAINING_LIST.url;
          default:
            break;
        }
        break;
      case 'TRAINING_CIRCUIT':
        switch (operation) {
          case 'DETAIL':
            return ApiURI.TRAINING_CIRCUIT_DETAIL.url;
          case 'FILTER':
            return ApiURI.TRAINING_CIRCUIT_FILTER.url;
          case 'UPDATE':
            return ApiURI.TRAINING_CIRCUIT_UPDATE.url;
          case 'DELETE':
            return ApiURI.TRAINING_CIRCUIT_DELETE.url;
          case 'LIST':
            return ApiURI.TRAINING_CIRCUIT_LIST.url;
          default:
            break;
        }
        break;
      case 'WORKOUT':
        switch (operation) {
          case 'DETAIL':
            return ApiURI.WORKOUT_DETAIL.url;
          case 'FILTER':
            return ApiURI.WORKOUT_FILTER.url;
          case 'UPDATE':
            return ApiURI.WORKOUT_UPDATE.url;
          case 'DELETE':
            return ApiURI.WORKOUT_DELETE.url;
          case 'LIST':
            return ApiURI.WORKOUT_LIST.url;
          default:
            break;
        }
        break;
    }
    throw Exception('ApiURI not found');
  }
}
