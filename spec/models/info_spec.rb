require 'rails_helper'

RSpec.describe Info, type: :model do
  let (:room) {create(:room)}
  let (:user) {
    User.find_or_create_from_omniauth(OmniAuth.config.mock_auth[:google])  do |user|
     user.room_id = room.id
   end
 }

  describe "self.new_infos" do
    it "when the info is nil create new infos" do
      child_one = Child.create(name: "child", last_name: "one", email: "child@gmail.com", attend: true, room_id: room.id)
      child_two = Child.create(name: "child_two", last_name: "two", email: "two@Gmail.com", attend: true, room_id: room.id)
      expect(child_one.infos.last).to be_nil
      Info.new_infos(room)
      expect(child_one.infos.last).to_not be_nil
    end
  end

end
