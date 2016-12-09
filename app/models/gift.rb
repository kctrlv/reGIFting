class Gift < ApplicationRecord
  belongs_to :user

  def giphy_url
    gif = self.url_for
  end

  def url_for
    response = Faraday.get("http://api.giphy.com/v1/gifs/translate", {s: gif.tr(' ','+'), api_key: 'dc6zaTOxFJmzC'})
    gif_url = JSON.parse(response.body, symbolize_names: true)[:data][:images][:fixed_height][:url]
    update_attribute(:gif, gif_url)
    gif_url
  end
end
