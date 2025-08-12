class Settings::BankSyncsController < ApplicationController
  layout "settings"

  def show
    @breadcrumbs = [["Home", root_path], ["Bank Sync", settings_bank_sync_path]]
    @providers = [
      { name: "Lunch Flow", path: lunch_flow_settings_bank_sync_path, description: "US, Canada, UK, EU, Brazil, Asia via multiple open banking providers. Instructions and demo." },
      { name: "Plaid", path: plaid_settings_bank_sync_path, description: "US & Canada bank connections with transactions, investments, and liabilities." },
      { name: "SimpleFin", path: settings_bank_sync_simplefin_index_path, description: "US & Canada connections via SimpleFin protocol (MX sourced)." }
    ].sort_by { |p| p[:name] }
  end
end


