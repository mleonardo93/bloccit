require 'rails_helper'

RSpec.describe "users/show.html.erb", type: :view do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:post) { create(:post) }
  let(:other_post) { create(:post, user: other_user) }
  let(:favorite) { Favorite.create!(post: post, user: user) }

  it "displays the post" do
    render
    rendered.should contain(post)
  end
end