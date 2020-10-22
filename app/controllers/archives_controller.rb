class ArchivesController < ApplicationController
    def index
        @scores = Score.all
    end
end
