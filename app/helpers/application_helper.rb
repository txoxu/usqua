module ApplicationHelper
  def convert_quantity_image_filename(filename)
    # 例: '200ml-60b110b7cc6a0164de1821f3905805f5f52725a119106913b914dd503db87032.jpg' を '200ml.jpg' に変換
    filename.gsub(/-\w+\.jpg$/, '.jpg')
  end
end
