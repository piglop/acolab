task :create_slugs => :environment do
  PaperTrail.enabled = false
  [User, Project, Article].each do |klass|
    klass.all.each(&:save)
  end
end