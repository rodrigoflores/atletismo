require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Treino do
  before(:each) do
    @valid_attributes = {
    }
    @treino = Treino.new 
  end

  it "should create a new instance given valid attributes" do
    Treino.create!(@valid_attributes)
  end
  
  it "should have many item_treino" do
    should have_many :item_treino
  end
  
  it "should belong to atleta" do
    should belong_to :atleta
  end
  
  it "should initialize" do
    @treino.text.should == ""
    @treino.comentario.should == ""
  end

  it "should reject two trainings whith the same date and the same athlete" do
    @treino.date = Date.new
    @treino.id = 1
    @treino.save.should be_true

    @treino2 = Treino.new
    @treino2.id = 1
    @treino2.date = @treino.date    
    @treino2.save.should be_false
  end
  
  
  it "should bring back all trainings of an athlete" do
    @item1 = ItemTreino.new
    @item1.treino_id = 1;
    @item1.save
    @item2 = ItemTreino.new
    @item2.treino_id = 1;
    @item2.save
    @item3 = ItemTreino.new
    @item3.treino_id = 2;
    @item3.save
    
    @treino.id = 1
    @treino.itens_treino.should == [@item1, @item2] 
  
  end

  it "should transpose a training matrix" do
  end

end
