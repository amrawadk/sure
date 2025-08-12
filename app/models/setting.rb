# Dynamic settings the user can change within the app (helpful for self-hosting)
class Setting < RailsSettings::Base
  cache_prefix { "v1" }

  field :twelve_data_api_key, type: :string, default: ENV["TWELVE_DATA_API_KEY"]
  field :openai_access_token, type: :string, default: ENV["OPENAI_ACCESS_TOKEN"]
  field :brand_fetch_client_id, type: :string, default: ENV["BRAND_FETCH_CLIENT_ID"]

  # Optional: allow configuring Plaid via UI (falls back to ENV when blank)
  field :plaid_client_id, type: :string, default: ENV["PLAID_CLIENT_ID"]
  field :plaid_secret, type: :string, default: ENV["PLAID_SECRET"]
  field :plaid_env, type: :string, default: ENV.fetch("PLAID_ENV", "")
  field :plaid_eu_client_id, type: :string, default: ENV["PLAID_EU_CLIENT_ID"]
  field :plaid_eu_secret, type: :string, default: ENV["PLAID_EU_SECRET"]

  field :require_invite_for_signup, type: :boolean, default: false
  field :require_email_confirmation, type: :boolean, default: ENV.fetch("REQUIRE_EMAIL_CONFIRMATION", "true") == "true"
end
