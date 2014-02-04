require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Prova do
  before(:each) do
    @prova = Prova.new
  end

  describe "tempo" do
    it "should return a string with only the minutes if we only have minutes" do
     @prova.minutos = 10
     @prova.tempo.should == "10' "
   end

    it "should return a string with only the minutes if we have minutes different of zero and the others are zero" do
     @prova.horas = 0
     @prova.segundos = 0
     @prova.decimos = 0
     @prova.minutos = 10
     @prova.tempo.should == "10' "
   end

   it "should return a string with only the seconds if we only have seconds" do
     @prova.segundos = 12
     @prova.tempo.should == "12'' "
   end

   it "should return a string with only the seconds if we have seconds different of zero and the others are zero" do
   	 @prova.horas = 0
   	 @prova.minutos = 0
   	 @prova.decimos = 0
     @prova.segundos = 12
     @prova.tempo.should == "12'' "
   end

   it "should return a string with only the decimals if we only have decimals" do
     @prova.decimos = 1
     @prova.tempo.should == "1"
   end

   it "should return a string with only the decimals if we have decimals different of zero and the others are zero" do
     @prova.horas = 0
     @prova.segundos = 0
     @prova.decimos = 10
     @prova.minutos = 0
     @prova.tempo.should == "10"
   end

   it "should return a string with the seconds and minutes if we have both" do
     @prova.minutos = 12
     @prova.segundos = 15
     @prova.tempo.should == "12' 15'' "
   end

   it "should return a string with the seconds and minutes if we have both different of zero and the others are zero" do
	 @prova.horas = 0
	 @prova.decimos = 0
     @prova.minutos = 12
     @prova.segundos = 15
     @prova.tempo.should == "12' 15'' "
   end

   it "should return a string with the seconds and decimals if we have both" do
     @prova.segundos = 12
     @prova.decimos = 9
     @prova.tempo.should == "12'' 9"
   end

   it "should return a string with the seconds and decimals if we have both different of zero and the others are zero" do
	 @prova.horas = 0
	 @prova.decimos = 9
     @prova.minutos = 0
     @prova.segundos = 12
     @prova.tempo.should == "12'' 9"
   end

   it "should return a string with hours and seconds if we have they both" do
   	@prova.horas = 4
   	@prova.segundos = 15
   	@prova.tempo.should == "4 h 15'' "
   end

   it "should return a string with hours and seconds if we have both different of zero and the others are zero" do
   	@prova.horas = 4
   	@prova.minutos = 0
   	@prova.segundos = 15
   	@prova.decimos = 0
   	@prova.tempo.should == "4 h 15'' "
   end

   it "should return a string with the decimals and minutes if we have both" do
     @prova.minutos = 51
     @prova.decimos = 8
     @prova.tempo.should == "51' 8"
   end

   it "should return a string with the decimals and minutes if we have both different of zero and the others are zero" do
     @prova.horas = 0
     @prova.minutos = 51
     @prova.segundos = 0
     @prova.decimos = 8
     @prova.tempo.should == "51' 8"
   end

 end

 describe "tempo em decimos" do
   it "should return 0 when @prova is nil" do
     @prova.horas = nil
     @prova.minutos = nil
     @prova.segundos = nil
     @prova.decimos = nil
     @prova.tempo_em_decimos.should == 0
   end

   it "should return 0 when the time is 0" do
     @prova.horas = 0
     @prova.minutos = 0
     @prova.segundos = 0
     @prova.decimos = 0
     @prova.tempo_em_decimos.should == 0
   end

   it "should return 5 when the time is 0 h 0' 0'' 5" do
     @prova.horas = 0
     @prova.minutos = 0
     @prova.segundos = 0
     @prova.decimos = 5
     @prova.tempo_em_decimos.should == 5
   end

   it "should return 52 when the time is 0 h 0' 5'' 0" do
     @prova.horas = 0
     @prova.minutos = 0
     @prova.segundos = 5
     @prova.decimos = 0
     @prova.tempo_em_decimos.should == 50
   end

   it "should return 605 when the time is 0 h 1' 0'' 0" do
     @prova.horas = 0
     @prova.minutos = 1
     @prova.segundos = 0
     @prova.decimos = 0
     @prova.tempo_em_decimos.should == 600
   end

   it "should return 630 when the time is 1 h 0' 0'' 0" do
     @prova.horas = 1
     @prova.minutos = 0
     @prova.segundos = 0
     @prova.decimos = 0
     @prova.tempo_em_decimos.should == 36000
   end

   it "should return 722 when the time is 1 h 1' 12'' 2" do
     @prova.horas = 1
     @prova.minutos = 1
     @prova.segundos = 12
     @prova.decimos = 2
     @prova.tempo_em_decimos.should == 36722
   end
 end

 describe "tempo em minutos" do
   it "should return 0 if time is nil" do
     @prova.horas = nil
     @prova.minutos = nil
     @prova.segundos = nil
     @prova.decimos = nil
     @prova.tempo_em_minutos.should == 0
   end

   it "should return 0 if the time is 0 h 0' 0'' 0" do
     @prova.horas = 0
     @prova.minutos = 0
     @prova.segundos = 0
     @prova.decimos = 0
     @prova.tempo_em_minutos.should == 0

   end

   it "should return 0.001 if the time is 0 h 0' 0'' 1" do
     @prova.horas = 0
     @prova.minutos = 0
     @prova.segundos = 0
     @prova.decimos = 1
     @prova.tempo_em_minutos.should == 0.001
   end

   it "should return 0 if the time is 0 h 0' 0'' 5" do
     @prova.horas = 0
     @prova.minutos = 0
     @prova.segundos = 0
     @prova.decimos = 5
     @prova.tempo_em_minutos.should == 0.008
   end

   it "should return 0.1 if the time is 0 h 0' 6'' 0" do
     @prova.horas = 0
     @prova.minutos = 0
     @prova.segundos = 6
     @prova.decimos = 0
     @prova.tempo_em_minutos.should == 0.1
   end

   it "should return 34 if the time is 0 h 34' 0'' 0" do
     @prova.horas = 0
     @prova.minutos = 34
     @prova.segundos = 0
     @prova.decimos = 0
     @prova.tempo_em_minutos.should == 34
   end

   it "should return 180 if the time is 3 h 0' 0'' 0" do
     @prova.horas = 3
     @prova.minutos = 0
     @prova.segundos = 0
     @prova.decimos = 0
     @prova.tempo_em_minutos.should == 180
   end

   it "should return 183.051 if the time is 3 h 3' 3'' 1" do
     @prova.horas = 3
     @prova.minutos = 3
     @prova.segundos = 3
     @prova.decimos = 1
     @prova.tempo_em_minutos.should == 183.051
   end
 end

 describe "default_values" do
 	it "should assign 0 if nil" do
 		@prova.valid?
 		@prova.horas.should == 0
 		@prova.minutos.should == 0
 		@prova.segundos.should == 0
 		@prova.decimos.should == 0
 	end
 end

end
