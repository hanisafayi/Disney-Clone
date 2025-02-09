import { IsEmpty, IsEnum, IsNumber, IsOptional, IsString } from 'class-validator';
// import { Category } from '../schemas/car.schema';
import { User } from '../../auth/schemas/user.schema';

export class UpdateCarDto {

  @IsOptional()
  @IsString()
  readonly name: string;

  @IsOptional()
  @IsString()
  readonly model: string;

  @IsOptional()
  @IsString()
  readonly year: number;

  @IsOptional()
  @IsNumber()
  readonly ID: string;

  // @IsOptional()
  // @IsEnum(Category, { message: 'please enter correct category'})
  // readonly category: Category;

  @IsEmpty({ message: " You can't pass user id"})
  readonly user: User;

}