import { ApiOperationOptions } from '@nestjs/swagger';

/**
 * This file defines Swagger documentation options for various API operations.
 * It provides descriptive metadata for each endpoint, enhancing the API documentation
 * generated by Swagger. This includes summaries and descriptions for different
 * controller methods, which are used to create and manage user credentials, members,
 * member cards, ...
 */

/*------------------------------------------------------------------------------------------------------*/
/*------------------------------------------- AUTH -----------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------*/

/*------------------------------------- CONTROLLER -----------------------------------------------------*/

export const AuthenticatedControllerSignIn: ApiOperationOptions = {
  summary: 'User Sign-In',
  description:
    'Authenticate a user using their credentials and return an authentication token.',
};

export const AuthenticatedControllerAdminSignIn: ApiOperationOptions = {
  summary: 'Admin Sign-In',
  description:
    'Authenticate an admin user using their credentials and return an authentication token.',
};

export const AuthenticatedControllerSignUp: ApiOperationOptions = {
  summary: 'User Sign-Up',
  description:
    'Register a new user and return an authentication token upon successful registration.',
};

export const AuthenticatedControllerRefresh: ApiOperationOptions = {
  summary: 'Refresh Authentication Token',
  description: 'Refresh the authentication token using a valid refresh token.',
};

export const AuthenticatedControllerMe: ApiOperationOptions = {
  summary: 'Get Current User Information',
  description: "Retrieve the current authenticated user's profile information.",
};

export const AuthenticatedControllerDelete: ApiOperationOptions = {
  summary: 'Delete Credential',
  description:
    'Delete a user credential by its ID and remove associated authentication tokens.',
};

export const AuthenticatedControllerLinkGoogleAccount: ApiOperationOptions = {
  summary: 'Link Google Account',
  description:
    'Method for linking a Google account to an existing user account.',
};

export const AuthenticatedControllerLinkFacebookAccount: ApiOperationOptions = {
  summary: 'Link Facebook Account',
  description:
    'Method for linking a Facebook account to an existing user account.',
};

export const AuthenticatedControllerLinkUsername: ApiOperationOptions = {
  summary: 'Link Username and Password',
  description:
    'Method for linking a username and password to an existing user account.',
};

/*--------------------------------------- ENTITY -------------------------------------------------------*/

export const credentialProperties = {
  credential_id: {
    description:
      'Unique identifier for the credential. Uses a custom transformer for serialization.',
    name: 'credential_id',
  },
  username: {
    description: 'Username for the credential',
    name: 'username',
  },
  password: {
    description:
      'Password for the credential, excluded from plain serialization',
    name: 'password',
  },
  facebook_hash: {
    description: 'Facebook hash associated with the credential',
    name: 'facebookHash',
  },
  google_hash: {
    description: 'Google hash associated with the credential',
    name: 'googleHash',
  },
  is_admin: {
    description: 'Flag indicating if the user is an admin',
    name: 'isAdmin',
  },
  member: {
    name: 'member',
    description: 'Associated Member entity',
  },
};

export const signInProperties = {
  social_login: {
    name: 'socialLogin',
    description: 'Indicates if the login is done through social networks',
  },
};

export const signUpProperties = {
  code_activation: {
    name: 'code_activation',
    description:
      'Activation code used to link an existing member to a credential',
  },
};

/*------------------------------------------------------------------------------------------------------*/
/*--------------------------------------- MEMBER -------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------*/

/*------------------------------------- CONTROLLER -----------------------------------------------------*/

export const MemberControllerCreate: ApiOperationOptions = {
  summary: 'Create Member',
  description: 'Create a new member and store their details in the database.',
};

export const MemberControllerDetail: ApiOperationOptions = {
  summary: 'Get Member Details',
  description: 'Retrieve the details of a specific member by their ID.',
};

export const MemberControllerList: ApiOperationOptions = {
  summary: 'List All Members',
  description: 'Retrieve a list of all members stored in the database.',
};

export const MemberControllerUpdate: ApiOperationOptions = {
  summary: 'Update Member',
  description: 'Update the details of an existing member.',
};

export const MemberControllerDelete: ApiOperationOptions = {
  summary: 'Delete Member',
  description: 'Delete a specific member from the database by their ID.',
};

