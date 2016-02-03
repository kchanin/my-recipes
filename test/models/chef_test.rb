require 'test_helper'

  class ChefTest < ActiveSupport::TestCase
    
    def setup
      @chef = Chef.new(chefname: "My Name", email: "this@example.come", password: "password")
    end
    
    test "chef should be valid" do
      assert @chef.valid?
    end
    
    
    test "chefname should be present" do
      @chef.chefname = " "
      assert_not @chef.valid?
    end
    
    test "chefname is not less than 3 characters" do
      @chef.chefname = "ab"
      assert_not @chef.valid?
    end
    
    test "chefname is less than 40 characters" do
      @chef.chefname = "a" * 40
      assert_not @chef.valid?
    end

    test "email is present" do
      @chef.email = " "
      assert_not @chef.valid?
    end
    
    test "email should not be too long" do
      @chef.email = "a" * 101 + "@example.com"
      assert_not @chef.valid?
    end
    
    test "email should be valid" do
      valid_address = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eem.au laura+joe@monk.cm]
      valid_address.each do |va|
        @chef.email = va 
        assert @chef.valid?, '#{va.inspect} should be valid'
      end
    end
    
    test "email validation should reject invalid address" do
      invalid_address = %w[user@eee,com  user_at_eee.org user.name@example. eee@i_am.com foo@ee+aar.com]
      invalid_address.each do |iva|
        @chef.email = iva 
        assert_not @chef.valid?, '#{iva.inspect} should not be valid'
    end
  end
    

    
    test "email should be unique" do
      dup_chef = @chef.dup
      dup_chef.email = @chef.email.upcase
      @chef.save
      assert_not dup_chef.valid?
    end

  end