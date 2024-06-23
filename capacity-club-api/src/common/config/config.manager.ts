import { TypeOrmModuleOptions } from '@nestjs/typeorm';
import { ConfigKey, configMinimalKeys } from '@common/config/enum';

import * as dotenv from 'dotenv';
dotenv.config();
//require('dotenv').config();

/**
 * Class responsible for managing configuration settings.
 * It retrieves and ensures the presence of required configuration values from environment variables.
 */
class ConfigManager {
  /**
   * Constructor takes an environment variable object.
   * @param env - The environment variables object.
   */
  constructor(private env: { [k: string]: string | undefined }) {}

  /**
   * Ensure that all required configuration values are present.
   * @param keys - An array of configuration keys to check.
   * @returns The current instance of ConfigManager.
   * @throws Error if any required configuration key is missing.
   */
  public ensureValues(keys: ConfigKey[]): ConfigManager {
    keys.forEach((k: ConfigKey) => this.getValue(k, true));
    return this;
  }

  /**
   * Method to retrieve TypeORM configuration options.
   * @returns An object containing TypeORM configuration options.
   */
  public getTypeOrmConfig(): TypeOrmModuleOptions {
    return {
      type: this.getValue(ConfigKey.DB_TYPE) as any,
      host: this.getValue(ConfigKey.DB_HOST),
      port: parseInt(this.getValue(ConfigKey.DB_PORT)),
      username: this.getValue(ConfigKey.DB_USER),
      password: this.getValue(ConfigKey.DB_PASSWORD),
      database: this.getValue(ConfigKey.DB_DATABASE),
      // Auto-detect TypeORM entities in any directory two levels up, covering both TypeScript and JavaScript files.
      entities: [__dirname + '/../../**/*.entity{.ts,.js}'],
      synchronize: this.getValue(ConfigKey.DB_SYNC) === 'true',
      logging: ['query', 'error', 'schema'],
    };
  }

  /**
   * Method to retrieve a value for a given configuration key.
   * @param key - The configuration key.
   * @param throwOnMissing - Whether to throw an error if the key is missing.
   * @returns The value of the configuration key.
   * @throws Error if the key is missing and throwOnMissing is true.
   */
  getValue(key: ConfigKey, throwOnMissing = true): string {
    const value = this.env[key];
    if (!value && throwOnMissing) {
      throw new Error(`config error - missing env.${key}`);
    }
    return value;
  }
}

/**
 * Create an instance of ConfigManager with the environment variables,
 * ensure all config values are set, and export it.
 */
const configManager = new ConfigManager(process.env).ensureValues(
  configMinimalKeys,
);
export { configManager };
