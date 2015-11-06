
class Instance
  attr_accessor :creation_time, :destruction_time, :object

  def initialize(create, destroy, object)
    @creation_time = create
    @destruction_time = destroy
    @object = object
  end
end

class Timeline
  def initialize()
    @objects = []
  end

  def add_object(time_create, time_destroy, object)
    @objects << Instance.new(time_create, time_destroy, object)
  end

end

class Value
  def initialize(&blk)
    @block = blk
  end

  def sample(t)
    return @block.call(t)
  end
end

t = Timeline.new()

v = Value.new do |t|
  next Math.sin(t)
end

t.add_object(0, Float::INFINITY, v)

puts v.sample(0)
puts v.sample(Math::PI/2)
puts v.sample(Math::PI)
puts v.sample(2 * Math::PI)
