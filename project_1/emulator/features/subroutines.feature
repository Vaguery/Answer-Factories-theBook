Feature: Subroutines and timeouts

Background: a bot exists
  Given I have a new cargobot

  Scenario: "call" tokens immediately branch, then return from subroutines
    Given subroutine 1 is "R call2 R R call2"
    And subroutine 2 is "claw L claw"
    And the pallets are [[],[red],[blue]]
    And the claw is over pallet 1
    When I activate the cargobot
    Then the pallets should be [[red],[blue],[]]
    And the claw should be over pallet 2
    And the claw should be empty
  
  Scenario: recursive calls form loops (and time out)
    Given subroutine 1 is "claw R claw R call2"
    And subroutine 2 is "claw L L claw R call3"
    And subroutine 3 is "claw R claw L L call1"
    And the pallets are [[red],[],[blue]]
    And the step limit is 24
    And the claw is over pallet 1
    When I activate the cargobot
    Then the step count should be 24
    And the pallets should be [[],[blue],[]]
    And the claw should be over pallet 2
    And the claw should hold a red crate


