class ReplyFormPresenter
	def initialize(user, question, reply)
		@user =  user
		@question = question
		@reply = reply
	end

	def partial
		if @user
			:partial => "reply/form", :locals => {:question => @question, :reply => @reply}
		else
			:partial => "reply/require_login"
		end
			
	end
end

__END__
