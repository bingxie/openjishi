class PagesController < ApplicationController
  include HighVoltage::StaticPage

  layout :layout_for_page

  private

  def layout_for_page
    case params[:id]
    when %r{my\/}
      'my'
    else
      'index'
    end
  end
end
