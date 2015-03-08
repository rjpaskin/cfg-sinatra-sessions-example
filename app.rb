require "sinatra"

# Session aren't enabled by default, so we have to opt-in to using them:
enable :sessions

get "/" do
  # Set our session values to zero - unless they're already set to something
  # (i.e. not nil or false), in which case we leave the current value as-is
  session[:left] ||= 0
  session[:right] ||= 0

  # We can access the `session` method in the view, but it's better to assign
  # the value to instance variables - that way, the view doesn't care how we
  # deal with the counting of "left" and "right", and we're free to change it
  # in this file without having to change our views
  @left_count = session[:left]
  @right_count = session[:right]

  erb :index
end

post "/choose" do
  # Fetch the user's choice from the `params` - we used "choice" as the `name`
  # property in our HTML form, so that's the name we use to fetch the choice
  # from the params
  users_choice = params[:choice]

  # Increment the session value, based on the user's choice of "left" or "right"
  if users_choice == "left"
    session[:left] += 1
  elsif users_choice == "right"
    session[:right] += 1
  end

  # Redirect back to the "index" page, which triggers the `get` we defined above
  redirect to("/")
end
