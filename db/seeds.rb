require 'open-uri'

project_types = ['Renovation and Refurbishment', 'Kitchen Refurbishment', 'Bathroom Refurbishment']
project_types.each do |type|
  ProjectType.find_or_create_by(name: type)
end

puts "Creating projects..."
projects = [
  {
    name: "Kitchen Refurbishment",
    description: "Upgrade your kitchen with modern, stylish renovations.",
    project_type_id: ProjectType.find_by(name: 'Kitchen Refurbishment').id,
    images: ["https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571857/20160930_130813_dv7fu3.jpg",
             "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571847/20160209_085645_yjnvrx.jpg",
             "https://res.cloudinary.com/dc6nbm8zp/image/upload/e_improve,w_300,h_600,c_thumb,g_auto/v1719571798/20231208_164052_higkgq.jpg",
             "https://res.cloudinary.com/dc6nbm8zp/image/upload/e_improve,w_300,h_600,c_thumb,g_auto/v1719571797/20231208_164048_k2l2as.jpg",
             "https://res.cloudinary.com/dc6nbm8zp/image/upload/e_improve,w_300,h_600,c_thumb,g_auto/v1719571784/20221108_123712_zdgjqp.jpg",
             "https://res.cloudinary.com/dc6nbm8zp/image/upload/e_improve,w_300,h_600,c_thumb,g_auto/v1719571779/20220217_161209_2_macvzr.jpg",
             "https://res.cloudinary.com/dc6nbm8zp/image/upload/e_improve,w_300,h_600,c_thumb,g_auto/v1719571777/20220217_160709_iqatbq.jpg",
             "https://res.cloudinary.com/dc6nbm8zp/image/upload/e_improve,w_300,h_600,c_thumb,g_auto/v1719571769/20220216_083019_ipqcs1.jpg",]
  },
  {
    name: "Bathoroom Refurbishment",
    description: "Upgrade your bathroom with modern, stylish renovations.",
    project_type_id: ProjectType.find_by(name: 'Bathroom Refurbishment').id,
    images: ["https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571857/20160930_130609_wtzdnn.jpg",
             "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571852/20160106_123930_wxmifn.jpg",
             "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571849/20160930_130557_a9jji1.jpg",
             "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571830/IMG-20240507-WA0000_uqv4li.jpg",
             "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571814/20240609_173822_wzm0no.jpg",]
  },
  {
    name: "Renovation and Refurbishment",
    description: "Upgrade your home with modern, stylish renovations.",
    project_type_id: ProjectType.find_by(name: 'Renovation and Refurbishment').id,
    images: ["https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571834/20240609_174300_rxmbbj.jpg",
             'https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571825/20240609_174130_s8jxbq.jpg',
             "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571825/20240609_174044_tiuyts.jpg",
             "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571824/20240609_173934_siy3ya.jpg",
             "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571822/20240609_174027_a40mvn.jpg",
             "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571817/20240609_173852_bvelqq.jpg",
             "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571806/20231208_164850_x9rdds.jpg",
             "https://res.cloudinary.com/dc6nbm8zp/image/upload/e_improve,w_300,h_600,c_thumb,g_auto/v1719571805/20240307_073545_zd3um0.jpg",
             "https://res.cloudinary.com/dc6nbm8zp/image/upload/e_improve,w_300,h_600,c_thumb,g_auto/v1719571793/20221018_105157_wmwtwb.jpg",
             "https://res.cloudinary.com/dc6nbm8zp/image/upload/e_improve,w_300,h_600,c_thumb,g_auto/v1719571792/20230721_161450_yr8tn1.jpg",
             "https://res.cloudinary.com/dc6nbm8zp/image/upload/e_improve,w_300,h_600,c_thumb,g_auto/v1719571792/20230721_161450_yr8tn1.jpg",
             "https://res.cloudinary.com/dc6nbm8zp/image/upload/e_improve,w_300,h_600,c_thumb,g_auto/v1719571782/20220519_172244_meerxa.jpg",
             "https://res.cloudinary.com/dc6nbm8zp/image/upload/e_improve,w_300,h_600,c_thumb,g_auto/v1719571781/20220307_115116_wrjako.jpg",]

  }

]
puts "Creating images..."
# Criando projetos e associando as imagens
projects.each do |project_data|
  if project_data[:images].nil? || project_data[:images].empty?
    puts "Images for project #{project_data[:name]} not found!"
    next
  end
  images = project_data.delete(:images)
  project = Project.create!(
    name: project_data[:name],
    description: project_data[:description],
    project_type_id: project_data[:project_type_id]
  )
  puts "Creating images for project #{project.name}..."
  images.each do |image_url|
    project.images.attach(
      io: URI.open(image_url),
      filename: File.basename(URI.parse(image_url).path)
    )
  end
end

 puts "Seeds created successfully!"

puts "Populando galeria..."
Gallery.destroy_all


images = [
             "https://res.cloudinary.com/dc6nbm8zp/image/upload/e_improve,w_300,h_600,c_thumb,g_auto/v1719571792/20230721_161450_yr8tn1.jpg",
             "https://res.cloudinary.com/dc6nbm8zp/image/upload/e_improve,w_300,h_600,c_thumb,g_auto/v1719571792/20230721_161450_yr8tn1.jpg",
             "https://res.cloudinary.com/dc6nbm8zp/image/upload/e_improve,w_300,h_600,c_thumb,g_auto/v1719571782/20220519_172244_meerxa.jpg",
             "https://res.cloudinary.com/dc6nbm8zp/image/upload/e_improve,w_300,h_600,c_thumb,g_auto/v1719571781/20220307_115116_wrjako.jpg",
             "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg"
            ]

images.each do |image_path|
  Gallery.create(photo: image_path, description: "") # COLUNA DESCRIPTION PARA CASO PRECISE ADICIONAR UM COMENTARIO OU EXPLICACAO SOBRE A IMAGEM
end

puts "Galeria populada com #{Gallery.count} imagens."
