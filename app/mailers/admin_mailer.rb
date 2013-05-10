class AdminMailer < ActionMailer::Base
  include SendGrid
  default :from => "mailer@nola-apps.com"

  def app_submitted(app)
    @domain = 'nola-apps.com'
    @app = app
    AdminUser.all.each do |user|
      mail :to => user.email, :subject => "App Submitted: '#{@app.name}' :-)"
    end
  end

  def app_published(app)
    @domain = 'nola-apps.com'
    @app = app
    mail :to => app.contact_email, :subject => "App Published: '#{@app.name}' :-)"
  end
end
