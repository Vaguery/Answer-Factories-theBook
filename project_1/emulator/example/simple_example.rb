require_relative '../lib/cargobot'

example = CargoBot.new([[:r,:r,:r],[],[:b,:b,:b]])

example.program[0] = %w(claw R claw L claw R claw call2)
example.program[1] = %w(R claw L claw R claw L claw)

example.run

puts "  steps : #{example.steps}"
puts "pallets : #{example.pallets.inspect}"
puts "  bumps : #{example.wall_bumps}"
puts "   claw : over pallet #{example.claw_position+1} of #{example.pallets.length}"