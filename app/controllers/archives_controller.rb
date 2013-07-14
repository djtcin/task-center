class ArchivesController < ApplicationController
  
  def create
    @submission = Submission.find(params[:submission_id])
    @archies = @submission.archives.create(params[:archive])
    redirect_to post_path(@post)
  end
  
  
end
