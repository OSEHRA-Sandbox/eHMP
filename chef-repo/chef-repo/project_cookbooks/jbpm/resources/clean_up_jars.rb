actions :execute
default_action :execute

attribute :name, :kind_of => String, :required => true, :name_attribute => true
attribute :user, :kind_of => String, :default => node[:jbpm][:install][:admin_user]
attribute :password, :kind_of => String, :required => true
