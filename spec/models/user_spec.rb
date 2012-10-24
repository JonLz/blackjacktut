require 'spec_helper'

 describe User do 
	before { @user = User.new(name: 'Jojo', 
														password: '123456',
														password_confirmation:'123456')}
	subject {@user}

	it { should respond_to(:name)}
	it { should respond_to(:password)}
	it { should respond_to(:password_confirmation)}
	it { should respond_to(:bankroll)}
	it { should respond_to(:password_digest)}

	it { should be_valid}

	describe "no name entered" do
		before { @user.name = ''}
		it { should_not be_valid}
	end

	describe "name is too long" do
		before { @user.name = 'kljg53'*5}
		it { should_not be_valid}
	end

 describe "name is not unique" do
 	  before do 
 	  	@dupe_user = @user.dup
 	  	@dupe_user.save
 	  end
 	  it { should_not be_valid}
 	end

 describe "password too short" do
 	before do 
 		@user.password = '12345'
 		@user.password_confirmation = '12345'
 	end
 	it { should_not be_valid}
 end

 describe "no password" do
 	before { @user.password = ''}
 	it { should_not be_valid}
 end

 describe "no password confirm" do
 	before { @user.password_confirmation = ''}
 	it { should_not be_valid}
 end

 describe "password mismatch" do
 	before do
 	 @user.password_confirmation = '1234567'
 	end
 	it { should_not be_valid}
 end

 describe "test authenticate" do
 	before { @user.save }
 	let(:found_user) { User.find_by_name(@user.name) }

 	describe "with valid password" do
 		it {should == found_user.authenticate(@user.password)}
 	end

 	describe "with invalid password" do
 		let(:invalid_pass_user) { found_user.authenticate('Invalid')}
 		it {should_not == invalid_pass_user}
 		specify {invalid_pass_user.should be_false}
 	end
 end

 end
