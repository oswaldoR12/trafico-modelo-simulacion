import numpy as np
from trafficSim import *

sim = Simulation()

# Play with these
n = 1
# 20
a = -2
b = 12
l = 300
# 300

NUM_OF_ROADS = 27
VEHICLE_RATE = 100
STEPS_PER_UPDATE = 10

# Nodes
WEST_RIGHT_START = (-b-l, a)
WEST_LEFT_START =	(-b-l, -a)

SOUTH_RIGHT_START = (a+5, b+l)

EAST_RIGHT_START = (b+l, -a)
EAST_LEFT_START = (b+l, a)

NORTH_LEFT_START = (a+5, -b-l)

WEST_RIGHT = (-b, a)
WEST_LEFT =	(-b, -a)

SOUTH_RIGHT = (a+5, b)

EAST_RIGHT = (b, -a)
EAST_LEFT = (b, a)

NORTH_LEFT = (a+5, -b)

# Create Nodes with offset to avoid overlapping
WEST_RIGHT_START2 = (WEST_RIGHT_START[0], WEST_RIGHT_START[1] - 4)
WEST_LEFT_START2 = (WEST_LEFT_START[0], WEST_LEFT_START[1] + 4)

SOUTH_RIGHT_START2 = (SOUTH_RIGHT_START[0] - 4, SOUTH_RIGHT_START[1])

EAST_RIGHT_START2 = (EAST_RIGHT_START[0], EAST_RIGHT_START[1] + 4)
EAST_LEFT_START2 = (EAST_LEFT_START[0], EAST_LEFT_START[1] - 4)

NORTH_LEFT_START2 = (NORTH_LEFT_START[0] - 4, NORTH_LEFT_START[1])

# Create Nodes with offset to avoid overlapping
WEST_RIGHT_START3 = (WEST_RIGHT_START[0], WEST_RIGHT_START[1] - 8)
WEST_LEFT_START3 = (WEST_LEFT_START[0], WEST_LEFT_START[1] + 8)

SOUTH_RIGHT_START3 = (SOUTH_RIGHT_START[0] - 8, SOUTH_RIGHT_START[1])

EAST_RIGHT_START3 = (EAST_RIGHT_START[0], EAST_RIGHT_START[1] + 8)
EAST_LEFT_START3 = (EAST_LEFT_START[0], EAST_LEFT_START[1] - 8)

NORTH_LEFT_START3 = (NORTH_LEFT_START[0] - 8, NORTH_LEFT_START[1])

# Create Nodes with offset to avoid overlapping
WEST_RIGHT2 = (WEST_RIGHT[0], WEST_RIGHT[1] - 4)
WEST_LEFT2 =	(WEST_LEFT[0], WEST_LEFT[1] + 4)

SOUTH_RIGHT2 = (SOUTH_RIGHT[0] - 4, SOUTH_RIGHT[1])

EAST_RIGHT2 = (EAST_RIGHT[0], EAST_RIGHT[1] + 4)
EAST_LEFT2 = (EAST_LEFT[0], EAST_LEFT[1] - 4)

NORTH_LEFT2 = (NORTH_LEFT[0] - 4, NORTH_LEFT[1])

# Create Nodes with offset to avoid overlapping
WEST_RIGHT3 = (WEST_RIGHT[0], WEST_RIGHT[1] - 8)
WEST_LEFT3 =	(WEST_LEFT[0], WEST_LEFT[1] + 8)

SOUTH_RIGHT3 = (SOUTH_RIGHT[0] - 8, SOUTH_RIGHT[1])

EAST_RIGHT3 = (EAST_RIGHT[0], EAST_RIGHT[1] + 8)
EAST_LEFT3 = (EAST_LEFT[0], EAST_LEFT[1] - 8)

NORTH_LEFT3 = (NORTH_LEFT[0] - 8, NORTH_LEFT[1])

