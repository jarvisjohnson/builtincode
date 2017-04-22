module ApplicationHelper

  def active_class(link_path)
    current_page?(link_path) ? "active" : ""
  end   

  def check_connection(provider, name)
    if current_client.has_connection_with(provider)
      html = link_to client_path(current_client, :uid => nil, :provider => nil), :method => :put, :confirm => "Are you sure?", :class => "button ui inline large disabled #{name} button fluid"  do
          content_tag(:span) do
            # concat content_tag(:i, class: "#{name} icon")
            concat "#{name} connected" 
          end         
        end
    else
      html = link_to omniauth_authorize_path(current_client, provider), class: "button ui basic inline large blue #{name} button fluid" do
          content_tag(:span) do
            # concat content_tag(:i, class: "#{name} icon")
            concat "Connect with #{name}" 
          end   
      end
    end
    return html
  end  
  
end
