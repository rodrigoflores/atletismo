require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Treinador do
  before(:each) do
    @valid_attributes = {
    }
  end

  it "should create a new instance given valid attributes" do
    Treinador.create!(@valid_attributes)
  end

  pending "should have one user on trainer" do
    it { should have_one (:user)}
  end
  it { should have_many (:cor_treinos) }
  it { should have_many (:cor_periodos) }
end
