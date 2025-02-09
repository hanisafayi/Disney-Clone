import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Document } from 'mongoose';
// import { Role } from 'src/auth/utils/role.enum';

export enum Role {
  USER = 'User',
  ADMIN = 'Admin',
}

@Schema({
  timestamps: true,
})
export class User extends Document {
  static role(name: string): (target: typeof import("../auth.service").AuthService, propertyKey: undefined, parameterIndex: 0) => void {
    throw new Error('Method not implemented.');
}
  @Prop()
  name: string;

  @Prop({ unique: [true, 'Invalid email entered'] })
  email: string;

  @Prop()
  password: string;

  @Prop({ type: String , enum: Role, default: Role.USER})
  role: Role;
  
}

export const UserSchema = SchemaFactory.createForClass(User);