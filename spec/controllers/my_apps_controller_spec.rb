require 'rails_helper'
RSpec.describe MyAppsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # MyApp. As you add validations to MyApp, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
        { title: "My aplicacion", javascript_origins: "http://localhost" }
  }

  let(:my_app){ FactoryGirl.create(:my_app) }

  let(:invalid_attributes) {
    { title: ""  }
  }

  before :each do
    request.session[:user_id] = my_app.user.id
  end

  describe "GET #new" do
    it "assigns a new my_app as @my_app" do
      get :new, {}
      expect(assigns(:my_app)).to be_a_new(MyApp)
    end
  end

  describe "GET #edit" do
    it "assigns the requested my_app as @my_app" do
      get :edit, {:id => my_app.to_param}
      expect(assigns(:my_app)).to eq(my_app)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new MyApp" do
        expect {
          post :create, {:my_app => valid_attributes}
        }.to change(MyApp, :count).by(1)
      end

      it "assigns a newly created my_app as @my_app" do
        post :create, {:my_app => valid_attributes}
        expect(assigns(:my_app)).to be_a(MyApp)
        expect(assigns(:my_app)).to be_persisted
      end

      it "redirects to the created my_app" do
        post :create, {:my_app => valid_attributes}
        expect(response).to redirect_to("/")
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved my_app as @my_app" do
        post :create, {:my_app => invalid_attributes}
        expect(assigns(:my_app)).to be_a_new(MyApp)
      end

      it "re-renders the 'new' template" do
        post :create, {:my_app => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { title: "Nuevo titulo" }
      }

      it "updates the requested my_app" do
        put :update, {:id => my_app.to_param, :my_app => new_attributes}
        my_app.reload
        expect(my_app.title).to eq("Nuevo titulo")
      end

      it "assigns the requested my_app as @my_app" do
        put :update, {:id => my_app.to_param, :my_app => valid_attributes}
        expect(assigns(:my_app)).to eq(my_app)
      end

      it "redirects to the my_app" do
        put :update, {:id => my_app.to_param, :my_app => valid_attributes}
        expect(response).to redirect_to("/")
      end
    end

    context "with invalid params" do
     it "assigns the my_app as @my_app" do
        put :update, {:id => my_app.to_param, :my_app => invalid_attributes}
        expect(assigns(:my_app)).to eq(my_app)
      end

      it "re-renders the 'edit' template" do
        put :update, {:id => my_app.to_param, :my_app => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested my_app" do
      expect {
        delete :destroy, {:id => my_app.to_param}
      }.to change(MyApp, :count).by(-1)
    end

    it "redirects to the my_apps list" do
      delete :destroy, {:id => my_app.to_param}
      expect(response).to redirect_to("/")
    end
  end

end