export const MemberControllerFilter: ApiOperationOptions = {
  summary: 'Filter Members',
  description:
    'Retrieve a list of members based on specific filtering criteria.',
};

/*--------------------------------------- ENTITY -------------------------------------------------------*/

export const memberProperties = {
  member_id: {
    name: 'member_id',
    description:
      'Unique identifier for the member. Uses a custom transformer for serialization.',
  },
  firstname: {
    name: 'firstname',
    description: 'First name of the member.',
  },
  lastname: {
    name: 'lastname',
    description: 'Last name of the member.',
  },
  birthdate: {
    name: 'birthdate',
    description: 'Birthdate of the member.',
  },
  gender: {
    name: 'gender',
    description: 'Gender of the member.',
  },
  phone: {
    name: 'phone',
    description: 'Phone number of the member.',
  },
  mail: {
    name: 'mail',
    description: 'Email address of the member.',
  },
  code_activation: {
    name: 'code_activation',
    description: 'Activation code for the member.',
  },
  active: {
    name: 'active',
    description: 'Indicates whether the member is active.',
  },
  subscriptions: {
    name: 'subscriptions',
    description: 'List of subscriptions for the member.',
  },
  member_home_trainings: {
    name: 'member_home_trainings',
    description: 'List of home trainings for the member.',
  },
  address: {
    name: 'address',
    description: 'Address of the member.',
  },
  credential: {
    name: 'credential',
    description: 'Credentials associated with the member.',
  },
  member_card: {
    name: 'member_card',
    description: 'Member card associated with the member.',
  },
};

/*------------------------------------------------------------------------------------------------------*/
/*------------------------------------- MEMBER CARD ----------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------*/

/*------------------------------------- CONTROLLER -----------------------------------------------------*/

export const MemberCardControllerCreate: ApiOperationOptions = {
  summary: 'Create MemberCard',
  description:
    'Create a new member card and store its details in the database.',
};

export const MemberCardControllerDetail: ApiOperationOptions = {
  summary: 'Get MemberCard Details',
  description: 'Retrieve the details of a specific member card by its ID.',
};

export const MemberCardControllerList: ApiOperationOptions = {
  summary: 'List All MemberCards',
  description: 'Retrieve a list of all member cards stored in the database.',
};

export const MemberCardControllerUpdate: ApiOperationOptions = {
  summary: 'Update MemberCard',
  description: 'Update the details of an existing member card.',
};

export const MemberCardControllerDelete: ApiOperationOptions = {
  summary: 'Delete MemberCard',
  description: 'Delete a specific member card from the database by its ID.',
};

export const MemberCardControllerFilter: ApiOperationOptions = {
  summary: 'Filter MemberCards',
  description:
    'Retrieve a list of member cards based on specific filtering criteria.',
};

/*--------------------------------------- ENTITY -------------------------------------------------------*/

export const memberCardProperties = {
  member_card_id: {
    name: 'member_card_id',
    description:
      'Unique identifier for the member card. Uses a custom transformer for serialization.',
  },
  collective_session_count: {
    name: 'collective_session_count',
    description: 'Number of collective sessions available for the member.',
  },
  individual_session_count: {
    name: 'individual_session_count',
    description: 'Number of individual sessions available for the member.',
  },
};

/*------------------------------------------------------------------------------------------------------*/
/*--------------------------------------- ADDRESS ------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------*/

/*------------------------------------- CONTROLLER -----------------------------------------------------*/

export const AddressControllerCreate: ApiOperationOptions = {
  summary: 'Create Address',
  description: 'Create a new address and store its details in the database.',
};

export const AddressControllerDetail: ApiOperationOptions = {
  summary: 'Get Address Details',
  description: 'Retrieve the details of a specific address by its ID.',
};

export const AddressControllerList: ApiOperationOptions = {
  summary: 'List All Addresses',
  description: 'Retrieve a list of all addresses stored in the database.',
};

export const AddressControllerUpdate: ApiOperationOptions = {
  summary: 'Update Address',
  description: 'Update the details of an existing address.',
};

export const AddressControllerDelete: ApiOperationOptions = {
  summary: 'Delete Address',
  description: 'Delete a specific address from the database by its ID.',
};

export const AddressControllerFilter: ApiOperationOptions = {
  summary: 'Filter Addresses',
  description:
    'Retrieve a list of addresses based on specific filtering criteria.',
};

