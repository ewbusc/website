SimpleNavigation::Configuration.run do |navigation|
  navigation.active_leaf_class = 'active'
  navigation.items do |primary|
    primary.dom_class = 'nav navbar-nav'
    primary.item :home, 'Home', '/'
    primary.item :events, 'Events', '/events'
    primary.item :projects, 'Projects', '/projects'
    primary.item :media, 'Media', '/media'
    primary.item :support, 'Support Us', '/support'
    primary.item :contact, 'Contact', '/contact'
  end
end
