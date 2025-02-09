import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { CarModule } from './car/car.module';
import { ConfigModule } from '@nestjs/config';
import { MongooseModule } from '@nestjs/mongoose';
import { MulterModule } from '@nestjs/platform-express';
import { AuthModule } from './auth/auth.module';
import { ServeStaticModule } from '@nestjs/serve-static';
import { join } from 'path';
import { memoryStorage } from 'multer';


@Module({
  imports: [
    ConfigModule.forRoot({
      envFilePath: '.env',
      isGlobal:true
    }),
    MulterModule.register({
      storage: memoryStorage(), 
    }),
    MongooseModule.forRoot(process.env.DB_URI),
    CarModule, 
    AuthModule,
    // ServeStaticModule.forRoot({
    //   rootPath: join(__dirname,'..','frontend')
    // })
  ],
  controllers: [AppController],
  providers: [AppService],
}) 
export class AppModule {}


