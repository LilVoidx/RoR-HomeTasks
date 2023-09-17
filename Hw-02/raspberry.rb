class Raspberry
  attr_reader :state, :index

  STATES = %w[Absent Flowering Green Red].freeze

  def initialize(index)
    @index = index
    @state = STATES[0]
  end

  def grow!
    @state = STATES[STATES.index(@state) + 1] unless ripe?
  end

  def ripe?
    @state == STATES.last
  end
end
