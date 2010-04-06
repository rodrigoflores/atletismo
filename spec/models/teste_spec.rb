require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Teste do
	before(:each) do 
		@teste = Teste.new
	end
	
	describe "presence of name" do
		it "should not be valid if there is no name" do
			@teste.valid?.should be_false
		end
		
		it "should be valid if there is name" do
			@teste.nome = "Fulano"
			@teste.valid?.should be_true
		end
	end
	
	describe "numericality" do
		it "should be valid if the seconds are less than 60" do
			@teste.nome = "Fulano"
			@teste.segundos = 59
			@teste.valid?.should be_true
		end
		
		it "should not be valid if the seconds are more than or equal 60" do
			@teste.nome = "Cicrano"
			@teste.segundos = 60
			@teste.valid?.should be_false
		end
		
		it "should be valid if the decimals are less than 10" do
			@teste.nome = "Beltrano"
			@teste.decimos = 9
			@teste.valid?.should be_true
		end
		
		it "should not be valid if the decimals are more/equal than 10" do
			@teste.nome = "Fulano"
			@teste.decimos = 10
			@teste.valid?.should be_false
		end
		
		it "should not be valid if the centimeters are more/equal than 100" do
			@teste.nome = "Cicrano2"
			@teste.centimetros = 100
			@teste.valid?.should be_false
		end
		
		it "should be valid if the centimeters are less than 100" do
			@teste.nome = "Fulano"
			@teste.centimetros = 99
			@teste.valid?.should be_true
		end
	end
	
	describe "default values" do
		it "should assign 0 if nil" do
			@teste.valid?
			@teste.minutos.should == 0
			@teste.segundos.should == 0
			@teste.decimos.should == 0
			@teste.kg.should == 0
			@teste.metros.should == 0
			@teste.centimetros.should == 0
		end
	end
	
	describe "resultado" do
		it "should return '' if all is nil" do
			@teste.resultado.should  == ""
		end

		it "should return '' if all is set as 0" do
			@teste.minutos = 0
			@teste.segundos = 0
			@teste.decimos = 0
			@teste.kg = 0
			@teste.metros = 0
			@teste.centimetros = 0
			@teste.resultado.should == ""
		end
		
		it "should return '1' 1'' 1 | 1.0 kg | 1 m 1 cm' if all is set as 1" do
			@teste.minutos = 1
			@teste.segundos = 1
			@teste.decimos = 1
			@teste.kg = 1
			@teste.metros = 1
			@teste.centimetros = 1
			@teste.resultado.should == "1' 1'' 1 | 1.0 kg | 1 m 1 cm"
		end
		
		it "should return '1' 1'' 1' if there is only time" do
			@teste.minutos = 1
			@teste.segundos = 1
			@teste.decimos = 1
			@teste.resultado.should == "1' 1'' 1"
		end

		it "should return '1' 1'' 1' if only the time is different of 0" do
			@teste.minutos = 1
			@teste.segundos = 1
			@teste.decimos = 1
			@teste.kg = 0
			@teste.metros = 0
			@teste.centimetros = 0
			@teste.resultado.should == "1' 1'' 1"
		end

		it "should return '1.0 kg' if there is only weight" do
			@teste.kg = 1
			@teste.resultado.should == "1.0 kg"
		end
		
		it "should return '1.0 kg' if only the weight is different of 0" do
			@teste.minutos = 0
			@teste.segundos = 0
			@teste.decimos = 0
			@teste.kg = 1
			@teste.metros = 0
			@teste.centimetros = 0
			@teste.resultado.should == "1.0 kg"
		end
		
		it "should return '1 m 1 cm' if there is only distance" do
			@teste.metros = 1
			@teste.centimetros = 1
			@teste.resultado.should == "1 m 1 cm"
		end

		it "should return '1 m 1 cm' if only the distance is different of 0" do
			@teste.minutos = 0
			@teste.segundos = 0
			@teste.decimos = 0
			@teste.kg = 0
			@teste.metros = 1
			@teste.centimetros = 1
			@teste.resultado.should == "1 m 1 cm"
		end
		
		it "should return '1' ' if there is only minutes" do
			@teste.minutos = 1
			@teste.resultado.should == "1' "
		end

		it "should return '1' ' if only the minutes is different of 0" do
			@teste.minutos = 1
			@teste.segundos = 0
			@teste.decimos = 0
			@teste.kg = 0
			@teste.metros = 0
			@teste.centimetros = 0
			@teste.resultado.should == "1' "
		end

		it "should return '1'' ' if there is only seconds" do
			@teste.segundos = 1
			@teste.resultado.should == "1'' "
		end

		it "should return '1'' ' if only the seconds is different of 0" do
			@teste.minutos = 0
			@teste.segundos = 1
			@teste.decimos = 0
			@teste.kg = 0
			@teste.metros = 0
			@teste.centimetros = 0
			@teste.resultado.should == "1'' "
		end

		it "should return '1' if there is only decimals" do
			@teste.decimos = 1
			@teste.resultado.should == "1"
		end

		it "should return '1' if only the decimals is different of 0" do
			@teste.minutos = 0
			@teste.segundos = 0
			@teste.decimos = 1
			@teste.kg = 0
			@teste.metros = 0
			@teste.centimetros = 0
			@teste.resultado.should == "1"
		end

		it "should return '1 m ' if there is only meters" do
			@teste.metros = 1
			@teste.resultado.should == "1 m "
		end

		it "should return '1 m ' if only the meters is different of 0" do
			@teste.minutos = 0
			@teste.segundos = 0
			@teste.decimos = 0
			@teste.kg = 0
			@teste.metros = 1
			@teste.centimetros = 0
			@teste.resultado.should == "1 m "
		end

		it "should return '1 cm' if there is only cemtimeters" do
			@teste.centimetros = 1
			@teste.resultado.should == "1 cm"
		end

		it "should return '1 cm' if only the centimeters is different of 0" do
			@teste.minutos = 0
			@teste.segundos = 0
			@teste.decimos = 0
			@teste.kg = 0
			@teste.metros = 0
			@teste.centimetros = 1
			@teste.resultado.should == "1 cm"
		end
	end
end

