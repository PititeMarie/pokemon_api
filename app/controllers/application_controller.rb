class ApplicationController < ActionController::API
  def json_errors(error)
    return { json: { errors: error }, status: 400 }
  end
end
