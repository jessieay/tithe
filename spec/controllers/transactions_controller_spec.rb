require 'spec_helper'

describe TransactionsController do

  describe '#new' do
    it 'initializes a new instance of Transaction' do
      get(:new)
      assigns(:transaction).should be_new_record
    end
  end

  describe '#create' do
    context "when given invalid parameters" do
      before :each do
        Transaction.any_instance.stub(:save_with_payment).and_return(false)
        post(:create)
      end

      it "renders new" do
        response.should render_template('new')
      end

      it "does not save the transaction" do
        assigns(:transaction).should be_new_record
      end
    end

    context "when given valid parameters" do
      before :each do
        Transaction.any_instance.stub(:save_with_payment).and_return(true)
      end

      it "redirects to root" do
        post(:create)
        response.should redirect_to(root_path)
      end
    end
  end

end
