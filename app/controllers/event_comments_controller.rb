class EventCommentsController < ApplicationController
  def create
    authorize EventComment

    @comment = current_user.event_comments.build(comment_params.merge({ event_id: params[:id], author: current_user }))

    if @comment.save
      redirect_to "/events/#{params[:id]}"
    else
      @event = @comment.event

      render 'events/show', status: :unprocessable_entity
    end
  end

  def destroy
    @comment = EventComment.find(params[:id])

    authorize @comment

    @comment.destroy

    redirect_to @comment.event
  end

  private

  def comment_params
    params.require(:event_comment).permit(:body)
  end
end
