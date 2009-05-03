require 'lib/positioned'

=begin rdoc
=Map, to keep track of various positioned elements
The elements are internally categorized by classname.
=end
module Anthill
  class Map
    def initialize
      @elements = {}
    end

    # number of elements, can be categorized
    def length classname = nil
      self[classname].length
    end

    # adding an element, can be positioned meanwhile
    def <<(element, position = nil)
      classname = element.class.to_s.to_sym
      @elements[classname] ||= []
      unless @elements[classname].include? element
        @elements[classname] << element
        element.extend Positioned unless element.respond_to? :position
        element.position = position.nil? ?
          element.position.nil? ? Vector.new(0, 0) : element.position : position
        element.map = self
      end
    end

    # removing an element
    def >> element
      classname = element.class.to_s.to_sym
      @elements[classname].delete element
      element.map = nil
    end

    # iterating through the elements, can be categorized
    def each classname = nil, &block
      self[classname].each(&block)
    end

    # access to the flattened array, can be categorized
    def [] classname = nil
      values = classname.nil? ? @elements.values.flatten : @elements[classname.to_sym]
      values.nil? ? [] : values
    end
  end
end
