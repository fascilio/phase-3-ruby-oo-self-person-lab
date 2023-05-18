# your code goes here
class Person
    attr_reader :name
    attr_accessor :bank_account, :happiness, :hygiene
  
    def initialize(name)
      @name = name
      @bank_account = 25
      @happiness = 8
      @hygiene = 8
    end
  
    def name=(new_name)
      raise NoMethodError, "Name cannot be changed."
    end
  
    def happiness=(new_happiness)
      @happiness = limit_range(new_happiness, 0, 10)
    end
  
    def hygiene=(new_hygiene)
      @hygiene = limit_range(new_hygiene, 0, 10)
    end
  
    def happy?
      happiness > 7
    end
  
    def clean?
      hygiene > 7
    end
  
    def get_paid(amount)
      self.bank_account += amount
      "all about the benjamins"
    end
  
    def take_bath
      self.hygiene += 4
      "♪ Rub-a-dub just relaxing in the tub ♫"
    end
  
    def work_out
      self.hygiene -= 3
      self.happiness += 2
      "♪ another one bites the dust ♫"
    end
  
    def call_friend(friend)
      self.happiness += 3
      friend.happiness += 3
      self.happiness = 10 if self.happiness > 10
      friend.happiness = 10 if friend.happiness > 10
      "Hi #{friend.name}! It's #{self.name}. How are you?"
    end
  
    def start_conversation(person, topic)
      case topic
      when "politics"
        self.happiness -= 2
        person.happiness -= 2
        self.happiness = 0 if self.happiness.negative?
        person.happiness = 0 if person.happiness.negative?
        "blah blah partisan blah lobbyist"
      when "weather"
        self.happiness += 1
        person.happiness += 1
        self.happiness = 10 if self.happiness > 10
        person.happiness = 10 if person.happiness > 10
        "blah blah sun blah rain"
      else
        "blah blah blah blah blah"
      end
    end
  
    private
  
    def limit_range(value, min, max)
      [min, value, max].sort[1]
    end
  end
  