class StaticPagesController < ApplicationController
  def home
  	@slider = Slider.all    
  end

  def aboutus
  end

  def contact
  end

  #def new
  #  render 'home'
  #  @newsletter = Newsletter.new
  #  @slider = Slider.all
  #end

  #def create
  #	@newsletter = Newsletter.new(newsletter_params)
  #  if @newsletter.save
  #  	flash[:success] = "subskrypcja przyjeta."
   		
  #  else
  #    flash[:denger] = "bledny email"
  #    redirect_to root_url
  #  end
  #end


  #private
  # def newsletter_params
  #    params.require(:newsletter).permit(:email)
  #  end

  #      <%= form_for(@newsletter) do |f| %>
   #                 <label class="sr-only" for="subscr-email">Enter email</label>
    #                <%= f.text_field :email, class: 'form-control' %></br>                
     #               <%= f.submit "Create my account", class: "btn btn-primary" %>
      #<% end %>
end
