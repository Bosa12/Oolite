module MetaTagsHelper
  def meta_title
    content_for?(:meta_title) ? content_for(:meta_title) : DEFAULT_META["meta_title"]
  end

  def meta_description
    content_for?(:meta_description) ? content_for(:meta_description) : DEFAULT_META["meta_description"]
  end

  def meta_image
    meta_image = (content_for?(:meta_image) ? content_for(:meta_image) : DEFAULT_META["meta_image"])
    # little twist to make it work equally with an asset or a url
    meta_image.starts_with?("http") ? meta_image : image_url(meta_image)
  end
  def meta_title
    content_for?(:meta_title) ? content_for(:meta_title) : DEFAULT_META["meta_title"]
  end

  def meta_description
    content_for?(:meta_description) ? content_for(:meta_description) : DEFAULT_META["meta_description"]
  end

  def meta_image
    meta_image = (content_for?(:meta_image) ? content_for(:meta_image) : DEFAULT_META["meta_image"])
    # little twist to make it work equally with an asset or a url
    meta_image.starts_with?("http") ? meta_image : image_url(meta_image)
  end

  def meta_keywords
    content_for?(:meta_keywords) ? content_for(:meta_keywords) : DEFAULT_META["meta_keywords"]
  end

  def meta_og
    {
      title: meta_title,
      description: meta_description,
      image: meta_image,
      url: request.url,
      site_name: DEFAULT_META["site_name"],
      type: 'website'
    }
  end

  def meta_twitter
    {
      card: 'summary_large_image',
      site: '@your_twitter_handle',
      title: meta_title,
      description: meta_description,
      image: meta_image
    }
  end
end
