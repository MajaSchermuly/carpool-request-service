# frozen_string_literal: true
Whitelist.create!([
    { email: 'maja9756@tamu.edu'},
    { email: 'externalaffairs.carpool@gmail.com'},
    { email: 'john001@tamu.edu'},
    { email: 'joseph.shumway@tamu.edu'},
    { email: 'terry.rughe@gmail.com'},
    { email: 'u.miguel.j@gmail.com'},

    { email: 'testuser@gmail.com'}

    

])
Member.create!([
  {member_id: 1, password: 'Change*Password', last_name: "change", first_name:"change", phone: "8309009000", address:"change", emergency_full_name: "change", emergency_phone_number:"8309009000",  is_admin: true, is_supervisor: true, leaderboard_points: nil, email: "maja9756@tamu.edu", full_name: "change change", uid: nil, avatar_url: nil, provider: nil, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil},
  {member_id: 2, password: 'Change*Password', last_name: "change", first_name:"change", phone: "8309009000", address:"change", emergency_full_name: "change", emergency_phone_number:"8309009000",  is_admin: true, is_supervisor: true, leaderboard_points: nil, email: "externalaffairs.carpool@gmail.com", full_name: "change change", uid: nil, avatar_url: nil, provider: nil, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil},
  {member_id: 3, password: 'Change*Password', last_name: "change", first_name:"change", phone: "8309009000", address:"change", emergency_full_name: "change", emergency_phone_number:"8309009000",  is_admin: true, is_supervisor: true, leaderboard_points: nil, email: "john001@tamu.edu", full_name: "change change", uid: nil, avatar_url: nil, provider: nil, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil},
  {member_id: 4, password: 'Change*Password', last_name: "change", first_name:"change", phone: "8309009000", address:"change", emergency_full_name: "change", emergency_phone_number:"8309009000",  is_admin: true, is_supervisor: true, leaderboard_points: nil, email: "joseph.shumway@tamu.edu", full_name: "change change", uid: nil, avatar_url: nil, provider: nil, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil},
  {member_id: 5, password: 'Change*Password', last_name: "change", first_name:"change", phone: "8309009000", address:"change", emergency_full_name: "change", emergency_phone_number:"8309009000",  is_admin: true, is_supervisor: true, leaderboard_points: nil, email: "terry.rughe@gmail.com", full_name: "change change", uid: nil, avatar_url: nil, provider: nil, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil},
  {member_id: 6, password: 'Change*Password', last_name: "change", first_name:"change", phone: "8309009000", address:"change", emergency_full_name: "change", emergency_phone_number:"8309009000",  is_admin: true, is_supervisor: true, leaderboard_points: nil, email: "u.miguel.j@gmail.com", full_name: "change change", uid: nil, avatar_url: nil, provider: nil, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil},
  {member_id: 7, password: 'Change*Password', last_name: "change", first_name:"change", phone: "8309009000", address:"change", emergency_full_name: "change", emergency_phone_number:"8309009000",  is_admin: true, is_supervisor: true, leaderboard_points: nil, email: "testuser@gmail.com", full_name: "change change", uid: nil, avatar_url: nil, provider: nil, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil},

])
# Assignment.create!([
#   {assignment_id: 1, request_id: 1, driver_id: 0, driver_notes: nil, pick_up_time: nil, drop_off_time: nil, queue_pos: 0},
#   {assignment_id: 2, request_id: 2, driver_id: 0, driver_notes: "Heading north", pick_up_time: nil, drop_off_time: nil, queue_pos: 2}
# ])
# Request.create!([
#   {request_id: 3, rider_id: 0, request_status: "Unassigned", date_time: "2022-10-14 02:07:00", pick_up_loc: "MSC", is_address_BCS: nil, drop_off_loc: "789 That Place Dr", num_passengers: 4, additional_info: "Not drunk"},
#   {request_id: 2, rider_id: 0, request_status: "In Progress", date_time: "2022-10-14 02:07:00", pick_up_loc: "Kyle Field", is_address_BCS: nil, drop_off_loc: "456 Somewhere Lane", num_passengers: 1, additional_info: ""},
#   {request_id: 1, rider_id: 0, request_status: "Late", date_time: "2022-10-14 02:06:00", pick_up_loc: "Zachry", is_address_BCS: nil, drop_off_loc: "123 Anywhere Street", num_passengers: 2, additional_info: "Wearing a green hoodie"}
# ])
