# frozen_string_literal: true

module ApplicationHelper
  def default_meta_tags
    {
      site: 'USQUA',
      title: 'ウイスキーを登録・管理、探求できるアプリ',
      reverse: true,
      charset: 'utf-8',
      description: 'USQUAではウイスキーを登録、管理しウイスキーベースのカクテルや国内蒸留所で探求しよう!',
      keywords: 'お酒,ウイスキー,ウヰスキー,カクテル,蒸留所',
      canonical: 'https://usqua-b00a6d1e8961.herokuapp.com/',
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: 'https://usqua-b00a6d1e8961.herokuapp.com/',
        image: image_url('無題.jpg'),
        locale: 'ja-JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@obvyamdrss',
        image: image_url('無題.jpg')
      }
    }
  end
end
