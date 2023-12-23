import { NestFactory } from '@nestjs/core';
import { AppModule } from './core/app.module';
import { HttpExceptionFilter } from '@common/config/exception';
import { swaggerConfiguration } from '@common/documentation';

async function bootstrap() {
  // Create an instance of the NestJS application
  const app = await NestFactory.create(AppModule);
  // Apply a global exception filter.
  app.useGlobalFilters(new HttpExceptionFilter());
  // Initializes and applies Swagger configuration.
  swaggerConfiguration.config(app);
  // Start listening on port 3000.
  await app.listen(3000);
}
bootstrap();
