Feature: Cargo-bot emulator claw

Background: a bot exists
  Given I have a new cargobot

Scenario: Claw moves left and right  
  Given subroutine 1 is "L R R R"
  And the pallets are [[], [], [], [], []]
  And the claw is over pallet 2
  When I activate the cargobot
  Then the claw should be over pallet 4

Scenario: Empty claw picks up crates
  Given subroutine 1 is "claw R"
  And the pallets are [[blue, red],[]]
  And the claw is over pallet 1
  When I activate the cargobot
  Then the claw should hold a red crate
  And the pallets should be [[blue],[]]
  And the claw should be over pallet 2

Scenario: Claw with crate sets it down
  Given subroutine 1 is "claw R claw"
  And the pallets are [[blue, red],[]]
  And the claw is over pallet 1
  When I activate the cargobot
  Then the claw should be empty
  And the pallets should be [[blue],[red]]
  And the claw should be over pallet 2

Scenario: crashing into the wall
  Given subroutine 1 is "R R R L L L R R"
  And the pallets are [[],[]]
  And the claw is over pallet 1
  When I activate the cargobot
  Then the claw should be over pallet 2
  And the number of bumps should be 5

Scenario: crashing when "fragile" immediately stops the simulation
  Given subroutine 1 is "R R R L L L R R"
  And the claw is fragile
  And the pallets are [[],[]]
  And the claw is over pallet 1
  When I activate the cargobot
  Then the claw should be over pallet 2
  And the number of bumps should be 1
  And the step count should be 2

