import { ApiProperty } from '@nestjs/swagger';
import {
  IsString,
  IsOptional,
  Length,
  IsDate,
  IsEmail,
  IsBoolean,
} from 'class-validator';

export class MemberFilter {
  @ApiProperty()
  @IsString()
  @IsOptional()
  @Length(1, 50)
  firstname?: string;

  @ApiProperty()
  @IsString()
  @IsOptional()
  @Length(1, 50)
  lastname?: string;

  @ApiProperty()
  @IsDate()
  @IsOptional()
  birthdate?: Date;

  @ApiProperty()
  @IsEmail()
  @IsOptional()
  @Length(1, 50)
  mail?: string;

  @ApiProperty()
  @IsOptional()
  @Length(1, 50)
  phone?: string;

  @ApiProperty()
  @IsOptional()
  @Length(1, 10)
  code_activation?: string;

  @ApiProperty()
  @IsOptional()
  @IsBoolean()
  active?: boolean;
}
