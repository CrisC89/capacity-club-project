import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';
import { INestApplication } from '@nestjs/common';
// Configuration class for setting up Swagger documentation
class SwaggerConfiguration {
  constructor() {}
  // Method to configure and initialize Swagger.
  config(app: INestApplication<any>) {
    // Define basic Swagger document settings
    const config = new DocumentBuilder()
      .setTitle('Capacity Club API')
      .setDescription('Capacity Club API swagger document')
      .setVersion('1.0')
      // Configures Swagger to use bearer token authentication.
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
    // Create and apply the Swagger document to the application.
    const document = SwaggerModule.createDocument(app, config);
    SwaggerModule.setup('docs', app, document);
  }
}
const swaggerConfiguration = new SwaggerConfiguration();
export { swaggerConfiguration };
