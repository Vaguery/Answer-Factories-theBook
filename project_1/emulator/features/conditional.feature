Feature: Conditional tokens

Background: a bot exists
  Given I have a new cargobot

  Scenario: conditional branching
    Given subroutine 1 is "call2 call2 call2"
    And subroutine 2 is "claw call3_red call4_blue"
    And subroutine 3 is "L claw R"
    And subroutine 4 is "R claw L"
    And the pallets are [[],[green,red,blue,blue],[]]
    And the claw is over pallet 2
    When I activate the cargobot
    Then the pallets should be [[red],[green],[blue,blue]]

  Scenario: "_any" flag
    Given subroutine 1 is "claw call2_any"
    And subroutine 2 is "R claw L claw call2_any"
    And the pallets are [[r,g,b],[]]
    And the claw is over pallet 1
    When I activate the cargobot
    Then the pallets should be [[],[b,g,r]]
    And the step count should be 17
  
  Scenario: "_none" flag
    Given subroutine 1 is "claw_none call2_any"
    And subroutine 2 is "call3_b R claw L call1_none"
    And subroutine 3 is "L claw R call1_none"
    And the pallets are [[],[r,g,b,b],[]]
    And the claw is over pallet 2
    When I activate the cargobot
    Then the pallets should be [[b,b],[],[g,r]]
    And the step count should be 40
  
  