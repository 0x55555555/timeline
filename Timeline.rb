
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


t = Timeline.new()

t.add_object(0, Float::INFINITY, {})
