class SongsController < ApplicationController

    def index
        @songs = Song.all
    end

    def show
        @song = Song.find(params[:id])
    end

    def edit
        @song = Song.find(params[:id])
    end

    def new
        @song = Song.new
    end

    def update
        @song = Song.find(params[:id])
        # binding.pry
        @song.update(song_params)
        if @song.update(song_params)
            
            redirect_to song_path(@song)
        else
            render :edit
        end
    end

    def create
        @song = Song.create(song_params)
        redirect_to song_path(@song)
    end

    def delete
        @song = Song.find(params[:id])
        @song.destroy

        render :index
    end



private

    def song_params
        params.require(:song).permit(:title, :released, :released_year, :artist_name, :genre)
    end
end
