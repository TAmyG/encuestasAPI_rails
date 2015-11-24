class Api::V1::MasterApiController < ApplicationController
	layout 'api/v1/application'

	after_action :cors_set_access_control_headers

	#peticiones cors para los encabezados
	def cors_set_access_control_headers
		headers['Access-Control-Allow-Origin']  = '*'
		headers['Access-Control-Allow-Methods'] = "POST,GET,PUT,DELETE,OPTIONS"
		headers['Access-Control-Allow-Headers'] = 'Origin,Content-Type,Accept,Authorization,Token'
	end

	def xhr_options_request
		head :ok
	end
end