module CandidatesHelper
  # Ripped from https://github.com/railstutorial/sample_app_2nd_ed/blob/master/app/helpers/users_helper.rb
  #
  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(candidate, options = { :size => nil })
    gravatar_id = Digest::MD5::hexdigest(candidate.email.downcase)
    size = options[:size]
    gravatar =
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, class: "gravatar")
  end
end