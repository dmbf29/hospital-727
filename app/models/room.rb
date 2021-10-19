class Room
  class CapacityReachedError < Exception; end
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id] # integer
    @capacity = attributes[:capacity] # integer
    @patients = [] # an array INSTANCES
  end

  def full?
    @patients.length >= @capacity
  end

  # vip.add_patient(michi)
  def add_patient(patient)
    unless full?
      @patients << patient
      patient.room = self
    else
      raise CapacityReachedError, 'The room is full'
    end
  end
end
