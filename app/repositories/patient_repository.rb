require 'csv'
require_relative '../models/patient'

class PatientRepository
  def initialize(csv_file_path, room_repository)
    @csv_file_path = csv_file_path
    @room_repository = room_repository
    @patients = []
    @next_id = 1
    load_csv
  end

  def add(patient)
    patient.id = @next_id
    @patients << patient
    @next_id += 1
  end

  def remove(index)
    @patients.delete_at(index)
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol}
    CSV.foreach(@csv_file_path, csv_options) do |attributes|
      # only change values that aren't strings
      attributes[:cured] = attributes[:cured] == 'true'
      attributes[:id] = attributes[:id].to_i
      # p attributes[:room_id].to_i
      # room = @room_repository.find(attributes[:room_id].to_i)
      patient = Patient.new(attributes)
      # room.add_patient(patient)
      @patients << patient
    end
    @next_id = @patients.any? ? @patients.last.id + 1 : @next_id
  end
end
