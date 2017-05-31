class ShortUrlRequestsController < ApplicationController
  before_action :authorise_as_short_url_requester!, only: [:new, :create]
  before_action :authorise_as_short_url_manager!, only: [:index, :show, :accept, :new_rejection, :reject, :list_short_urls, :edit, :update]
  before_action :get_short_url_request, only: [:edit, :update, :show, :accept, :new_rejection, :reject]

  def index
    @short_url_requests = ShortUrlRequest.pending.order_by([:created_at, 'desc']).paginate(page: params[:page], per_page: 40)
  end

  def show
    @existing_redirect = Redirect.where(from_path: @short_url_request.from_path).first
  end

  def list_short_urls
    @accepted_short_urls = ShortUrlRequest.accepted.order_by([:created_at, 'desc'])
  end

  def new
    @short_url_request = ShortUrlRequest.new(organisation_slug: current_user.organisation_slug)
  end

  def create
    Commands::ShortUrlRequests::Create.new(create_short_url_request_params, current_user).call(
      success: -> (_url_request) {
        flash[:success] = "Your request has been made."
        redirect_to root_path
      },
      failure: -> (url_request) {
        @short_url_request = url_request
        render 'new'
      },
      confirmation_required: -> (url_request) {
        @short_url_request = url_request
        render 'confirmation'
      }
    )
  end

  def accept
    Commands::ShortUrlRequests::Accept.new(@short_url_request).call(
      failure: -> () { render 'short_url_requests/accept_failed' }
    )
  end

  def new_rejection
  end

  def reject
    rejection_params = params.require(:short_url_request).permit(:rejection_reason)
    Commands::ShortUrlRequests::Reject.new(@short_url_request, rejection_params[:rejection_reason]).call
    flash[:success] = "The short URL request has been rejected, and the requester has been notified."

    redirect_to short_url_requests_path
  end

  def edit
  end

  def update
    Commands::ShortUrlRequests::Update.new(update_short_url_request_params, @short_url_request).call(
      success: -> () {
        flash[:success] = "Your edit was successful."
        redirect_to short_url_request_path(@short_url_request)
      },
      failure: -> () { render 'edit' }
    )
  end

  def organisations
    @organisations ||= Organisation.all.order_by([:title, 'asc'])
  end
  helper_method :organisations

private

  def get_short_url_request
    @short_url_request = ShortUrlRequest.find(params[:id])
  rescue Mongoid::Errors::DocumentNotFound
    render plain: "Not found", status: 404
  end

  def create_short_url_request_params
    params[:short_url_request].permit(:from_path, :to_path, :reason, :organisation_slug, :confirmed)
  end

  def update_short_url_request_params
    params[:short_url_request].permit(:to_path, :reason, :organisation_slug)
  end
end
