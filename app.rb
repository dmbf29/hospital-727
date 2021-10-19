require_relative 'app/models/patient'
require_relative 'app/repositories/patient_repository'
require_relative 'app/repositories/room_repository'
require_relative 'app/models/room'

michi = Patient.new(name: 'Michi')
mai = Patient.new(name: 'Mai')
ryan = Patient.new(name: 'Ryan')
vip = Room.new(capacity: 2)
big = Room.new(capacity: 20)

vip.add_patient(michi)
vip.add_patient(mai)
big.add_patient(ryan)
# p vip
p michi.room

# room_repository = RoomRepository.new('data/rooms.csv')
# room_repository.add_recipe(recipe)
csv_file_path = 'data/rooms.csv'
room_repository = RoomRepository.new(csv_file_path)
csv_file_path = 'data/patients.csv'
patient_repository = PatientRepository.new(csv_file_path, room_repository)

# patient_repository.add(michi) # let the repo handle the id
# matias = Patient.new(name: 'Matias')
# patient_repository.add(matias)
# patient_repository.remove(3)
# # p matias
# puts
# patient_repository
# etienne = Patient.new(name: 'etienne')
# patient_repository.add(etienne)
# p etienne
