
import {
    Body,
    Controller,
    Delete,
    Get,
    Param,
    Post,
    Put,
    UploadedFile,
    UseGuards,
    UseInterceptors,
  } from '@nestjs/common';
import { CarService } from './car.service';
import { CreateCarDto } from './dto/create-car.dto';
import { UpdateCarDto } from './dto/update-car.dto';
import { Car } from './schemas/car.schema';
import { Role } from 'src/auth/utils/role.enum';
import { Roles } from 'src/auth/decorators/roles/roles.decorator';
import { Express } from 'express';

import { AuthGuard } from '@nestjs/passport';
import { RolesGuard } from 'src/auth/guards/guard/roles.guard';
import { JwtGuard } from 'src/auth/jwt.guard';
import { FileInterceptor } from '@nestjs/platform-express';

  @Controller('cars')
  export class CarController {
    constructor(private carService: CarService) {}

    @Roles(Role.ADMIN, Role.USER)
    @UseGuards(AuthGuard(), JwtGuard, RolesGuard)
    @Post()
    @UseInterceptors(FileInterceptor('image'))
    async createCar(
      @UploadedFile() image: Express.Multer.File,
      @Body() CreateCarDto: Car): Promise<Car> {

      return this.carService.create(CreateCarDto);
    }  

    @Roles(Role.ADMIN)
    @UseGuards(JwtGuard, RolesGuard)
    @Get()
    async getAllCars(): Promise<Car[]> {
      return this.carService.findAll();
      
    }

    @Get(':id')
    async getCar(
      @Param('id') id: string ): Promise<Car> {
      return this.carService.findById(id);
    }
  
    @Put(':id')
    async updateCar(
      @Param('id') id: string,
      @Body() UpdateCarDto: Car): Promise<Car> {
      return this.carService.updateById(id, UpdateCarDto);
    }
  
    @Delete(':id')
    async deleteCar(
      @Param('id') id: string ): Promise<Car> {
      return this.carService.deleteById(id);
    }
  }
