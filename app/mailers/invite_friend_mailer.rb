class InviteFriendMailer < ApplicationMailer
  def invite_friend(current_user, friend_email, server_origin)
    @user = current_user
    @friend_email = friend_email
    @server_origin = server_origin

  mail(to: friend_email, subject: "#{current_user.username}
            has invited you to TomatoTime")
  end
end