/*--------------------------------------- ENTITY -------------------------------------------------------*/
export const addressProperties = {
  address_id: {
    name: 'address_id',
    description:
      'Unique identifier for the address. Uses a custom transformer for serialization.',
  },
  street: {
    name: 'street',
    description: 'Street name of the address',
  },
  number: {
    name: 'number',
    description: 'House number of the address',
  },
  zipcode: {
    name: 'zipcode',
    description: 'Zip code of the address',
  },
  town: {
    name: 'town',
    description: 'Town or city of the address',
  },
  country: {
    name: 'country',
    description: 'Country of the address',
  },
  complement: {
    name: 'complement',
    description: 'Additional address information',
  },
};

/*------------------------------------------------------------------------------------------------------*/
/*--------------------------------------- MEMBER PLAN --------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------*/

/*------------------------------------- CONTROLLER -----------------------------------------------------*/
export const MemberPlanControllerCreate: ApiOperationOptions = {
  summary: 'Create Member Plan',
  description:
    'Create a new member plan and store its details in the database.',
};

export const MemberPlanControllerDetail: ApiOperationOptions = {
  summary: 'Get Member Plan Details',
  description: 'Retrieve the details of a specific member plan by its ID.',
};

export const MemberPlanControllerList: ApiOperationOptions = {
  summary: 'List All Member Plans',
  description: 'Retrieve a list of all member plans stored in the database.',
};

export const MemberPlanControllerUpdate: ApiOperationOptions = {
  summary: 'Update Member Plan',
  description: 'Update the details of an existing member plan.',
};

export const MemberPlanControllerDelete: ApiOperationOptions = {
  summary: 'Delete Member Plan',
  description: 'Delete a specific member plan from the database by its ID.',
};

export const MemberPlanControllerFilter: ApiOperationOptions = {
  summary: 'Filter Member Plans',
  description:
    'Retrieve a list of member plans based on specific filtering criteria.',
};
/*--------------------------------------- ENTITY -------------------------------------------------------*/

export const memberPlanProperties = {
  member_plan_id: {
    name: 'member_plan_id',
    description:
      'Unique identifier for the member plan. Uses a custom transformer for serialization.',
  },
  title: {
    name: 'title',
    description: 'Title of the member plan.',
  },
  description: {
    name: 'description',
    description: 'Description of the member plan.',
  },
  nb_individual_training: {
    name: 'nb_individual_training',
    description: 'Number of individual training sessions included in the plan.',
  },
  nb_collective_training: {
    name: 'nb_collective_training',
    description: 'Number of collective training sessions included in the plan.',
  },
  price: {
    name: 'price',
    description: 'Price of the member plan.',
  },
};
/*------------------------------------------------------------------------------------------------------*/
/*--------------------------------------- EXERCISE DATA ------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------*/

/*------------------------------------- CONTROLLER -----------------------------------------------------*/
export const ExerciseDataControllerCreate: ApiOperationOptions = {
  summary: 'Create Exercise Data',
  description:
    'Create a new exercise data and store its details in the database.',
};

export const ExerciseDataControllerDetail: ApiOperationOptions = {
  summary: 'Get Exercise Data Details',
  description: 'Retrieve the details of a specific exercise data by its ID.',
};

export const ExerciseDataControllerList: ApiOperationOptions = {
  summary: 'List All Exercise Data',
  description: 'Retrieve a list of all exercise data stored in the database.',
};

export const ExerciseDataControllerUpdate: ApiOperationOptions = {
  summary: 'Update Exercise Data',
  description: 'Update the details of an existing exercise data.',
};

export const ExerciseDataControllerDelete: ApiOperationOptions = {
  summary: 'Delete Exercise Data',
  description: 'Delete a specific exercise data from the database by its ID.',
};

export const ExerciseDataControllerFilter: ApiOperationOptions = {
  summary: 'Filter Exercise Data',
  description:
    'Retrieve a list of exercise data based on specific filtering criteria.',
};

/*--------------------------------------- ENTITY -------------------------------------------------------*/

