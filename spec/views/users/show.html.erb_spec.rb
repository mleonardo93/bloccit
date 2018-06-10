require 'rails_helper'

RSpec.describe "users/show.html.erb", type: :view do

  it "displays the post" do
    u = create(:user)
    p = create(:post, user: u, title: "Post title")

    assign(:user, u)
    render
    expect(view).to render_template(partial: "_post", count: 1)
  end

  it "displays comments" do
    u = create(:user)
    p = create(:post, user: u, title: "Post title")
    c = create(:comment, user: u, post: p, body: "Comment body comment body comment body")

    assign(:user, u)
    render
    expect(view).to render_template(partial: "_comment", count: 1)
  end

  it "displays favorites" do 
    u = create(:user)
    o_u = create(:user)
    o_p = create(:post, user: o_u, title: "Another post title")
    f = Favorite.create!(post: o_p, user: u) 

    assign(:user, u)
    render
    expect(view).to render_template(partial: "_post", count: 1)
  end
end