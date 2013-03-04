if Rails.env.production?
  Hackerspace::Application.config.middleware.use ExceptionNotifier,
    :email_prefix => "[hackerspace] ",
    :sender_address => %{"hackerspace" <control@ouvrages-web.fr>},
    :exception_recipients => %w{mike@lepton.fr}
end
