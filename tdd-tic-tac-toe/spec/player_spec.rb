require "player"
require "helper"

RSpec.describe "Player" do
  it "has a kind" do
    player = Player.new(STATE[:cross])
    expect(player.kind).not_to be_nil
  end

  it "has the right kind" do
    cross = STATE[:cross]
    player = Player.new(cross)
    expect(player.kind).to eq(cross)
  end
end
