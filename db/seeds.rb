# frozen_string_literal: true

Whitelist.create!([
                    { email: 'maja9756@tamu.edu' },
                    { email: 'externalaffairs.carpool@gmail.com' },
                    { email: 'john001@tamu.edu' },
                    { email: 'joseph.shumway@tamu.edu' },
                    { email: 'terry.ruhge@gmail.com' },
                    { email: 'u.miguel.j@gmail.com' },

                    { email: 'testuser@gmail.com' }

                  ])
Member.create!([
                 {  password: 'Change*Password', last_name: 'change', first_name: 'change', phone: '8309009000', address: 'change', emergency_1_full_name: 'change', emergency_1_phone_number: '8309009000', is_admin: true, is_supervisor: true, leaderboard_points: nil, email: 'maja9756@tamu.edu', full_name: 'change change', uid: nil, avatar_url: nil, provider: nil, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil },
                 {  password: 'Change*Password', last_name: 'change', first_name: 'change', phone: '8309009000', address: 'change', emergency_1_full_name: 'change', emergency_1_phone_number: '8309009000', is_admin: true, is_supervisor: true, leaderboard_points: nil, email: 'externalaffairs.carpool@gmail.com', full_name: 'change change', uid: nil, avatar_url: nil, provider: nil, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil },
                 {  password: 'Change*Password', last_name: 'change', first_name: 'change', phone: '8309009000', address: 'change', emergency_1_full_name: 'change', emergency_1_phone_number: '8309009000', is_admin: true, is_supervisor: true, leaderboard_points: nil, email: 'john001@tamu.edu', full_name: 'change change', uid: nil, avatar_url: nil, provider: nil, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil },
                 {  password: 'Change*Password', last_name: 'change', first_name: 'change', phone: '8309009000', address: 'change', emergency_1_full_name: 'change', emergency_1_phone_number: '8309009000', is_admin: true, is_supervisor: true, leaderboard_points: nil, email: 'joseph.shumway@tamu.edu', full_name: 'change change', uid: nil, avatar_url: nil, provider: nil, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil },
                 {  password: 'Change*Password', last_name: 'change', first_name: 'change', phone: '8309009000', address: 'change', emergency_1_full_name: 'change', emergency_1_phone_number: '8309009000', is_admin: true, is_supervisor: true, leaderboard_points: nil, email: 'terry.ruhge@gmail.com', full_name: 'change change', uid: nil, avatar_url: nil, provider: nil, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil },
                 {  password: 'Change*Password', last_name: 'change', first_name: 'change', phone: '8309009000', address: 'change', emergency_1_full_name: 'change', emergency_1_phone_number: '8309009000', is_admin: true, is_supervisor: true, leaderboard_points: nil, email: 'u.miguel.j@gmail.com', full_name: 'change change', uid: nil, avatar_url: nil, provider: nil, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil },
                 {  password: 'Change*Password', last_name: 'change', first_name: 'change', phone: '8309009000', address: 'change', emergency_1_full_name: 'change', emergency_1_phone_number: '8309009000', is_admin: true, is_supervisor: true, leaderboard_points: nil, email: 'testuser@gmail.com', full_name: 'change change', uid: nil, avatar_url: nil, provider: nil, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil }
               ])
