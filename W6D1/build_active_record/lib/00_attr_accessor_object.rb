class AttrAccessorObject
  def self.my_attr_accessor(*names)
    # ...
    names.each do |name|
      define_method(name) { puts "value of #{name}"}
    end
  end
end
