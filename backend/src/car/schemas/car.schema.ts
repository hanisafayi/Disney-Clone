import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { User } from '../../auth/schemas/user.schema';
import { Types} from 'mongoose';
import { Type } from 'class-transformer';

// export enum Category {
//   ADVENTURE = 'Adventure',
//   CLASSICS = 'Classics',
//   CRIME = 'Crime',
//   FANTASY = 'Fantasy',
// }

@Schema({
  timestamps: true,
})
export class Car {
  @Prop()
  name: string;

  @Prop()
  model: string;

  @Prop()
  year: number;

  @Prop()
  ID: string;

  // @Prop()
  // category: Category;

  @Prop({required: false, type: Types.Buffer})
  image: Buffer;


  // @Prop({ type: mongoose.Schema.Types.ObjectId, ref: "User"})
  // user: User;
}

export const CarSchema = SchemaFactory.createForClass(Car);