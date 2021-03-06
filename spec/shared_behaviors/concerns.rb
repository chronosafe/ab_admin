require 'spec_helper'

shared_examples_for 'headerable' do
  it { should have_one(:header) }
  it { should accept_nested_attributes_for(:header) }
  it { should allow_mass_assignment_of(:header_attributes) }
  it { should respond_to(:default_header) }
end

shared_examples_for 'nested_set' do
  it { should have_db_index([:lft, :rgt]) }
  it { should have_db_index(:parent_id) }
  [:lft, :rgt, :depth].each do |attr|
    it { should_not allow_mass_assignment_of(attr) }
  end
  it { should respond_to(:acts_as_nested_set_options) }
  it { subject.class.should respond_to(:nested_set) }
  it { subject.class.should respond_to(:reversed_nested_set) }
  it { subject.class.should respond_to(:with_depth) }
end
