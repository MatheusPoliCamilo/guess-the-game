OpenAI.configure do |config|
  config.access_token = Rails.application.credentials.dig(:OPENAI_ACCESS_TOKEN)
  config.organization_id = Rails.application.credentials.dig(:OPENAI_ORGANIZATION_ID)
end
