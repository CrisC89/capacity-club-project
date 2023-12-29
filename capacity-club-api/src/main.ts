import { NestFactory } from '@nestjs/core';
import { AppModule } from './core/app.module';
import { HttpExceptionFilter } from '@common/config/exception';
import { swaggerConfiguration } from '@common/documentation';
import { configManager, ConfigKey } from './common';
import { Logger } from '@nestjs/common/services/logger.service';
import { ValidationPipe } from '@nestjs/common/pipes/validation.pipe';
import { ApiInterceptor } from '@common/api/api.interceptor';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.setGlobalPrefix(configManager.getValue(ConfigKey.APP_BASE_URL));
  swaggerConfiguration.config(app);
  app.useGlobalFilters(new HttpExceptionFilter());
  app.useGlobalPipes(new ValidationPipe());
  app.useGlobalInterceptors(new ApiInterceptor());
  await app.listen(parseInt(configManager.getValue(ConfigKey.APP_PORT), 10));
}

bootstrap().then(() => {
  const logger = new Logger('Main Logger');
  logger.log('Server is started !!');
});
