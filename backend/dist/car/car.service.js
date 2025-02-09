"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var __param = (this && this.__param) || function (paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.CarService = void 0;
const common_1 = require("@nestjs/common");
const mongoose_1 = require("@nestjs/mongoose");
const mongoose = require("mongoose");
const car_schema_1 = require("./schemas/car.schema");
let CarService = class CarService {
    constructor(carModel) {
        this.carModel = carModel;
    }
    async create(CreateCarDto) {
        const createdCar = await this.carModel.create(CreateCarDto);
        return createdCar.save();
    }
    async findAll() {
        const cars = await this.carModel.find();
        return cars;
    }
    async findById(id) {
        const isValidId = mongoose.isValidObjectId(id);
        if (!isValidId) {
            throw new common_1.BadRequestException('please enter correct id.');
        }
        const car = await this.carModel.findById(id);
        if (!car) {
            throw new common_1.NotFoundException('Car not available.');
        }
        return car;
    }
    async updateById(id, UpdateCarDto) {
        return await this.carModel.findByIdAndUpdate(id, UpdateCarDto, {
            new: true,
            runValidators: true,
        });
    }
    async deleteById(id) {
        const deletedCar = await this.carModel.findByIdAndUpdate(id);
        return deletedCar;
    }
};
exports.CarService = CarService;
exports.CarService = CarService = __decorate([
    (0, common_1.Injectable)(),
    __param(0, (0, mongoose_1.InjectModel)(car_schema_1.Car.name)),
    __metadata("design:paramtypes", [mongoose.Model])
], CarService);
//# sourceMappingURL=car.service.js.map