namespace :comfortable_mexican_sofa do
  namespace :fixtures do
    task :set_correct_yml_engine do
      YAML::ENGINE.yamler = 'psych'
    end
    task :import => :set_correct_yml_engine
  end
end
