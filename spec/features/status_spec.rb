require 'rails_helper'

feature "Status" do

  scenario "User can create status with valid info" do
    visit root_path
    expect(page).to have_content("Status Updates")
    click_on "New Status"
    fill_in "Status", with: "I love CRUD!"
    fill_in "User", with: "Roger"
    fill_in "Likes", with: 5
    click_on "Create Status"
    expect(page).to have_content("Status was successfully created.")
  end

  scenario "User can't create status with invalid info" do
    visit root_path
    expect(page).to have_content("Status Updates")
    click_on "New Status"
    fill_in "Status", with: "I love CRUD!"
    fill_in "Likes", with: 5
    click_on "Create Status"
    expect(page).to have_content("User can't be blank")
  end

  scenario "User can edit status with valid info" do
    Status.create!(description: "Hi", user: "Betty Boop", number_of_likes: 4000)
    visit root_path
    expect(page).to have_content("Betty Boop")
    click_on "Hi"
    click_on "Edit"
    fill_in "Status", with: "boop boop de boop"
    click_on "Update Status"
    expect(page).to have_content("Status was successfully updated")
  end

  scenario "User can't edit status with invalid info" do
    Status.create!(description: "Hi", user: "Betty Boop", number_of_likes: 4000)
    visit root_path
    expect(page).to have_content("Betty Boop")
    click_on "Hi"
    click_on "Edit"
    fill_in "User", with: nil
    click_on "Update Status"
    expect(page).to have_content("User can't be blank")
  end

  scenario "User can destroy status" do
    Status.create!(description: "Hi", user: "Betty Boop", number_of_likes: 4000)
    visit root_path
    expect(page).to have_content("Betty Boop")
    click_on "Hi"
    click_on "Delete"
    expect(page).to have_content("Status was successfully deleted")
  end

end
