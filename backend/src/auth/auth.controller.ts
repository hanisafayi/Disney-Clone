import { Body, Controller, Get, Post, UseGuards, ValidationPipe } from '@nestjs/common';
import { AuthService } from './auth.service';
import { LoginDto } from './dto/login.dto';
import { SignUpDto } from './dto/signup.dto';
// import { Roles } from './decorators/roles/roles.decorator';
// import { Role } from './utils/role.enum';
// import { JwtGuard } from './jwt.guard';
// import { RolesGuard } from './guards/guard/roles.guard';

require ('cors');

@Controller('auth') 
export class AuthController { 
  constructor(private authService: AuthService) {}

  // @Roles(Role.ADMIN, Role.USER)
  // @UseGuards(JwtGuard, RolesGuard) 
  @Post('signup') 
  signUp(@Body(ValidationPipe) signUpDto: SignUpDto): Promise<{ token: string }> {
    return this.authService.signUp(signUpDto);
  }

  @Get('login') 
  login(@Body() loginDto: LoginDto): Promise<{ token: string }> {
    return this.authService.login(loginDto);
  } 
}