# 10 frames
# chaque frame a 2 lancés
# Faire tomber X quilles donnent X points
# Faire tomber 10 quilles en une frame rapporte 10 + lancer suivant
# Faire tomber 10 quilles au premier lancé d une frame rapporte 10 + 2 lancés suivants
# Si 10e frame fait un spare => un lancé supplémentaire
# Si 10e frame fait strike => deux lancés supplémentaire

def assert(label)
    result = yield
    if result
        p(label + " VERT")
    else
        p(label + " ROUGE")
    end
end

class Bowling
    def initialize
        @frames = []
    end

    def compute_score
        score = 0
        @frames.each.with_index do |frame, index|
            score += frame.score
            next_frame = @frames[index + 1]
            if frame.strike? && next_frame
                score += next_frame.score
            elsif frame.spare? && next_frame
                score += next_frame.first_throw
            end
        end
        score
    end

    def add_throw(pins)
        last_frame = @frames.last
        if last_frame && !last_frame.complete?
            last_frame.add_second_throw(pins)
        else
            new_frame = Frame.new(pins)
            @frames.push(new_frame)
        end
    end

    private 
    
    def has_index_plus_1?(index)
        @throws[index + 1] != nil
    end
end

class Frame
    attr_reader :first_throw

    def initialize(pins)
        @first_throw = pins
        @second_throw = nil
    end

    def add_second_throw(pins)
        @second_throw = pins
    end

    def complete?
        @second_throw != nil || strike?
    end

    def spare?
        score == 10
    end

    def strike?
        first_throw == 10
    end

    def score
        first_throw + @second_throw.to_i
    end
end


assert('0 points when the game was just started') do
    bowling = Bowling.new
    bowling.compute_score == 0
end

assert('3 pins fallen give 3 points') do
    bowling = Bowling.new
    bowling.add_throw(3)
    bowling.compute_score == 3
end

assert('spare give 14 points') do
    bowling = Bowling.new
    bowling.add_throw(3)
    bowling.add_throw(7)
    bowling.add_throw(2)
    puts bowling.compute_score
    bowling.compute_score == 14
end

assert('spare give 28 points') do
    bowling = Bowling.new
    bowling.add_throw(10)
    bowling.add_throw(7)
    bowling.add_throw(2)
    puts bowling.compute_score
    bowling.compute_score == 28
end