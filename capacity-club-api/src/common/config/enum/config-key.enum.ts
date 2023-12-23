export enum ConfigKey {
  // Each line defines a key for configuration settings, representing different environment variables.
  DB_TYPE = 'DB_TYPE',
  DB_HOST = 'DB_HOST',
  DB_PORT = 'DB_PORT',
  DB_USER = 'DB_USER',
  DB_PASSWORD = 'DB_PASSWORD',
  DB_DATABASE = 'DB_DATABASE',
  DB_SYNC = 'DB_SYNC',
  JWT_TOKEN_SECRET = 'JWT_TOKEN_SECRET',
  JWT_TOKEN_EXPIRE_IN = 'JWT_TOKEN_EXPIRE_IN',
  JWT_REFRESH_TOKEN_SECRET = 'JWT_REFRESH_TOKEN_SECRET',
  JWT_REFRESH_TOKEN_EXPIRE_IN = 'JWT_REFRESH_TOKEN_EXPIRE_IN',
  APP_BASE_URL = 'APP_BASE_URL',
  APP_MODE = 'APP_MODE',
  APP_PORT = 'APP_PORT',
}

// Create a constant named configMinimalKeys
// This constant is an array of ConfigKey, obtained by getting all keys from the ConfigKey enum.
export const configMinimalKeys: ConfigKey[] = Object.keys(
  ConfigKey,
) as ConfigKey[];
