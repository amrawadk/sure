class Settings::PlaidConfigsController < ApplicationController
  layout "settings"

  # Allow anyone to view; restrict saving to admins
  before_action :ensure_admin, only: :update

  def show
    @breadcrumbs = [["Home", root_path], ["Bank Sync", settings_bank_sync_path], ["Plaid", nil]]
    @plaid_client_id = Setting.plaid_client_id
    @plaid_secret = Setting.plaid_secret.present? ? "********" : ""
    @plaid_env = Setting.plaid_env.presence || ENV["PLAID_ENV"]
    @plaid_eu_client_id = Setting.plaid_eu_client_id
    @plaid_eu_secret = Setting.plaid_eu_secret.present? ? "********" : ""
  end

  def update
    Setting.plaid_client_id = plaid_params[:plaid_client_id]
    Setting.plaid_secret = plaid_params[:plaid_secret] if plaid_params[:plaid_secret].present?
    Setting.plaid_env = plaid_params[:plaid_env]
    Setting.plaid_eu_client_id = plaid_params[:plaid_eu_client_id]
    Setting.plaid_eu_secret = plaid_params[:plaid_eu_secret] if plaid_params[:plaid_eu_secret].present?

    redirect_to plaid_settings_bank_sync_path, notice: "Plaid settings saved"
  end

  private
    def ensure_admin
      redirect_to settings_bank_sync_path, alert: "Not authorized" unless Current.user.admin?
    end

    def plaid_params
      params.require(:setting).permit(:plaid_client_id, :plaid_secret, :plaid_env, :plaid_eu_client_id, :plaid_eu_secret)
    end
end


