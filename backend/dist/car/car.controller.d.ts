/// <reference types="multer" />
import { CarService } from './car.service';
import { Car } from './schemas/car.schema';
export declare class CarController {
    private carService;
    constructor(carService: CarService);
    createCar(image: Express.Multer.File, CreateCarDto: Car): Promise<Car>;
    getAllCars(): Promise<Car[]>;
    getCar(id: string): Promise<Car>;
    updateCar(id: string, UpdateCarDto: Car): Promise<Car>;
    deleteCar(id: string): Promise<Car>;
}
