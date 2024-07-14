class FizzBuzz
    def initialize(size)
        @size = size
    end

    def compute
        numbers = []
        for n in 0...@size
            if is_fizzbuzz?(n)
                numbers.push('fizzbuzz')
            elsif is_fizz?(n)
                numbers.push('fizz')
            elsif is_buzz?(n)
                numbers.push('buzz')
            else
                numbers.push(n)
            end
        end
        numbers
    end

    private

    def is_fizzbuzz?(number)
        is_fizz?(number) && is_buzz?(number)
    end

    def is_fizz?(number)
        number % 3 == 0 
    end

    def is_buzz?(number)
        number % 5 == 0
    end
end

def assert(label)
    result = yield
    if result
        p(label + " VERT")
    else
        p(label + " ROUGE")
    end
end

assert('display 100 first numbers') do
    fizzbuzz = FizzBuzz.new(100)
    fizzbuzz.compute.size == 100
end

assert('3 become fizz') do
    fizzbuzz = FizzBuzz.new(100)
    fizzbuzz.compute[3] == 'fizz'
end

assert('6 become fizz') do
    fizzbuzz = FizzBuzz.new(100)
    fizzbuzz.compute[6] == 'fizz'
end

assert('5 become buzz') do
    fizzbuzz = FizzBuzz.new(100)
    fizzbuzz.compute[5] == 'buzz'
end

assert('10 become buzz') do
    fizzbuzz = FizzBuzz.new(100)
    fizzbuzz.compute[10] == 'buzz'
end

assert('15 become fizzbuzz') do
    fizzbuzz = FizzBuzz.new(100)
    fizzbuzz.compute[15] == 'fizzbuzz'
end

assert('30 become fizzbuzz') do
    fizzbuzz = FizzBuzz.new(100)
    fizzbuzz.compute[30] == 'fizzbuzz'
end