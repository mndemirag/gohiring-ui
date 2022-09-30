# frozen_string_literal: true

class PositionsController < ApplicationController
  layout "positions"

  def index
    @position_props = { open_positions: Position.all }
  end
end
