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
        @throws = []
    end

    def compute_score
        score = 0
        @throws.each do |pins|
            score += pins
        end
        score
    end

    def add_throw(pins)
        @throws.push(pins)
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