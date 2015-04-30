SimpleNavigation::Configuration.run do |navigation|
  navigation.active_leaf_class = 'active'
  navigation.autogenerate_item_ids = false
  navigation.items do |primary|
    primary.dom_class = 'nav navbar-nav'
    primary.item :home, 'Home', '/'
    primary.item :events, 'Events', '/events'
    primary.item :projects, 'Projects', '/projects'
    primary.item :pictures, 'Pictures', '/pictures', :link => {:target => '_blank'}
    primary.item :videos, 'Videos', '/videos', :link => {:target => '_blank'}
    primary.item :support, 'Support Us', '/support'
    primary.item :contact, 'Contact', '/contact'
  end
end

