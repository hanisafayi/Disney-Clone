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
exports.CarController = void 0;
const common_1 = require("@nestjs/common");
const car_service_1 = require("./car.service");
const car_schema_1 = require("./schemas/car.schema");
const role_enum_1 = require("../auth/utils/role.enum");
const roles_decorator_1 = require("../auth/decorators/roles/roles.decorator");
const passport_1 = require("@nestjs/passport");
const roles_guard_1 = require("../auth/guards/guard/roles.guard");
const jwt_guard_1 = require("../auth/jwt.guard");
const platform_express_1 = require("@nestjs/platform-express");
let CarController = class CarController {
    constructor(carService) {
        this.carService = carService;
    }
    async createCar(image, CreateCarDto) {
        return this.carService.create(CreateCarDto);
    }
    async getAllCars() {
        return this.carService.findAll();
    }
    async getCar(id) {
        return this.carService.findById(id);
    }
    async updateCar(id, UpdateCarDto) {
        return this.carService.updateById(id, UpdateCarDto);
    }
    async deleteCar(id) {
        return this.carService.deleteById(id);
    }
};
exports.CarController = CarController;
__decorate([
    (0, roles_decorator_1.Roles)(role_enum_1.Role.ADMIN, role_enum_1.Role.USER),
    (0, common_1.UseGuards)((0, passport_1.AuthGuard)(), jwt_guard_1.JwtGuard, roles_guard_1.RolesGuard),
    (0, common_1.Post)(),
    (0, common_1.UseInterceptors)((0, platform_express_1.FileInterceptor)('image')),
    __param(0, (0, common_1.UploadedFile)()),
    __param(1, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object, car_schema_1.Car]),
    __metadata("design:returntype", Promise)
], CarController.prototype, "createCar", null);
__decorate([
    (0, roles_decorator_1.Roles)(role_enum_1.Role.ADMIN),
    (0, common_1.UseGuards)(jwt_guard_1.JwtGuard, roles_guard_1.RolesGuard),
    (0, common_1.Get)(),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", Promise)
], CarController.prototype, "getAllCars", null);
__decorate([
    (0, common_1.Get)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", Promise)
], CarController.prototype, "getCar", null);
__decorate([
    (0, common_1.Put)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __param(1, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String, car_schema_1.Car]),
    __metadata("design:returntype", Promise)
], CarController.prototype, "updateCar", null);
__decorate([
    (0, common_1.Delete)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", Promise)
], CarController.prototype, "deleteCar", null);
exports.CarController = CarController = __decorate([
    (0, common_1.Controller)('cars'),
    __metadata("design:paramtypes", [car_service_1.CarService])
], CarController);
//# sourceMappingURL=car.controller.js.map