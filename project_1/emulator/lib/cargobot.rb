class CargoBot
  attr_accessor :program
  attr_accessor :pallets
  attr_accessor :claw_position,:claw_holding
  attr_accessor :call_stack
  attr_accessor :step_limit, :steps
  attr_accessor :wall_bumps
  attr_accessor :fragile
  attr_accessor :goal
  
  def initialize(args={})
    @program = args[:program] || []
    @claw_position = args[:claw_position] || 0 
    @step_limit = args[:step_limit] || 500
    @fragile = args[:fragile] || false
    @goal = args[:goal] || []
    
    @call_stack = []
    @steps = 0
    @wall_bumps = 0
  end
  
  def condition_met?(flag)
    flag.nil? ||
    flag == "none" && @claw_holding.nil? ||
    flag == "any" && !@claw_holding.nil? ||
    flag.intern == @claw_holding
  end
  
  def handle_R
    @claw_position < @pallets.length-1 ?
      @claw_position += 1 :
      @wall_bumps += 1
  end
  
  def handle_L
    @claw_position > 0 ?
      @claw_position -= 1 :
      @wall_bumps += 1
  end
  
  def interpret(token)
    token,flag = token.match(/(\p{Alnum}+)_?(.+)?/)[1..2]
    return unless condition_met?(flag)
    case token
    when 'R'
      handle_R
    when 'L'
      handle_L
    when 'claw'
      activate_claw
    when /call(\d+)/
      subroutine = $1.to_i-1
      @call_stack = @program[subroutine].clone + @call_stack
    end
  end
  
  def activate_claw
    if @claw_holding.nil?
      @claw_holding = @pallets[@claw_position].pop
    else
      @pallets[@claw_position].push @claw_holding
      @claw_holding = nil
    end
  end
  
  def finished?
    @call_stack.empty? ||
      @steps >= @step_limit ||
      (@fragile && @wall_bumps > 0) ||
      @pallets == @goal
  end
  
  def run
    @call_stack = @program[0].clone
    until finished?
      @steps += 1
      token = @call_stack.shift
      self.interpret(token)
    end
  end
end