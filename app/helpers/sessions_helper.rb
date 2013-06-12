module SessionsHelper

	def sign_in(user) # runs when the user signs in, which is handled by sessions_controller
		cookies.permanent[:remember_token] = user.remember_token
		self.current_user = user
	end

	def signed_in?
		!self.current_user.nil? #in the tutorial, there was no "self." before current_user even though the tutorial says it's necessary on line 5.
	end

	def current_user=(user) 
		@current_user =user
	end

	def current_user
		@current_user ||= User.find_by_remember_token(cookies[:remember_token])
	end

	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
	end
end
