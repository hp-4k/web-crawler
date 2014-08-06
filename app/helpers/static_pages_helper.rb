module StaticPagesHelper
  
  def text_field_text 
    params[:url] || 'http://'
  end

  def error?
    flash[:error] 
  end

end
