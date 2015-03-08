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
