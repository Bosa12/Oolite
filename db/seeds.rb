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
#     images: []
#   },
#   {
#     name: "Bathoroom Refurbishment",
#     description: "Upgrade your bathroom with modern, stylish renovations.",
#     project_type_id: ProjectType.find_by(name: 'Bathroom Refurbishment').id,
#     images: []
#   },
#   {
#     name: "Full  Refurbishment",
#     description: "Upgrade your home with modern, stylish renovations.",
#     project_type_id: ProjectType.find_by(name: 'Full Refurbishment').id,
#     images: []
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
images = ["https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066112/dyjcvms15vpcofjg3c4a.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726173509/r98bqz83pfdxfxpvgt8i.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066110/ilpjpvgxvjd06wkprxyr.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066111/dxx6qudqmgbexuhyoykv.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066111/no9c4riw3inbnxhgpnwt.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066111/nqnwtsiilyr2ldwx5wfo.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066110/b3gcm0eupvumzfwzmkgw.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066111/jmld4uxqpbbbniwtnohf.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066110/x3smhpflbhumucqjvau5.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726173526/cvhhsm0d3uidtfe4c9qh.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066109/vyjitso2o0pbvguzkg6z.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066109/wl4kxhrjkrctkqg0fhv3.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066109/lxalxzq8z94d9n9as83z.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066109/dw3zu5ffj5dqkwy2qdht.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066109/alqjuknmuxxetnlya5zk.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066108/ssbycvdie0bliozqclns.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066108/wxvshbp8foblpo9vbfpr.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066108/r0cqkygofye7bwmzg8ve.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066108/rgmlv9xrw7r9vrhq2qmg.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066107/wotiqmqvrhzjxyoiijnl.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066107/nyix8u42xjcpemavdhcz.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066107/vzpxlgtk40ag9jwz9o6n.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066107/ui1nrgsznw3myncpegzr.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066106/kylg5ho19fjymapdiyzs.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066107/p1z9zbjq4ez7xnf82jg0.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066106/hbgmg2mfdnwqxvxbh0zy.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066105/kulpj6c0hradosirsqsq.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066105/nefuiboffxpng29bfiyr.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066104/m8etlr0nc2foxb31pxqg.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066103/qjyumiarw9hb1tpazozk.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066103/zmttstrpteefxqykkyqz.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066102/ihbhtx9lyyadipamn9aa.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066101/r7l7zts0uw1tbzpoozdd.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066099/y0dhglo0erfnpws1jy7k.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066099/sbdyjcplpmwi7l5wajqw.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066095/zho4vrow7ns3l9cfwqi1.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066093/vi7ouistpb0gb0n7kbmf.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066091/u9lv6rnk3zzeuuvfdjh2.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066091/jncqz5imbfbuqbnoqosj.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066088/pskxy4ex19ikegwprxdi.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066088/w3ukilgakipfg2tm8qnf.jpg",
          'https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066083/frsom2bmgewkl0gfy85q.jpg',
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066081/vvmai5ypycxbsj22whrz.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066081/ztbia1p9rycakaj0epmz.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066074/yqpa2kghomvyml0sizrz.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066077/kvmpsf660rkptunjlwuh.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066074/lejv19ri0kez53erfrg9.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066072/ix0f5z3bsnqopozomeud.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066070/fi8rlgmwgogsdbasxsym.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066066/pdp2onnomck8fwbetm5n.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066069/poei1lavi2uigqlk9c0a.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066064/uhngqidhlmhcqwq4osid.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066064/fbamejqsu2leuyl4xtq8.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066063/t18pjemdtpmobmaetjqe.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066061/afwxinmypheaagf1izhu.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066058/hjhqvglsp569yonkkivj.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066055/ftcg1v89q6s5t0lpqxrx.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066054/thsqmch9s4e4anyrqmg5.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066052/qgmgqo3ufrhefzkrkddi.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066052/lbau1qyk6coqlsfl5eiy.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066052/rbpyc5k2gwsrnqzw3ynx.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066052/cpcxsyclrfa3mmlf74gq.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066053/tomoaw6vjmvy4iw11cty.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066063/t18pjemdtpmobmaetjqe.jpg",
          "https://res.cloudinary.com/dskz2xkp0/image/upload/v1726066055/ftcg1v89q6s5t0lpqxrx.jpg"]
images.each do |image_path|
  Gallery.create(photo: image_path, description: "This picture for gallery") # COLUNA DESCRIPTION PARA CASO PRECISE ADICIONAR UM COMENTARIO OU EXPLICACAO SOBRE A IMAGEM
end
puts "Galeria populada com #{Gallery.count} imagens."
