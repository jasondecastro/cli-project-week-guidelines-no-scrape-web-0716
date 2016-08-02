require 'pony'

class EmailStuff
  def initialize(fortune, first_name, last_name, email)
    Pony.mail({
      :to => email,
      :via => :smtp,
      :via_options => {
        :address              => 'smtp.gmail.com',
        :port                 => '587',
        :enable_starttls_auto => true,
        :user_name            => 'no.reply.zoltar@gmail.com',
        :password             => 'zoltar123',
        :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
        :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
      },
      :from => 'no.reply.zoltar@gmail.com',
      :subject => 'Told you we\'d see each other again, ' + first_name + ' ' + last_name + '.',
      :body => "Here's your fortune below. I'll see you again when the night is dark and full of terrors. \n\n #{fortune}"
    })
  end
end