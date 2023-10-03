class EventCommentsController < ApplicationController
  def create
    @event = Event.find(params[:id])
    @comment = current_user.event_comments.build(comment_params)
    @comment.event_id = @event.id

    if @comment.save
      redirect_to "/events/#{params[:id]}"
    else
      render 'events/show', status: :unprocessable_entity
    end
  end

  def destroy
    @comment = EventComment.find(params[:comment_id])

    @comment.destroy

    redirect_to "/events/#{params[:id]}"
  end

  private

  def comment_params
    params.require(:event_comment).permit(:body)
  end
end
