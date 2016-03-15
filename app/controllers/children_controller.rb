class ChildrenController < ApplicationController

  # def create
  #   @child = Child.create(child_params)
  #   if @child.save
  #     redirect_to @child, notice: 'Child was successfully created.'
  #    else
  #      render action: 'new'
  #   end
  # end

  def edit
    @child = Child.find(params[:id])
  end

  def edit_my_child
    @child = Child.find(params[:id])
    @parent = Parent.find(params[:parent_id])
  end


  def attend
    @child = Child.find(params[:id])
    if @child.attend
      @child.attend = false
    else
      @child.attend = true
    end

    @child.save
    render json: [], status: 200
  end

  def update
    @child = Child.find(params[:id])
    @parent = Parent.find(params[:parent_id]) if !params[:parent_id].nil?
    @child.update(child_params)
    if @child.save
      if !@parent.nil?
        redirect_to my_children_path(@parent)
      else
        redirect_to user_child_path(@current_user.id, @child.id)
      end
    else
      render :edit
    end
  end

  # def new
  #   @child = Child.new
  # end

  def index
    @user = @current_user
    @children = @user.children
  end

  def show
    @child = Child.find(params[:id])
    @parent = @child.parent
  end

  def my_child
    @child = Child.find(params[:id])
    @parent = Parent.find(params[:parent_id])
  end

  def send_emails
    user = @current_user
    @children = user.children
    @children.each do |child|
      SendInfo.send_info(child.email, child).deliver_now
    end
    # child = user.children.last
    # SendInfo.send_info(child.email, child).deliver_now
    redirect_to my_class_path(user.id)
  end

  def send_text_message
    # message = "(Check) Your Child is not in school"
    twilio_sid = ENV["TWILIO_ACCOUNT_SID"]
    twilio_token = ENV["TWILIO_AUTH_TOKEN"]
    twilio_phone_number = ENV["TWILIO_PHONE_NUMBER"]

    children = @current_user.children
    children.each do |child|
      if !child.attend
        @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
        @twilio_client.account.messages.create(
          :from => twilio_phone_number,
          :to => child.parent1_number,
          :body => "Good Morning " + child.parents_names + ", " + child.name + " is not in school"
        )

      end
    end
    redirect_to my_class_path(@current_user.id)
  end


  private

  def child_params
    params.require(:child).permit(:avatar, :name, :last_name, :parents_names, :gender)
  end

end
