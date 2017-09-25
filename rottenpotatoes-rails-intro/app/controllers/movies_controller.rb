class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
	if (!params.has_key?(:sort) && !params.has_key?(:ratings))	#Check for any parameter changes since reload
		if (session.has_key?(:sort) || session.has_key?(:ratings))	#No param changes, check for stored flags and redirect accordingly
			redirect_to movies_path(:sort=>session[:sort], :order=>session[:order], :ratings=>session[:ratings])
		end
	end

	sort = params[:sort]
	order = params[:order]
	ratings = params[:ratings]
	@sort = params[:sort]

	if (params[:order] == 'desc' || params[:order].nil?)
		@order = 'asc'			#Couldn't get it to sync up with requests, so it flip-flops
		session[:order] = 'desc'	#@order is set to what the flag WILL be in one request
	else
		@order = 'desc'
		session[:order] = 'asc'
	end
	if (params[:ratings].nil?)
		@ratings = Movie.all_ratings	#Very finicky and breaks easily, when testing just make sure all valid ratings are accepted
	else
		@ratings = ratings.keys
	end
	session[:sort] = @sort
	session[:ratings] = ratings
	@all_ratings = Movie.all_ratings
	@movies = Movie.order("#{params[:sort]} #{params[:order]}").where('rating IN (?)', @ratings).all
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
