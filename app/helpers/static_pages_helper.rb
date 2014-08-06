module StaticPagesHelper
  
  def text_field_text 
    params[:url] || 'http://'
  end

  def links_to_display?
    !flash[:error] && @links
  end

end
