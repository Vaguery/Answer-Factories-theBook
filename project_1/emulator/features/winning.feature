Feature: Solving the puzzle

Background: a bot exists
  Given I have a new cargobot

  Scenario: The emulator halts as soon as the factory state matches the goal
    Given subroutine 1 is "claw R claw L claw R claw L"
    And the pallets are [[b],[]]
    And the claw is over pallet 1
    And the goal is [[],[b]]
    When I activate the cargobot
    Then the step count should be 3
    And the claw should be over pallet 2
    And the pallets should be [[],[b]]
