/*
Exemple
export const AppControllerHelloWorld: ApiOperationOptions = {
 summary: 'Hello world',
 description: 'Ma super description pour cette méthode'
}

@ApiTags('Route de base')
@Controller()
export class AppController {
 constructor(private readonly appService: AppService) {
 }
 @ApiOperation(AppControllerHelloWorld)
 @Get()
 getHello(): string {
 throw new TestException();
 }
*/
