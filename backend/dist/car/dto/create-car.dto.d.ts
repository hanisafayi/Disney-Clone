import { User } from '../../auth/schemas/user.schema';
export declare class CreateCarDto {
    readonly name: string;
    readonly model: string;
    readonly year: number;
    readonly ID: string;
    readonly user: User;
}
