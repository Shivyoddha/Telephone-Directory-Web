class BsnlMailer < ApplicationMailer
  def Mail
    @user=User.find(params[:id])
    @complaint = Complaint.find(params[:complaint_id])
      mail(
            from:"crfnitk@gmail.com" ,
            to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "Telephone Directory NITK - Complaint Logged",
            locals:{user:@user, complaint:@complaint}
          )
  end
end
