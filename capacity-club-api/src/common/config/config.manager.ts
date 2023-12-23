import { TypeOrmModuleOptions } from '@nestjs/typeorm';
import { ConfigKey, configMinimalKeys } from '@common/config/enum';

import * as dotenv from 'dotenv';
dotenv.config();
//require('dotenv').config();

class ConfigManager {
  // Constructor takes an environment variable object
  constructor(private env: { [k: string]: string | undefined }) {}

  // Ensure that all required configuration values are present
  public ensureValues(keys: ConfigKey[]): ConfigManager {
    keys.forEach((k: ConfigKey) => this.getValue(k, true));
    return this;
  }

  // Method to retrieve a value for a given configuration key
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
    };
  }

  // Method to retrieve a value for a given configuration key
  getValue(key: ConfigKey, throwOnMissing = true): string {
    const value = this.env[key];
    if (!value && throwOnMissing) {
      throw new Error(`config error - missing env.${key}`);
    }
    return value;
  }
}

// Create an instance of ConfigManager with the environment variables and ensure all config values are set and export it
const configManager = new ConfigManager(process.env).ensureValues(
  configMinimalKeys,
);
export { configManager };
