class AdminMailer < ActionMailer::Base
  include SendGrid
  default :from => "mailer@nola-apps.com"

  def app_submitted(app)
    @domain = 'nola-apps.com'
    @app = app
    mail :to => @app.contact_email, :cc => AdminUser.all.map(&:email), :subject => "App Submitted: '#{@app.name}' :-)"
  end

  def app_published(app)
    @domain = 'nola-apps.com'
    @app = app
    mail :to => @app.contact_email, :subject => "App Published: '#{@app.name}' :-)"
  end
end