export const exerciseDataProperties = {
  exercise_data_id: {
    name: 'exercise_data_id',
    description:
      'Unique identifier for the exercise data. Uses a custom transformer for serialization.',
  },
  title: {
    name: 'title',
    description: 'Title of the exercise data.',
  },
  description: {
    name: 'description',
    description: 'Detailed description of the exercise.',
  },
  categories: {
    name: 'categories',
    description: 'Categories of the exercise data.',
  },
  video_youtube_link: {
    name: 'video_youtube_link',
    description: 'YouTube link associated with the exercise.',
  },
  video_asset_link: {
    name: 'video_asset_link',
    description: 'Link to the video asset for the exercise.',
  },
  exercise_training_list: {
    name: 'exercise_training_list',
    description:
      'List of exercise trainings associated with this exercise data.',
  },
};

/*------------------------------------------------------------------------------------------------------*/
/*--------------------------------------- EXERCISE TRAINING --------------------------------------------*/
/*------------------------------------------------------------------------------------------------------*/

/*------------------------------------- CONTROLLER -----------------------------------------------------*/
export const ExerciseTrainingControllerCreate: ApiOperationOptions = {
  summary: 'Create Exercise Training',
  description:
    'Create a new exercise training and store its details in the database.',
};

export const ExerciseTrainingControllerDetail: ApiOperationOptions = {
  summary: 'Get Exercise Training Details',
  description:
    'Retrieve the details of a specific exercise training by its ID.',
};

export const ExerciseTrainingControllerList: ApiOperationOptions = {
  summary: 'List All Exercise Trainings',
  description:
    'Retrieve a list of all exercise trainings stored in the database.',
};

export const ExerciseTrainingControllerUpdate: ApiOperationOptions = {
  summary: 'Update Exercise Training',
  description: 'Update the details of an existing exercise training.',
};

export const ExerciseTrainingControllerDelete: ApiOperationOptions = {
  summary: 'Delete Exercise Training',
  description:
    'Delete a specific exercise training from the database by its ID.',
};

export const ExerciseTrainingControllerFilter: ApiOperationOptions = {
  summary: 'Filter Exercise Trainings',
  description:
    'Retrieve a list of exercise trainings based on specific filtering criteria.',
};
/*--------------------------------------- ENTITY -------------------------------------------------------*/
export const exerciseTrainingProperties = {
  exercise_training_id: {
    name: 'exercise_training_id',
    description:
      'Unique identifier for the exercise training. Uses a custom transformer for serialization.',
  },
  nb_reps: {
    name: 'nb_reps',
    description: 'Number of repetitions for the exercise.',
  },
  intensity: {
    name: 'intensity',
    description: 'Intensity level of the exercise training.',
  },
  intensityType: {
    name: 'intensityType',
    description:
      'Type of intensity measurement used for the exercise training.',
  },
  exercise_data: {
    name: 'exercise_data',
    description: 'Exercise data associated with this training session.',
  },
  training_circuit: {
    name: 'training_circuit',
    description: 'Training circuit that includes this exercise training.',
  },
};
/*------------------------------------------------------------------------------------------------------*/
/*--------------------------------------- TRAINING CIRCUIT ---------------------------------------------*/
/*------------------------------------------------------------------------------------------------------*/

/*------------------------------------- CONTROLLER -----------------------------------------------------*/

export const TrainingCircuitControllerCreate: ApiOperationOptions = {
  summary: 'Create Training Circuit',
  description:
    'Create a new training circuit and store its details in the database.',
};

export const TrainingCircuitControllerDetail: ApiOperationOptions = {
  summary: 'Get Training Circuit Details',
  description: 'Retrieve the details of a specific training circuit by its ID.',
};

export const TrainingCircuitControllerList: ApiOperationOptions = {
  summary: 'List All Training Circuits',
  description:
    'Retrieve a list of all training circuits stored in the database.',
};

export const TrainingCircuitControllerUpdate: ApiOperationOptions = {
  summary: 'Update Training Circuit',
  description: 'Update the details of an existing training circuit.',
};

export const TrainingCircuitControllerDelete: ApiOperationOptions = {
  summary: 'Delete Training Circuit',
  description:
    'Delete a specific training circuit from the database by its ID.',
};

export const TrainingCircuitControllerFilter: ApiOperationOptions = {
  summary: 'Filter Training Circuits',
  description:
    'Retrieve a list of training circuits based on specific filtering criteria.',
};

