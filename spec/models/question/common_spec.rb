require "spec_helper"

describe Question do
  describe "#viewed!" do
    subject { questions(:about_rails) }

    it "increments the views count" do
      expect {
        subject.viewed!
      }.to change { subject.reload.views_count }.by(1)
    end
  end
end
