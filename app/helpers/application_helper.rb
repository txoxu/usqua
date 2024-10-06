# frozen_string_literal: true

# 静的OGPの設定
module ApplicationHelper
  def default_meta_tags
    { site: meta_site,
      title: meta_title,
      reverse: true,
      charset: 'utf-8',
      description: meta_description,
      keywords: meta_keywords,
      canonical: meta_canonical_url,
      separator: '|',
      og: default_og_tags,
      twitter: default_twitter_tags}
  end

  private

  def meta_site
    'USQUA'
  end

  def meta_title
    'ウイスキーを登録・管理、探求できるアプリ'
  end

  def meta_description
    'USQUAではウイスキーを登録、管理しウイスキーベースのカクテルや国内蒸留所で探求しよう!'
  end

  def meta_keywords
    'お酒,ウイスキー,ウヰスキー,カクテル,蒸留所'
  end

  def meta_canonical_url
    'https://usqua-b00a6d1e8961.herokuapp.com/'
  end

  def default_og_tags
    {
      site_name: meta_site,
      title: meta_title,
      description: meta_description,
      type: 'website',
      url: meta_canonical_url,
      image: image_url('無題.jpg'),
      locale: 'ja-JP'
    }
  end

  def default_twitter_tags
    {
      card: 'summary_large_image',
      site: '@obvyamdrss',
      image: image_url('無題.jpg')
    }
  end
end