/*--------------------------------------- ENTITY -------------------------------------------------------*/
export const trainingCircuitProperties = {
  training_circuit_id: {
    name: 'training_circuit_id',
    description:
      'Unique identifier for the training circuit. Uses a custom transformer for serialization.',
  },
  title: {
    name: 'title',
    description: 'Title of the training circuit.',
  },
  exercise_training_list: {
    name: 'exercise_training_list',
    description:
      'List of exercise trainings included in this training circuit.',
  },
  workout: {
    name: 'workout',
    description: 'Workout that includes this training circuit.',
  },
};

/*------------------------------------------------------------------------------------------------------*/
/*--------------------------------------- WORKOUT ------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------*/

/*------------------------------------- CONTROLLER -----------------------------------------------------*/

export const WorkoutControllerCreate: ApiOperationOptions = {
  summary: 'Create Workout',
  description: 'Create a new workout and store its details in the database.',
};

export const WorkoutControllerDetail: ApiOperationOptions = {
  summary: 'Get Workout Details',
  description: 'Retrieve the details of a specific workout by its ID.',
};

export const WorkoutControllerList: ApiOperationOptions = {
  summary: 'List All Workouts',
  description: 'Retrieve a list of all workouts stored in the database.',
};

export const WorkoutControllerUpdate: ApiOperationOptions = {
  summary: 'Update Workout',
  description: 'Update the details of an existing workout.',
};

export const WorkoutControllerDelete: ApiOperationOptions = {
  summary: 'Delete Workout',
  description: 'Delete a specific workout from the database by its ID.',
};

export const WorkoutControllerFilter: ApiOperationOptions = {
  summary: 'Filter Workouts',
  description:
    'Retrieve a list of workouts based on specific filtering criteria.',
};

/*--------------------------------------- ENTITY -------------------------------------------------------*/

export const workoutProperties = {
  workout_id: {
    name: 'workout_id',
    description:
      'Unique identifier for the workout. Uses a custom transformer for serialization.',
  },
  title: {
    name: 'title',
    description: 'Title of the workout.',
  },
  training_circuits: {
    name: 'training_circuits',
    description: 'List of training circuits included in this workout.',
  },
  indoor_training: {
    name: 'indoor_training',
    description: 'Indoor training associated with this workout.',
  },
  home_training: {
    name: 'home_training',
    description: 'Home training associated with this workout.',
  },
};

/*------------------------------------------------------------------------------------------------------*/
/*------------------------------------ MEMBER PLAN SUBSCRIPTION ----------------------------------------*/
/*------------------------------------------------------------------------------------------------------*/

/*------------------------------------- CONTROLLER -----------------------------------------------------*/

export const MemberPlanSubscriptionControllerCreate: ApiOperationOptions = {
  summary: 'Create Member Plan Subscription',
  description:
    'Create a new member plan subscription and store its details in the database.',
};

export const MemberPlanSubscriptionControllerDetail: ApiOperationOptions = {
  summary: 'Get Member Plan Subscription Details',
  description:
    'Retrieve the details of a specific member plan subscription by its ID.',
};

export const MemberPlanSubscriptionControllerList: ApiOperationOptions = {
  summary: 'List All Member Plan Subscriptions',
  description:
    'Retrieve a list of all member plan subscriptions stored in the database.',
};

export const MemberPlanSubscriptionControllerUpdate: ApiOperationOptions = {
  summary: 'Update Member Plan Subscription',
  description: 'Update the details of an existing member plan subscription.',
};

export const MemberPlanSubscriptionControllerDelete: ApiOperationOptions = {
  summary: 'Delete Member Plan Subscription',
  description:
    'Delete a specific member plan subscription from the database by its ID.',
};

export const MemberPlanSubscriptionControllerFilter: ApiOperationOptions = {
  summary: 'Filter Member Plan Subscriptions',
  description:
    'Retrieve a list of member plan subscriptions based on specific filtering criteria.',
};

/*--------------------------------------- ENTITY -------------------------------------------------------*/

export const memberPlanSubscriptionProperties = {
  member_plan_subscription_id: {
    name: 'member_plan_subscription_id',
    description:
      'Unique identifier for the member plan subscription. Uses a custom transformer for serialization.',
  },
  purchase_date: {
    name: 'purchase_date',
    description: 'Date of purchase for the member plan subscription.',
  },
  member: {
    name: 'member',
    description: 'Member associated with the subscription.',
  },
  member_plan: {
    name: 'member_plan',
    description: 'Member plan associated with the subscription.',
  },
  member_card: {
    name: 'member_card',
    description: 'Member card associated with the subscription.',
  },
};

