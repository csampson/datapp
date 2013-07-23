class AdminMailer < ActionMailer::Base
  include SendGrid
  default :from => "mailer@datapp.org"

  def app_submitted(app)
    @domain = 'datapp.org'
    @app = app
    mail :to => @app.contact_email, :cc => AdminUser.all.map(&:email), :subject => "App Submitted: '#{@app.name}' :-)"
  end

  def app_published(app)
    @domain = 'datapp.org'
    @app = app
    mail :to => @app.contact_email, :subject => "App Published: '#{@app.name}' :-)"
  end
end
