class ComplexNumber

    #class var
    @@addoperation = 0
    @@multiplyoperation = 0

    #setter && getter
    attr_accessor :real, :img

    #constructor
    def initialize(real, img)
        @real = real
        @img = img
    end

    #override on + function 
    def + (cn)
        @@addoperation += 1
        real = @real + cn.real
        img  = @img  + cn.img
        ComplexNumber.new(real, img)
    end

    #override on * function 
    def *(other)
        @@multiplyoperation += 1
        real = @real *other.real - @img * other.img
        img  = @real *other.img  + @img * other.real
       ComplexNumber.new(real, img)
    end

    #bulk_add
    def self.bulk_add(cns)
        result = cns.first
        cns.drop(1).each do |cn|
            result += cn
        end
        result
    end

    #bulk_multiply
    def self.bulk_multiply(cns)
        result = cns.first
        cns.drop(1).each do |cn|
            result *= cn
        end
        result
    end

    # override to default to_string function
    def to_s
        "(#{self.real} + #{self.img}i)"
    end

    #get_state
    def self.get_state()
        puts "No. Add Operation: #{@@addoperation}"
        puts "No. Multiply Operation: #{@@multiplyoperation}"
    end   
      
end

complexnumber1 = ComplexNumber.new(3, 2)
complexnumber2 = ComplexNumber.new(1, 7)

puts complexnumber1 + complexnumber2
puts complexnumber1 * complexnumber2

#array operation
arr = [complexnumber1, complexnumber2, complexnumber1]

puts ComplexNumber.bulk_add(arr)
puts ComplexNumber.bulk_multiply(arr)

#get state
ComplexNumber.get_state()