/*------------------------------------------------------------------------------------------------------*/
/*--------------------------------------- MEMBER HOME TRAINING -----------------------------------------*/
/*------------------------------------------------------------------------------------------------------*/

/*------------------------------------- CONTROLLER -----------------------------------------------------*/

export const MemberHomeTrainingControllerCreate: ApiOperationOptions = {
  summary: 'Create Member Home Training',
  description:
    'Create a new member home training and store its details in the database.',
};

export const MemberHomeTrainingControllerDetail: ApiOperationOptions = {
  summary: 'Get Member Home Training Details',
  description:
    'Retrieve the details of a specific member home training by its ID.',
};

export const MemberHomeTrainingControllerList: ApiOperationOptions = {
  summary: 'List All Member Home Trainings',
  description:
    'Retrieve a list of all member home trainings stored in the database.',
};

export const MemberHomeTrainingControllerUpdate: ApiOperationOptions = {
  summary: 'Update Member Home Training',
  description: 'Update the details of an existing member home training.',
};

export const MemberHomeTrainingControllerDelete: ApiOperationOptions = {
  summary: 'Delete Member Home Training',
  description:
    'Delete a specific member home training from the database by its ID.',
};

export const MemberHomeTrainingControllerFilter: ApiOperationOptions = {
  summary: 'Filter Member Home Trainings',
  description:
    'Retrieve a list of member home trainings based on specific filtering criteria.',
};

/*--------------------------------------- ENTITY -------------------------------------------------------*/

export const memberHomeTrainingProperties = {
  member_home_training_id: {
    name: 'member_home_training_id',
    description:
      'Unique identifier for the member home training. Uses a custom transformer for serialization.',
  },
  purchase_date: {
    name: 'purchase_date',
    description: 'Date of purchase for the member home training.',
  },
  member: {
    name: 'member',
    description: 'Member associated with the home training.',
  },
};

/*------------------------------------------------------------------------------------------------------*/
/*--------------------------------------- HOME TRAINING ------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------*/

/*------------------------------------- CONTROLLER -----------------------------------------------------*/

export const HomeTrainingControllerCreate: ApiOperationOptions = {
  summary: 'Create Home Training',
  description:
    'Create a new home training program and store its details in the database.',
};

export const HomeTrainingControllerDetail: ApiOperationOptions = {
  summary: 'Get Home Training Details',
  description:
    'Retrieve the details of a specific home training program by its ID.',
};

export const HomeTrainingControllerList: ApiOperationOptions = {
  summary: 'List All Home Trainings',
  description:
    'Retrieve a list of all home training programs stored in the database.',
};

export const HomeTrainingControllerUpdate: ApiOperationOptions = {
  summary: 'Update Home Training',
  description: 'Update the details of an existing home training program.',
};

export const HomeTrainingControllerDelete: ApiOperationOptions = {
  summary: 'Delete Home Training',
  description:
    'Delete a specific home training program from the database by its ID.',
};

export const HomeTrainingControllerFilter: ApiOperationOptions = {
  summary: 'Filter Home Trainings',
  description:
    'Retrieve a list of home training programs based on specific filtering criteria.',
};

/*--------------------------------------- ENTITY -------------------------------------------------------*/

export const homeTrainingProperties = {
  home_training_id: {
    name: 'home_training_id',
    description:
      'Unique identifier for the home training program. Uses a custom transformer for serialization.',
  },
  title: {
    name: 'title',
    description: 'Title of the home training program.',
  },
  nb_week: {
    name: 'nb_week',
    description: 'Number of weeks in the home training program.',
  },
  nb_training_by_week: {
    name: 'nb_training_by_week',
    description: 'Number of training sessions per week.',
  },
  price: {
    name: 'price',
    description: 'Price of the home training program.',
  },
  workouts: {
    name: 'workouts',
    description: 'List of workouts associated with this home training program.',
  },
};

/*------------------------------------------------------------------------------------------------------*/
/*--------------------------------------- INDOOR TRAINING ----------------------------------------------*/
/*------------------------------------------------------------------------------------------------------*/

/*------------------------------------- CONTROLLER -----------------------------------------------------*/

