require 'open-uri'

class StaticPagesController < ApplicationController

  def home
    begin
      if params[:url]
        @links = Nokogiri::HTML(open params[:url], :allow_redirections => :safe).xpath('//a').map do |link|
          if link['href'] =~ /^http/ 
            link['href']
          elsif link['href'] =~ /^\//
            params[:url] + link['href']
          else
            params[:url] + '/' + (link['href'] || '')
          end
        end.uniq.paginate(:page => params[:page])
      end    
    rescue *[URI::InvalidURIError, Errno::ENOENT]
      flash[:error] = 'Invalid URL'
      render 'home' and return
    end
  end
end
