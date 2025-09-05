# frozen_string_literal: true

require "main"

RSpec.describe Main do
  describe "#price" do
    it "Validates number of arguments" do
      wrong_argument = Main.new([])
      expect(wrong_argument.errors.length).to eq(1)
      expect(wrong_argument.errors.first).to eq("Se requiere 1 argumento y tienes 0")
    end

    it "Validates input type" do
      wrong_argument = Main.new(["some string"])
      expect(wrong_argument.errors.length).to eq(1)
      expect(wrong_argument.errors.first).to eq("El argumento debe ser un número")
    end
  end
end
