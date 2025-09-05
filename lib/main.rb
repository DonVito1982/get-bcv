# frozen_string_literal: true

require "json"
require "net/http"

class Main
  attr_reader :errors, :dollars

  def initialize(arguments)
    @arguments = arguments
    validate_arguments
  end

  def call
    if errors.empty?
      puts("Son %.2f bolívares a tasa %.2f" % [price * dollars, price])
    else
      errors.each do |error|
        puts error
      end
    end
  end

  def price
    uri = URI("https://bcv-api.rafnixg.dev/rates/")
    response = Net::HTTP.get(uri)
    JSON.parse(response)["dollar"]
  end

  private

  def validate_arguments
    @errors = []
    if @arguments.length == 1
      begin
        @dollars = Float(@arguments.first)
      rescue ArgumentError
        @errors.push("El argumento debe ser un número")
      end
    else
      @errors.push("Se requiere 1 argumento y tienes #{@arguments.length}")
    end
  end

  def message
    "Hola Victor"
  end
end
