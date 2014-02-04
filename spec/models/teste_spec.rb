require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Teste do
	before(:each) do
		@teste = Teste.new
	end

	it "should belong to atleta" do
    should belong_to :atleta
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


	end

	describe "resultado" do
		it "should return '' if all is nil" do
			@teste.resultado.should  == ""
		end

		it "should return '' if all is set as 0" do
			@teste.minutos = 0
			@teste.segundos = 0
			@teste.decimos = 0
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
			@teste.resultado.should == "1' 1'' 1"
		end

		it "should return '1' ' if there is only minutes" do
			@teste.minutos = 1
			@teste.resultado.should == "1' "
		end

		it "should return '1' ' if only the minutes is different of 0" do
			@teste.minutos = 1
			@teste.segundos = 0
			@teste.decimos = 0
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
			@teste.resultado.should == "1"
		end
	end
end

