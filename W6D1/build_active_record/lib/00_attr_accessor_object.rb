class AttrAccessorObject
  def self.my_attr_accessor(*names)
    # ...
    names.each do |name|
      define_method(name) do |name|
        puts name
      end
    end
      
  end
end
