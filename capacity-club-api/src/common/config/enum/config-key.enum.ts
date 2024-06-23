/**
 * Enumeration representing different configuration keys for environment variables.
 */
export enum ConfigKey {
  DB_TYPE = 'DB_TYPE', // Database type (e.g., postgres, mysql).
  DB_HOST = 'DB_HOST', // Database host address.
  DB_PORT = 'DB_PORT', // Database port number.
  DB_USER = 'DB_USER', // Database user name.
  DB_PASSWORD = 'DB_PASSWORD', // Database password.
  DB_DATABASE = 'DB_DATABASE', // Database name.
  DB_SYNC = 'DB_SYNC', // Database synchronization option.
  JWT_TOKEN_SECRET = 'JWT_TOKEN_SECRET', // Secret key for JWT tokens.
  JWT_TOKEN_EXPIRE_IN = 'JWT_TOKEN_EXPIRE_IN', // Expiration time for JWT tokens.
  JWT_REFRESH_TOKEN_SECRET = 'JWT_REFRESH_TOKEN_SECRET', // Secret key for JWT refresh tokens.
  JWT_REFRESH_TOKEN_EXPIRE_IN = 'JWT_REFRESH_TOKEN_EXPIRE_IN', // Expiration time for JWT refresh tokens.
  APP_BASE_URL = 'APP_BASE_URL', // Base URL for the application.
  APP_MODE = 'APP_MODE', // Application mode (e.g., development, production).
  APP_PORT = 'APP_PORT', // Port number for the application.
}

/**
 * Constant array containing all keys from the ConfigKey enum.
 */
export const configMinimalKeys: ConfigKey[] = Object.keys(
  ConfigKey,
) as ConfigKey[];
