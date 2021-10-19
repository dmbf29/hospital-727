require 'csv'
require_relative '../models/room'

class RoomRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @rooms = []
    @next_id = 1
    load_csv
  end

  def add(room)
    room.id = @next_id
    @rooms << room
    @next_id += 1
  end

  def remove(index)
    @rooms.delete_at(index)
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol}
    CSV.foreach(@csv_file_path, csv_options) do |attributes|
      # only change values that aren't strings
      attributes[:capacity] = attributes[:capacity].to_i
      attributes[:id] = attributes[:id].to_i
      @rooms << Room.new(attributes)
    end
    @next_id = @rooms.any? ? @rooms.last.id + 1 : @next_id
  end
end
