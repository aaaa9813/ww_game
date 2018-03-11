################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/protobuf/servertst.cpp 

CC_SRCS += \
../src/protobuf/server_msg.pb.cc 

OBJS += \
./src/protobuf/server_msg.pb.o \
./src/protobuf/servertst.o 

CC_DEPS += \
./src/protobuf/server_msg.pb.d 

CPP_DEPS += \
./src/protobuf/servertst.d 


# Each subdirectory must supply rules for building sources it contributes
src/protobuf/%.o: ../src/protobuf/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -I../../raknet_ex_4065 -I../../protobuf-3.5.1/src -I../include -I../../raknet_4065/include -I../../common -I/usr/include/libxml2 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/protobuf/%.o: ../src/protobuf/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -I../../raknet_ex_4065 -I../../protobuf-3.5.1/src -I../include -I../../raknet_4065/include -I../../common -I/usr/include/libxml2 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


