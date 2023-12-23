import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';
import { TestException } from 'core/app.exception';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  getHello(): string {
    //return this.appService.getHello();
    throw new TestException();
  }
}
