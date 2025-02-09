import { IsEnum, IsEmpty, IsNotEmpty, IsNumber, IsString, isEmpty } from 'class-validator';
import { User } from '../../auth/schemas/user.schema';
// import { Category } from '../schemas/car.schema';

export class CreateCarDto {
 
  @IsNotEmpty()
  @IsString()
  readonly name: string;

  @IsNotEmpty()
  @IsString()
  readonly model: string;

  @IsNotEmpty()
  @IsString()
  readonly year: number;

  @IsNotEmpty()
  @IsNumber()
  readonly ID: string;

  // @IsNotEmpty() 
  // @IsEnum(Category, { message: 'please enter correct category'})
  // readonly category: Category;

  @IsEmpty({ message: " You can't pass user id"})
  readonly user: User;

}