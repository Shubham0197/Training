module Working
  # module method
  Y = 20
  def portal
    puts "Welcome to Portal!"
  end

  # module method
  def tutorial
    puts "Ruby Tutorial!"
  end

  # module method
  def topic
    puts "Topic - Module"
  end
end

# Create class
class Parent
  # Include module in class
  # by using 'include' keyword
  include Working

  # Method of the class
  def add
    x = 30 + Y
      puts x
  end
end

# Creating objects of class
obj_class = Parent.new

# calling module methods
# with the help of GeeksforGeeks
# class object
obj_class.portal
obj_class.tutorial
obj_class.topic

# Calling class method
obj_class.add
puts Working::Y
