lab = Lab.find_or_create_by(name: 'SILC Test Lab', country: 'United States')

user= Experimenter.find_or_initialize_by(
  first_name: 'Alex',
  last_name: 'Baranov',
  email: 'alex.baranov@gaiasystemsinc.com',
  country: 'United States',
  web_site: 'gaiasystemsinc.com',
  administrator: true)
user.lab_id = lab.id
user.password = 'password'
user.password_confirmation = 'password'
user.save
Study.find_or_create_by(
  name: 'Virtual Ambler',
  lab_id: lab.id,
  experimenter_id: user.id,
  active: true,
  ask_participant_id: true,
  welcome_text: "Welcome to Virtual Ambler. This experiment will test your navigation skills. It will take approximately 90 minutes to complete and you will receive specific instructions at each stage of the experiment. If you have questions at any time, please ask the experimenter.",
  completion_text: "You're all done now!"
)
puts "creating virtual environments"
vambler = VirtualEnvironment.find_or_create_by(name: 'Ambler',
  map_arrangement_pixel_width: 792,
  map_arrangement_pixel_height: 570)

puts 'creating virtual routes'
route_a = VirtualRoute.find_or_create_by(name: 'Route A')
route_b = VirtualRoute.find_or_create_by(name: 'Route B')
puts 'creating virtual landmarks'
VirtualLandmark.find_or_create_by(
  virtual_route_id: route_a.id,
  virtual_environment_id: vambler.id,
  name: 'Batty House',
  map_arrangement_piece_image: 'batty_house_piece.png',
  icon_image: 'batty_house_icon.jpg',
  piece_upper_left_pixel_x: 27,
  piece_upper_left_pixel_y: 272,
  front_door_pixel_x: 63,
  front_door_pixel_y: 292,
  pointing_location_pixel_x: 91,
  pointing_location_pixel_y: 309,
  visit_order: 0
)

VirtualLandmark.find_or_create_by(
  virtual_route_id: route_a.id,
  virtual_environment_id: vambler.id,
  name: 'Lynch Station',
  map_arrangement_piece_image: 'lynch_station_piece.png',
  icon_image: 'lynch_station_icon.jpg',
  piece_upper_left_pixel_x: 12,
  piece_upper_left_pixel_y: 124,
  front_door_pixel_x: 67,
  front_door_pixel_y: 169,
  pointing_location_pixel_x: 158,
  pointing_location_pixel_y: 222,
  visit_order: 1
)

VirtualLandmark.find_or_create_by(
  virtual_route_id: route_a.id,
  virtual_environment_id: vambler.id,
  name: 'Harris Hall',
  map_arrangement_piece_image: 'harris_hall_piece.png',
  icon_image: 'harris_hall_icon.jpg',
  piece_upper_left_pixel_x: 215,
  piece_upper_left_pixel_y: 226,
  front_door_pixel_x: 268,
  front_door_pixel_y: 262,
  pointing_location_pixel_x: 284,
  pointing_location_pixel_y: 251,
  visit_order: 2
)
VirtualLandmark.find_or_create_by(
  virtual_route_id: route_a.id,
  virtual_environment_id: vambler.id,
  name: 'Harvey House',
  map_arrangement_piece_image: 'harvey_house_piece.png',
  icon_image: 'harvey_house_icon.jpg',
  piece_upper_left_pixel_x: 294,
  piece_upper_left_pixel_y: 485,
  front_door_pixel_x: 310,
  front_door_pixel_y: 498,
  pointing_location_pixel_x: 300,
  pointing_location_pixel_y: 488,
  visit_order: 3
)
VirtualLandmark.find_or_create_by(
  virtual_route_id: route_b.id,
  virtual_environment_id: vambler.id,
  name: 'Golledge Hall',
  map_arrangement_piece_image: 'golledge_hall_piece.png',
  icon_image: 'golledge_hall_icon.jpg',
  piece_upper_left_pixel_x: 564,
  piece_upper_left_pixel_y: 291,
  front_door_pixel_x: 635,
  front_door_pixel_y: 303,
  pointing_location_pixel_x: 628,
  pointing_location_pixel_y: 255,
  visit_order: 4
)
VirtualLandmark.find_or_create_by(
  virtual_route_id: route_b.id,
  virtual_environment_id: vambler.id,
  name: 'Snow Church',
  map_arrangement_piece_image: 'snow_church_piece.png',
  icon_image: 'snow_church_icon.jpg',
  piece_upper_left_pixel_x: 716,
  piece_upper_left_pixel_y: 205,
  front_door_pixel_x: 731,
  front_door_pixel_y: 262,
  pointing_location_pixel_x: 692,
  pointing_location_pixel_y: 258,
  visit_order: 5
)

VirtualLandmark.find_or_create_by(
  virtual_route_id: route_b.id,
  virtual_environment_id: vambler.id,
  name: 'Sauer Center',
  map_arrangement_piece_image: 'sauer_center_piece.png',
  icon_image: 'sauer_center_icon.jpg',
  piece_upper_left_pixel_x: 625,
  piece_upper_left_pixel_y: 5,
  front_door_pixel_x: 683,
  front_door_pixel_y: 69,
  pointing_location_pixel_x: 687,
  pointing_location_pixel_y: 141,
  visit_order: 6
)

VirtualLandmark.find_or_create_by(
  virtual_route_id: route_b.id,
  virtual_environment_id: vambler.id,
  name: 'Tobler Museum',
  map_arrangement_piece_image: 'tobler_museum_piece.png',
  icon_image: 'tobler_museum_icon.jpg',
  piece_upper_left_pixel_x: 493,
  piece_upper_left_pixel_y: 122,
  front_door_pixel_x: 536,
  front_door_pixel_y: 189,
  pointing_location_pixel_x: 536,
  pointing_location_pixel_y: 197,
  visit_order: 7
)
