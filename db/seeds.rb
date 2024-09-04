require 'open-uri'

# project_types = ['Full Refurbishment', 'Kitchen Refurbishment', 'Bathroom Refurbishment']
# project_types.each do |type|
#   ProjectType.find_or_create_by(name: type)
# end

# puts "Creating projects..."
# projects = [
#   {
#     name: "Kitchen Refurbishment",
#     description: "Upgrade your kitchen with modern, stylish renovations.",
#     project_type_id: ProjectType.find_by(name: 'Kitchen Refurbishment').id,
#     images: ["https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571611/pzgeithnnz45v6mwohzm.jpg",
#              "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571857/20160930_130813_dv7fu3.jpg",
#              "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571847/20160209_085645_yjnvrx.jpg",
#              "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571784/20221108_123712_zdgjqp.jpg",
#              "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571779/20220217_161209_2_macvzr.jpg",
#   },
#   {
#     name: "Bathoroom Refurbishment",
#     description: "Upgrade your bathroom with modern, stylish renovations.",
#     project_type_id: ProjectType.find_by(name: 'Bathroom Refurbishment').id,
#     images: ["https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571834/AirBrush_20230505190714_relavo.jpg",
#              "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571849/20160930_130557_a9jji1.jpg",
#              "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571852/20160106_123930_wxmifn.jpg",
#              "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571830/IMG-20240507-WA0000_uqv4li.jpg",
#              "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571814/20240609_173822_wzm0no.jpg",
#              "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571811/20240609_173746_zdnh3n.jpg",
#              "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1722492686/20240329_155824_1_yfqd1x.jpg",
#              "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1722873286/WhatsApp_Image_2024-08-05_at_16.50.04_czfncu.jpg",
#              "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1722873286/WhatsApp_Image_2024-08-05_at_16.49.21_uhg2mj.jpg",
#              "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1722873263/WhatsApp_Image_2024-08-05_at_16.51.11_nm42mk.jpg",]
#   },
#   {
#     name: "Full  Refurbishment",
#     description: "Upgrade your home with modern, stylish renovations.",
#     project_type_id: ProjectType.find_by(name: 'Full Refurbishment').id,
#     images: ["https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571834/20240609_174300_rxmbbj.jpg",
#              'https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571825/20240609_174130_s8jxbq.jpg',
#              "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571825/20240609_174044_tiuyts.jpg",
#              "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571824/20240609_173934_siy3ya.jpg",
#              "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571822/20240609_174027_a40mvn.jpg",
#              "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571817/20240609_173852_bvelqq.jpg",
#              "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1722493128/20230721_161525_v7jnlz.jpg",
#              "https://res.cloudinary.com/dc6nbm8zp/image/upload/e_improve,c_thumb,g_auto/v1719571792/20230721_161450_yr8tn1.jpg",
#              "https://res.cloudinary.com/dc6nbm8zp/image/upload/e_improve,c_thumb,g_auto/v1719571781/20220307_115116_wrjako.jpg",
#              "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571788/20230605_130701_2_tk2f1q.jpg",
#              "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1722493126/20210805_133239_py2pem.jpg",
#              "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1722493123/20220216_082243_skjbpb.jpg",
#              "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1722767137/pier_xv6zzd.jpg",
#              "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1722872965/WhatsApp_Image_2024-08-05_at_16.35.05_askdrr.jpg",
#              "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1722872954/WhatsApp_Image_2024-08-05_at_16.32.22_gwul4s.jpg",
#              "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1722872966/WhatsApp_Image_2024-08-05_at_16.40.16_wjzqzy.jpg",
#              "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1722875487/2024-08-05_at_17.27.04_monaat.jpg",]

#   }

# ]
# puts "Creating images..."
# # Criando projetos e associando as imagens
# projects.each do |project_data|
#   if project_data[:images].nil? || project_data[:images].empty?
#     puts "Images for project #{project_data[:name]} not found!"
#     next
#   end
#   images = project_data.delete(:images)
#   project = Project.create!(
#     name: project_data[:name],
#     description: project_data[:description],
#     project_type_id: project_data[:project_type_id]
#   )
#   puts "Creating images for project #{project.name}..."
#   images.each do |image_url|
#     project.images.attach(
#       io: URI.open(image_url),
#       filename: File.basename(URI.parse(image_url).path)
#     )
#   end
# end

#  puts "Seeds created successfully!"

puts "Populando galeria..."
Gallery.destroy_all


images = ["https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571611/pzgeithnnz45v6mwohzm.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571857/20160930_130813_dv7fu3.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571847/20160209_085645_yjnvrx.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571784/20221108_123712_zdgjqp.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571847/20160122_173522_o9pptn.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571834/AirBrush_20230505190714_relavo.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571830/IMG-20240507-WA0000_uqv4li.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571814/20240609_173822_wzm0no.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1722492686/20240329_155824_1_yfqd1x.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571811/20240609_173746_zdnh3n.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571849/20160930_130557_a9jji1.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571852/20160106_123930_wxmifn.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1722873263/WhatsApp_Image_2024-08-05_at_16.51.11_nm42mk.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1722873286/WhatsApp_Image_2024-08-05_at_16.50.04_czfncu.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1722873286/WhatsApp_Image_2024-08-05_at_16.49.21_uhg2mj.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/e_improve,c_thumb,g_auto/v1719571781/20220307_115116_wrjako.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571877/IMG-20220211-WA0000_002_djiedp.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1722767137/20210212_155431_002_ruozka.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1722767137/pier_xv6zzd.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1722875487/2024-08-05_at_17.27.04_monaat.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571834/AirBrush_20221018171557_td1dsn.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1722767155/20171204_163239_ltlkzm.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571832/20240609_174300_1_pv9fjk.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1722872954/WhatsApp_Image_2024-08-05_at_16.32.22_gwul4s.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1722767158/20170620_151840_qtlb0r.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571876/DJI_0200-min_2305843009213810322_gc7u7v.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571760/20191130_112409_q87ujg.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571767/20210505_175817_z1og5y.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571788/20230605_130701_2_tk2f1q.jpg",
          'https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571825/20240609_174130_s8jxbq.jpg',
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571825/20240609_174044_tiuyts.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571824/20240609_173934_siy3ya.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571822/20240609_174027_a40mvn.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571817/20240609_173852_bvelqq.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1722493128/20230721_161525_v7jnlz.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1722493126/20210805_133239_py2pem.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1722493123/20220216_082243_skjbpb.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1722872965/WhatsApp_Image_2024-08-05_at_16.35.05_askdrr.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571610/hl2b0f10bmbw1is3pcb0.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1722872966/WhatsApp_Image_2024-08-05_at_16.40.16_wjzqzy.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1722492857/20231208_164843_2_scxpok.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1722492862/20160523_150055_gj3q3m.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1722767152/20160525_110800_ezeji0.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1722767149/20160525_110836_vvdktx.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1722767143/20191125_120607_vqyge3.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1722767161/fencing_ksp5i4.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1722357049/wall_qawlnx.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1719571782/20220519_172244_meerxa.jpg",
          "https://res.cloudinary.com/dc6nbm8zp/image/upload/v1725213034/development/gaautut52bbbn2a6sutl020zmkob.jpg"]


images.each do |image_path|
  Gallery.create(photo: image_path, description: "This picture for gallery") # COLUNA DESCRIPTION PARA CASO PRECISE ADICIONAR UM COMENTARIO OU EXPLICACAO SOBRE A IMAGEM
end

puts "Galeria populada com #{Gallery.count} imagens."
