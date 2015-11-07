
class Instance
  attr_accessor :creation_time, :destruction_time, :object

  def initialize(create, destroy, object)
    @creation_time = create
    @destruction_time = destroy
    @object = object
  end

  def is_alive(t)
    return t >= @creation_time && t <= @destruction_time
  end

  def sample(t)
    return object.sample(self, t)
  end
end

class Timeline
  def initialize()
    @objects = []
  end

  def add_object(time_create, time_destroy, object)
    inst = Instance.new(time_create, time_destroy, object)
    @objects << inst
    return inst
  end

end

class Value
  def initialize(&blk)
    @block = blk
  end

  def sample(inst, t)
    return @block.call(inst, t)
  end
end

t = Timeline.new()

v = Value.new do |i, t|
  if i.is_alive(t)
    next Math.sin(t)
  else
    return 0
  end
end

inst = t.add_object(0, Float::INFINITY, v)

puts inst.sample(0)
puts inst.sample(Math::PI/2)
puts inst.sample(Math::PI)
puts inst.sample(2 * Math::PI)
