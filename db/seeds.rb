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
    project_type: ProjectType.find_by(name: 'Kitchen Refurbishment'),
    images: ["https://res.cloudinary.com/dfp6xzba7/image/upload/samples/animals/cat.jpg"]
  },

  {
    name: "Bathroom Refurbishment",
    description: "Upgrade your bathroom with modern, stylish renovations.",
    project_type: ProjectType.find_by(name: 'Bathroom Refurbishment'),
    images: ["https://res.cloudinary.com/dfp6xzba7/image/upload/samples/animals/cat.jpg"]
  },
  {
    name: "Renovation and Refurbishment",
    description: "Upgrade your home with modern, stylish renovations.",
    project_type: ProjectType.find_by(name: 'Renovation and Refurbishment'),
    images: ["https://res.cloudinary.com/dfp6xzba7/image/upload/samples/animals/cat.jpg"]

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
    project_type: project_data[:project_type]
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
