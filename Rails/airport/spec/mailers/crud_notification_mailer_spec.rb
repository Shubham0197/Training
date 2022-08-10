require "rails_helper"

RSpec.describe CrudNotificationMailer, type: :mailer do
  describe "mail sent" do
    aircraft = FactoryGirl.create(:aircraft)
    let(:mail) {CrudNotificationMailer.create_notification(aircraft)}
    

    it "renders the headers" do
      expect(mail.subject).to eq("A new entry has been created")
      expect(mail.to).to eq(["jjshubhamjj@gamil.com"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end
end
