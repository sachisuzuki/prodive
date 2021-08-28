module ConditionsHelper
  def set_image
    if @condition.image?
      @condition.image.url
    else
      '/images/default_image.png'
    end
  end
end
