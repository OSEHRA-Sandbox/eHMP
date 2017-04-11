#
# Cookbook Name:: vista
# Resource:: ro_install
#
# Loads and installs a distribution
#
# Assumptions: Distribution has not been previously loaded and waiting install
#
# see: http://www.va.gov/vdl/documents/Clinical/virtual_patient_record/vpr_ig.pdf for VPR install guide
#
#

actions :execute
default_action :execute

attribute :name, :kind_of => String, :required => true, :name_attribute => true
attribute :source, :kind_of => String, :required => true
attribute :log, :default => ''
attribute :namespace, :kind_of => String, :required => true
