  # frozen_string_literal: true

require_relative "new_gem/version"
require_relative "new_gem/builder"
module NewGem
  class Builder < StandardError; end
  # Your code goes here...
    def initialize total:, gratuity:
      @total = total
      @gratuity = gratuity
    end

    def generate
      return calculation if number_based?
      string_based
    end

    def number_based?
      (@gratuity.is_a? Numeric) || (@gratuity.integer?)

    end

    def string_based
      case @gratuity.downcase
      when "high" then calculation 25
      when "standard" then calculation 18
      when "low" then calculation 15
      end
    end
    
    def calculation gratuity = @gratuity
      @total += @total * (gratuity.to_f / 100)
    end


  end

end
