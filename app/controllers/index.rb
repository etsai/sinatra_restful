# A user can Read all the notes created.
get '/' do
  @notes = Note.all.order("updated_at DESC")
  erb :index
end

# A user can Create a new note.
post '/note' do
  Note.create(title: params[:title], content: params[:content])
  redirect '/'
end

# A user can see Edit options to a note.
get '/:id' do
  @note = Note.find(params[:id])
  erb :edit
end

# A user can Update a note.
put '/:id' do
  Note.find(params[:id]).update(title: params[:title], content: params[:content], updated_at: Time.now)
  redirect '/'
end

# A user can Delete an existing note.
# Verify that a user really wants to delete a particular note.
delete '/:id' do
  Note.find(params[:id]).destroy
  redirect "/"
end