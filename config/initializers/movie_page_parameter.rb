module MoviePageParameter
  def page(page)
    @params[:page] = page.to_i
    self
  end
end

Tmdb::Search.include MoviePageParameter
