require 'calculator'

describe Calculator do
  # subject = Calculator.new
  it "Should be a calculator" do
    calc = Calculator.new
    calc.should be_a(Calculator)
  end

  describe "#clear" do
    context "when the total has a value" do
      it "should reset the total to zero" do
        subject.add(5)
        subject.total.should == 5
        subject.clear
        subject.total.should == 0
        #expect{subject.clear}.to
        #  change{subject.total}.from(5).to(0)
      end
    end
  end

  describe "#total" do
    it "should be 0 by default" do
      subject.total.should == 0
    end

    it "should keep a running total" do
      subject.total.should == 0
      subject.add(5)
      subject.total.should == 5
    end
  end

  describe "#subtract" do
    context "when passed 5 arguments" do
      it "should return the result" do
        subject.subtract(1,2,3,4,5).total.should == -15
      end
    end
    context "when passed two positive numbers" do
      it "should return the result" do
        subject.subtract(2, 3).total.should == -5
      end
    end
    it "should add a positive and negative" do
      subject.subtract(10, -3).total.should == -7
    end

    it "should add two negative numbers" do
      subject.subtract(-3, -4).total.should == 7
    end

    it "should handle zero as input" do
      subject.subtract(7, 0).total.should == -7
    end

    it "should raise an error if an argument is not a number" do
      pending
      expect { Calculator.new.subtract(7, "zero")}.to
      raise_error(TypeError,
                  "String can't be coerced into Fixnum")
    end

    it "should raise an error if passed two arguments that are not a number" do
      pending
      expect{subject.subtract("one", "two")}.to
      raise_error(TypeError,
                  "String can't be coerced into Fixnum")
    end

    it "should be chainable" do
      subject.subtract(5).subtract(3).subtract(7).subtract(10).total.should == -25
    end
  end

  describe "#add" do
    context "when passed two positive numbers" do
      it "should return the result" do
        subject.add(2, 3).total.should == 5
      end
    end
    it "should add a positive and negative" do
      subject.add(10, -3).total.should == 7
    end

    it "should add two negative numbers" do
      subject.add(-3, -4).total.should == -7
    end

    it "should handle zero as input" do
      subject.add(7, 0).total.should == 7
    end

    it "should raise an error if an argument is not a number" do
      pending
      expect { Calculator.new.add(7, "zero")}.to
        raise_error(TypeError,
                    "String can't be coerced into Fixnum")
    end

    it "should raise an error if passed two arguments that are not a number" do
      pending
      expect{subject.add("one", "two")}.to
      raise_error(TypeError,
                    "String can't be coerced into Fixnum")
    end

    it "should be chainable" do
      subject.add(5).add(3).add(7).add(10).total.should == 25
    end
  end
end