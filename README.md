# FPGA_robo
Designed and developed a line following robot for E yantra robotics competetion

![image](https://github.com/manavshah-28/FPGA_robo/assets/82638448/1b2b08b0-a31a-452e-9dd0-f129226ab189)

## Quatus Prime project overview

![image](https://github.com/manavshah-28/FPGA_robo/assets/82638448/7476e9ce-57ce-4a34-93bf-3f231dec69fb)

## The Bot
- The robot brain is made up several Verilog modules all tied up together to operate in concert.
- These parts include modules for line sensor, color sensor, Xbee control for UART communication, Motor controller and PWM, Dijkstra's Algorithm.
- The Arena consists of black lines and nodes.
- When All three parts of the line sensor are over the black region, it is on a node. 
- Line following is made such so that bot tries to allign it's central line sensor on the black line and both left and right sensors over the white area.
- Based on the readings of the line sensor the bot must make decisions regarding it's turns. Turns are taken by controlling individual motors in opposite directions.
- The map is stored as a matrix in verilog module and the DIJKSTRA's Algorithm is used to decide turns.

### Basic FSM machine
![image](https://github.com/manavshah-28/FPGA_robo/assets/82638448/9b23d802-6cd9-429d-8379-f7de376b9a5d)

### Fusion 360 design and hand craft of bot ver.1
![image](https://github.com/manavshah-28/FPGA_robo/assets/82638448/b986d5e2-2317-49f4-ad16-d86eb288a26c)
![image](https://github.com/manavshah-28/FPGA_robo/assets/82638448/1c4643d6-1d8d-4d48-8e98-ccaca451e147)


