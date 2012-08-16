Feature: Cargo-bot examples

Background: a bot exists
  Given I have a new cargobot

Scenario: A known solution to Tutorial 1 works
  Given subroutine 1 is "claw R claw"
  And the pallets are [[yellow],[]]
  And the goal is [[], [yellow]]
  When I activate the cargobot
  Then the pallets should be [[], [yellow]]
  And the step count should be 3
  And the number of bumps should be 0
  
  
Scenario: A known solution to Tutorial 2 works
  Given subroutine 1 is "claw R R R claw"
  And the pallets are [[yellow],[],[],[]]
  And the goal is [[],[],[],[yellow]]
  When I activate the cargobot
  Then the pallets should be [[],[],[],[yellow]]
  And the step count should be 5
  And the number of bumps should be 0
  
  
Scenario: A known solution to Tutorial 4 works
  Given subroutine 1 is "call2 call2 call2 call2 R call1"
  And subroutine 2 is "claw R claw L"
  And the pallets are [[blue,red,green,yellow],[],[],[],[],[]]
  And the goal is [[],[],[],[],[],[yellow,green,red,blue]]
  When I activate the cargobot
  Then the pallets should be [[],[],[],[],[],[yellow,green,red,blue]]
  And the step count should be 107
  And the number of bumps should be 0
  
  
Scenario: A known solution to 'Go the Distance' (Easy) works
  Given subroutine 1 is "R_none claw claw_y L_r call1"
  And the pallets are [[y],[y],[y],[y],[y],[y],[],[r,r,r,r]]
  And the goal is [[y],[y],[y],[y],[y],[y],[r,r,r,r],[]]
  And the step limit is 2000
  When I activate the cargobot
  Then the pallets should be [[y],[y],[y],[y],[y],[y],[r,r,r,r],[]]
  And the number of bumps should be 0
  
  
Scenario: A known solution to 'Lay it Out' (Medium) works
  Given subroutine 1 is "call2 claw L call2_g call1"
  And subroutine 2 is "claw R"
  And the pallets are [[g,g,g,g,g,g],[],[],[],[],[]]
  And the goal is [[g],[g],[g],[g],[g],[g]]
  And the step limit is 2000
  When I activate the cargobot
  Then the pallets should be [[g],[g],[g],[g],[g],[g]]
  And the number of bumps should be 0
  
  
Scenario: A known solution to 'Restoring Order' (Impossible) works
  Given subroutine 1 is "R_none claw_none call2_b call3_r call1"
  And subroutine 2 is "call4 call3_r call2_b call4"
  And subroutine 3 is "R claw L claw"
  And subroutine 4 is "L claw R claw"
  And the pallets are [[],[b,r,b,b],[r,b,r,b],[b,b,b],[r],[r,b],[b],[]]
  And the goal is [[],[b,b,b],[b,b],[b,b,b],[],[b],[b],[r,r,r,r,r]]
  And the step limit is 2000
  When I activate the cargobot
  Then the pallets should be [[],[b,b,b],[b,b],[b,b,b],[],[b],[b],[r,r,r,r,r]]
  And the number of bumps should be 0


