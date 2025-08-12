Rails.application.configure do
  config.plaid = nil
  config.plaid_eu = nil

  client_id = ENV["PLAID_CLIENT_ID"].presence || Setting.plaid_client_id
  secret = ENV["PLAID_SECRET"].presence || Setting.plaid_secret
  env = (ENV["PLAID_ENV"].presence || Setting.plaid_env.presence || "sandbox")

  if client_id.present? && secret.present?
    config.plaid = Plaid::Configuration.new
    config.plaid.server_index = Plaid::Configuration::Environment[env]
    config.plaid.api_key["PLAID-CLIENT-ID"] = client_id
    config.plaid.api_key["PLAID-SECRET"] = secret
  end

  eu_client_id = ENV["PLAID_EU_CLIENT_ID"].presence || Setting.plaid_eu_client_id
  eu_secret = ENV["PLAID_EU_SECRET"].presence || Setting.plaid_eu_secret
  eu_env = env

  if eu_client_id.present? && eu_secret.present?
    config.plaid_eu = Plaid::Configuration.new
    config.plaid_eu.server_index = Plaid::Configuration::Environment[eu_env]
    config.plaid_eu.api_key["PLAID-CLIENT-ID"] = eu_client_id
    config.plaid_eu.api_key["PLAID-SECRET"] = eu_secret
  end
end
