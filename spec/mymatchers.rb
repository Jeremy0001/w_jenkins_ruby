def install_ruby_install_ruby(specific_ruby)
  ChefSpec::Matchers::ResourceMatcher.new(:ruby_install_ruby, :install, specific_ruby)
end