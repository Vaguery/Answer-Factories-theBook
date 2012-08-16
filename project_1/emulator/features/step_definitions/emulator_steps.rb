Given /^I have a new cargobot$/ do
  @bot = CargoBot.new
end

Given /^subroutine (\d+) is "(.*?)"$/ do |which, code|
  subroutine = which.to_i - 1
  tokens = code.split
  @bot.program[subroutine] = tokens
end

Given /^the pallets are (\[.+\])$/ do |setup|
  symbolized_stacks = setup.gsub(/(\w+)/,':\1')
  @bot.pallets = eval(symbolized_stacks)
end

Given /^the claw is over pallet (\d+)$/ do |which|
  position = which.to_i - 1
  @bot.claw_position = position
end

Given /^the step limit is (\d+)$/ do |limit|
  @bot.step_limit = limit.to_i
end

Given /^the claw is fragile$/ do
  @bot.fragile = true
end

Given /^the goal is (\[.+\])$/ do |goal|
  symbolized_stacks = goal.gsub(/(\w+)/,':\1')
  @bot.goal = eval(symbolized_stacks)
end


When /^I activate the cargobot$/ do
  @bot.run
end


Then /^the claw should be over pallet (\d+)$/ do |which|
  position = which.to_i - 1
  @bot.claw_position.should == position.to_i
end

Then /^the claw should hold a (.*?) crate$/ do |color|
  crate = color.intern
  @bot.claw_holding.should == crate
end

Then /^the pallets should be (\[.+\])$/ do |factory_layout|
  symbolized_stacks = factory_layout.gsub(/(\w+)/,':\1')
  @bot.pallets.should == eval(symbolized_stacks)
end

Then /^the call stack should be "(.*?)"$/ do |stack_as_string|
  @bot.call_stack.join(" ").should == stack_as_string
end

Then /^the claw should be empty$/ do
  @bot.claw_holding.should be_nil
end

Then /^the step count should be (\d+)$/ do |steps|
  @bot.steps.should == steps.to_i
end

Then /^the number of bumps should be (\d+)$/ do |bumps|
  @bot.wall_bumps.should == bumps.to_i
end