export const IndoorTrainingControllerCreate: ApiOperationOptions = {
  summary: 'Create Indoor Training',
  description:
    'Create a new indoor training session and store its details in the database.',
};

export const IndoorTrainingControllerDetail: ApiOperationOptions = {
  summary: 'Get Indoor Training Details',
  description:
    'Retrieve the details of a specific indoor training session by its ID.',
};

export const IndoorTrainingControllerList: ApiOperationOptions = {
  summary: 'List All Indoor Trainings',
  description:
    'Retrieve a list of all indoor training sessions stored in the database.',
};

export const IndoorTrainingControllerUpdate: ApiOperationOptions = {
  summary: 'Update Indoor Training',
  description: 'Update the details of an existing indoor training session.',
};

export const IndoorTrainingControllerDelete: ApiOperationOptions = {
  summary: 'Delete Indoor Training',
  description:
    'Delete a specific indoor training session from the database by its ID.',
};

export const IndoorTrainingControllerFilter: ApiOperationOptions = {
  summary: 'Filter Indoor Trainings',
  description:
    'Retrieve a list of indoor training sessions based on specific filtering criteria.',
};

/*--------------------------------------- ENTITY -------------------------------------------------------*/

export const indoorTrainingProperties = {
  indoor_training_id: {
    name: 'indoor_training_id',
    description:
      'Unique identifier for the indoor training. Uses a custom transformer for serialization.',
  },
  title: {
    name: 'title',
    description: 'Title of the indoor training session.',
  },
  training_date: {
    name: 'training_date',
    description: 'Date of the training session.',
  },
  start_hours: {
    name: 'start_hours',
    description: 'Start time of the training session.',
  },
  end_hours: {
    name: 'end_hours',
    description: 'End time of the training session.',
  },
  nb_place: {
    name: 'nb_place',
    description: 'Number of available places for the training session.',
  },
  nb_subscription: {
    name: 'nb_subscription',
    description: 'Number of subscriptions for the training session.',
  },
  workout: {
    name: 'workout',
    description: 'Workout associated with the indoor training session.',
  },
};

/*------------------------------------------------------------------------------------------------------*/
/*--------------------------------- INDOOR TRAINING SUBSCRIPTION ---------------------------------------*/
/*------------------------------------------------------------------------------------------------------*/

/*------------------------------------- CONTROLLER -----------------------------------------------------*/

export const IndoorTrainingSubscriptionControllerCreate: ApiOperationOptions = {
  summary: 'Create Indoor Training Subscription',
  description:
    'Create a new indoor training subscription and store its details in the database.',
};

export const IndoorTrainingSubscriptionControllerDetail: ApiOperationOptions = {
  summary: 'Get Indoor Training Subscription Details',
  description:
    'Retrieve the details of a specific indoor training subscription by its ID.',
};

export const IndoorTrainingSubscriptionControllerList: ApiOperationOptions = {
  summary: 'List All Indoor Trainings Subscription',
  description:
    'Retrieve a list of all indoor training subscription stored in the database.',
};

export const IndoorTrainingSubscriptionControllerUpdate: ApiOperationOptions = {
  summary: 'Update Indoor Training Subscription',
  description:
    'Update the details of an existing indoor training subscription.',
};

export const IndoorTrainingSubscriptionControllerDelete: ApiOperationOptions = {
  summary: 'Delete Indoor Training Subscription',
  description:
    'Delete a specific indoor training subscription from the database by its ID.',
};

export const IndoorTrainingSubscriptionControllerFilter: ApiOperationOptions = {
  summary: 'Filter Indoor Trainings Subscription',
  description:
    'Retrieve a list of indoor training subscription based on specific filtering criteria.',
};

/*--------------------------------------- ENTITY -------------------------------------------------------*/

export const indoorTrainingSubscriptionProperties = {
  indoor_training_subscription_id: {
    name: 'indoor_training_subscription_id',
    description:
      'Unique identifier for the indoor training. Uses a custom transformer for serialization.',
  },
  training_date: {
    name: 'training_date',
    description: 'Date of subscription to the training session.',
  },
  indoor_training: {
    name: 'indoor_training',
    description: 'Indoor training concerned by the subscription.',
  },
  member: {
    name: 'member',
    description: 'Member concerned by the indoor training subscription.',
  },
};
