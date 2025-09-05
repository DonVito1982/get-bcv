# frozen_string_literal: true

require "main"

RSpec.describe Main do
  describe "#message" do
    it "retrieves the message" do
      expect(Main.new.message).to eq("Hola Victor")
    end
  end
end
