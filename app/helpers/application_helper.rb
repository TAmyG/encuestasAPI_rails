module ApplicationHelper
	def user_signed_in?
		#devolverá true si hay un usuario logueado y falso sino
		!current_user.nil? #devuelve true si el objeto es nil, sino devuleve false
	end

	def current_user
		#devuelve nill si ningún usuario está logueado o devuelve el usuario
		User.where(id: session[:user_id]).first
	end
end
