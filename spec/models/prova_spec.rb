require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Prova do
  before(:each) do
    @valid_attributes = {
    }
    @prova = Prova.new
  end

  describe "tempo" do
    it "should return a string with only the minutes if we only have minutes" do
     @prova.minutos = 10
     @prova.tempo.should == "10' "
   end
   
   it "should return a string with only the seconds if we only have seconds" do
     @prova.segundos = 12
     @prova.tempo.should == "12'' "
   end
   
   it "should return a string with only the decimals if we only have decimals" do
     @prova.decimos = 1
     @prova.tempo.should == "1"
   end
   
   it "should return a string with the seconds and minutes if we have both" do
     @prova.minutos = 12
     @prova.segundos = 15
     @prova.tempo.should == "12' 15'' "
   end

   it "should return a string with the seconds and decimals if we have both" do
     @prova.segundos = 12
     @prova.decimos = 9
     @prova.tempo.should == "12'' 9"
   end
   
   it "should return a string with the decimals and minutes if we have both" do
     @prova.minutos = 51
     @prova.decimos = 8
     @prova.tempo.should == "51' 8"
   end
 end
 
 describe "tempo em decimos" do
   it "should return 0 when the time is 0" do
     @prova.minutos = 0
     @prova.segundos = 0
     @prova.decimos = 0
     @prova.tempo_em_decimos.should == 0
   end
   
   it "should return 5 when the time is 0' 0'' 5" do
     @prova.minutos = 0
     @prova.segundos = 0
     @prova.decimos = 5
     @prova.tempo_em_decimos.should == 5
   end
   
   it "should return 52 when the time is 0' 5'' 2" do
     @prova.minutos = 0
     @prova.segundos = 5
     @prova.decimos = 2
     @prova.tempo_em_decimos.should == 52
   end
   
   it "should return 605 when the time is 1' 0'' 5" do
     @prova.minutos = 1
     @prova.segundos = 0
     @prova.decimos = 5
     @prova.tempo_em_decimos.should == 605
   end
   
   it "should return 630 when the time is 1' 3'' 0" do
     @prova.minutos = 1
     @prova.segundos = 3
     @prova.decimos = 0
     @prova.tempo_em_decimos.should == 630
   end
   
   it "should return 722 when the time is 1' 12'' 2" do
     @prova.minutos = 1
     @prova.segundos = 12
     @prova.decimos = 2
     @prova.tempo_em_decimos.should == 722
   end
 end
 
 describe "tempo em minutos" do
   it "should return 0 if the time is 0' 0'' 0" do
     @prova.minutos = 0
     @prova.segundos = 0
     @prova.decimos = 0
     @prova.tempo_em_minutos.should == 0
     
   end
   it "should return 0 if the time is 0' 0'' 5" do
     @prova.minutos = 0
     @prova.segundos = 0
     @prova.decimos = 5
     @prova.tempo_em_minutos.should == 0
   end

   it "should return 0.1 if the time is 0' 6'' 0" do
     @prova.minutos = 0
     @prova.segundos = 6
     @prova.decimos = 0
     @prova.tempo_em_minutos.should == 0.1
   end

   it "should return 34 if the time is 34' 0'' 0" do
     @prova.minutos = 34
     @prova.segundos = 0
     @prova.decimos = 0
     @prova.tempo_em_minutos.should == 34
   end

   it "should return 0.05 if the time is 0' 3'' 1" do
     @prova.minutos = 0
     @prova.segundos = 3
     @prova.decimos = 1
     @prova.tempo_em_minutos.should == 0.05
   end

   it "should return 2 if the time is 2' 0'' 4" do
     @prova.minutos = 2
     @prova.segundos = 0
     @prova.decimos = 4
     @prova.tempo_em_minutos.should == 2
   end

   it "should return 4.15 if the time is 4' 9'' 0" do
     @prova.minutos = 4
     @prova.segundos = 9
     @prova.decimos = 0
     @prova.tempo_em_minutos.should == 4.15
   end

   it "should return 23.1 if the time is 23' 6'' 8" do
     @prova.minutos = 23
     @prova.segundos = 6
     @prova.decimos = 8
     @prova.tempo_em_minutos.should == 23.1
   end



 end

  

end
