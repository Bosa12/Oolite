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
    images: ["https://res.cloudinary.com/dfp6xzba7/image/upload/samples/animals/cat.jpg","https://images.unsplash.com/photo-1603562750325-7627768b62da?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"]
  },

  {
    name: "Bathroom Refurbishment",
    description: "Upgrade your bathroom with modern, stylish renovations.",
    project_type_id: ProjectType.find_by(name: 'Bathroom Refurbishment').id,
    images: ["https://res.cloudinary.com/dfp6xzba7/image/upload/samples/animals/cat.jpg",'https://images.unsplash.com/photo-1603562750325-7627768b62da?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D']
  },
  {
    name: "Renovation and Refurbishment",
    description: "Upgrade your home with modern, stylish renovations.",
    project_type_id: ProjectType.find_by(name: 'Renovation and Refurbishment').id,
    images: ["https://res.cloudinary.com/dfp6xzba7/image/upload/samples/animals/cat.jpg",'https://images.unsplash.com/photo-1603562750325-7627768b62da?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D']

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
