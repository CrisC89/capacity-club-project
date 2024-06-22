import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';
import { INestApplication } from '@nestjs/common';

class SwaggerConfiguration {
  constructor() {}
  /**
   * Method to configure and initialize Swagger.
   * @param app - The NestJS application instance.
   */
  config(app: INestApplication<any>) {
    const config = new DocumentBuilder()
      .setTitle('Capacity Club API')
      .setDescription('Capacity Club API swagger document')
      .setVersion('1.0')
      .addBearerAuth(
        {
          description: `Please enter token`,
          name: 'Authorization',
          bearerFormat: 'Bearer',
          scheme: 'Bearer',
          type: 'http',
          in: 'Header',
        },
        'access-token',
      )
      .build();

    const document = SwaggerModule.createDocument(app, config);
    SwaggerModule.setup('docs', app, document);
  }
}
const swaggerConfiguration = new SwaggerConfiguration();
export { swaggerConfiguration };
