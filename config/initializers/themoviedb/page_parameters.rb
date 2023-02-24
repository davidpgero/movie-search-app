module Tmbd
  module PageParameter
    def page(page)
      @params[:page] = page.to_i
      self
    end
  end
end

Tmdb::Search.include Tmdb::PageParameter
