# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

project_types = ['Renovation and Refurbishment', 'Kitchen Refurbishment', 'bathroom Refurbishment']
project_types.each do |type|
  ProjectType.find_or_create_by(name: type)
end


projects = [
  {
    name: "Renovation and Refurbishment",
    description: "A full domestic renovation and refurbishment services.",
    project_type: ProjectType.find_by(name: 'Renovation and Refurbishment'),
    images: ["cozinha.jpg", "dechn.jpg"]
  },
  {
    name: "Kitchen Refurbishment",
    description: "Modernize your kitchen with sleek, stylish updates.",
    project_type: ProjectType.find_by(name: 'kitchen Refurbishment'),
    images: ["cozinha.jpg", "dechn.jpg"]
  },
  {
    name: "bathroom Refurbishment",
    description: "Upgrade your bathroom with modern, stylish renovations..",
    project_type: ProjectType.find_by(name: 'bathroom Refurbishment'),
    images: ["cozinha.jpg", "dechn.jpg"]
  }
]
  projects.each do |project_data|
    images = project_data.delete(:images)
    project = Project.create!(project_data)
    images.each do |image|
    project.images.create!(file: image)
  end
end