# Roads
WEST_INBOUND = (WEST_RIGHT, WEST_RIGHT_START)
SOUTH_INBOUND = (SOUTH_RIGHT, SOUTH_RIGHT_START)
EAST_INBOUND = (EAST_RIGHT, EAST_RIGHT_START)

WEST_OUTBOUND = (WEST_LEFT_START, WEST_LEFT)
EAST_OUTBOUND = (EAST_LEFT_START, EAST_LEFT)
NORTH_OUTBOUND = (NORTH_LEFT_START, NORTH_LEFT)

WEST_STRAIGHT = (EAST_LEFT, WEST_RIGHT)
SOUTH_STRAIGHT = (NORTH_LEFT, SOUTH_RIGHT)
EAST_STRAIGHT = (WEST_LEFT, EAST_RIGHT)

WEST_LEFT_TURN = turn_road(NORTH_LEFT, WEST_RIGHT, TURN_LEFT, n)

SOUTH_RIGHT_TURN = turn_road(EAST_LEFT, SOUTH_RIGHT, TURN_RIGHT, n)

EAST_RIGHT_TURN = turn_road(NORTH_LEFT, EAST_RIGHT, TURN_RIGHT, n)


# Create Roads
WEST_INBOUND2 = (WEST_RIGHT2, WEST_RIGHT_START2)
SOUTH_INBOUND2 = (SOUTH_RIGHT2, SOUTH_RIGHT_START2)
EAST_INBOUND2 = (EAST_RIGHT2, EAST_RIGHT_START2)

WEST_OUTBOUND2 = (WEST_LEFT_START2, WEST_LEFT2)
EAST_OUTBOUND2 = (EAST_LEFT_START2, EAST_LEFT2)
NORTH_OUTBOUND2 = (NORTH_LEFT_START2, NORTH_LEFT2)

WEST_STRAIGHT2 = (EAST_LEFT2, WEST_RIGHT2)
SOUTH_STRAIGHT2 = (NORTH_LEFT2, SOUTH_RIGHT2)
EAST_STRAIGHT2 = (WEST_LEFT2, EAST_RIGHT2)


WEST_LEFT_TURN2 = turn_road(NORTH_LEFT2,WEST_RIGHT2, TURN_LEFT, n)

SOUTH_RIGHT_TURN2 = turn_road(EAST_LEFT2,SOUTH_RIGHT2, TURN_RIGHT, n)

EAST_RIGHT_TURN2 = turn_road(NORTH_LEFT2,EAST_RIGHT2, TURN_RIGHT, n)


# Create Roads
WEST_INBOUND3 = (WEST_RIGHT3, WEST_RIGHT_START3)
SOUTH_INBOUND3 = (SOUTH_RIGHT3, SOUTH_RIGHT_START3)
EAST_INBOUND3 = (EAST_RIGHT3, EAST_RIGHT_START3)

WEST_OUTBOUND3 = (WEST_LEFT_START3, WEST_LEFT3)
EAST_OUTBOUND3 = (EAST_LEFT_START3, EAST_LEFT3)
NORTH_OUTBOUND3 = (NORTH_LEFT_START3, NORTH_LEFT3)

WEST_STRAIGHT3 = (EAST_LEFT3, WEST_RIGHT3)
SOUTH_STRAIGHT3 = (NORTH_LEFT3, SOUTH_RIGHT3)
EAST_STRAIGHT3 = (WEST_LEFT3, EAST_RIGHT3)

WEST_LEFT_TURN3 = turn_road(NORTH_LEFT3, WEST_RIGHT3, TURN_LEFT, n)

SOUTH_RIGHT_TURN3 = turn_road(WEST_LEFT3, SOUTH_RIGHT3, TURN_RIGHT, n)

EAST_RIGHT_TURN3 = turn_road(NORTH_LEFT3, EAST_RIGHT3, TURN_RIGHT, n)





