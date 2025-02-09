
import { BadRequestException, Injectable, NotFoundException } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import * as mongoose from 'mongoose';
import { Car } from './schemas/car.schema';

import {Query} from 'express-serve-static-core';
import { User } from '../auth/schemas/user.schema';

@Injectable()
export class CarService {
  constructor(
    @InjectModel(Car.name)
    private carModel: mongoose.Model<Car>,
  ) {}

  async create(CreateCarDto: Car ): Promise<Car> {

    const createdCar = await this.carModel.create(CreateCarDto);
    return createdCar.save();
  }

  async findAll(): Promise<Car[]> {

    const cars = await this.carModel.find();
    return cars;
  }  

  async findById(id: string): Promise<Car> {

    const isValidId = mongoose.isValidObjectId(id);

    if (!isValidId) {
      throw new BadRequestException('please enter correct id.');
    } 
    const car = await this.carModel.findById(id);

    if (!car) {
      throw new NotFoundException('Car not available.');
    } 

    return car;
  }

  async updateById(id: string, UpdateCarDto: Car): Promise<Car> {
    return await this.carModel.findByIdAndUpdate(id, UpdateCarDto, {
      new: true,
      runValidators: true,
    });
  }

  async deleteById(id: string): Promise<Car> {

    const deletedCar = await this.carModel.findByIdAndUpdate(id);
    return deletedCar;
  }
  
}
