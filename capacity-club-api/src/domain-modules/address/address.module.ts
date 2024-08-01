import { TypeOrmModule } from '@nestjs/typeorm';
import { Module } from '@nestjs/common';
import { AddressController } from './address.controller';
import { AddressService } from './address.service';
import { Address } from './model';

/**
 * Module for managing Address.
 */

@Module({
  imports: [TypeOrmModule.forFeature([Address])],
  controllers: [AddressController],
  providers: [AddressService],
  exports: [AddressService],
})
export class AddressModule {}
