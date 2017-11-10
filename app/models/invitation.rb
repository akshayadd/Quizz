class Invitation < ApplicationRecord
  belongs_to :user

  def self.create_invitation_entry(invitation_data)
    result = {
      status:  204,
      message: ["Something went wrong!."],
    }
    user = User.find_by("id = ? ", invitation_data["user_id"])
    if user.present?
      invitation = Invitation.new(user_id: user.id)
      invitation.reffer_number = invitation_data["reffer_number"]
      invitation.invitation_token = invitation_data["token"]
      invitation.invitation_accept = false

      if invitation.save
        result[:status]  = 200
        result[:message] = ["Success"]
      end
    end
    return result
  end
end
