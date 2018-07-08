ActionMailer::Base.smtp_settings = {
    address: "smtp.mailgun.org",
    port: 587,
    enable_starttls_auto: true,
    user_name: "postmaster@bugsstories.com",
    password: "a5db568307d72a7eacf7485b3b172363",
    authentication: "login"
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: "utf-8"