require 'rails_helper'

describe 'Users most reservations by bookings' do
  it 'returns users with most reservations by number of total bookings' do
    user1, user2, user3 = create_list(:user, 3)

    property = create(:property)

    reservation1 = create(:reservation, start_date: Date.yesterday, end_date: (Date.today), renter: user1)
    reservation2 = create(:reservation, start_date: Date.today, end_date: (Date.tomorrow), renter: user1)
    reservation3 = create(:reservation, start_date: Date.yesterday, end_date: (Date.tomorrow), renter: user2)
    get "/api/v1/users/reservations/bookings?limit=2"

    expect(response).to be_success

    users = JSON.parse(response.body)

    expect(users.count).to eq(2)
    expect(users.first["id"]).to eq(user1.id)
  end
end