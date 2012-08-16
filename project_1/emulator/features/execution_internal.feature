Feature: Execution internals

Background: a bot exists
  Given I have a new cargobot

  Scenario: subroutine 1 is copied to execution stack first
    Given subroutine 1 is "R L claw"
    And the pallets are [[], []]
    And the claw is over pallet 1
    And the step limit is 0
    When I activate the cargobot
    Then the call stack should be "R L claw"

  Scenario: call_stack contents are consumed as the interpreter runs
    Given subroutine 1 is "R L claw"
    And the pallets are [[], []]
    And the claw is over pallet 1
    And the step limit is 1
    When I activate the cargobot
    Then the call stack should be "L claw"
    And the claw should be over pallet 2