sim.create_roads([
    WEST_INBOUND,   #0
    SOUTH_INBOUND,  #1
    EAST_INBOUND,   #2

    WEST_OUTBOUND,  #3
    EAST_OUTBOUND,  #4
    NORTH_OUTBOUND, #5

    WEST_STRAIGHT,  #6
    SOUTH_STRAIGHT, #7
    EAST_STRAIGHT,  #8

    # NEW ROADS ----------------------------------------------
    WEST_INBOUND2,  #9
    SOUTH_INBOUND2, #10
    EAST_INBOUND2,  #11

    WEST_OUTBOUND2, #12
    EAST_OUTBOUND2, #13
    NORTH_OUTBOUND2, #14

    WEST_STRAIGHT2, #15
    SOUTH_STRAIGHT2, #16
    EAST_STRAIGHT2, #17
    #----------------------------------------------------------------

    WEST_INBOUND3,  #18
    SOUTH_INBOUND3, #19
    EAST_INBOUND3,  #20

    WEST_OUTBOUND3, #21
    EAST_OUTBOUND3, #22
    NORTH_OUTBOUND3, #23

    WEST_STRAIGHT3, #24
    SOUTH_STRAIGHT3, #25
    EAST_STRAIGHT3, #26

    *WEST_LEFT_TURN,

    *SOUTH_RIGHT_TURN,

    *EAST_RIGHT_TURN,


    *WEST_LEFT_TURN2,

    *SOUTH_RIGHT_TURN2,

    *EAST_RIGHT_TURN2,


    *WEST_LEFT_TURN3,

    *SOUTH_RIGHT_TURN3, #ESTE!

    *EAST_RIGHT_TURN3,


])

def road(a): return range(a, a+n)
# print("RANGOS:")
# print(*road(NUM_OF_ROADS))

road(NUM_OF_ROADS)
sim.create_gen({
'vehicle_rate': VEHICLE_RATE,
'vehicles':[
  

 # 1st Lane

          [2, {'path': [3, 8, 2]}],

          [2, {'path': [4, 6, 0]}],
          [3, {'path': [4, *road(NUM_OF_ROADS+1*n), 1]}],

          [2, {'path': [5, 7, 1]}],
          [2, {'path': [5, *road(NUM_OF_ROADS+2*n), 2]}],

    #   2nd Lane

        #  [2, {'path': [12, 17, 11]}],

        #  [3, {'path': [13, *road(NUM_OF_ROADS+4*n), 10]}],
        #  [3, {'path': [13, 15, 9]}],

        #  [3, {'path': [14, 16, 10]}],
        #  [3, {'path': [14, *road(NUM_OF_ROADS+3*n), 9]}],


    # 3rd Lane (no red light/turn left only)

        # [3, {'path': [22, 24, 18]}],

        # [3, {'path': [23, *road(NUM_OF_ROADS+6*n), 18]}],

        # [3, {'path': [21, 34, 19]}]



    # [3, {'path': [28, *road(NUM_OF_ROADS+19*n), 25]}],
    # [4, {'path': [29, *road(NUM_OF_ROADS+21*n), 26]}],
    # [4, {'path': [30, *road(NUM_OF_ROADS+23*n), 27]}]

 ]})

sim.create_signal([[3],[4],[5]])
sim.create_signal([[12],[13],[14]])
sim.create_signal([[21],[22],[23]])

# sim.create_signal([[4], [5], [6], [7]])
# sim.create_signal([[16], [17], [18], [19]])
# sim.create_signal([[28], [29], [30], [31]])

# # Create Green Light for 3rd Lane
# sim.create_signal([[28]])
# sim.create_signal([[29]])
# sim.create_signal([[30]])
# sim.create_signal([[31]])

# Start simulation
win = Window(sim)
win.zoom = 10
if(sim.isPaused == False):
    win.run(steps_per_update=STEPS_PER_UPDATE)
