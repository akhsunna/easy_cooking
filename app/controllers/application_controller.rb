class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  rescue_from ActiveRecord::RecordNotFound, with: :not_found!

  protected

  def not_found!
    render json: { error: 'Not found' }, status: 404
  end
end
