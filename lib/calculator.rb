class Calculator
  attr_accessor :total

  def initialize
    self.clear
  end

  def add(*args)
    verify_arguments(args)
    args.each do |arg|
      self.total += arg
    end

    self
  end

  def subtract(*args)
    verify_arguments(args)
    args.each do |arg|
      self.total -= arg
    end

    self
  end

  def clear
    self.total = 0
  end

  private
  def verify_arguments(args)
    args.each do |arg|
      raise(TypeError, "String can't be coerced into Fixnum") unless arg.is_a?(Numeric)
    end
  end
end